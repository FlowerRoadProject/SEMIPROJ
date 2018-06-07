<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h3>관리자 메시지 <small>Message</small></h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>메시지 관리함<small>Message</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="row">
                      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 mail_list_column">
                          <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                              <button id="" class="btn btn-sm btn-warning btn-block" type="button">전체 메시지 보기</button>
                          </div>
                           <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6 mail_list_column">
                               <button id="compose" class="btn btn-sm btn-success btn-block" type="button">새 메시지 보내기</button>
                           </div>
                        
                        <a>
                          <div class="mail_list">
                            <div class="left">
                              <i class="fa fa-circle"></i>
                            </div>
                            <div class="right">
                              <h3 class="col-lg-7 col-md-12 col-sm-6 col-xs-6">관리자1</h3>
                              <h4 class="col-lg-5 col-md-12 col-sm-6 col-xs-6" style="text-align: right"><small>3:00 PM</small></h4>
                              <p class="col-xs-12">메시지1</p>
                            </div>
                          </div>
                        </a>
                        <a>
                          <div class="mail_list">
                            <div class="left">
                              <i class="fa fa-circle"></i>
                            </div>
                            <div class="right">
                              <h3 class="col-lg-7 col-md-12 col-sm-6 col-xs-6">관리자2</h3>
                              <h4 class="col-lg-5 col-md-12 col-sm-6 col-xs-6" style="text-align: right"><small>4:00 PM</small></h4>
                              <p class="col-xs-12">메시지2</p>
                            </div>
                          </div>
                        </a>
                        <a>
                          <div class="mail_list">
                            <div class="left">
                              <i class="fa fa-circle"></i>
                            </div>
                            <div class="right">
                              <h3 class="col-lg-7 col-md-12 col-sm-6 col-xs-6">관리자3</h3>
                              <h4 class="col-lg-5 col-md-12 col-sm-6 col-xs-6" style="text-align: right"><small>5:00 PM</small></h4>
                              <p class="col-xs-12">메시지3</p>
                            </div>
                          </div>
                        </a>
                        <a>
                          <div class="mail_list">
                            <div class="left">
                              <i class="fa fa-circle"></i>
                            </div>
                            <div class="right">
                              <h3 class="col-lg-7 col-md-12 col-sm-6 col-xs-6">관리자4</h3>
                              <h4 class="col-lg-5 col-md-12 col-sm-6 col-xs-6" style="text-align: right"><small>6:00 PM</small></h4>
                              <p class="col-xs-12">메시지4</p>
                            </div>
                          </div>
                        </a>
                      </div>
                      <!-- /MAIL LIST -->

                      <!-- CONTENT MAIL -->
                      <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 mail_view">
                        <div class="inbox-body">
                          <div class="mail_heading row">
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                              <div class="btn-group">
                                <button id="compose" class="btn btn-sm btn-primary" type="button"><i class="fa fa-reply"></i> 답장</button>
                                <button class="btn btn-sm btn-danger" type="button" data-placement="top" data-toggle="tooltip" data-original-title="Trash"><i class="fa fa-trash-o"></i> 삭제</button>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-5 col-xs-6 text-right">
                              <p class="date"> 8:02 PM 12 FEB 2018</p>
                            </div>
                          </div>
                          <div class="sender-info">
                            <div class="row">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <strong>보낸 사람</strong>
                                <a class="sender-dropdown"><i class="fa fa-chevron-down"></i></a>
                                <div class="writerName">
                                    
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="view-mail">
                            <div class="col-md-12">
                                <strong>내용</strong>
                                <a class="sender-dropdown"><i class="fa fa-chevron-down"></i></a>
                              </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 writerContents">
                                
                              </div>
                            
                          </div>
                        </div>
                        

                      </div>
                      <!-- /CONTENT MAIL -->
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
    <!-- compose -->
    <div class="compose col-md-6 col-xs-12">
      <div class="compose-header">
        메시지 작성
        <button type="button" class="close compose-close">
          <span>×</span>
        </button>
      </div>

      <div class="compose-body">
        <div id="alerts"></div>

        <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor">
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

        <div id="editor" class="editor-wrapper"></div>
      </div>

      <div class="compose-footer">
        <button id="send" class="btn btn-sm btn-success" type="button">보내기</button>
      </div>
    </div>
   	<script>
		var mainPath = '<%=request.getContextPath() %>';
	</script>
    <!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
