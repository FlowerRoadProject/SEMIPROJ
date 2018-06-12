package com.fr.jsp.member.controller;

import java.io.IOException;
import java.security.KeyStore.PrivateKeyEntry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.common.PreventDuplicationLogin;
import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;

@WebServlet("/login.me")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		Member m = new Member(id,pwd);
		String page = "";
		MemberService ms = new MemberService();
		
		m=ms.loginSelectMember(m);
		
		
		if(m!=null){//로그인성공
			
			HttpSession session = request.getSession();
			
			if(m.getMemberNum().charAt(0)=='A'){
					session.setAttribute("memberNum", m.getMemberNum());
//					System.out.println("관리자 로그인성공");
					page = "/firstMain.admin";
					
			}else{
				
				if(ms.accessMember(m) !=0){
					//액세스 로그 가 성공햇을때
//					System.out.println("액세스 로그 삽입 성공");
				}else{
//					System.out.println("액세스 로그 삽입 실패");
				}
					
				if(PreventDuplicationLogin.getInstance().isUsing(m.getMemberNum())){
					request.setAttribute("msg", "이 아이디로 접속이 이미 되어 있습니다.");
					page ="views/common/errorPage.jsp";
				}else{
					session.setAttribute("memberNum", m.getMemberNum());
					
					String lastUrl = (String)session.getAttribute("lastUrl");
					String toUrl=null;
					
					if(lastUrl!=null){
						String temp = request.getContextPath();
						toUrl= (String)lastUrl.subSequence(temp.length(), lastUrl.length());
					}
					
					if(toUrl!=null){
						page = toUrl;
					}else{
						page = "main.jsp";	
					}
				}
			}
		}else{//로그인 실패
			//System.out.println("아이디비번틀림");
			page="views/mainPage/login.jsp";
			request.setAttribute("msg", "로그인 실패 아이디나 비밀번호를 다시 확인하세요");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
