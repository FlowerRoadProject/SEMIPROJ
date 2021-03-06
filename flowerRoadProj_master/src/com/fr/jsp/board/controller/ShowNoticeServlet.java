package com.fr.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.board.model.service.NoticeBoardService;
import com.fr.jsp.board.model.vo.NoticeBoard;
import com.fr.jsp.board.model.vo.PagingTool;


/**
 * Servlet implementation class ShowNoticeServlet
 */
@WebServlet("/showNotice.no")
public class ShowNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int startPage; 	// 한번에 표시될 게시글들의 시작 페이지
		int endPage;	// 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;	// 전체 페이지의 마지막 페이지
		int currentPage; // 현재 페이지
		int limit;  	//한 페이지당 게시글 수
		
		//게시판은 1 페이지부터 시작한다
		currentPage = 1;
		
		//한 페이지에 보여질 게시글 수
		limit = 7;
		
		//만약에 전달받는 페이지가 있을 경우  즉, 현재페이지 정보를 받을 경우
		//currentPage의 값을 수정한다
		if(request.getParameter("current") != null){
			currentPage = Integer.parseInt(request.getParameter("current"));
		}
		
		//전체 게시글의 수
		int listCount = new NoticeBoardService().getListCount(); 		
		
		//총 게시글 수에 대한 페이지 계산
		//ex) 목록의 수가 123개 라면 페이지수는 13페이지!
		// 짜투리 게시글도 하나의 페이지로 취급해야 한다
		// 10 / 1 --> 0.9를 더하여 하나의 페이지로 만든다
		
		maxPage = (int)((double)listCount / limit +0.9);
		
		//현재 화면에 표시할 페이지 갯수
		//첫 페이지의 번호
		//ex) 한 화면에 10개의 페이지를 표시하는 경우
		startPage = ( ( (int)(  (double)currentPage / limit +0.9) ) -1 ) * limit + 1;
		
		//한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		
		//페이지 관련 변수 전달용 VO 생성
		PagingTool page = new PagingTool(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<NoticeBoard> list = new NoticeBoardService().showNotice(currentPage, limit);		
		if(list == null){			
			request.setAttribute("msg", "게시글의 정보를 불러오지 못했습니다");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/views/notice/notice.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
