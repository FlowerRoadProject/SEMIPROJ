package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminFaqBoardService;
import com.fr.jsp.admin.model.service.AdminNoticeBoardService;
import com.fr.jsp.admin.model.service.AdminReviewBoardService;
import com.fr.jsp.admin.model.service.AdminUserQuestionBoardService;
import com.fr.jsp.board.model.vo.UserQuestionBoard;

@WebServlet("/userQuestionBoard.admin")
public class AdminUserQuestionBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUserQuestionBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminFaqBoardService afbs = new AdminFaqBoardService();
		// 전체 FAQ 게시판 게시글 수
		int admin_faqBoardCount = afbs.admin_faqBoardAllList().size();
		// Connection close
		afbs.closeCon();
		
		AdminNoticeBoardService anbs = new AdminNoticeBoardService();
		// 전체 공지사항 게시판 게시글 수
		int admin_noticeBoardCount = anbs.admin_noticeBoardAllList().size();
		// Connection close
		anbs.closeCon();
		
		AdminReviewBoardService arbs = new AdminReviewBoardService();
		// 전체 리뷰 게시판 게시글 수
		int admin_reviewBoardCount = arbs.admin_reviewBoardAllCount();
		// Connection close
		arbs.closeCon();
		
		AdminUserQuestionBoardService auqbs = new AdminUserQuestionBoardService();
		// 전체 1:1 게시판 게시글 수
		int admin_userQuestionBoardCount = auqbs.admin_userQuestionBoardAllCount();
		// 1:1 게시판 리스트
		ArrayList<UserQuestionBoard> admin_userQuestionBoardList = auqbs.admin_userQuestionBoardList();
		// Connection close
		auqbs.closeCon();
		
		request.setAttribute("admin_faqBoardCount", admin_faqBoardCount);
		request.setAttribute("admin_noticeBoardCount", admin_noticeBoardCount);
		request.setAttribute("admin_reviewBoardCount", admin_reviewBoardCount);
		request.setAttribute("admin_userQuestionBoardCount", admin_userQuestionBoardCount);
		request.setAttribute("admin_userQuestionBoardList", admin_userQuestionBoardList);
		
		request.getRequestDispatcher("views/admin_views/admin_UserQuestionBoard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
