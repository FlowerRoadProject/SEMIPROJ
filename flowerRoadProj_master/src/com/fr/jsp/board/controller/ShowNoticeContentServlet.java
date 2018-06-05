package com.fr.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.board.model.service.NoticeBoardService;
import com.fr.jsp.board.model.vo.NoticeBoard;

/**
 * Servlet implementation class ShowNoticeContentServlet
 */
@WebServlet("/noticeContent.no")
public class ShowNoticeContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowNoticeContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));		
		
		
		NoticeBoardService nService = new NoticeBoardService();
		NoticeBoard notice = nService.showContent(bNum);
			
		
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/views/notice/noticeContent.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
