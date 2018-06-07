<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.board.model.vo.*" %>
<% 
	int admin_faqBoardCount = (int)(request.getAttribute("admin_faqBoardCount"));
	int admin_noticeBoardCount = (int)(request.getAttribute("admin_noticeBoardCount"));
	int admin_reviewBoardCount = (int)(request.getAttribute("admin_reviewBoardCount"));
	int admin_userQuestionBoardCount = (int)(request.getAttribute("admin_userQuestionBoardCount"));
	ArrayList<ReviewBoard> admin_reviewBoardList = (ArrayList<ReviewBoard>)(request.getAttribute("admin_reviewBoardList"));
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
                <h3>상품리뷰 관리 <small>(Board)</small></h3>
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
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-bullhorn"></i>
                          </div>
                          <div class="count"><%=admin_noticeBoardCount %></div>
                          <a href="<%=request.getContextPath() %>/noticeBoard.admin"><h3>공지사항</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-star"></i>
                          </div>
                          <div class="count"><%=admin_faqBoardCount %></div>
							<a href="<%=request.getContextPath() %>/faqBoard.admin"><h3>FAQ</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-comments-o"></i>
                          </div>
                          <div class="count"><%=admin_userQuestionBoardCount %></div>

                          <a href="<%=request.getContextPath() %>/userQuestionBoard.admin"><h3>1:1문의</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-edit"></i>
                          </div>
                          <div class="count"><%=admin_reviewBoardCount %></div>

                          <a href="<%=request.getContextPath() %>/reviewBoard.admin"><h3>상품리뷰</h3></a>
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
                    <h2>게시글 조회<small>상품리뷰</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					
                   <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap reviewTable" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>글번호</th>
                          <th>회원번호</th>
                          <th>작성일</th>
                          <th>상품번호</th>
                          <th>별점</th>
                          <th>글제목</th>
                          <th>글내용</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for(ReviewBoard rb : admin_reviewBoardList){ %>
                        <tr>
                          <td><%=rb.getbNum() %></td>
                          <td><%=rb.getMemberNum() %></td>
                          <td><%=rb.getSubmitDate() %></td>
                          <td><%=rb.getProductNum() %></td>
                          <td><%=rb.getRating() %></td>
                          <td><%=rb.getbTitle() %></td>
                          <td><%=rb.getbContent() %></td>
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
                    <h2>상세보기 <small>상품리뷰</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                    
                    <div class="x_content">
                        <div id="alerts"></div>
                         <form id="demo-form" data-parsley-validate>
                          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
	                          <label for="fullname">글번호</label>
	                          <input type="text" id="" class="form-control reviewNum" name="" required disabled/>
                          </div>
                          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
                          	<label for="fullname">회원번호</label>
                          	<input type="text" id="" class="form-control reviewMemberNum" name="" required disabled/>
                          </div>
                          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
	                          <label for="fullname">상품번호</label>
	                          <input type="text" id="" class="form-control reviewProductNum" name="" required disabled/>
                          </div>
                          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
                          	<label for="fullname">별점</label>
                          	<input type="text" id="" class="form-control reviewRating" name="" required disabled/>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                          	<label for="fullname">제목</label>
                          	<input type="text" id="" class="form-control reviewTitle" name="" required disabled/>
                          </div>
                          
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
	                          <label for="fullname">내용</label>
	                          <textarea class="resizable_textarea form-control reviewContent" placeholder="..." disabled></textarea>
	                          
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="margin-top:20px">
	                          <button type="button" class="btn btn-round btn-success col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin-left:30%" id="checkReview">확인</button>
                          </div>
                        </form>
                      
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
	<script>
		var mainPath = '<%=request.getContextPath()%>';
	</script>
	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
