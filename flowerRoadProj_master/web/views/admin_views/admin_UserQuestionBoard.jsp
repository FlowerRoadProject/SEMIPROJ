<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.board.model.vo.*" %>
<% 
	int admin_faqBoardCount = (int)(request.getAttribute("admin_faqBoardCount"));
	int admin_noticeBoardCount = (int)(request.getAttribute("admin_noticeBoardCount"));
	int admin_reviewBoardCount = (int)(request.getAttribute("admin_reviewBoardCount"));
	int admin_userQuestionBoardCount = (int)(request.getAttribute("admin_userQuestionBoardCount"));
	ArrayList<UserQuestionBoard> admin_userQuestionBoardList = (ArrayList<UserQuestionBoard>)(request.getAttribute("admin_userQuestionBoardList"));
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
                <h3>게시글 관리 <small>(Posting)</small></h3>
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
                          <div class="count noticeBoardCount"><%=admin_noticeBoardCount %></div>
                          <a href="<%=request.getContextPath() %>/noticeBoard.admin"><h3>공지사항</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-star"></i>
                          </div>
                          <div class="count faqBoardCount"><%=admin_faqBoardCount %></div>
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
                    <h2>게시글 조회<small>1:1문의</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					
                   <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>글번호</th>
                          <th>회원번호</th>
                          <th>글제목</th>
                          <th>글내용</th>
                          <th>작성일</th>
                          <th>관리자번호</th>
                          <th>답변내용</th>
                          <th>답변일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for(UserQuestionBoard uqb : admin_userQuestionBoardList){ %>
                        <tr>
                          <td><%=uqb.getbNum() %></td>
                          <td><%=uqb.getMemberNum() %></td>
                          <td><%=uqb.getbTitle() %></td>
                          <td><%=uqb.getbContent() %></td>
                          <td><%=uqb.getSubmitDate() %></td>
                          <td><%=uqb.getManagerNum() %></td>
                          <td><%=uqb.getReplyContent() %></td>
                          <td><%=uqb.getReply_date() %></td>
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
                    <h2>답변 등록 <small>1:1 문의</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                    
                    <div class="x_content">
                        <div id="alerts"></div>
                         <form id="demo-form" data-parsley-validate>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
	                          <label for="fullname">글번호</label>
	                          <input type="text" id="" class="form-control userQuestionNum" name="fullname" required disabled/>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                          	<label for="fullname">회원번호</label>
                          	<input type="text" id="" class="form-control userQuestionMemberNum" name="fullname" required />
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                          	<label for="fullname">제목</label>
                          	<input type="text" id="" class="form-control userQuestionTitle" name="fullname" required />
                          </div>
                          
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
	                          <label for="fullname">내용</label>
	                          <div id="editor-one" class="editor-wrapper userQuestionContent"></div>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                          	<div class="ln_solid"></div>
						</div>
                          <div class="form-group" style="padding-bottom: 90px">
                            <label class="control-label col-md-12 col-sm-12 col-xs-12">답변등록</label>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                              <textarea class="resizable_textarea form-control userQuestionReply" placeholder="..."></textarea>
                            </div>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="margin-top:20px">
	                          <button type="button" class="btn btn-round btn-success" style="width: 100px" id="insertUserQuestion">등록</button>
	                          <button type="button" class="btn btn-round btn-warning" style="width: 100px" id="updateUserQuestion">수정</button>
	                          <button type="button" class="btn btn-round btn-danger" style="width: 100px" id="cancleUserQuestion">취소</button>
	                          <button type="button" class="btn btn-round" style="width: 100px" id="deleteUserQuestion">삭제</button>
                          </div>
                        </form>
                      
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
