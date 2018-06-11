package com.fr.jsp.member.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.member.model.vo.MemberBoard;
import com.fr.jsp.member.model.vo.MemberCoupon;
import com.fr.jsp.product.model.vo.ProductFavorite;

public class MemberDao {
	
	private Properties prop = new Properties();
	public MemberDao(){
		String filename=MemberDao.class.getResource("/config/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Member selectMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultMember = null;
		//System.out.println("DAO 전달 확인 : "+m);
		
		//JDBC 관련 로직을 작성할 때 SQLException이 발생할 수 있기 때문에 반드시 예외처리한다.
		try {
			
			//3. 실행하고자하는 SQL 문을 먼저 생성한다.
			//   생성시에 값이 정해지지 않은 부분은 ' ? '로 표시한다.
			String query = prop.getProperty("memberSelect");
			//4. PreparedStatement 객체를 생성하여 query를 적용하고, ?로 된 부분을 하나씩 채워 넣는다.
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberNum());
			
			//5.쿼리를 실행하고 난 결과를 받을 ResultSet 객체 생성
			rset = pstmt.executeQuery();
			
			//6.ResultSet에 담긴 값을 받아 VO/DTO/DomainObject/Entity 객체에 기록한다.
			//ResultSet 결과는 한 행씩 읽는데, 머릿글을 포함하기 때문에 ResultSet.next(); 메소드로 실제 값에 접근해야 한다.
			
			if(rset.next()){
				resultMember = new Member();
				
				//6-1. 값을 순서대로 받아오는 방법과 실제 컬럼 명으로 받아오는 두가지 방법이 있다.
				//만약 순서대로 받아올 경우 시작 값은 1 컬럼명을 기준으로 받아올 경우 컬럼 명은 대, 소문자를 가리지 않는다.
				
				resultMember.setMemberNum((rset.getString("MEMBER_NUM")));
				resultMember.setMemberId((rset.getString("MEMBER_ID")));
				resultMember.setMemberPw(rset.getString("MEMBER_PW"));
				resultMember.setMemberName((rset.getString("MEMBER_NAME")));
				resultMember.setMemberAddress((rset.getString("MEMBER_ADDRESS")));
				resultMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
				if(rset.getString("MEMBER_GENDER")!=null){	
				resultMember.setMemberGender(rset.getString("MEMBER_GENDER").charAt(0));
				}
				resultMember.setMemberBirthDate(rset.getDate("MEMBER_BIRTH_DATE"));
				resultMember.setGradeCode(rset.getString("GRADE_CODE"));
				resultMember.setSecondPw((rset.getString("SECOND_PW")));
				resultMember.setImagePath((rset.getString("IMAGE_PATH")));
				resultMember.setEnrollDate((rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//7. 데이터베이스 연관 객체들은 사용이 끝난뒤에 반드시 close 처리해야 한다.
			//그렇지 않으면 이후에 실행될 다른 DB 접근 객체 트랜잭션에 영향을 미칠 수 있기 때문이다.
			//해당 close는 예외가 발생하더라도 반드시 close 해야 하기 때문에 finally에 작성한다.
			close(rset);
			close(pstmt);
		}
		//System.out.println("DB 확인 값 : "+resultMember);
		return resultMember;
	}
	public int findMember(Connection con, String memberNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		try {
			String query = prop.getProperty("memberFind");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			rset=pstmt.executeQuery();
			if(rset.next()){
				result=rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public int snsInsertMember(Connection con, String memberNum) {
		PreparedStatement pstmt= null;
		int result=0;
		try {
			
			//4.실제 사용될 쿼리를 작성
			String sql = prop.getProperty("memberSnsInsert");
		
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberNum);
			//5. 작성한 쿼리를 실행한다.
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			
		} finally {
			//7.모든 처리가 완료된 후에는 DB객체들을 닫아준다.
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원조회- 메인
		public Member insertInfo(Connection con, String num) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Member resultMember = null;
			System.out.println(num);
			try{
				
				String query = prop.getProperty("insertInfo");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, num);
				System.out.println("m의 num : "+num);
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					resultMember = new Member();
		            
		            
		            resultMember.setMemberNum((rset.getString("MEMBER_NUM")));
		            resultMember.setMemberId((rset.getString("MEMBER_ID")));
		            resultMember.setMemberPw(rset.getString("MEMBER_PW"));
		            resultMember.setMemberName((rset.getString("MEMBER_NAME")));
		            resultMember.setMemberAddress((rset.getString("MEMBER_ADDRESS")));
		            resultMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
		            if(rset.getString("MEMBER_GENDER")!=null){   
		            resultMember.setMemberGender(rset.getString("MEMBER_GENDER").charAt(0));
		            }
		            resultMember.setMemberBirthDate(rset.getDate("MEMBER_BIRTH_DATE"));
		            resultMember.setGradeCode(rset.getString("GRADE_CODE"));
		            resultMember.setSecondPw((rset.getString("SECOND_PW")));
		            resultMember.setImagePath((rset.getString("IMAGE_PATH")));
		            resultMember.setEnrollDate((rset.getDate("ENROLL_DATE")));
		            resultMember.setMemberEmail(rset.getString("MEMBER_EMAIL"));
					
				}else{
					System.out.println("없어!");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return resultMember;
		}

		// 비밀번호 변경
		public Member pwdChangeView(Connection con, Member m) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Member resultM = null;
			
			String query = prop.getProperty("pwdChangeView");
			try {
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getMemberId());
				System.out.println("m의 id : "+m.getMemberId());
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					resultM = new Member();
					
					resultM.setMemberName(rset.getString(1));
					resultM.setMemberId(rset.getString(2));
				}else {
					System.out.println("없음");
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			
			return resultM;
		}

		public int pwdChange(Connection con, Member m) {
			PreparedStatement pstmt = null;
			int result =0;
			
			String query = prop.getProperty("pwdChange");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getMemberPw());
				pstmt.setString(2, m.getMemberId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			return result;
		}

		public int memberUpdate(Connection con, Member m) {
			PreparedStatement pstmt = null;
			int result =0;
			
			String query = prop.getProperty("memberUpdate");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getMemberEmail());
				pstmt.setString(2, m.getMemberAddress());
				pstmt.setString(3, m.getMemberPhone());
				pstmt.setString(4, m.getMemberId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			return result;
		}

		public int memberDelete(Connection con, Member m) {
			PreparedStatement pstmt = null;
			int result =0;
			
			String query = prop.getProperty("memberDelete");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, m.getMemberId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			return result;
		}

		public ArrayList<ProductFavorite> favorite(Connection con, String num, int currentPage, int limit) {
			ArrayList<ProductFavorite> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("memberFavorite");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, num);
				
				int startRow = (currentPage - 1)* limit +1;
			    int endRow = startRow + (limit - 1);
			    pstmt.setInt(2, startRow);
			    pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<ProductFavorite>();
				String quantity ="";
				
				while(rset.next()){
					ProductFavorite pf = new ProductFavorite();
					pf.setImage(rset.getString(2));
					pf.setProductName(rset.getString(3));
					pf.setProductPrice(rset.getInt(4));
					pf.setProductNum(rset.getString(5));
					
					if(rset.getInt(4) > 0){
						quantity = "재고있음";
						pf.setProductQuantityState(quantity);
					} else {
						quantity = "재고없음";
						pf.setProductQuantityState(quantity);
					}
					
					list.add(pf);
				} 
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public ArrayList<MemberBoard> oneBoard(Connection con, String num) {
			ArrayList<MemberBoard> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = prop.getProperty("1on1Board");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, num);
				rset = pstmt.executeQuery();
				
				list = new ArrayList<MemberBoard>();
				String status ="";
				
				while(rset.next()){
					MemberBoard mb = new MemberBoard();
					
					mb.setBoardTitle(rset.getString(1));
					mb.setSubmitDate(rset.getDate(2));
					mb.setBoardNum(rset.getInt(4));
					if(rset.getString(3) != null){
						status = "답변 완료";
						mb.setReplyStatus(status);
					} else {
						status = "미확인";
						mb.setReplyStatus(status);
					}
					
					list.add(mb);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			System.out.println(list);
			return list;
		}

		public int sendBoard(Connection con, MemberBoard mb) {
			PreparedStatement pstmt = null;
			int result =0;
			
			String query = prop.getProperty("sendBoard");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, mb.getBoardTitle());
				System.out.println("1:"+mb.getBoardTitle());
				pstmt.setString(3, mb.getMemberNum());
				System.out.println("2:"+mb.getMemberNum());
				pstmt.setString(2, mb.getBoardContent());
				System.out.println("3:"+mb.getBoardContent());
				
				result = pstmt.executeUpdate();
				System.out.println("result="+result);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			return result;
		}
	
	
	
	
	
	
	
	
	
	public int addToFavorite(Connection con, String memberNum, String productNum) {
		
		PreparedStatement pstmt=null;
		int result= 0;
		
		try{
			pstmt = con.prepareStatement(prop.getProperty("addToFavorite"));
			
			pstmt.setString(1, memberNum);
			pstmt.setString(2, productNum);
			
			result =  pstmt.executeUpdate();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);
		}
		
		return result;
	}
	public int checkInList(Connection con, String memberNum, String productNum) {
		
		PreparedStatement pstmt=null;
		ResultSet  rset=null;
		int result = 0;
		try{
			pstmt = con.prepareStatement(prop.getProperty("checkInList"));
			
			pstmt.setString(1, memberNum);
			pstmt.setString(2, productNum);
			
			rset =  pstmt.executeQuery();
			
			while(rset.next()){
				
				result = rset.getInt(1);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);
		}
		
		return result;
	}
	public int deleteFromFavorite(Connection con, String memberNum, String productNum) {
		
		PreparedStatement pstmt=null;
		int result= 0;
		
		try{
			pstmt = con.prepareStatement(prop.getProperty("deleteFromFavoriteList"));
			
			pstmt.setString(1, memberNum);
			pstmt.setString(2, productNum);
			
			result =  pstmt.executeUpdate();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);
		}
		
		return result;
	}
	
	public Member loginSelectMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultMember = null;
		try {
			
			String query = prop.getProperty("loginMemberSelect");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()){
				resultMember = new Member();
				
				
				resultMember.setMemberNum((rset.getString("MEMBER_NUM")));
				resultMember.setMemberId((rset.getString("MEMBER_ID")));
				resultMember.setMemberPw(rset.getString("MEMBER_PW"));
				resultMember.setMemberName((rset.getString("MEMBER_NAME")));
				resultMember.setMemberAddress((rset.getString("MEMBER_ADDRESS")));
				resultMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
				if(rset.getString("MEMBER_GENDER")!=null){	
				resultMember.setMemberGender(rset.getString("MEMBER_GENDER").charAt(0));
				}
				resultMember.setMemberBirthDate(rset.getDate("MEMBER_BIRTH_DATE"));
				resultMember.setGradeCode(rset.getString("GRADE_CODE"));
				resultMember.setSecondPw((rset.getString("SECOND_PW")));
				resultMember.setImagePath((rset.getString("IMAGE_PATH")));
				resultMember.setEnrollDate((rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return resultMember;
	}
	
	public int accessMember(Connection con, Member m) {
		PreparedStatement pstmt= null;
		int result=0;
		try {
			String sql = prop.getProperty("accessMember");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMemberNum());		
			System.out.println(m.getMemberNum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public String idSearch(Connection con, String name, String phone, String email) {
		
		PreparedStatement pstmt= null;
		ResultSet rset= null;
		String result="";
		try {
			String sql = prop.getProperty("idSearch");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result=rset.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int pwSearch(Connection con, Member m , String pwd) {
		PreparedStatement pstmt= null;
		int result=0;
		/*System.out.println(pwd);
		System.out.println(m.getMemberId());
		System.out.println(m.getMemberName());
		System.out.println(m.getMemberEmail());*/
		try {	
			String sql = prop.getProperty("pwSearch");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberEmail());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int checkId(Connection con, String userId) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		int result=0;
		try {
			String query =  prop.getProperty("checkId");
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result=rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public int insertMember(Connection con, Member m) {

				PreparedStatement pstmt= null;
				int result=0;
				try {
					String sql = prop.getProperty("memberInsert");
					System.out.println(sql);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m.getMemberId());
					pstmt.setString(2, m.getMemberPw());
					pstmt.setString(3, m.getMemberName());
					pstmt.setString(4, m.getMemberAddress());
					pstmt.setString(5, m.getMemberPhone());
					pstmt.setString(6, String.valueOf(m.getMemberGender()));
					//pstmt.setObject(6,  m.getMemberGender(), java.sql.Types.CHAR);
					pstmt.setDate(7, m.getMemberBirthDate());
					pstmt.setString(8, m.getMemberEmail());
					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				return result;
	}
	public int getListCount(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result=rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}
	public int favoriteAllDel(Connection con, String num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("AlldeleteFavorite");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			System.out.println(num);
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		System.out.println(result);
		return result;
	}
	public int favoriteDel(Connection con, String num, String pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFavorite");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.setString(2, pno);
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
	public MemberBoard oneView(Connection con, String mNum, int bNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberBoard resultBoard = null;
		try{
			
			String query = prop.getProperty("BoardView");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNum);
			pstmt.setInt(2, bNum);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				resultBoard = new MemberBoard();
	            
				resultBoard.setBoardNum(rset.getInt(1));
				resultBoard.setBoardTitle(rset.getString(2));
				resultBoard.setBoardContent(rset.getString(3));
				resultBoard.setSubmitDate(rset.getDate(6));
				resultBoard.setReplyContent(rset.getString("BOARD_REPLY_CONTENT"));
				
			}else{
				System.out.println("없어!");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return resultBoard;
	}
	public ArrayList<MemberCoupon> memberCoupon(Connection con, String num) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<MemberCoupon> clist = null;
		
		String query = prop.getProperty("memberCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();

			clist = new ArrayList<MemberCoupon>();
			
			while(rset.next()){
				MemberCoupon mc = new MemberCoupon();
				
				mc.setDistNum(rset.getInt(1));
				mc.setCouponCode(rset.getString(2));
				mc.setIssueDate(rset.getDate(3));
				mc.setIsUsed(rset.getString(4));
				
				clist.add(mc);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return clist;
	}
	// 비밀번호 재확인
	public int pwdRecheck(Connection con, String num, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("pwdRecheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.setString(2, pwd);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}

}
