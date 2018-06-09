package com.fr.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.board.model.service.NoticeBoardService;

/**
 * Servlet implementation class UpdateNoticeServlet
 */
@WebServlet("/update.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		
		
		
		
		int result = new NoticeBoardService().updateContent(bNum, bTitle, bContent);
		
		System.out.println("게시글 업데이트 성공!");
		
		
		if(result >0){
			request.getRequestDispatcher("/noticeContent.no?bNum+"+bNum).forward(request, response);
			
		}else{
			System.out.println("업데이트실패...");
		}
		
		
		
		//int bNum, String bTitle, String bContent, Date submitDate, int viewNum
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
