package com.fr.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;

@WebServlet("/snsLoginservlet.me")
public class snsLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public snsLoginServlet() {
        super();
        
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String memberNum = request.getParameter("memberNum");

      Member m = new Member();
      m.setMemberNum(memberNum);
      
      
      MemberService ms = new MemberService();
      int result = ms.findMember(memberNum);
      HttpSession session = request.getSession();
      if(result>0){
         //membernum을가지고잇는사람찾음
         m=ms.SelectMember(m);
         if(m!=null){//로그인성공
            session.setAttribute("memberNum", m.getMemberNum());
            System.out.println("로그인성공");
            RequestDispatcher view = request.getRequestDispatcher("main.jsp");
            view.forward(request, response);
         }else{//로그인 실패
            request.setAttribute("msg", "로그인 실패");
            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
            view.forward(request, response);
         }
      }else{
         //membernum을 가지고있는사람 없음 회원가입과동시에 로그인

         if(ms.snsInsertMember(memberNum) !=0){
            System.out.println("정상적으로 회원 가입 성공!!");
            session.setAttribute("memberNum", m.getMemberNum());
            RequestDispatcher view = request.getRequestDispatcher("main.jsp");
            view.forward(request, response);
//            response.sendRedirect("main.jsp");
            
         }else{
            System.out.println("회원 가입 실패!!");
            request.setAttribute("msg", "회원 가입 실패!!");
            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
            view.forward(request, response);
         }
      }
      
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);
   }

}