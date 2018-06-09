package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.service.AdminOrderService;
import com.fr.jsp.admin.model.service.AdminReviewBoardService;
import com.fr.jsp.admin.model.service.AdminService;
import com.fr.jsp.admin.model.service.AdminUserQuestionBoardService;
import com.fr.jsp.admin.model.vo.AdminFortuen;
import com.fr.jsp.admin.model.vo.AdminRandomGame;
import com.fr.jsp.member.model.vo.Member;

@WebServlet("/main.admin")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		AdminMemberService ams = new AdminMemberService();
		// 관리자 메인 이름, 사진
		Member admin = ams.adminData(adminNum);
		// 관리자 메시지 알림
		int admin_messageCount = ams.admin_uncheckedMessage(adminNum);
		// Connection close
		ams.closeCon();
		
		AdminOrderService aos = new AdminOrderService();
		// 오늘 등록된 주문 수
		int admin_orderCount = aos.admin_todayOrder();
		// Connection close
		aos.closeCon();
		
		AdminReviewBoardService arbs = new AdminReviewBoardService();
		// 오늘 등록된 리뷰 게시판 게시글 수
		int admin_reviewCount = arbs.admin_todayReview();
		// Connection close
		arbs.closeCon();
		
		AdminUserQuestionBoardService auqbs = new AdminUserQuestionBoardService();
		// 오늘 등록된 1:1 게시판 게시글 수
		int admin_userQuestionCount = auqbs.admin_todayUserQuestion();
		// Connection close
		auqbs.closeCon();
		
		AdminService as = new AdminService();
		// 오늘의 명언
		AdminFortuen adminFortuen = as.admin_randomFortuen();
		// 랜덤 게임 위치
		AdminRandomGame adminRandomGame = new AdminRandomGame();
		adminRandomGame.setTopNum((int)(Math.random()*50));
		adminRandomGame.setLeftNum((int)(Math.random()*50));
		adminRandomGame.setGoalTopNum((int)(Math.random()*80));
		adminRandomGame.setGoalLeftNum((int)(Math.random()*80));
		// Connection close
		as.closeCon();
		
		session.setAttribute("admin", admin);
		session.setAttribute("admin_messageCount", admin_messageCount);
		session.setAttribute("admin_orderCount", admin_orderCount);
		session.setAttribute("admin_reviewCount", admin_reviewCount);
		session.setAttribute("admin_userQuestionCount", admin_userQuestionCount);
		
		request.setAttribute("adminFortuen", adminFortuen);
		request.setAttribute("adminRandomGame", adminRandomGame);
		
		request.getRequestDispatcher("views/admin_views/admin_Main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
