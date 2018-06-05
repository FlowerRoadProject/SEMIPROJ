<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.board.model.vo.*" %>
<% 
	int admin_faqBoardCount = (int)(request.getAttribute("admin_faqBoardCount"));
	int admin_noticeBoardCount = (int)(request.getAttribute("admin_noticeBoardCount"));
	int admin_reviewBoardCount = (int)(request.getAttribute("admin_reviewBoardCount"));
	int admin_userQuestionBoardCount = (int)(request.getAttribute("admin_userQuestionBoardCount"));
	ArrayList<FaqBoard> admin_faqBoardList = (ArrayList<FaqBoard>)(request.getAttribute("admin_faqBoardList"));
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
                    <h2>게시글 조회<small>FAQ</small></h2>
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
                          <th>작성자</th>
                          <th>작성일</th>
                          <th>카테고리</th>
                          <th>질문</th>
                          <th>답변</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for(FaqBoard fb : admin_faqBoardList){ %>
                        <tr>
                          <td><%=fb.getbNum() %></td>
                          <td><%=fb.getMemberNum() %></td>
                          <td><%=fb.getSubmitDate() %></td>
                          <td><%=fb.getContentCategory() %></td>
                          <td><%=fb.getbTitle() %></td>
                          <td><%=fb.getbContent() %></td>
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
                    <h2>게시글 등록/수정/삭제 <small>FAQ</small></h2>
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
	                          <input type="text" id="" class="form-control faqNum" name="fullname" required disabled/>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                          <label for="heard">카테고리 선택</label>
	                          <select id="heard" class="form-control faqCatecory" required>
	                            <option value="카테고리 선택">카테고리 선택</option>
	                            <option value="결제">결제</option>
	                            <option value="교환/환불">교환/환불</option>
	                            <option value="배송">배송</option>
	                            <option value="상품">상품</option>
	                            <option value="주문">주문</option>
	                            <option value="쿠폰">쿠폰</option>
	                            <option value="회원">회원</option>
	                          </select>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                          	<label for="fullname">질문</label>
                          	<input type="text" id="fullname" class="form-control faqQuestion" name="fullname" required />
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                          <label for="fullname">답변</label>
	                          <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
	                            <div class="btn-group">
	                              <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
	                              <ul class="dropdown-menu">
	                              </ul>
	                            </div>
	
	                            <div class="btn-group">
	                              <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
	                              <ul class="dropdown-menu">
	                                <li>
	                                  <a data-edit="fontSize 5">
	                                    <p style="font-size:17px">Huge</p>
	                                  </a>
	                                </li>
	                                <li>
	                                  <a data-edit="fontSize 3">
	                                    <p style="font-size:14px">Normal</p>
	                                  </a>
	                                </li>
	                                <li>
	                                  <a data-edit="fontSize 1">
	                                    <p style="font-size:11px">Small</p>
	                                  </a>
	                                </li>
	                              </ul>
	                            </div>
	
	                            <div class="btn-group">
	                              <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
	                              <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
	                              <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
	                              <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
	                            </div>
	
	                            <div class="btn-group">
	                              <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
	                              <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
	                              <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
	                              <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
	                            </div>
	
	                            <div class="btn-group">
	                              <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
	                              <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
	                              <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
	                              <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
	                            </div>
	
	                            <div class="btn-group">
	                              <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
	                              <div class="dropdown-menu input-append">
	                                <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
	                                <button class="btn" type="button">Add</button>
	                              </div>
	                              <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
	                            </div>
	                            <div class="btn-group">
	                              <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
	                              <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
	                            </div>
	                          </div>
	
	                          <div id="editor-one" class="editor-wrapper faqAnswer"></div>
                          </div>
                          
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="margin-top:20px">
	                          <button type="button" class="btn btn-round btn-success" style="width: 100px" id="insertFAQ">등록</button>
	                          <button type="button" class="btn btn-round btn-warning" style="width: 100px" id="updateFAQ">수정</button>
	                          <button type="button" class="btn btn-round btn-danger" style="width: 100px" id="cancleFAQ">취소</button>
	                          <button type="button" class="btn btn-round" style="width: 100px" id="deleteFAQ">삭제</button>
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

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
