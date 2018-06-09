package com.fr.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.fr.jsp.member.model.service.MemberService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AddToFavoriteServlet
 */
@WebServlet("/addFavorite.do")
public class AddToFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToFavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String productNum=  request.getParameter("pno");
		String memberNum = (String)session.getAttribute("memberNum");
		MemberService ms = new MemberService();
		int result =0;  
		String resultString ="";
		
		
	
		if(memberNum!=null){
			if(ms.checkInList(memberNum,productNum)<=0){
				result=ms.addToFavorite(memberNum,productNum);
				
				resultString+="찜 목록에 등록";
			}else{
				result = ms.deleteFromFavorite(memberNum,productNum);
				
				resultString+="찜 목록에서 삭제 ";
			}
				if(result>0)
					resultString +="성공 하였습니다.";
				else
					resultString +="실패 하였습니다.";
			}else{
				resultString="로그인 해주세요.";
		}
		
			new Gson().toJson(resultString,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
