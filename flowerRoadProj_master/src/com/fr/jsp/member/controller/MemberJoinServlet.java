package com.fr.jsp.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.member.model.service.MemberService;


@WebServlet("/mInsert.me")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MemberJoinServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String my_id = request.getParameter("my_id");
		String my_pwd = request.getParameter("my_pwd");
		String my_name = request.getParameter("my_name");
		char my_gender = request.getParameter("my_gender").charAt(0);
		String my_birth = request.getParameter("my_birth");
		//TO_DATE('1990-07-16','RRRR-MM-DD')
		String my_email = request.getParameter("my_email");
		String zipCode = request.getParameter("zipCode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address=zipCode+"/"+address1+"/"+address2;
		String my_phone = request.getParameter("my_phone");
		java.sql.Date my_date=java.sql.Date.valueOf(my_birth);
		Member m = new Member(my_id,my_pwd,my_name,address,my_phone,my_gender,my_date,my_email);
		
		MemberService ms = new MemberService();
		
		
		if(ms.checkId(m.getMemberId())==1){
			System.out.println("이미 회원이 존재하는 경우");
			request.setAttribute("msg", "이미 회원이 존재합니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/mainPage/signUp.jsp");
			view.forward(request, response);
		}
		if(ms.InsertMember(m) !=0){
			System.out.println("정상적으로 회원 가입 성공!!");
			RequestDispatcher view = request.getRequestDispatcher("views/mainPage/login.jsp");
			view.forward(request, response);
		}else{
			System.out.println("회원 가입 실패!!");
			request.setAttribute("msg", "회원 가입 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
