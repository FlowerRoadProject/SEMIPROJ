<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.admin.model.vo.*" %>
<% 
	int admin_allMemberCount = (int)(request.getAttribute("admin_allMemberCount"));
	int admin_memberCount = (int)(request.getAttribute("admin_memberCount"));
	int admin_adminCount = (int)(request.getAttribute("admin_adminCount"));
	int admin_todayEnrollCount = (int)(request.getAttribute("admin_todayEnrollCount"));
	int admin_withdrawMemberCount = (int)(request.getAttribute("admin_withdrawMemberCount"));
	ArrayList<AdminMember> admin_memberList = (ArrayList<AdminMember>)(request.getAttribute("admin_memberList"));
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Walk Together Along the Flower Road </title>

		<!-- admin_CSS -->
		<%@ include file="common/admin_CSS.jsp" %>
		<script>
			var mainPath = '<%=request.getContextPath() %>';
		</script>
	</head>

	<body class="nav-md">
		<!-- admin_LOADING -->
		<%@ include file="common/admin_LOADING.jsp" %>
    
    <div class="container body">
      <div class="main_container">
        <!-- admin_NAV -->
    <%@ include file="common/admin_NAV.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>회원 관리 <small>(Members/Managers)</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="">
                  <div class="x_content">
                    <div class="row">
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-group"></i>
                          </div>
                          <div class="count"><%=admin_allMemberCount %></div>
                          <h3>총 인원</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-child"></i>
                          </div>
                          <div class="count"><%=admin_todayEnrollCount %></div>
                          <a href="<%=request.getContextPath() %>/todayEnrollMember.admin"><h3>오늘 가입 회원</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-user"></i>
                          </div>
                          <div class="count"><%=admin_memberCount %></div>
                          <a href="<%=request.getContextPath() %>/member.admin"><h3>회원</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-adn"></i>
                          </div>
                          <div class="count"><%=admin_adminCount %></div>
                          <a href="<%=request.getContextPath() %>/admin.admin"><h3>관리자</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-frown-o"></i>
                          </div>
                          <div class="count"><%=admin_withdrawMemberCount %></div>
                          <h3>탈퇴 회원</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 조회<small>Members</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					
                   <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap memberTable" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>회원번호</th>
                          <th>아이디</th>
                          <th>비밀번호</th>
                          <th>가입일</th>
                          <th>등급</th>
                          <th>이름</th>
                          <th>생년월일</th>
                          <th>성별</th>
                          <th>전화번호</th>
                          <th>이메일</th>
                          <th>주소</th>
                          <th>이미지</th>
                          <th>총구매액</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for(AdminMember am : admin_memberList){ %>
                        <tr>
                          <td><%=am.getMemberNum() %></td>
                          <td><%=am.getMemberId() %></td>
                          <td><%=am.getMemberPw() %></td>
                          <td><%=am.getEnrollDate() %></td>
                          <td><%=am.getGradeName() %></td>
                          <td><%=am.getMemberName() %></td>
                          <td><%=am.getMemberBirthDate() %></td>
                          <td><%=am.getMemberGender() %></td>
                          <td><%=am.getMemberPhone() %></td>
                          <td><%=am.getMemberEmail() %></td>
                          <td><%=am.getMemberAddress() %></td>
                          <td><%=am.getImagePath() %></td>
                          <td><%=am.getTotalPrice() %></td>
                        </tr>
                        <%} %>
                      </tbody>
                    </table>
                    
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 상세정보 <small>Member</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-md-4 col-sm-4 col-xs-12" style="margin-bottom: 20px;">
                      <div class="product-image">
                        <img class="MImage" src="" alt="..." />
                      </div>
                    </div>

                    <div class="col-md-8 col-sm-8 col-xs-12" style="border:0px solid #e5e5e5;">
                     <div class="col-md-12 col-sm-12 col-xs-12" style="">
                          <h3 class="prod_title">회원 번호</h3>
                          <input  class="col-md-12 col-sm-12 col-xs-12 MNum" type="text" style="margin-bottom: 15px" disabled>
                     </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">아이디</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MId"  type="text" style="margin-bottom: 15px" disabled>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">비밀번호</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MPw"  type="password" style="margin-bottom: 15px" disabled>
                          </div>
                      </div>
                      
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">등급</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MGrade"  type="text" style="margin-bottom: 15px" disabled>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">총 구매액</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MTotalPrice"  type="number" min='0' style="margin-bottom: 15px" disabled>
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">이름</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MName"  type="text" style="margin-bottom: 15px" disabled>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">성별</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MGender"  type="text" style="margin-bottom: 15px" disabled>
                              
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-12 col-xs-12" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">생년월일</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MBirth"  type="date" style="margin-bottom: 15px" disabled>
                          </div>
                          <div class="col-md-6 col-sm-12 col-xs-12" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">가입일</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MEnrollDate"  type="date" style="margin-bottom: 15px" disabled>
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-12 col-xs-12" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">전화번호</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MPhone"  type="text" style="margin-bottom: 15px" disabled>
                          </div>
                          <div class="col-md-6 col-sm-12 col-xs-12" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">이메일</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 MEmail"  type="text" style="margin-bottom: 15px" disabled>
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="">
                          <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">주소</p>
                          <input class="col-md-12 col-sm-12 col-xs-12 MAddress"  type="text" style="margin-bottom: 15px" disabled>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                         <button type="button" class="btn btn-round btn-success col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin: 4%;margin-left: 30%" id="checkMember">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
