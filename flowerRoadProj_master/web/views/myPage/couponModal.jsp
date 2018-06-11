<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*,
    						java.util.*"%>
<%
	ArrayList<MemberCoupon> clist = (ArrayList<MemberCoupon>)request.getAttribute("clist");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 모달</title>
 		<script>
        	
        		 $(function(){
        			 $.ajax({
        				url : "mCoupon.me",
        				type : "GET",
        				success : function(data){
        					var list = data
        					
        					var couponJson = $.parseJSON(data);
        					
        					for(var o in couponJson){
        						console.log(couponJson[o].couponCode);
        						$('#modalT').append("<tr>");
        						$('#modalT').append("<td>"+ (parseInt(o)+1) +"</td>");
        						$('#modalT').append("<td>"+ couponJson[o].couponCode+"</td>");
        						$('#modalT').append("<td> ~ "+ couponJson[o].issueDate+"</td>");
        						$('#modalT').append("</tr>");
        					}
        				}
        			 });
        		}); 
        	
        </script>  
</head>
<body>
 <!-- 기본 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">보유중인 쿠폰</h4>
	      </div>
	      			<div class="modal-body">
							<table class="table table-hover" id="modalT">
		                            <tr style="background-color: lightgray;">
		                                <th>번호</th>
		                                <th>쿠폰이름</th>
		                                <th>사용기간</th>
		                                <th></th>
		                            </tr> 
		                            <%--  <% int i = clist.size(); 
		                            for(int j = 0; j < clist.size(); j++) {  
		                            	if(!clist.get(j).getIsUsed().equals("N")) { %>
		                            <tr>
		                                <td><%= i-- %></td>
		                                <td><%=clist.get(j).getCouponCode() %></td>
		                                <td><%=clist.get(j).getIssueDate() %></td>
		                            </tr>
		                            <% } } %>  --%>
		                        </table>
			      </div>
			      <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
        
</body>
</html>