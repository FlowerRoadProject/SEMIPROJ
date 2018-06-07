package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.fr.jsp.admin.model.vo.AdminAdmin;
import com.fr.jsp.admin.model.vo.AdminMember;
import com.fr.jsp.member.model.vo.Member;

public class AdminDao {
	private Properties prop;
	
	public AdminDao() {
		super();
		prop = new Properties();
		String fileName = AdminDao.class.getResource("/config/admin/admin_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 관리자 2차 보안
	public Member adminSecondPwCheck(Connection con, String adminNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member admin = null;
		
		try { 
			String query = prop.getProperty("baseData");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin = new Member();
				admin.setMemberName(rset.getString("MEMBER_NAME"));
				admin.setSecondPw(rset.getString("SECOND_PW"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin;
	}
	// 관리자 메인 이름, 사진
	public Member adminData(Connection con, String adminNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member admin = null;
		
		try { 
			String query = prop.getProperty("baseData");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin = new Member();
				admin.setMemberName(rset.getString("MEMBER_NAME"));
				admin.setImagePath(rset.getString("IMAGE_PATH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin;
	}
	// 관리자 메시지 알림
	public int admin_uncheckedMessage(Connection con, String adminNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_messageCount = 0;
		
		try { 
			String query = prop.getProperty("admin_messageCount");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_messageCount = Integer.parseInt(rset.getString("COUNT(RECEIVE_MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_messageCount;
	}
	// 모든 회원 수 조회
	public int admin_allMemberCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_allMemberCount = 0;
		
		try { 
			String query = prop.getProperty("admin_allMemberCount");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_allMemberCount = Integer.parseInt(rset.getString("COUNT(MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_allMemberCount;
	}
	// 회원 리스트
	public ArrayList<AdminMember> admin_memberList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> admin_memberList = null;
		
		try { 
			String query = prop.getProperty("admin_memberList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_memberList = new ArrayList<AdminMember>();
			while(rset.next()){
				AdminMember member = new AdminMember();
				
				member.setMemberNum(rset.getString("MEMBER_NUM"));
				member.setMemberId(rset.getString("MEMBER_ID"));
				member.setMemberPw(rset.getString("MEMBER_PW"));
				member.setMemberName(rset.getString("MEMBER_NAME"));
				member.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				member.setMemberPhone(rset.getString("MEMBER_PHONE"));
				member.setMemberGender(rset.getString("MEMBER_GENDER"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("MEMBER_BIRTH_DATE"));
		        java.sql.Date memberBirthDate = new java.sql.Date(u_date.getTime());
		        member.setMemberBirthDate(memberBirthDate);
		        member.setGradeName(rset.getString("GRADE_NAME"));
		        member.setImagePath(rset.getString("IMAGE_PATH"));
		        Date u_date1 = format.parse(rset.getString("ENROLL_DATE"));
		        java.sql.Date enrollDate = new java.sql.Date(u_date1.getTime());
		        member.setEnrollDate(enrollDate);
		        member.setMemberEmail(rset.getString("MEMBER_EMAIL"));
		        member.setTotalPrice(Integer.parseInt(rset.getString("TOTAL_PRICE")));
		        
		        admin_memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_memberList;
	}
	// 관리자 리스트
	public ArrayList<AdminAdmin> admin_adminList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminAdmin> admin_adminList = null;
		
		try { 
			String query = prop.getProperty("admin_adminList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_adminList = new ArrayList<AdminAdmin>();
			while(rset.next()){
				AdminAdmin admin = new AdminAdmin();
				
				admin.setAdminNum(rset.getString("MEMBER_NUM"));
				admin.setAdminId(rset.getString("MEMBER_ID"));
				admin.setAdminPw(rset.getString("MEMBER_PW"));
				admin.setAdminName(rset.getString("MEMBER_NAME"));
				admin.setAdminAddress(rset.getString("MEMBER_ADDRESS"));
				admin.setAdminPhone(rset.getString("MEMBER_PHONE"));
				admin.setAdminGender(rset.getString("MEMBER_GENDER"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("MEMBER_BIRTH_DATE"));
		        java.sql.Date memberBirthDate = new java.sql.Date(u_date.getTime());
		        admin.setAdminBirthDate(memberBirthDate);
		        admin.setSecondPw(rset.getString("SECOND_PW"));
		        admin.setImagePath(rset.getString("IMAGE_PATH"));
		        Date u_date1 = format.parse(rset.getString("ENROLL_DATE"));
		        java.sql.Date enrollDate = new java.sql.Date(u_date1.getTime());
		        admin.setEnrollDate(enrollDate);
		        admin.setAdminEmail(rset.getString("MEMBER_EMAIL"));
		        
		        admin_adminList.add(admin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_adminList;
	}
	// 오늘 등록한 회원 수 조회
	public ArrayList<AdminMember> admin_todayEnrollMemberList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> admin_todayEnrollMemberList = null;
		
		try { 
			String query = prop.getProperty("admin_todayEnrollMemberList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_todayEnrollMemberList = new ArrayList<AdminMember>();
			while(rset.next()){
				AdminMember member = new AdminMember();
				
				member.setMemberNum(rset.getString("MEMBER_NUM"));
				member.setMemberId(rset.getString("MEMBER_ID"));
				member.setMemberPw(rset.getString("MEMBER_PW"));
				member.setMemberName(rset.getString("MEMBER_NAME"));
				member.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				member.setMemberPhone(rset.getString("MEMBER_PHONE"));
				member.setMemberGender(rset.getString("MEMBER_GENDER"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("MEMBER_BIRTH_DATE"));
		        java.sql.Date memberBirthDate = new java.sql.Date(u_date.getTime());
		        member.setMemberBirthDate(memberBirthDate);
		        member.setGradeName(rset.getString("GRADE_NAME"));
		        member.setImagePath(rset.getString("IMAGE_PATH"));
		        Date u_date1 = format.parse(rset.getString("ENROLL_DATE"));
		        java.sql.Date enrollDate = new java.sql.Date(u_date1.getTime());
		        member.setEnrollDate(enrollDate);
		        member.setMemberEmail(rset.getString("MEMBER_EMAIL"));
		        
		        admin_todayEnrollMemberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_todayEnrollMemberList;
	}
	// 탈퇴한 회원 수 조회
	public int admin_withdrawMemberCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_withdrawMemberCount = 0;
		
		try { 
			String query = prop.getProperty("admin_withdrawMemberCount");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_withdrawMemberCount = Integer.parseInt(rset.getString("COUNT(MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_withdrawMemberCount;
	}
	// 관리자 사진 받아오기
	public String admin_selectAdminImage(Connection con, String aNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String admin_selectAdminImage = null;
		
		try { 
			String query = prop.getProperty("admin_selectAdminImage");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, aNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_selectAdminImage = (rset.getString("IMAGE_PATH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_selectAdminImage;
	}
	// 관리자 정보 수정
	public int admin_updateAdmin(Connection con, AdminAdmin admin) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateAdmin");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,admin.getAdminPw());
			pstmt.setString(2,admin.getAdminAddress());
			pstmt.setString(3,admin.getAdminPhone());
			pstmt.setString(4,admin.getSecondPw());
			pstmt.setString(5,admin.getImagePath());
			pstmt.setString(6,admin.getAdminEmail());
			pstmt.setString(7,admin.getAdminNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 관리자 등록
	public int admin_insertAdmin(Connection con, AdminAdmin admin) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertAdmin");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,admin.getAdminId());
			pstmt.setString(2,admin.getAdminPw());
			pstmt.setString(3,admin.getAdminName());
			pstmt.setString(4,admin.getAdminAddress());
			pstmt.setString(5,admin.getAdminPhone());
			pstmt.setString(6,admin.getAdminGender());
			pstmt.setDate(7,admin.getAdminBirthDate());
			pstmt.setString(8,admin.getSecondPw());
			pstmt.setString(9,admin.getImagePath());
			pstmt.setString(10, admin.getAdminEmail());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
