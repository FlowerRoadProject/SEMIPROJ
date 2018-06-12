<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
	
  <style>
   @media(max-width:1100px){
  		.footText{
    		width:1100px;
    	}
   }
  
  
   @media (max-width: 900px){ 
                .container{
                    width: 890px;
                }
            }
  	footer ul li {
      display: inline;      
      height: 2em;
      font-size: 1.2em;
      border-right: 1px solid black;
      border-left: 1px solid black;
      text-align: center;
      padding-top: 0.3em;
    }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .test-border{
    	border: 1px solid black;
    }
    .fP{
    	text-align: center;
    }
    .highlight{
    	font-weight:700;
    }
    .access #accessTermsText{
		margin: 3em;		
		max-height: calc(70% - 100px);
    	overflow-y: scroll;
	}
	.mClose{
		align: center;
	}
	
       
    </style>  
        <footer>
            <div class="footprint footText">
               <hr> 
              <div class="footALink">
                
                <div class="container col-xs-10 col-sm-10 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2">
                  <ul class="col-lg-12 footList">
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1" style="border-left:2px solid black;">
                     	 회사 소개
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2" data-toggle="modal" data-target=".aTerm">
                      	이용 약관
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                      	오시는길
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    	FAQ
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="border-right:2px solid black;">
                     	 공지사항
                    </li>
                  </ul>
                </div>
                
                <script>
                	
                $(function(){
                	console.log( $('.footList li:first-child').text());
                	
                })
               $('.footList li').hover(function(){
               		$(this).css({
               			'background':'lightcoral',
               			'color':'white',
               			'cursor': 'pointer'               			
               			})               		
               	},function(){
               		$(this).css({
               			'background':'white',
               			'color':'black'
               			});
               	})
               	$('.footList li').eq(0).click(function(){
               		location.href= '<%=request.getContextPath()%>/views/common/introduce.jsp';
               	});                
                $('.footList li').eq(2).click(function(){
               		location.href= '<%=request.getContextPath()%>/views/common/comAddress.jsp';
               	});
                $('.footList li').eq(3).click(function(){
               		location.href= '<%=request.getContextPath()%>/show.faq';
               	});
                $('.footList li').eq(4).click(function(){
               		location.href= '<%=request.getContextPath()%>/showNotice.no';
               	});
                </script>
                
               

<div class="modal fade aTerm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content access" style="margin : 2em;">
     	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">이용약관</h4>
      </div>
     	<div id="accessTermsText">
		
제 1 조 (목적)<br />
본 약관은 쇼핑몰을 운영하는 주식회사 꽃길 (이하 ‘회사’라 한다)에서 관련 서비스(이하 ‘서비스’라 하며, 접속 가능한 유,무선 단말기의 종류와 상관없이사이트가 제공하는 모든 서비스를 의미합니다.)를 이용함에 있어 회원의 권리•의무 규정함을 목적으로 합니다. <br />
<br /><br />

제 2 조 (정의)<br />
1. ‘사이트’ 란 ‘회사’가 상품을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이등’을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 사이버몰을 운영하는 사업사용합니다. 현재 ‘회사’가 운영하는 ‘사이트’는  안드로이드, iOS 환경의 서비스를 포함한 모바일웹과 앱을 포함 합니다.<br />
2. ‘회원’이라 함은 ‘사이트’에 개인정보를 제공하여 회원등록을 한 자로서, ‘사이트’에 가입 방침에 따라 ‘사이트’의 정보를 지속적으로 제공받으며, ‘사이트’가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br />
3. ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br />
4. ‘비밀번호’라 함은 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로 ‘사이트’에 등록한 영문과 숫자의 조합을 말합니다.<br />
5. 본 약관에서 정의되지 않은 용어는 관계법령이 정하는 바에 따르며, 그 외에는 일반적인 사회 통념을 따릅니다. <br />
<br /><br />
<br /><br />
제 3 조 (약관의 명시와 설명 및 개정)<br />
1. ‘회사’는 이 약관의 내용과 상호 및 대표자 이름, 소재지 주소, 전화번호, 사업자등록번호 등을 회원이 쉽게 알 수 있도록 ‘사이트’의 초기 ‘서비스’ 화면에 게시합약관의 구체적 내용은 회원이 연결화면을 통하여 볼 수 있습니다.<br />
2. ‘회사’는 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제 등에 『전자거래 기본법』, 『전자 서명법』, 『정보통신망 이용촉진 등에 관한 법률』, 『소비관계법령』을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />
3. ‘회사’가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.<br />
4. ‘회사’가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되며, 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 회원이 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내송신하여 ‘회사’의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />
5. 제3항에 따라 공지된 적용일자 이후에 회원이 ‘회사’의 ‘서비스’를 계속 이용하는 경우, 약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 회원은 언제든지 자유롭게 이용계약을 해지할 수 있습니다. <br />

제 4 조 (약관 외 준칙)<br />
이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 『전자상거래 등에서의 소비자법률』 등 관련법령의 규정과 일반 상관례에 따릅니다. <br /><br />
제 5 조 (이용계약의 성립)<br />
1. 이용계약은 회원이 되고자 하는 자(이하 ‘가입신청자’)가 약관의 내용에 동의를 하고 정한 가입양식에 따라 회원정보(전자우편주소, 비밀번호, or 소셜네트워크를 통한 회원가입, 전화번호 인증)기입하여 회원가입신청을 하고 ‘회사’가 이러한 신청에 대하여 승인함으로써 체결됩니다.<br />
2. ‘회사’는 다음 각 호에 해당하는 신청에 대하여는 승인을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.<br />
가. ‘가입신청자’가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 후 3개월이 경과한 자로서 ‘회사’의 회원 재가입 승낙을 얻은 경우에는 예외로 함<br />
다. 등록내용에 허위의 정보를 기재하거나, 기재누락, 오기가 있는 경우<br />
라. 회원가입일 현재 만 14세 미만인 경우<br />
마. 이미 가입된 회원과 이름 및 전자우편주소, 전화번호가 동일한 경우<br />
바. 부정한 용도 또는 영리를 추구할 목적으로 본 ‘서비스’를 이용하고자 하는 경우<br />
사. 회원의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br />
아. 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 ‘회사’판단에 의하여 필요하다고 인정하는 경우<br />
3. ‘회사’는 ‘서비스’ 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우 이용계약을 유보할 수 있습니다.<br />
4. 제2항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, 이 경우 ‘회사’는 이를 ‘가입신청자’에게 알리도록 합니다.<br />
5. 이용계약의 성립시기는 ‘회사’가 가입완료를 신청절차상에서 표시한 시점으로 합니다.<br />
6. ‘회사’는 회원에 대해 ‘회사’정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 구매금액 등을 세분하여 이용에 차등을 둘 수 있습니다.<br />
7. ‘회사’는 회원에 대하여 『영화 및 비디오물의 진흥에 관한 법률』 및 『청소년 보호법등급 및 연령준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다. <br />
<br /><br />
제 6 조 (개인정보의 변경)<br />
회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. <br />
<br /><br />
제 7 조 (개인정보의 보호)<br />
1. ‘회사’는 회원의 개인정보를 보호하기 위하여 『정보통신망 이용촉진 및 정보보호 등 관계법령에서 정하는 바를 준수합니다.<br />
2. ‘회사’는 회원의 개인정보를 보호하기 위하여 개인정보취급방침을 제정, 이를 서비스에 게시합니다. 다만, 개인정보취급방침의 구체적 내용은 연결화면을 통하여 볼 수 있습니다.<br />
3. ‘회사’는 개인정보취급방침에 따라 회원의 개인정보를 최대한 보호하기 위하여 노력합니다.<br />
4. ‘회사’의 공식 ‘사이트’ 이외의 링크된 사이트에서는 ‘회사’의 개인정보를 취급하지 않습니다. 링크된 사이트 및 ‘상품 등’을 제공하는 제3자의 개인정보 취급과 관련하여 제3자의 개인정보취급방침을 확인할 책임이 회원에게 있으며, ‘회사’는 이에 대하여 책임을 지지 않습니다.<br />
5. ‘회사’는 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에 제공할 수 있습니다.<br />
가. 수사기관이나 기타 정부기관으로부터 정보제공을 요청 받은 경우<br />
나. 회원의 법령 또는 약관의 위반을 포함하여 부정행위확인 등의 정보보호업무를 위해 필요한 경우<br />
다. 기타 법률에 의해 요구되는 경우<br />
라. 판매자 또는 배송업체 등에게 거래 및 배송 등에 필요한 최소한의 회원의 정보(이름, 전화번호, 주소)를 제공하는 경우<br />
마. 구매가 성사된 때에 그 이행을 위하여 필요한 경우와 구매가 종료된 이후에도 반품, 취소 등을 위하여<br />
<br /><br />
제 8 조 (이용계약의 종료)<br />
1. 회원의 해지<br />
가. 회원은 언제든지 ‘회사’에게 해지의사를 통지함으로써 이용계약을 해지할 수 있습니다.<br />
나. 이용계약은 회원의 해지의사가 ‘회사’에 도달한 때에 종료됩니다.<br />
다. 본 항에 따라 해지를 한 회원은 이 약관이 정하는 회원가입절차와 관련조항에 따라 가입할 수 있습니다.<br />
2. 회사의 해지<br />
가. ‘회사’는 다음과 같은 사유가 있는 경우, 이용계약을 해지할 수 있습니다. 이 경회원에게 전자우편주소, 전화 등 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지‘회사’는 해당 회원에게 사전에 해지사유에 대한 의견진술의 기회를 부여할 수 있습니다.<br />
① 제5조 제2항에서 정하고 있는 이용계약의 승낙거부사유가 있음이 확인된 경우<br />
② 회원이 ‘회사’나 다른 회원 기타 타인의 권리나 명예, 신용 기타 정당한 이익을 침해한 경우<br />
③ 기타 회원이 이 약관에 위배되는 행위를 하거나 이 약관에서 정한 해지사유가 발생한 경우<br />
나. 이용계약은 ‘회사’가 해지의사를 회원에게 통지함으로써 종료됩니다. 이 경우 ‘회사’회원이 등록한 전자우편주소로 발송하거나 ‘회사’의 게시판에 게시함으로써 통지에 갈음합니다.<br />
다. 이용계약이 종료되는 경우 회원의 적립금 및 쿠폰은 소멸되며, 환불 등의 처리에 관하여는 ‘회사’의 환불규정에 의합니다.<br />
라. 이용계약의 종료와 관련하여 발생한 손해는 이용계약이 종료된 이후 해당 회원이 책임을 부는 일체의 책임을 지지 않습니다. <br />
<br /><br />
제 9 조 (회원탈퇴 및 자격 상실)<br />
1. 회원은 ‘회사’에 언제든지 탈퇴를 요청할 수 있으며 ‘회사’는 회원탈퇴에 관한 규정에 따라 탈퇴를 처리합니다.<br />
2. 회원이 다음 각 호의 사유에 해당하는 경우, ‘회사’는 회원자격을 제한 및 정지시킬 수 있습니다.<br />
가. 다른 사람의 ‘사이트’ 이용을 방해하거나 그 정보를 도용하는 등 전자상거래질서를 위협하는 경우<br />
나. ‘사이트’를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br />
다. 기타 다음과 같은 행위 등으로 ‘사이트’의 건전한 운영을 해하거나 ‘사이트’의 업무를 방해하는 경우<br />
① ‘사이트’의 운영과 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하명예를 실추시키거나 ‘사이트’의 신뢰성을 해하는 경우<br />
② ‘사이트’의 이용과정에서 직원에게 폭언, 협박 또는 음란한 언행 등으로 ‘사이트’의 운경우<br />
③ ‘사이트’를 통해 ‘상품 등’을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 ‘회사’의 업무를 방해하는 경우<br />
④ ‘사이트’를 통해 구입한 ‘상품 등’에 특별한 하자가 없는데도 불구하고 일부 사용취소∙전부 또는 일부 반품 등으로 ‘회사’의 업무를 방해하는 경우<br />
3. ‘회사’가 회원자격을 제한∙정지시킨 후 동일한 행위가 2회 이상 반복되거나 30일 이내 시정되지 아니하는 경우 ‘회사’는 회원자격을 상실시킬 수 있습니다.<br />
4. 재판매의 목적으로 ‘사이트’에서 ‘상품 등’을 중복 구매하는 등 ‘사이트’의 거래에 심각한 혼란을 줄 경우 ‘회사’는 당해 회원의 회원자격을 상실시킬 수 있습니다.<br />
5. ‘회사’가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 제2항 (나)목에 따라 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.  <br />
<br /><br />
제 10 조 (회원의 ID 및 비밀번호에 대한 의무)<br />
1. ID(전자우편번호 및 소셜네트워크 연동으로 인한 ID)와 비밀번호에 관한 관리에 대한 책임이 있으며, 이를 소홀히 하여 발생한 모든 민∙형사상의 책임은 회원 자신에게 있습니다.<br />
2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br />
3. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 ‘회사’에 통보하고 ‘회사’의 조치가 있는 경우에는 그에 따라야 합니다.<br />
4. 회원이 제3항에 따른 통지를 하지 않거나 ‘회사’의 조치에 응하지 아니하여 발생하는 대한 책임은 회원에 있습니다. <br />
<br /><br />
제 11 조 (회원의 의무)<br />
1. 회원은 관계법령, 이 약관의 규정, 이용안내 등 ‘회사’가 통지하는 사항을 준수하여야 하며 ‘회사’ 업무에 방해되는 행위를 하여서는 안됩니다.<br />
2. 회원은 ‘서비스’ 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.<br />
가. ‘서비스’ 신청 또는 변경 시 허위내용의 등록<br />
나. 타인의 정보도용<br />
다. ‘사이트’에 게시된 정보의 허가 받지 않은 변경<br />
라. ‘회사’가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br />
마. ‘회사’ 및 기타 제3자의 저작권 등 지적재산권에 대한 침해<br />
바. ‘회사’ 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br />
사. 외설 또는 폭력적인 메시지∙화상∙음성 기타 공서양속에 반하는 정보를 ‘회사’에 공개 행위<br />
아. ‘회사’의 동의 없이 영리를 목적으로 ‘서비스’를 사용하는 행위<br />
자. 기타 관계법령이나 ‘회사’에서 정한 규정에 어긋나는 경우 <br />
<br /><br />
제 12 조 (회원의 게시물)<br />
1. 회원이 작성한 게시물에 대한 모든 권리 및 책임은 이를 게시한 회원에게 있으며, ‘회원’게시하거나 등록하는 ‘서비스’의 내용물이 다음 각 항에 해당한다고 판단되는 경우에 삭제할 수 있고, 이에 대하여 ‘회사’는 어떠한 책임도 지지 않습니다.<br />
2. 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우<br />
3. 공서양속에 위반되는 내용일 경우<br />
4. 범죄적 행위에 결부된다고 인정되는 경우<br />
5. ‘회사’의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br />
6. 회원이 ‘사이트’와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우<br />
7. ‘회사’로부터 사전 승인 받지 아니한 상업광고, 판촉내용을 게시하는 경우<br />
8. 해당 상품과 관련 없는 내용인 경우<br />
9. 정당한 사유 없이 당사의 영업을 방해하는 내용을 기재하는 경우<br />
10. 기타 관계법령에 위반된다고 판단되는 경우 <br />
<br /><br />

제 13 조 (회원에 대한 통지)<br />
1. ‘회사’가 회원에 대한 통지를 하는 경우, 회원이 가입신청 시 ‘회사’에 제출한 전자우편 PUSH 등으로 할 수 있습니다.<br />
2. ‘회사’는 불특정다수 회원에 대한 통지의 경우, 1주일 이상 ‘사이트’에 게시함으로써 갈음할 수 있습니다. 다만, 회원 본인의 거래에 관하여 중대한 영향을 미치는 사항에 대해서는 본인이 확인을 하여야 합니다. <br />
<br /><br />

제 14 조 (‘회사’의 의무)<br />
1. ‘회사’는 관계법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 바에 따라 지속적이고, 안정적으로 ‘상품 등’을 제공하는데 최선을 다하여야 합니다.<br />
2. ‘회사’는 회원이 안전하게 ‘서비스’를 이용할 수 있도록 회원의 개인정보(신용정보위한 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.<br />
3. ‘회사’는 회원으로부터 제기되는 의견이나 불만이 정당하고 객관적으로 인정될 경절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 회원에처리일정을 통보하여야 합니다. <br />
<br /><br />
제 15 조 (개별 서비스에 대한 약관 및 이용조건)<br />
‘회사’는 제공하는 ‘서비스’내의 개별 서비스에 대한 별도의 약관 및 이용조건을 둘 수 있으며, 서비스에서 별도로 적용되는 약관에 대한 동의는 회원이 개별 서비스를 최초로 이용할 경우, 그에 대한 동의절차를 거치게 됩니다. 이 경우 개별 서비스에 대한 이용약관 등이 본 약관에 포함되지 않는 경우 개별 서비스에 대한 이용약관의 내용을 별도로 표기합니다. <br />
<br /><br />

제 16 조 (‘서비스’ 이용시간)<br />
‘서비스’의 이용은 ‘회사’의 업무상 또는 기술상 특별한 지장이 없는 한 일요일을 제외한 연중무휴를 1원칙으로 합니다. 다만 정기점검 등의 필요로 ‘회사’가 정한 날이나 시간은 제외됩니다. ‘서비스’제공화면에 공지한 서비스 이용시간에 따릅니다. 평일, 토요일 업무시간은 10:00~19:00입니다. <br />

<br /><br />
제 17 조 (‘서비스’ 이용책임)
회원은 ‘회사’가 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 ‘서비스상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌이 광고, 음란사이트 등을 통상용S/W 불법배포 등을 할 수 없습니다. 이를 어겨 발생한 영업활동의 결과 및 손실, 관법적 조치 등에 관해서는 ‘회사’가 책임을 지지 않습니다. <br />

<br /><br />
제 18 조 (‘서비스’ 제공의 중지)<br />
1. ‘회사’는 다음 각 호에 해당하는 경우 ‘서비스’ 제공을 중지할 수 있습니다.<br />
가. 컴퓨터 등 정보통신설비의 보수점검∙교체 및 고장, 통신의 두절 등의 사유가 발생한 경우<br />
나. 『전기통신사업법』에 규정된 기간통신사업자가 전기통신 ‘서비스’를 중지했을 경우<br />
다. 기타 불가항력적 사유가 있는 경우<br />
2. ‘회사’는 국가비상사태, 정전, ‘서비스’ 설비의 장애 또는 ‘서비스’ 이용의 폭주 등‘서비스’ 이용에 지장이 있는 때에는 ‘서비스’의 전부 또는 일부를 제한하거나 정지할 수 있습니다.<br />
3. ‘회사’가 ‘서비스’ 제공을 일시적으로 중단할 경우 서비스 일시 중단사실과 그 사유를 초기화면에 보기 쉬운 공간에 게재합니다. <br />

<br /><br />
제 19 조 (정보의 제공 및 광고의 게재)<br />
1. ‘회사’는 회원이 ‘서비스’ 이용 중 필요하다고 인정되는 다양한 정보를 공지사항 또는 SMS, 전화 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거의 모든 사항에 대해서 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편 등에 대해서 수신 거절을 할 수 있습니다.<br />
2. ‘회사’는 ‘서비스’의 운영과 관련하여 ‘서비스’ 화면, 홈페이지, 전자우편 등에 내용을 고지할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 회원은 수신거절을 ‘회사’에게 할 수 있습니다. <br />
<br /><br />

제 20 조 (구매신청)<br />
1. 회원은 본 약관 및 ‘회사’가 정한 규정에 따라 아래 또는 이와 유사한 방법에 신청하여야 합니다.<br />
가. ‘상품 등’의 선택<br />
나. 구매자 성명, 주소, 전화번호, 전자우편주소, 수취인의 성명, 배송지 정보, 전화번호 입력<br />
다. 결제 시 유의사항에 대한 확인<br />
라. 이 약관에 동의한다는 표시(예, 마우스 클릭)<br />
2. ‘회사’는 회원의 구매신청이 있는 경우 회원에게 수신확인통지를 합니다.<br />
3. 전 항의 수신확인통지를 받은 회원은 의사표시의 불일치 등이 있는 경우에는 수신확인통지 즉시 구매신청 변경 및 취소를 요청할 수 있습니다. 다만, 이미 대금을 지불한 경우 청약철회 등에 관한 규정에 따릅니다. <br />

<br /><br />
제 21 조 (대금지급방법)<br />
1. ‘회사’에서 구매한 상품 또는 쿠폰에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.<br />
가. 신용카드 결제<br />
나. 실시간 계좌이체<br />
다. 에스크로 결제<br />
라. 가상계좌 입금<br />
마. 간편결제 <br />
사. 기타 ‘회사’가 추가 지정하는 결제 수단(할인쿠폰, 스마트폰 앱 등)<br />
2. 회원이 구매대금의 결제와 관련하여 입력한 정보 및 그 정보와 관련하여 발생한 책임은 전적으로 회원에게 있습니다. <br />
<br /><br />

제 22 조 (‘상품 등’의 공급)<br />
1. ‘회사’는 회원의 ‘상품 등’의 공급에 관하여 별도의 약정이 없는 이상 회원이 요청한 ‘배송 희망 시각’에 ‘상품 등’을 배송할 수 있도록 주문제작, 포장, 배송 등 기타의 최선의 노력을 취합니다. 또한, 폭설, 폭우, 교통혼잡 등 외부환경의 변화에 의한 배송 시각의 지연 등에 대해서 ‘회사’는 별도의 책임을 지지 않습니다. <br />
2. ‘회사’는 회원이 ‘상품 등’의 공급절차 및 진행사항, ‘상품 등’에 대한 구매 결제내역을 확인할 수 있도록 적절한 조치를 하여야 하며, ‘상품 등’의 취소방법 및 절차를 안내하여야 합니다.<br />
3. ‘회사’는 회원이 구매한 ‘상품 등’에 대해 배송수단, 수단별 배송비용, 배송비용, 배송기간 등을 명시합니다.<br />
4. ‘회사’와 고객간에 상품의 인도시기 및 쿠폰의 제공시기에 관하여 별도의 약정이 있는 약관에 따릅니다. <br />

<br /><br />
제 23 조 (환급)<br />
‘회사’는 회원이 구매 신청한 ‘상품 등’이 품절 등의 사유로 인도 또는 제공할 수 없을없이 그 사유를 회원에게 통지하여야 하고, 사전에 ‘상품 등’의 대금을 받은 경우에는날로부터 7영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. <br />

<br /><br />
제 24 조 (청약철회 등)<br />
1. ‘회사’의 ‘상품 등’의 구매취소 및 환불 규정은 『전자상거래 등에서의 소비자보호에 관한 법률』등 관련 법령을 준수합니다.<br />
2. ‘회사’와 ‘상품 등’의 구매에 관한 계약을 체결한 회원은 수신확인의 통지를 받은 날(SMS 문자통지 등을 받은 날) 또는 ‘상품 등’의 공급을 받은 날로부터 7일 이내, ‘배송요청시각’ 2시간 이내에는 청약을 철회할 수 있습니다.<br />
3. 회원은 ‘상품 등’을 배송 받은 경우 아래 각 호에 해당하는 경우에는 교환 및 반품, 환불을 할 수 없습니다.<br />
가. 회원에게 책임 있는 사유로 ‘상품 등’이 멸실 또는 훼손된 경우(다만, ‘상품’을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)<br />
나. 회원의 사용 또는 일부 소비에 의하여 ‘상품 등’의 가치가 현저히 감소한 경우<br />
다. 시간의 경과에 의하여 재판매가 곤란할 정도로 ‘상품 등’의 가치가 현저히 감소한 경우<br />
라. 같은 성능을 지닌 ‘상품 등’으로 복제가 가능한 경우 그 원본인 ‘상품 등’의 포장을 훼손한 경우<br />
마. 회사가 특정 쿠폰 또는 상품 등에 대하여 청약철회 제한에 관해 사전에 고지한 경우<br />
사. 배송된 상품의 수령인이 부재한 경우 또는 잘못된 주소를 입력하는 등 배송이 불가한 상황의 귀책이 회원에게 있는 경우 (이 경우 재배송에 대한 배송비용을 ‘회사’가 고객에게 청구할 수 있습니다.)<br />

4. 회원은 제3항의 규정에 불구하고 ‘상품 등’의 내용이 표시∙광고 내용과 내용과 다르게 이행된 때에는 당해 ‘상품 등’을 공급받은 날부터 3일 이내, 그 사실을 알 수 있었던 날부터 10일 이내에 청약철회 등을 할 수 있습니다. <br />

<br /><br />
제 25 조 (청약철회 등의 효과)<br />
1. 회원이 구매한 ‘상품 등’을 취소 또는 환불하는 경우 ‘회사’는 그 처리 결과에 대해 제대한 통지)에 정한 방법으로 통지합니다.<br />
2. ‘회사’는 회원으로부터 쿠폰취소 요청 또는 상품 등을 반환 받은 경우 7영업일지급받은 대금을 환급합니다. 이 경우 ‘회사’가 회원에게 재화 등의 환급을 지연할 때에는 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br />
3. 청약철회 등의 경우 공급받은 ‘상품 등’의 반환에 필요한 비용은 회원이 부담합니다. 등’의 내용이 표시∙광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경에 필요한 비용은 ‘회사’가 부담합니다.<br />
5. 회원의 단순변심에 의한 취소일 경우 환불처리에 발생하는 수수료와 기타 제반 부담합니다.<br />
6. 기타 본 약관 및 ‘사이트’의 이용안내에 규정되지 않은 취소 및 환불에 대한 사소비자 피해보상규정에서 정한 바에 따릅니다. <br />
<br /><br />
제 26 조 (‘상품 등’의 취소 및 환불의 특칙)<br />
상품의 반품에 따른 환불은 반품하는 상품이 판매자에게 도착되고, 반품 사유가 확인된 이후에 진행됩니다. <br />
<br /><br />
제 27 조 (게시물의 관리)<br />
1. 회원의 게시물이 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 및 『저작권』위반되는 내용을 포함하는 경우, 권리자는 관계법령이 정한 절차에 따라 해당 게시물의 게시등을 요청할 수 있으며, ‘회사’는 관계법령에 따라 조치를 취하여야 합니다.<br />
2. ‘회사’는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가‘회사’ 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 ‘게시물’에 대해 임시조치 할 수 있습니다.<br />
3. 본 조에 따른 세부절차는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 및 규정한 범위 내에서 ‘회사’가 정한 ‘게시중단요청서비스’에 따릅니다. <br />
4. 회원이 남긴 후기는 ‘회사’의 마케팅 목적에 따라 페이스북 및 각종 소셜미디어에 재게재할 수 있습니다. (다만, 이때 고객의 이름, 아이디 등 개인정보에 대한 부분은 노출하지 않습니다.)<br />
<br /><br />
제 28 조 (면책조항)<br />
1. ‘회사’는 천재지변 또는 이에 준하는 불가항력으로 인하여 ‘서비스’를 제공할 수 없는 경우에는 ‘서비스’ 제공에 관한 책임이 면제됩니다.<br />
2. ‘회사’는 회원의 귀책사유로 인한 ‘서비스’ 이용의 장애에 대하여 책임을 지지 않습니다.<br />
3. ‘회사’는 회원이 ‘서비스’를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지밖의 ‘서비스’를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br />
4. ‘회사’는 회원이 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다.<br />
5. 회원이 발송한 메일 내용에 대한 법적인 책임은 사용자에게 있습니다.<br />
6. ‘회사’는 회원간 또는 회원과 제3자 상호간에 ‘서비스’를 매개로 하여 거래 등을 통한 손해에 대해서는 책임이 면제됩니다.<br />
7. ‘회사’는 무료로 제공되는 ‘서비스’ 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다. <br />

<br /><br />
제 29 조 (분쟁해결)<br />
1. ‘회사’는 회원이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처피해보상처리 기구를 설치, 운영합니다.<br />
2. ‘회사’는 회원으로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다.처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 즉시 알립니다. <br />
제 30 조 (준거법 및 관할법원)<br />
1. 이 약관의 해석 및 ‘회사’와 회원간의 분쟁에 대하여는 대한민국의 법을 적용합니다.<br />
2. ‘서비스’ 이용 중 발생한 회원과 ‘회사’간의 소송은 민사소송법에 의한 관할법원에서 진행합니다. <br />
<br /><br />

부칙<br />
1. 이 약관은 2018년 1월 12일부터 시행합니다.<br />
2. 이 개정약관은 시행일 이후에 체결되는 계약에만 적용되고 그 이전에 체결된 계약은 개정전의 약관조항을 그대로 적용합니다.<br />
		
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">창닫기</button>        
      </div>
    </div>
  </div>
</div>
                
                
                
              </div>
              
             <!--  <hr> -->
              
              <br>
              <br>
              <div class="footInfo">
               
                <div class="col-sm-12 col-md-12 col-lg-12">

                   	<p class="col-lg-12 fP">법인명 : (주)꽃길  | 대표이사 :  박태영  | 사업장 소재지 :  서울시 강남구 역삼동 KH정보교육원  | 사업자등록번호 : 132-78-56215 | 사업자정보확인 </p>

         			<p class="col-lg-12 fP">통신판매업신고 : 제2013-서울강남-0521호  | 개인정보보호책임자 :  이원제 | 고객센터 :  02-2222-2222
                    | 팩스 : 02-2222-2222| E-mail :  help@flowerRoad.com</p>
                    <p class="col-lg-12 fP">Hosting by (주)코리아센터닷컴</p>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-2"></div>
              </div>
            </div>
          </footer>
   
