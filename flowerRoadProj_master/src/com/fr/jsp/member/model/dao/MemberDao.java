package com.fr.jsp.member.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.member.model.vo.MemberBoard;

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
		public Member insertInfo(Connection con, Member m) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Member resultM = null;
			
			try{
				
				String query = prop.getProperty("insertInfo");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getMemberId());
				System.out.println("m의 id : "+m.getMemberId());
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					resultM = new Member();
					
					resultM.setMemberId(rset.getString(1));
					resultM.setMemberName(rset.getString(2));
					resultM.setMemberEmail(rset.getString(3));
					resultM.setMemberAddress(rset.getString(4));
					resultM.setMemberPhone(rset.getString(5));
					resultM.setEnrollDate(rset.getDate(6));
					
				}else{
					System.out.println("없어!");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return resultM;
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
				System.out.println("id = "+m.getMemberId());
				
				result = pstmt.executeUpdate();
				
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
	
	public ArrayList<MemberBoard> oneBoard(Connection con, String num) {
		ArrayList<MemberBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("1on1Board");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			System.out.println(num);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MemberBoard>();
			String status ="";
			
			while(rset.next()){
				System.out.println("들어오니?");
				MemberBoard mb = new MemberBoard();
				
				mb.setBoardTitle(rset.getString(1));
				mb.setSubmitDate(rset.getDate(2));
				System.out.println(rset.getDate(2));
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

}
