$(document).ready(function($){
//for Preloader
    $(window).load(function(){
        $('#loading').fadeOut(1000);
    });
//for Payment
    var num=0;
    var interval = setInterval(function(){
        num=num+4;
        $('#paymentProcessBar').css('width',num+'%');
        $('#paymentProcessBar>span').text(num);
        if(num>99) {
            $('#paymentProcessBar>span').text(100);
            $('#paymentProcessBar').addClass('progress-bar-success');
            $('.payment>h2').text('결제 완료');
            $('.payment>p').text('해당 페이지로 이동합니다.');
            setTimeout(function(){clearInterval(interval)},0);
            
            var change = setInterval(function(){
                $('#hong').fadeOut(500);
                setTimeout(function(){clearInterval(interval)},0);
            },2000);
        }
    },100);
//loading
    var loading = setInterval(function(){
        $('#loading2').fadeOut(100);
    },1000);
});

