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
		String page = "";
		int bNum = 0;
		if(request.getParameter("bNum") == null){
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글의 정보를 읽어오지 못했습니다");
			request.getRequestDispatcher(page).forward(request, response);	
		}else{
			bNum = Integer.parseInt(request.getParameter("bNum"));	
		}
		
		NoticeBoardService nService = new NoticeBoardService();
		
		
		//공지사항글의 조회수를 늘린다
		int count = nService.updateCount(bNum);
		if(count >0) System.out.println("조회수 1증가");
		else System.out.println("조회수 안올라감..");	
		
		//공지사항의 내용을 보여준다		
		NoticeBoard notice = nService.showContent(bNum);	
		if(notice != null){
			page= "/views/notice/noticeContent.jsp";
			request.setAttribute("notice", notice);			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글의 정보를 읽어오지 못했습니다");
		}
		
		request.getRequestDispatcher(page).forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
