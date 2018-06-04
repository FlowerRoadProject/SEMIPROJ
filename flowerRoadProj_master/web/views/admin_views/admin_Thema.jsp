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
								<h3>테마 변경 <small>(Preset/Customizing)</small></h3>
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
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
										<h2>테마(theme) 설정 <sub>- Preset</sub></h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<div>프리셋 설정하기</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<button type="button" class="btn btn-round btn-success" style="width: 100px" onclick="changeCusFont();">프리셋 적용</button>
											<button type="button" class="btn btn-round btn-warning" style="width: 100px" onclick="saveCusFont();">설정 저장</button>
											<button type="button" class="btn btn-round btn-danger" style="width: 100px" onclick="cancleCusFont();">설정 취소</button>
										</div>
									</div>
								</div>
								<div class="x_panel">
									<div class="x_title">
										<h2>글자(font) 설정 <sub>- Customizing</sub></h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<form class="form-horizontal form-label-left">
											<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding-bottom: 20px">
												<p class="text-muted">Font-family</p>
												<div class="row">
													<div class="btn-group col-lg-12 col-md-12 col-sm-12 col-xs-12" data-toggle="buttons" id="fontFamily">
														<label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4" style="font-family: do hyeon;font-size: 16pt">
															<input type="radio" name="dohyeon" id="dohyeon"> Do hyeon
														</label>
														<label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4" style="font-family: cute font;font-size: 16pt">
															<input type="radio" name="cutefont" id="cutefont"> Cute font
														</label>
														<label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4" style="font-family: poor story;font-size: 16pt">
															<input type="radio" name="poorstory" id="poorstory"> Poor Story
														</label>
													</div>
												</div>
											</div>
                    
                        <div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding-bottom: 20px">
                            <p class="text-muted">Font-size</p>
                            <div class="row">
                              
                                <div class="btn-group col-lg-12 col-md-12 col-sm-12 col-xs-12" data-toggle="buttons" id="fontSize">
                                  
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size: 8pt">
                                  <input type="radio" name="options" id="option1">8pt
                                  </label>
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size: 10pt">
                                  <input type="radio" name="options" id="option2">10pt
                                  </label>
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size: 12pt">
                                  <input type="radio" name="options" id="option3">12pt
                                  </label>
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size: 14pt">
                                  <input type="radio" name="options" id="option3">14pt
                                  </label>
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size:16pt">
                                  <input type="radio" name="options" id="option3">16pt
                                  </label>
                                  <label class="btn btn-default col-lg-2 col-md-2 col-sm-2 col-xs-2" style="font-size: 18pt">
                                  <input type="radio" name="options" id="option3">18pt
                                  </label>
                                  
                                </div>
                              
                            </div>
                        </div>
                    
                    <div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding-bottom: 20px">
                        <p class="text-muted">Font-weight</p>
                        <div class="row">
                          <div class="btn-group col-lg-12 col-md-12 col-sm-12 col-xs-12" data-toggle="buttons" id="fontWeight">
                            <label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4">
                              <input type="radio" name="options" id="option1"> <l>Lighter</l>
                            </label>
                            <label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4">
                              <input type="radio" name="options" id="option2"> Normal
                            </label>
                            <label class="btn btn-default col-lg-4 col-md-4 col-sm-4 col-xs-4">
                              <input type="radio" name="options" id="option3"> <b>Bolder</b>
                            </label>
                          </div>
                        </div>
                      </div>
                      <br/>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                         <button type="button" class="btn btn-round btn-success" style="width: 100px" onclick="changeCusFont();">글자 적용</button>
                          <button type="button" class="btn btn-round btn-warning" style="width: 100px" onclick="saveCusFont();">설정 저장</button>
                          <button type="button" class="btn btn-round btn-danger" style="width: 100px" onclick="cancleCusFont();">설정 취소</button>
                      </div>
                      
                    </form>
                  </div>
                </div>
              </div>
              <!-- form color picker -->
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>배경색(back-color) 설정 <sub>- Customizing</sub></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <form class="form-horizontal form-label-left">
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 상단 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#2A3F54" class="form-control" id="navTitleBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 중간 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#2A3F54" class="form-control" id="navCenterBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 소메뉴 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#425668" class="form-control" id="childMenuBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 하단 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#2A3F54" class="form-control" id="navBottomBgc" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">상단 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#EDEDED" class="form-control" id="topMenuBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">상단 소메뉴 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#fff" class="form-control" id="topChildBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">메인 배경</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#F7F7F7" class="form-control" id="mainBgc"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                         <button type="button" class="btn btn-round btn-success" style="width: 100px" onclick="changeCusBgc();">배경 적용</button>
                          <button type="button" class="btn btn-round btn-warning" style="width: 100px" onclick="saveCusBgc();">설정 저장</button>
                          <button type="button" class="btn btn-round btn-danger" style="width: 100px" onclick="cancleCusBgc();">설정 취소</button>
                      </div>
                    </form>
                    
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>글자색(font-color) 설정 <sub>- Customizing</sub></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form class="form-horizontal form-label-left">
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 타이틀 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#ffffff" class="form-control" id="navTitleColor"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 프로필 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#ffffff" class="form-control" id="profileInfoColor"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 대분류 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#fff" class="form-control" id="sidebarMenuTitle" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 주메뉴 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#E7E7E7" class="form-control" id="sidebarMenuColor" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">왼쪽 소메뉴 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="rgba(255, 255, 255, 0.75)" class="form-control" id="sidebarchildmenuColor" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">상단 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#5A738E" class="form-control" id="topMenuColor" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <label class="control-label col-lg-12 col-md-12 col-sm-5 col-xs-3">메인 글자</label>
                        <div class="col-lg-12 col-md-12 col-sm-7 col-xs-9">
                          <div class="input-group demo2">
                            <input type="text" value="#73879C" class="form-control" id="bodyColor" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                          <button type="button" class="btn btn-round btn-success" style="width: 100px" onclick="changeCusFontColor();">글자색 적용</button>
                          <button type="button" class="btn btn-round btn-warning" style="width: 100px" onclick="saveCusFontColor();">설정 저장</button>
                          <button type="button" class="btn btn-round btn-danger" style="width: 100px" onclick="cancleCusFontColor();">설정 취소</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- /form color picker -->

              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <a class="music" style="float: right"><i class="fa fa-headphones" style="font-size: 20pt"><audio src="../../images/admin/third.wav" loop  preload="metadata"></audio></i></a>
          </div>
          <script>
            
            </script>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      
    </div>

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
