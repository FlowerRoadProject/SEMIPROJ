<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@media ( max-width : 992px) {
	.container-fluid {
		width: 969px;
	}	
	
}

.title{
	font-size: 4em;
	font-weight: bold;
}
.location{
	margin: 1em;
	background: black;
	color:white;
	font-size: 3em;
	height: 7em;
	text-align: center;	
}
.intro{
	margin-bottom: 1.5em;
}
.thumbnail img{
	height: 30em;
	width: 20em;
}
.introTitle{
	font-size: 2em;
	font-weigth: bold;
	border-bottom: 1px dashed gray;
	margin-bottom: 1.3em;
}
.subList{
	margin-bottom: 5em;	
}
.subList>div{
	font-size: 1.2em;
}
.admin{	
	background: white;
	text-align: center;
	font-size: 1.4em;
	height: 2em;
	padding-top: 0.4em;
}
.subList>div>span{
	font-weight: bold;
	font-size: 1.5em;
}
.adTitle{
	background: black;	
	margin-bottom: 1.5em;
	text-align: center;
}
.adminIntro{
	font-size: 1.5em;
	color:white;
}
.adminName{
	font-size: 2em;
	color: skyblue;
}

#adminInfo{
	display: none;
}
.beforeClick{
	background: gray;
	color: white;
	text-align: center;
	height: 15em;
	padding: 3em;
	
}

</style>


</head>
<body>
<%@include file="/views/common/header.jsp" %>

	<br /><br /><br /><br /><br />
	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-lg-offset-2 container-fluid">	
		<div class="col-lg-10 title">회사소개</div>
	<br>		
	</div>
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 location container-fluid">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="loc">Introduce</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
		</div>			
		<img src="<%=request.getContextPath()%>/resources/images/footerMenu/intro.jpg" 
		alt="" class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="height: 7em;"/>
	</div>
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 introTitle">
		회사소개
	</div>	
	
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 subList">		
		<div class="col-lg-6">
			우리는 사랑하는 사람과의 <span style="color: coral">기념일, 생일, 승진, 아기의 탄생</span>처럼 축하할 일들이 가득한 일상을 살고 있습니다.
			하지만 아직 우리에겐 꽃을 선물하는 문화가 적습니다. <br />
			<span style="color:orange; font-size: 1.2em;">왜 그럴까요?</span><br />
			<span style="color: darkblue; font-size: 1.2em;">우리는 기존의 꽃배달 서비스들이 고객들에게 감동을 전하기 충분한 서비스를 제공하지 못해서라고 생각했습니다.</span>
			<br />온라인 전국 꽃배달의 상품들은 천편일률적이고, 바쁜 일상 속에서 선물이 필요한 날, 마음에 드는 꽃집을 찾기는 너무 어렵습니다. 
			저희는 IT 기술을 통해 더 많은 분들께 행복을 선물할 수 있다고 믿습니다. 
			꽃을 선물받고 짓는 행복한 미소는 좀처럼 잊혀지지 않습니다. 
			<br />우리는 꽃을 잘 이해하는 플로리스트들이 제철의 신선한 꽃으로 당일 직접 꽃다발을 제작해서 배송합니다.
			<br /><span style="color: coral;">고객들의 하루에 행복한 놀라움을 선사하길 <br />기대하면서요.</span>		
		</div>	
		<div class="col-lg-6" style="background: black;">
			<img src="<%=request.getContextPath()%>/resources/images/footerMenu/introduce.jpg" alt="" class="col-lg-12"/>
		</div>
	</div>
	
	
	
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 introTitle">
		관리자 소개
	</div>
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 subList">		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">박태영</button>			
		</div>
		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">김낙용</button>
		</div>
		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">이원제</button>
		</div>
		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">이주형</button>
		</div>
		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">최순홍</button>
		</div>
		
		<div class="col-lg-2 admin">
			<button class="col-lg-12 btn btn-primary">한영두</button>
		</div>		
		<br /><br /><br />
		
		<br /><br />
		
		
		<div class="col-lg-12 beforeClick">
			<div class="col-lg-12" style="font-size:5em;">
				<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
			</div>
			<div class="col-lg-12">			
				위의 이름 버튼을 클릭해 보세요
			</div>
		</div>
		
		
		<div class="col-lg-12" id="adminInfo">
			<div class="col-lg-12 adTitle">
				<span class="adminIntro"></span><span class="adminName">박태영</span>
			</div>
			
			<div class="col-lg-12">
				<div class="col-lg-4">
					<img src="" class="col-lg-12 adminFlower" />
				</div>
				<div class="col-lg-8">
					<h2><b class="flowerName"></b></h2><br>	
					<h3 class="flowerLang"></h3>
				</div>
			</div>		
		</div>		
	
	</div>
	
	<script type="text/javascript">
		/*
			최순홍: 수선화(Narcissus) : 신비 
			이원제: 벚나무(Cherry) : 정신미 
			한영두: 비단향꽃무(Stock) : 영원한 아름다움
			박태영: 꽃아카시아나무(Robinia Hispida) : 품위 
			김낙용:
			이주형:
		*/
		//박태영
		var arrPTY = new Array('모자로는 가려지지 않는 품위.. ','박태영',
				'<%=request.getContextPath()%>/resources/images/introduce/PTY.JPG',
				'3월 28일 - 꽃아카시아나무(Robinia Hispida)',
				'꽃말 - 품위');
		//김낙용
		var arrKNY = new Array('상냥한 목소리, 그의 노래까지 따뜻해..','김낙용',
				'<%=request.getContextPath()%>/resources/images/introduce/KNY.JPG',
				'4월 23일 - 도라지꽃(Balloom-Flower)',
				'꽃말 - 상냥함, 따뜻함');
		//이원제
		var arrLWJ = new Array('온몸의 교양으로 풍겨지는 정신미.. ','이원제',
				'<%=request.getContextPath()%>/resources/images/introduce/LWJ.jpg',
				'4월 9일 - 벚나무(Cherry)',
				'꽃말 - 교양, 정신미');
		//이주형
		var arrLJH = new Array('그 시절의 첫사랑, 안경선배 ..','이주형',
				'<%=request.getContextPath()%>/resources/images/introduce/LJH.jpg',
				'3월 26일 - 흰앵초(Primrose)',
				'꽃말 - 첫사랑');
		//최순홍
		var arrCSH = new Array('거울속의 너.. 오늘도 신비로워 .. ','최순홍',
				'<%=request.getContextPath()%>/resources/images/introduce/CHS.jpg',
				'1월 13일 - 수선화(Narcissus)',
				'꽃말 - 자기애, 신비');
		//한영두
		var arrHYD = new Array('그 아름다움.. 영원히 Forever.. ','한영두',
				'<%=request.getContextPath()%>/resources/images/introduce/HYD.png',
				'7월 16일 - 비단향꽃무(Stock)',
				'꽃말 - 영원한 사랑, 영원한 아름다움');
		
		
		var $intro= $('.adminIntro');	//소개문구
		var $adName = $('.adminName');	//이름
		var $flower = $('.adminFlower');	//꽃사진
		var $fName = $('.flowerName');	//생일과 꽃 이름
		var $fLang = $('.flowerLang');	//꽃말
		
		
		$('.admin .btn').on('click',function(){
			if($(this).text() == '박태영'){
				$intro.text(arrPTY[0]);
				$adName.text(arrPTY[1]);
				$flower.attr('src',arrPTY[2]);
				$fName.text(arrPTY[3]);
				$fLang.text(arrPTY[4]);
			}
			if($(this).text() == '김낙용'){
				$intro.text(arrKNY[0]);
				$adName.text(arrKNY[1]);
				$flower.attr('src',arrKNY[2]);
				$fName.text(arrKNY[3]);
				$fLang.text(arrKNY[4]);
			}
			
			if($(this).text() == '이원제'){
				$intro.text(arrLWJ[0]);
				$adName.text(arrLWJ[1]);
				$flower.attr('src',arrLWJ[2]);
				$fName.text(arrLWJ[3]);
				$fLang.text(arrLWJ[4]);
			}
			if($(this).text() == '이주형'){
				$intro.text(arrLJH[0]);
				$adName.text(arrLJH[1]);
				$flower.attr('src',arrLJH[2]);
				$fName.text(arrLJH[3]);
				$fLang.text(arrLJH[4]);
			}
			
			if($(this).text() == '최순홍'){
				$intro.text(arrCSH[0]);
				$adName.text(arrCSH[1]);
				$flower.attr('src',arrCSH[2]);
				$fName.text(arrCSH[3]);
				$fLang.text(arrCSH[4]);
			}  
			if($(this).text() == '한영두'){
				$intro.text(arrHYD[0]);
				$adName.text(arrHYD[1]);
				$flower.attr('src',arrHYD[2]);
				$fName.text(arrHYD[3]);
				$fLang.text(arrHYD[4]);
			}
			$('#adminInfo').css('display','inline-block');
			$('.beforeClick').css('display','none');
			$('.admin .btn').removeClass('btn-warning');
			$('.admin .btn').addClass('btn-primary');
			$(this).removeClass('btn-primary');
			$(this).addClass('btn-warning');
			
		});
		
		
		
		
	</script>
		
	
	
	
	<div class="col-lg-8 col-lg-offset-2 container-fluid test intro">
		
		
	</div>
	
	
	



<%@include file="/views/common/footer.jsp" %>
</body>
</html>