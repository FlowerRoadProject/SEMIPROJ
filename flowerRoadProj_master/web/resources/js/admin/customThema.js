
//커스텀 배경 설정 적용
function changeCusBgc(){
    //메뉴 상단 배경
    $('.nav_title').css('background-color',$('#navTitleBgc').val());
    //메뉴 중간 배경
    $('.left_col').css('background-color',$('#navCenterBgc').val());
    //메뉴 하단 배경
    $('.sidebar-footer').css('background-color',$('#navBottomBgc').val());
    $('.sidebar-footer>a').css('background-color',$('#navBottomBgc').val());
    //메뉴>소메뉴 배경
    $('ul.nav.child_menu').css('background-color',$('#childMenuBgc').val());
    //상단메뉴 배경
    $('.nav_menu').css('background-color',$('#topMenuBgc').val());
    //상단메뉴>소메뉴 배경 
    $('.navbar-nav .dropdown-menu').css('background-color',$('#topChildBgc').val());
    //메인 배경
    $('body .body.container .right_col').css('background-color',$('#mainBgc').val());
};
//커스텀 배경 설정 저장
$('#saveCusBgc').on({
	'click':function(){
		$.ajax({
			url: mainPath+"/bgcThemaUpdate.admin",
			type: "post",
			data: {
				navTitleBgc: $('#navTitleBgc').val(),
				navCenterBgc: $('#navCenterBgc').val(),
				childMenuBgc: $('#childMenuBgc').val(),
				navBottomBgc: $('#navBottomBgc').val(),
				topMenuBgc: $('#topMenuBgc').val(),
				topChildBgc: $('#topChildBgc').val(),
				mainBgc: $('#mainBgc').val()
			},
			success: function(data){
				var cusCheck = confirm("저장한 설정은 다음 접속부터 적용됩니다.\n다시 로그인 하시겠습니까?");
				if(cusCheck) location.href=(mainPath+"/views/mainPage/login.jsp");
			},
			error: function(data){
				alert("전달 실패!!");
			}
		});
	}
});
//커스텀 배경 설정 취소
$('#cancleCusBgc').on({
	'click':function(){
		location.reload();
	}
});

//커스텀 글자 색상 설정 적용
function changeCusFontColor(){
    //왼쪽메뉴 타이틀
    $('.nav-md .navbar.nav_title a>span').css('color',$('#navTitleColor').val());
    //왼쪽메뉴 프로필
    $('.profile_info span').css('color',$('#profileInfoColor').val());
    $('.profile_info h2').css('color',$('#profileInfoColor').val());
    //왼쪽메뉴 대분류
    $('.menu_section h3').css('color',$('#sidebarMenuTitle').val());
    //왼쪽메뉴 주메뉴
    $('.nav.side-menu>li>a').css('color',$('#sidebarMenuColor').val());
    //왼쪽메뉴 소메뉴
    $('.nav.child_menu>li>a').css('color',$('#sidebarchildmenuColor').val());
    //상단메뉴 글자색
    $('.topMenuFontColor').css('color',$('#topMenuColor').val());
    //메인내용 글자색
    $('body').css('color',$('#bodyColor').val());
};
//커스텀 글자 색상 설정 저장
$('#saveCusFontColor').on({
	'click':function(){
		$.ajax({
			url: mainPath+"/fontColorThemaUpdate.admin",
			type: "post",
			data: {
				navTitleColor: $('#navTitleColor').val(),
				profileInfoColor: $('#profileInfoColor').val(),
				sidebarMenuTitle: $('#sidebarMenuTitle').val(),
				sidebarMenuColor: $('#sidebarMenuColor').val(),
				sidebarchildmenuColor: $('#sidebarchildmenuColor').val(),
				topMenuColor: $('#topMenuColor').val(),
				bodyColor: $('#bodyColor').val()
			},
			success: function(data){
				var cusCheck = confirm("저장한 설정은 다음 접속부터 적용됩니다.\n다시 로그인 하시겠습니까?");
				if(cusCheck) location.href=(mainPath+"/views/mainPage/login.jsp");
			},
			error: function(data){
				alert("전달 실패!!");
			}
		});
	}
});
//커스텀 글자 색상 설정 취소
$('#cancleCusFontColor').on({
	'click':function(){
		location.reload();
	}
});
// 프리셋 설정 적용
function changePreset(){
	var preset = $.trim($('#preset').find('.active').text());
	switch(preset){
	case "BLACK_ROSE": 
		$('body').css({
	        'font-family':"poor story",
	        'font-size':"14pt",
	        'font-weight':"normal"
	    });
		//메뉴 상단 배경
	    $('.nav_title').css('background-color',"#191919");
	    //메뉴 중간 배경
	    $('.left_col').css('background-color',"#191919");
	    //메뉴 하단 배경
	    $('.sidebar-footer').css('background-color',"#000000");
	    $('.sidebar-footer>a').css('background-color',"#000000");
	    //메뉴>소메뉴 배경
	    $('ul.nav.child_menu').css('background-color',"#1b1b1b");
	    //상단메뉴 배경
	    $('.nav_menu').css('background-color',"#191919");
	    //상단메뉴>소메뉴 배경 
	    $('.navbar-nav .dropdown-menu').css('background-color',"#1b1b1b");
	    //메인 배경
	    $('body .body.container .right_col').css('background-color',"#272727");
	    
	    //왼쪽메뉴 타이틀
	    $('.nav-md .navbar.nav_title a>span').css('color',"#ffffff");
	    //왼쪽메뉴 프로필
	    $('.profile_info span').css('color',"#8ffffa");
	    $('.profile_info h2').css('color',"#8ffffa");
	    //왼쪽메뉴 대분류
	    $('.menu_section h3').css('color',"#fffac4");
	    //왼쪽메뉴 주메뉴
	    $('.nav.side-menu>li>a').css('color',"#ffffff");
	    //왼쪽메뉴 소메뉴
	    $('.nav.child_menu>li>a').css('color',"#fffac4");
	    //상단메뉴 글자색
	    $('.topMenuFontColor').css('color',"#ffffff");
	    //메인내용 글자색
	    $('body').css('color',"#0098a0");
		
		break;
	case "MORNING_GRORY": 
		$('body').css({
	        'font-family':"cute font",
	        'font-size':"14pt",
	        'font-weight':"normal"
	    });
		//메뉴 상단 배경
	    $('.nav_title').css('background-color',"#88fffe");
	    //메뉴 중간 배경
	    $('.left_col').css('background-color',"#88fffe");
	    //메뉴 하단 배경
	    $('.sidebar-footer').css('background-color',"#00dbd9");
	    $('.sidebar-footer>a').css('background-color',"#00dbd9");
	    //메뉴>소메뉴 배경
	    $('ul.nav.child_menu').css('background-color',"#00cac9");
	    //상단메뉴 배경
	    $('.nav_menu').css('background-color',"#88fffe");
	    //상단메뉴>소메뉴 배경 
	    $('.navbar-nav .dropdown-menu').css('background-color',"#00cac9");
	    //메인 배경
	    $('body .body.container .right_col').css('background-color',"#00cac9");
	    
	    //왼쪽메뉴 타이틀
	    $('.nav-md .navbar.nav_title a>span').css('color',"#f0ff5f");
	    //왼쪽메뉴 프로필
	    $('.profile_info span').css('color',"#ae4848");
	    $('.profile_info h2').css('color',"#ae4848");
	    //왼쪽메뉴 대분류
	    $('.menu_section h3').css('color',"#ffc4c4");
	    //왼쪽메뉴 주메뉴
	    $('.nav.side-menu>li>a').css('color',"#4876ae");
	    //왼쪽메뉴 소메뉴
	    $('.nav.child_menu>li>a').css('color',"#fffac4");
	    //상단메뉴 글자색
	    $('.topMenuFontColor').css('color',"#f0ff5f");
	    //메인내용 글자색
	    $('body').css('color',"#c1dd00");
		break;
	case "MUGUNGHWA": 
		$('body').css({
	        'font-family':"do hyeon",
	        'font-size':"14pt",
	        'font-weight':"normal"
	    });
		//메뉴 상단 배경
	    $('.nav_title').css('background-color',"#fd92ff");
	    //메뉴 중간 배경
	    $('.left_col').css('background-color',"#fd92ff");
	    //메뉴 하단 배경
	    $('.sidebar-footer').css('background-color',"#fc74ff");
	    $('.sidebar-footer>a').css('background-color',"#fc74ff");
	    //메뉴>소메뉴 배경
	    $('ul.nav.child_menu').css('background-color',"#d459d6");
	    //상단메뉴 배경
	    $('.nav_menu').css('background-color',"#fd92ff");
	    //상단메뉴>소메뉴 배경 
	    $('.navbar-nav .dropdown-menu').css('background-color',"#d459d6");
	    //메인 배경
	    $('body .body.container .right_col').css('background-color',"#fecbff");
	    
	    //왼쪽메뉴 타이틀
	    $('.nav-md .navbar.nav_title a>span').css('color',"#7dff94");
	    //왼쪽메뉴 프로필
	    $('.profile_info span').css('color',"#484bae");
	    $('.profile_info h2').css('color',"#484bae");
	    //왼쪽메뉴 대분류
	    $('.menu_section h3').css('color',"#cdc4ff");
	    //왼쪽메뉴 주메뉴
	    $('.nav.side-menu>li>a').css('color',"#92488e");
	    //왼쪽메뉴 소메뉴
	    $('.nav.child_menu>li>a').css('color',"#510a4d");
	    //상단메뉴 글자색
	    $('.topMenuFontColor').css('color',"#7dff94");
	    //메인내용 글자색
	    $('body').css('color',"#1c631e");
		break;
	default: 
		$('body').css({
	        'font-family':"궁서체",
	        'font-size':"12pt",
	        'font-weight':"400"
	    });
		//메뉴 상단 배경
	    $('.nav_title').css('background-color',"#2a3f54");
	    //메뉴 중간 배경
	    $('.left_col').css('background-color',"#2a3f54");
	    //메뉴 하단 배경
	    $('.sidebar-footer').css('background-color',"#2a3f54");
	    $('.sidebar-footer>a').css('background-color',"#2a3f54");
	    //메뉴>소메뉴 배경
	    $('ul.nav.child_menu').css('background-color',"#425668");
	    //상단메뉴 배경
	    $('.nav_menu').css('background-color',"#ededed");
	    //상단메뉴>소메뉴 배경 
	    $('.navbar-nav .dropdown-menu').css('background-color',"#ffffff");
	    //메인 배경
	    $('body .body.container .right_col').css('background-color',"#f7f7f7");
	    
	    //왼쪽메뉴 타이틀
	    $('.nav-md .navbar.nav_title a>span').css('color',"#ffffff");
	    //왼쪽메뉴 프로필
	    $('.profile_info span').css('color',"#b9b9b9");
	    $('.profile_info h2').css('color',"#ffffff");
	    //왼쪽메뉴 대분류
	    $('.menu_section h3').css('color',"#ffffff");
	    //왼쪽메뉴 주메뉴
	    $('.nav.side-menu>li>a').css('color',"#e7e7e7");
	    //왼쪽메뉴 소메뉴
	    $('.nav.child_menu>li>a').css('color',"rgba(255,255,255,0.75)");
	    //상단메뉴 글자색
	    $('.topMenuFontColor').css('color',"#5a738e");
	    //메인내용 글자색
	    $('body').css('color',"#73879c");
		break;
	}
	
};
// 프리셋 설정 저장
$('#savePreset').on({
	'click':function(){
		$.ajax({
			url: mainPath+"/presetThemaUpdate.admin",
			type: "post",
			data: {
				preset: $.trim($('#preset').find('.active').text())
			},
			success: function(data){
				var cusCheck = confirm("저장한 설정은 다음 접속부터 적용됩니다.\n다시 로그인 하시겠습니까?");
				if(cusCheck) location.href=(mainPath+"/views/mainPage/login.jsp");
			},
			error: function(data){
				alert("전달 실패!!");
			}
		});
	}
});
// 관리자 테마 불러오기
$(document).ready(function() {
	$('body').css({
        'font-family':font_family,
        'font-size':font_size,
        'font-weight':font_weight
    });
	//메뉴 상단 배경
    $('.nav_title').css('background-color',nav_title_bgc);
    //메뉴 중간 배경
    $('.left_col').css('background-color',nav_center_bgc);
    //메뉴 하단 배경
    $('.sidebar-footer').css('background-color',nav_bottom_bgc);
    $('.sidebar-footer>a').css('background-color',nav_bottom_bgc);
    //메뉴>소메뉴 배경
    $('ul.nav.child_menu').css('background-color',nav_child_bgc);
    //상단메뉴 배경
    $('.nav_menu').css('background-color',top_menu_bgc);
    //상단메뉴>소메뉴 배경 
    $('.navbar-nav .dropdown-menu').css('background-color',top_child_bgc);
    //메인 배경
    $('body .body.container .right_col').css('background-color',main_bgc);
    
    //왼쪽메뉴 타이틀
    $('.nav-md .navbar.nav_title a>span').css('color',nav_title_color);
    //왼쪽메뉴 프로필
    $('.profile_info span').css('color',nav_profile_color);
    $('.profile_info h2').css('color',nav_profile_color);
    //왼쪽메뉴 대분류
    $('.menu_section h3').css('color',nav_side_title_color);
    //왼쪽메뉴 주메뉴
    $('.nav.side-menu>li>a').css('color',nav_side_color);
    //왼쪽메뉴 소메뉴
    $('.nav.child_menu>li>a').css('color',nav_child_color);
    //상단메뉴 글자색
    $('.topMenuFontColor').css('color',top_menu_color);
    //메인내용 글자색
    $('body').css('color',main_color);
});
// 프리셋 설정 취소
$('#canclePreset').on({
	'click':function(){
		location.reload();
	}
});
// 프리셋 투명도 조절
$(document).on({
	'click': function(){
		$('#preset .active').css('opacity',1);
		$('#preset .active').siblings().css('opacity',0.5);
	}
	
});
//왼쪽 로고 hover
$('.nav_title img').on({
    'mouseenter':function(){$(this).attr('src',mainPath+'/resources/images/admin/admin_side_icon_hover.png');
                            $('.icon').attr('href',mainPath+'/resources/images/admin/admin_side_icon_hover.png')},
    'mouseleave':function(){$(this).attr('src',mainPath+'/resources/images/admin/admin_side_icon.png');
                           $('.icon').attr('href',mainPath+'/resources/images/admin/admin_title_icon.png')}
});
//왼쪽 하단 top
$('.sidebar-footer a').on({
    'mouseenter':function(){
        $('.sidebar-footer a span').css({
            'animation-name':'trans2',
            'animation-duration':'0.5s',
            'animation-direction':'alternate',
            'animation-iteration-count':'infinite'
        });
    },'mouseleave':function(){
        $('.sidebar-footer a span').css('animation-iteration-count','0');
    }
});
//왼쪽 주메뉴 드롭
$('.nav.side-menu>li>a').on({
    'mouseenter':function(){
        $(this).children('span').css({
            'animation-name':'trans3',
            'animation-duration':'0.4s',
            'animation-direction':'alternate',
            'animation-iteration-count':'infinite'
        }),$(this).children('i').css({
            'color': '#fffeb6'
        });
    },'mouseleave':function(){
        $('.side-menu>li>a span').css('animation-iteration-count','0');
        $('.side-menu>li>a i').css('color','snow');
    }
});
//톱메뉴 아이콘
$('#menu_toggle').on({
    'mouseenter':function(){
        $(this).children('i').css({
            'transform':'rotateY(540deg)',
            'color': '#fffeb6'
        });
    },'mouseleave':function(){
        $(this).children('i').css('transform','rotateY(0deg)');
        $(this).children('i').css('color','#000000');
    }
});
$('.dropdown-toggle').children('span').each(function(index){
    if(parseInt($(this).html())>0) {
        if($(this).hasClass('bg-purple')){
            $(this).siblings('i').addClass('fa-envelope');
            $(this).siblings('i').removeClass('fa-envelope-o');
        }else if($(this).hasClass('bg-blue')){
            $(this).siblings('i').addClass('fa-comment');
            $(this).siblings('i').removeClass('fa-comment-o');
        }else if($(this).hasClass('bg-green')){
            $(this).siblings('i').addClass('fa-pencil-square');
            $(this).siblings('i').removeClass('fa-pencil-square-o');
        }
        $(this).siblings('i').addClass('blinking');
    }else {
        $(this).siblings('i').removeClass('blinking');
    }
});
$('.dropdown-usermenu a').on({
    'mouseenter':function(){
        $(this).children('i').css({
            'animation-name':'trans4',
            'animation-duration':'0.4s',
            'animation-direction':'alternate',
            'animation-iteration-count':'infinite',
            'color':'#ff1c1c'
        });
    },'mouseleave':function(){
        $(this).children('i').css('animation-iteration-count','0');
        $(this).children('i').css('color','#000000');
    }
});

//글자 설정
function changeCusFont(){
    $('body').css({
        'font-family':$('#fontFamily').children('.active').text(),
        'font-size':$('#fontSize').children('.active').text(),
        'font-weight':$('#fontWeight').children('.active').text()
    });
};
// 글자 저장
$('#saveCusFont').on({
	'click':function(){
		$.ajax({
			url: mainPath+"/fontThemaUpdate.admin",
			type: "post",
			data: {
				fontFamily: $.trim($('#fontFamily').find('.active').text()),
				fontSize: $.trim($('#fontSize').find('.active').text()),
				fontWeight: $.trim($('#fontWeight').find('.active').text())
			},
			success: function(data){
				var cusCheck = confirm("저장한 설정은 다음 접속부터 적용됩니다.\n다시 로그인 하시겠습니까?");
				if(cusCheck) location.href=(mainPath+"/views/mainPage/login.jsp");
			},
			error: function(data){
				alert("전달 실패!!");
			}
		});
	}
});
//글자 설정 취소
$('#cancleCusFont').on({
	'click':function(){
		location.reload();
	}
});
//음악 설정
$('a.music').click(function(){
    $(this).children('audio').attr('play');
});
// 메인 리더보드 난이도 선택
var difficultyNum = 150;
var difficultyRate =50;
var cnt = 0;
$('#selectDifficulty').on({
	'change':function(){
		var difficulty = $(this).val();
		switch(difficulty){
		case 'easy': 
			$('.randomGame #target').css({'width':'200px','height':'200px'});
			$('.randomGame #goal').css({'width':'200px','height':'200px'});
			difficultyNum=150; difficultyRate=50;
			cnt=0;
			var widthget = $('.randomGame #target').parent().css('width').replace(/[^-\d\.]/g, '');
			var heightget = $('.randomGame #target').parent().css('height').replace(/[^-\d\.]/g, '');
			var top2 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left2 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #target').css({'top': top2, 'left':left2});
			var top3 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left3 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #goal').css({'top': top3, 'left':left3});
			$.ajax({
				url: mainPath+"/selectLeaderBoardList.admin",
				type: "post",
				data: {
					difficulty: $('#selectDifficulty').val()
				},
				success: function(data){
					$('.leaderBoardTbody').children().remove();
					if(data.length!=0){
						for(var a=0; a<data.length; a++){
							var b=a+1;
							$('.leaderBoardTbody').append("<tr><th scope='row'>"+b+"</th><td>"+data[a].adminNum+"</td><td>"+data[a].clickCount+
									"</td><td>"+data[a].gameDate+"</td></tr>");

						}
					}
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
			break;
		case 'normal': 
			$('.randomGame #target').css({'width':'160px','height':'160px'});
			$('.randomGame #goal').css({'width':'160px','height':'160px'});
			difficultyNum=120; difficultyRate=40;
			cnt=0;
			var widthget = $('.randomGame #target').parent().css('width').replace(/[^-\d\.]/g, '');
			var heightget = $('.randomGame #target').parent().css('height').replace(/[^-\d\.]/g, '');
			var top2 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left2 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #target').css({'top': top2, 'left':left2});
			var top3 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left3 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #goal').css({'top': top3, 'left':left3});
			$.ajax({
				url: mainPath+"/selectLeaderBoardList.admin",
				type: "post",
				data: {
					difficulty: $('#selectDifficulty').val()
				},
				success: function(data){
					$('.leaderBoardTbody').children().remove();
					if(data.length!=0){
						for(var a=0; a<data.length; a++){
							var b=a+1;
							$('.leaderBoardTbody').append("<tr><th scope='row'>"+b+"</th><td>"+data[a].adminNum+"</td><td>"+data[a].clickCount+
									"</td><td>"+data[a].gameDate+"</td></tr>");

						}
					}

				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
			break;
		case 'hard': 
			$('.randomGame #target').css({'width':'120px','height':'120px'});
			$('.randomGame #goal').css({'width':'120px','height':'120px'});
			difficultyNum=90; difficultyRate=30;
			cnt=0;
			var widthget = $('.randomGame #target').parent().css('width').replace(/[^-\d\.]/g, '');
			var heightget = $('.randomGame #target').parent().css('height').replace(/[^-\d\.]/g, '');
			var top2 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left2 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #target').css({'top': top2, 'left':left2});
			var top3 = (Math.trunc((Math.random()*(heightget-difficultyNum))/50))*50;
			var left3 = (Math.trunc((Math.random()*(widthget-difficultyNum))/50))*50;
			$('.randomGame #goal').css({'top': top3, 'left':left3});
			$.ajax({
				url: mainPath+"/selectLeaderBoardList.admin",
				type: "post",
				data: {
					difficulty: $('#selectDifficulty').val()
				},
				success: function(data){
					$('.leaderBoardTbody').children().remove();
					if(data.length!=0){
						for(var a=0; a<data.length; a++){
							var b=a+1;
							$('.leaderBoardTbody').append("<tr><th scope='row'>"+b+"</th><td>"+data[a].adminNum+"</td><td>"+data[a].clickCount+
									"</td><td>"+data[a].gameDate+"</td></tr>");

						}
					}

				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
			break;
		case 'veryHard': 
			$('.randomGame #target').css({'width':'80px','height':'80px'});
			$('.randomGame #goal').css({'width':'80px','height':'80px'});
			difficultyNum=60; difficultyRate=20;
			cnt=0;
			var widthget = $('.randomGame #target').parent().css('width').replace(/[^-\d\.]/g, '');
			var heightget = $('.randomGame #target').parent().css('height').replace(/[^-\d\.]/g, '');
			var top2 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left2 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #target').css({'top': top2, 'left':left2});
			var top3 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
			var left3 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
			$('.randomGame #goal').css({'top': top3, 'left':left3});
			$.ajax({
				url: mainPath+"/selectLeaderBoardList.admin",
				type: "post",
				data: {
					difficulty: $('#selectDifficulty').val()
				},
				success: function(data){
					$('.leaderBoardTbody').children().remove();
					if(data.length!=0){
						for(var a=0; a<data.length; a++){
							var b=a+1;
							$('.leaderBoardTbody').append("<tr><th scope='row'>"+b+"</th><td>"+data[a].adminNum+"</td><td>"+data[a].clickCount+
									"</td><td>"+data[a].gameDate+"</td></tr>");

						}
					}

				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
			break;
		}
	}
});
// 메인 랜덤 위치
$('#randomPlace').on({
	'click':function(){
		var widthget = $('.randomGame #target').parent().css('width').replace(/[^-\d\.]/g, '');
		var heightget = $('.randomGame #target').parent().css('height').replace(/[^-\d\.]/g, '');
		var top2 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
		var left2 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
		$('.randomGame #target').css({'top': top2, 'left':left2});
		var top3 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
		var left3 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
		$('.randomGame #goal').css({'top': top3, 'left':left3});
		cnt=0;
		$('#clickCount').text(cnt);
	}
});
// 메인 랜덤 점수 초기화
$('#resetScore').on({
	'click':function(){
		var resetCheck = confirm("기록 초기화?");
		if(resetCheck){
			$.ajax({
				url: mainPath+"/deleteLeaderBoardList.admin",
				type: "post",
				success: function(data){
					if(data==true){
						alert("초기화 완료");
						$('.leaderBoardTbody').children().remove();
					}else{
						alert("넌 안돼~!");
					}
					
				},error: function(data){
					alert("전달 실패!!");
				}
			});
		}else alert("나중에 해~");
	}
});
//메인 랜덤 게임
$('.randomGame #target').on({
	'click':function(){
		var widthget = $(this).parent().css('width').replace(/[^-\d\.]/g, '');
		var heightget = $(this).parent().css('height').replace(/[^-\d\.]/g, '');
		var top1 = (Math.trunc((Math.random()*(heightget-difficultyNum))/difficultyRate))*difficultyRate;
		var left1 = (Math.trunc((Math.random()*(widthget-difficultyNum))/difficultyRate))*difficultyRate;
		$(this).css({'top': top1, 'left':left1});
		cnt++;
		$('#clickCount').text(cnt);
		
		var goalTop = $('#goal').css('top').replace(/[^-\d\.]/g, '');
		var goalLeft = $('#goal').css('left').replace(/[^-\d\.]/g, '');
		var targetTop = $('#target').css('top').replace(/[^-\d\.]/g, '');
		var targetLeft = $('#target').css('left').replace(/[^-\d\.]/g, '');
		
		if((Math.abs(goalTop - targetTop))<=difficultyNum && (Math.abs(goalLeft - targetLeft)<=difficultyNum)){
			//alert(Math.abs(goalTop - targetTop)+","+Math.abs(goalLeft - targetLeft));
			var finalCount = $('#clickCount').text();
			var gameCheck = confirm(finalCount+"회 만에 성공하셨네요.\n등록하시겠습니까?");
			var $page = $('.page');
			  $page.addClass('color-bg-start').addClass('bg-animate-color');
			if(gameCheck){
				$.ajax({
					url: mainPath+"/insertRandomGameScore.admin",
					type: "post",
					data: {
						finalCount: $('#clickCount').text(),
						difficulty: $('#selectDifficulty').val(),
					},
					success: function(data){
						alert("등록 완료");
						$('#randomPlace').click();
						$page.removeClass('color-bg-start').removeClass('bg-animate-color');
						$('.leaderBoardTbody').children().remove();
						if(data.length!=0){
							for(var a=0; a<data.length; a++){
								var b=a+1;
								$('.leaderBoardTbody').append("<tr><th scope='row'>"+b+"</th><td>"+data[a].adminNum+"</td><td>"+data[a].clickCount+
										"</td><td>"+data[a].gameDate+"</td></tr>");

							}
						}
					},error: function(data){
						alert("전달 실패!!");
					}
				});
			}else{
				alert("그 점수론 안돼~ ㅋㅋㅋㅋㅋ");
				$('#randomPlace').click();
				$page.removeClass('color-bg-start')
			    .removeClass('bg-animate-color');
			}
		}
	}
});
// 관리자 메인 보이기
$(document).ready(function(){
	$('.mainGameShow').slideUp();$('.mainFortuneShow').slideUp();$('.mainLeaderBoardShow').slideUp();
	$('.profile_pic img').on('click',function(){
		$('.mainGameShow').slideToggle("slow");
	});
	$('.profile_info span').on('click',function(){
		$('.mainFortuneShow').slideToggle("slow");
	});
	$('.profile_info h2').on('click',function(){
		$('.mainLeaderBoardShow').slideToggle("slow");
	});
});
//오늘의 명언
$(document).ready(function(){ 
		$("#english").slideUp();$("#korean").slideUp();
		var i = 1;
    $("#teachMe").on('click',function(){ 
        if(i==1){
        	$("#english").slideDown("slow"); i++;
        }else $("#korean").slideToggle("slow");
    });
});
// 관리자 first page
$("#adminQuiz").keydown(function (key) {
    if(key.keyCode == 65){
    	var answerPw = window.prompt('기회는 한 번뿐입니다.\n신중하게 답변하세요.\n\n제일 존경하는 인물은?');
		$.ajax({
			url: mainPath+"/secondPwCheck.admin",
			type: "post",
			success: function(data){
				if(($.trim(data.secondPw))==answerPw){
					alert(data.memberName+" 관리자님 어서오세요.");
					admin_Main.click();
				}else{ 
					alert("누구냐 넌..");
				}
			},
			error: function(data){
				alert("전달 실패!!");
			}
		})
    }
});
var ccc =0;
$('#adminQuiz').on({
	'click':function(){
		ccc++;
		if(ccc==1) $('#two').css('display','block');
		else if(ccc==2) $('#three').css('display','block');
		else if(ccc==3) $('#four').css('display','block');
		else member_Main.click();
		
	}
});
