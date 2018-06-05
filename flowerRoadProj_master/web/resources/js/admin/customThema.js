
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
function saveCusBgc(){
    alert("배경 설정이 저장되었습니다.\n다음 접속부터 적용됩니다.");
};
//커스텀 배경 설정 취소
function cancleCusBgc(){
    var check = confirm("설정한 내용이 초기화 됩니다.\n그래도 하시겠습니까?");
    if(check){}
};

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
function saveCusFontColor(){
    alert("글자 색상 설정이 저장되었습니다.\n다음 접속부터 적용됩니다.");
};
//커스텀 글자 색상 설정 취소
function cancleCusFontColor(){
    var check = confirm("설정한 내용이 초기화 됩니다.\n그래도 하시겠습니까?");
    if(check){}
};
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
//음악 설정
$('a.music').click(function(){
    $(this).children('audio').attr('play');
});