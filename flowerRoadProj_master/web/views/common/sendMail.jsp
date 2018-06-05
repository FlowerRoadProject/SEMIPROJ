<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.fr.jsp.member.model.vo.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%
request.setCharacterEncoding("utf-8");

String to = (String)request.getAttribute("to");// 받는 사람
String content = (String)request.getAttribute("content");//내용
String url = (String)request.getAttribute("url");//페이지 이동하는곳
String result = (String)request.getAttribute("result");
//System.out.println(url);
// 입력값 받음

Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들

try{
    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
    
    ses.setDebug(true);
    
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject("꽃길 홈페이지 입니다."); // 제목
    
    Address fromAddr = new InternetAddress("hykimyong@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
    
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
    
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
    
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('입력하신 이메일 정보가 다릅니다 다시 정확히 입력해주세요');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
//이메일로 보낼때
if(url.equals("emailSend")){
	out.println(result);
}else{
out.println("<script>alert('해당 이메일로 임시비밀번호가 발송되었습니다');");
out.println("location.href='"+request.getContextPath()+url+"';</script>");
}
// 성공 시
%>