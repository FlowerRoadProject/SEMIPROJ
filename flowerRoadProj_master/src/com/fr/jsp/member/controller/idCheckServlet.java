package com.fr.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.member.model.service.MemberService;

@WebServlet("/checkId.me")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public idCheckServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("my_id");
		
		MemberService ms = new MemberService();
		int result=0;
		if(userId==""||userId==null){
			result=100;
		}else{
			result = ms.checkId(userId);
		}
		String check="";
		if(result==1){
			check="아이디가 중복되었습니다.";
		}else if(result==100){
			check="아이디를 입력해주세요";
		}
		else{
			check="아이디가 중복되지 않았습니다.";
		}
		PrintWriter out = response.getWriter();
		out.print(check);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
