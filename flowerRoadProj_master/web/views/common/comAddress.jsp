<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는길</title>
<style>

@media (max-width: 767px){ 
       .container{
          width: 750px;
       }
       .container-fluid{
          width: 750px;
       }
}

#map{
    height: 400px;
    width: 100%;
   }

.test-border{
	border: 1px solid black;
}
.subway{	
	height: 2.5em;
	font-size:1.2em;
	border-bottom: 1px solid lightgray;
	margin-top: 1.5em;
}
.bus, .address {	
	height: 4em;
	font-size: 1.2em;
	border-bottom: 1px solid lightgray;
	margin-top: 1.5em;
}
.mainFrame>div>div:first-child{
	text-align: center;
	font-weight:bolder;
	font-size: 1.1em;
}
.mainFrame>div>div:not(:first-child){
	color: gray;
	font-weight: lighter;
}
.mainFrame{
	margin-bottom: 3em;
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
	
	
}
   
</style>



</head>
<body>
<%@include file="/views/common/header.jsp" %>
<br /><br /><br /><br /><br />

<div class="col-lg-8 col-lg-offset-2 container-fluid">
	<div class="col-lg-8 col-lg-offset-2">
		<div class="col-lg-12 title">오시는길</div>
	</div>
	<br />	
	<div class="col-lg-8 col-lg-offset-2 location container-fluid">
		location
		<img src="<%=request.getContextPath()%>/resources/images/footerMenu/roadSign2.jpg" alt="" style="height: 7em; width: 15em;"/>
	</div>
</div>



<div class="col-lg-8 col-lg-offset-2 container mainFrame">	
	<div class="col-lg-8 col-lg-offset-2 address">
		<div class="col-lg-2">주소</div>
		<div class="col-lg-9">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F</div>
		<div class="col-lg-9 col-lg-offset-2"> (T: 1544-9970 / F: 070-8290-2889) </div>
	</div>
	
	<div class="col-lg-8 col-lg-offset-2 bus">
		<div class="col-lg-2">버스</div>
		<div class="col-lg-9">역삼역.포스코P&S타워 정류장</div>
		<div class="col-lg-10 col-lg-offset-2">지선 146 / 740 / 341 / 360         간선 1100 / 1700 / 2000 / 7007 / 8001</div>
	</div>
	
	<div class="col-lg-8 col-lg-offset-2 subway">
		<div class="col-lg-2">지하철</div>
		<div class="col-lg-9">지하철 2호선 역삼역 3번출구 100m</div>
	</div>
	
	<div class="col-lg-8 col-lg-offset-2" style="margin-top: 1.5em;">
		<div id="map" ></div>
	</div>
</div>


<hr class="col-lg-12">


<%@include file="/views/common/footer.jsp" %>    	
<script>
      function initMap() {
        var kh = {lat: 37.499193, lng: 127.032866};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: kh
        });
        var marker = new google.maps.Marker({
          position: kh,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIEwqhWBJZTcaLJ6VsN7Avfk3YTLOvi5M&callback=initMap">
    </script>

</body>
</html>