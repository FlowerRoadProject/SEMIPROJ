<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.order.model.vo.*,
								com.fr.jsp.common.*, com.fr.jsp.member.model.vo.*" %>
<%
	Member m = (Member)session.getAttribute("m");
	ArrayList<MyPage_Order> list = (ArrayList<MyPage_Order>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Integer> cols = (ArrayList<Integer>)request.getAttribute("cols");
%>
<!DOCTYPE>
<html>
<head>
<title>꽃길-주문 조회</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/myInfo.css">
<script src="<%=request.getContextPath()%>/resources/js/myPage.js"></script>
<script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
        <style>
        .noneFavorite {
			color: black;
			font-size: 40px;
			text-align: center;
			width: 400px;
			height: 200px;
			margin: 100px;
		}
        </style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<!-- 마이페이지 카테고리  -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<div class="category col-sm-2 col-md-2 col-log-2" id="info"
			onclick="info()">내정보</div>
		<div class="category col-sm-2 col-md-2 col-lg-2"
			style="font-weight: bold; text-decoration: underline;" id="check"
			onclick="orderChk();">주문 조회</div>
		<div class="category col-sm-2 col-md-2 col-lg-2" id="favarite"
			onclick="favorite();">관심 상품</div>
		<div class="category col-sm-2 col-md-2 col-lg-2" id="1on1"
			onclick="oneToOne();">1:1 문의</div>
		<div class="col-sm-3 col-md-3 col-lg-3"></div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 주문 조회 창 -->
	<div class="container-fluid">
		<div class="col-sm-4 col-md-4 col-lg-4">
			<h4>
				<i>주문 조회</i> <small>: [<%= m.getMemberName() %>]님의 주문내역을 조회하실수 있습니다.</small>
			</h4>
		</div>
		<div class="col-sm-8 col-md-8 col-lg-8"></div>
	</div>
	<div>
		<div class="info">
			<% if(list.size() != 0) { %>
			<br>
			 <div class="col-md-4">
				<div class="input-group date col-md-12" data-provide="datepicker">
					<input type="text" class="form-control" placeholder="조회 기간 시작일"
						id="datepicker1"> <span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i></span>
				</div>

			</div>
			<div class="col-md-4">
				<div class="input-group date col-md-12" data-provide="datepicker">
					<input type="text" class="form-control" placeholder="조회 기간 종료일"
						id="datepicker2"><span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="col-md-6">
					<input class="ordchk btn btn-primary" type="button" id="search"
						onclick="search()" value="검색"
						style="color: white; background: midnightblue;">
				</div>
				<div class="col-md-6">
					<input class="btn btn-default" type="button" id="reSet" value="초기화">
				</div>
			</div> 
			
			<br><br><br>


			<table class="table table-hover">
				<tr style="background-color: lightgray;">
					<th>주문번호</th>
					<th>주문일자</th>
					<th>상품명</th>
					<th>결제금액</th>
					<th>익명발송 여부</th>
					<th>배송현황</th>
				</tr>
				<%
					int q = 0;
					for (int i=0; i < cols.size(); i++) {
						for(int j=q; j<cols.get(i)+q; j++) { %>
				<tr>
						<% if(j == q) { %>
					<td rowspan="<%= cols.get(i) %>" style="vertical-align: middle;"><%=list.get(q).getOrder_num()%>
						<input type="hidden" class="oN" name="oN"
						value="<%=list.get(q).getOrder_num()%>"></td>
					<% } %>
					<td><%=list.get(j).getOrdered_date()%></td>
					<td><a href="<%=request.getContextPath()%>/productDetail.do?productNum=+<%= list.get(j).getProduct_num()%>">
					<%=list.get(j).getProduct_name()%></a></td>
					<td><%=list.get(j).getProduct_cost()%></td>
					<td><%=list.get(j).getAnonymous_delivery()%></td>
					<% if( list.get(j).getOrder_state_code().equals("결제 완료") ) { %>
					<td><%=list.get(j).getOrder_state_code()%> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="환불하기" id="refund" class="refund btn btn-default">
					</td>
					<% } else if(list.get(j).getOrder_state_code().equals("배송 완료")) { %>
					<td><%=list.get(j).getOrder_state_code()%> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="구매확정" id="buyComplete" class="buyComplete btn btn-default">
					</td>
					<% } else { %>
					<td><%=list.get(j).getOrder_state_code()%></td>
					<% }
					} q += cols.get(i); %>
				</tr>
				<%
					}
				%>
			</table>
						<% } else { %>
                     	<div class="container-fluid">
                     		<div class="col-sm-1 col-md-1 col-lg-1"></div>
                     		<div class="col-sm-8 col-md-8 col-lg-8 noneFavorite">== 현재 주문하신 상품이 없습니다. ==</div>
                     		<div class="col-sm-3 col-md-3 col-lg-3"></div>
                     	</div>
                     	<% } %>
		</div>
	</div>


	<!-- 숫자 버튼창 -->
	<div class="container-fluid">
		<% if(list.size() != 0) {%>
		<div class="col-sm-5 col-md-5 col-lg-5"></div>
		<div class="col-sm-2 col-md-2 col-lg-2">
			<nav style="color: midnightblue;">
				<ul class="pagination">
				<!-- 한페이지 씩 앞으로 이동 -->
				<%if(pi.getCurrPage() <=1){ %>
					<li><span disabled>«</span></li>
				<% } else { %>
					<li><a href="<%=request.getContextPath() %>/orderChk.or?currentPage=<%=pi.getCurrPage()-1%>"><span aria-hidden="true">«</span><span
							class="sr-only">Previous</span></a></li>
				<% } %>
				<!-- 각 페이지 별 리스트 작성 -->
				<%for(int j = pi.getStartPage(); j<=pi.getEndPage(); j++){ %>
					<% if(j== pi.getCurrPage()){ %>
					<li><span disabled><%=j%></span></li>
					<%} else { %>
					<li><a href="<%=request.getContextPath() %>/orderChk.or?currentPage=<%=j%>"><%=j %></a></li>
					<%} %>
				<%} %>
				
				<!--한페이지씩 뒤로 이동 -->
				<%if(pi.getCurrPage()>=pi.getMaxPage()){ %>
				<li><span disabled>»</span></li>
				<% }else{ %>
				<li><a href="<%=request.getContextPath() %>/orderChk.or?currentPage=<%=pi.getCurrPage()+1%>"><span aria-hidden="true">»</span><span
						class="sr-only">Next</span></a></li>
				<% } %>
				</ul>
			</nav>
		</div>
		<div class="col-sm-5 col-md-5 col-lg-5"></div>
		<% } %>
	</div>
	<script>
		function search(){
			var start = $('#datepicker1').val();
			var end = $('#datepicker2').val();
			location.href = "<%=request.getContextPath() %>/orderChkSearch.or?start="+start+"&end="+end;
		}
		
		$('#reSet').on('click',function(){
			location.reload();
		});
		
		$('#refund').on('click',function(){
			var onum = $(this).parent().siblings().children('.oN').val();
			var cf = confirm("정말 환불 하시겠습니까??");
			if(cf == true){
			location.href=" <%=request.getContextPath() %>/orderRefund.or?onum="+onum;
			alert("환불이 완료되었습니다!");
			}
			
			
		});
		
		$('#buyComplete').on('click',function(){
			var onum = $(this).parent().siblings().children('.oN').val();
			location.href=" <%=request.getContextPath() %>/buyComplete.or?onum="+onum;
			
			alert("구매확정 되었습니다!");
			
		});
		
	</script>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
<!--부트스트랩 데이트피커-->
<!-- 부트 스트랩 데이트피커 관련 자료 https://bootstrap-datepicker.readthedocs.io/en/latest/#-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.css">
   <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script type='text/javascript'>
            $(function(){
                $('.input-group.date').datepicker({
                    calendarWeeks: false,
                    todayHighlight: true,
                    autoclose: true,
                    format: "yy/mm/dd",
                    language: "kr",
                       
                    
                    //선택가능한 날짜 지정할 수 있다
                    /* 
                    m : month
                    d: day
                    + : 현재시간으로 부터 후로
                    - : 현재시간으로 부터 전으로
                    
                    */
                    //startDate: '3m', // 3달전만 선택가능
                    endDate: '0d'  //오늘 이후 선택 불가능
                    
                });
            });

            $(function(){
	            $.fn.datepicker.dates['kr'] = {
		        days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		        daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
		        daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
		        months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		        monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	            };
            }(jQuery));
            
       
        </script>
</html>