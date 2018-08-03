<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>Insert title here</title>
<style>
body{
	overflow-x: hidden;
	font-family: 'Nanum Gothic', sans-serif;
}
.font-namu{
	font-family: 'Nanum Gothic', sans-serif;
}
<!--스크롤바-->
.scrollbar {
    margin-left: 30px;
    float: left;   
    width: 65px;
    background: #fff;
    overflow-y: scroll;
    margin-bottom: 25px;
}
.force-overflow {
    min-height: 450px;
}

.scrollbar-primary::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #4285F4; }


.scrollbar-default::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-default::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-default::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #2BBBAD; }

.scrollbar-secondary::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-secondary::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-secondary::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #aa66cc; }
.thin::-webkit-scrollbar {
  width: 6px; }  
.scrollbar-juicy-peach::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-juicy-peach::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-juicy-peach::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left top, right top, from(#ffecd2), to(#fcb69f));
  background-image: -webkit-linear-gradient(left, #ffecd2 0%, #fcb69f 100%);
  background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%); }

.scrollbar-young-passion::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-young-passion::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-young-passion::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left top, right top, from(#ff8177), color-stop(0%, #ff867a), color-stop(21%, #ff8c7f), color-stop(52%, #f99185), color-stop(78%, #cf556c), to(#b12a5b));
  background-image: -webkit-linear-gradient(left, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%);
  background-image: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); }

.scrollbar-lady-lips::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-lady-lips::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-lady-lips::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#ff9a9e), color-stop(99%, #fecfef), to(#fecfef));
  background-image: -webkit-linear-gradient(bottom, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);
  background-image: linear-gradient(to top, #ff9a9e 0%, #fecfef 99%, #fecfef 100%); }

.scrollbar-sunny-morning::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-sunny-morning::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-sunny-morning::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #f6d365 0%, #fda085 100%);
  background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%); }

.scrollbar-rainy-ashville::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-rainy-ashville::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-rainy-ashville::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#fbc2eb), to(#a6c1ee));
  background-image: -webkit-linear-gradient(bottom, #fbc2eb 0%, #a6c1ee 100%);
  background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%); }

.scrollbar-frozen-dreams::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-frozen-dreams::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-frozen-dreams::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#fdcbf1), color-stop(1%, #fdcbf1), to(#e6dee9));
  background-image: -webkit-linear-gradient(bottom, #fdcbf1 0%, #fdcbf1 1%, #e6dee9 100%);
  background-image: linear-gradient(to top, #fdcbf1 0%, #fdcbf1 1%, #e6dee9 100%); }

.scrollbar-warm-flame::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-warm-flame::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-warm-flame::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
  background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%); }

.scrollbar-night-fade::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-night-fade::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-night-fade::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#a18cd1), to(#fbc2eb));
  background-image: -webkit-linear-gradient(bottom, #a18cd1 0%, #fbc2eb 100%);
  background-image: linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%); }

.scrollbar-spring-warmth::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-spring-warmth::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-spring-warmth::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#fad0c4), to(#ffd1ff));
  background-image: -webkit-linear-gradient(bottom, #fad0c4 0%, #ffd1ff 100%);
  background-image: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%); }

.scrollbar-winter-neva::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-winter-neva::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-winter-neva::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #a1c4fd 0%, #c2e9fb 100%);
  background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%); }

.scrollbar-dusty-grass::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-dusty-grass::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-dusty-grass::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #d4fc79 0%, #96e6a1 100%);
  background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%); }

.scrollbar-tempting-azure::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-tempting-azure::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-tempting-azure::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #84fab0 0%, #8fd3f4 100%);
  background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%); }

.scrollbar-heavy-rain::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-heavy-rain::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-heavy-rain::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#cfd9df), to(#e2ebf0));
  background-image: -webkit-linear-gradient(bottom, #cfd9df 0%, #e2ebf0 100%);
  background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%); }

.scrollbar-amy-crisp::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-amy-crisp::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-amy-crisp::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #a6c0fe 0%, #f68084 100%);
  background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%); }

.scrollbar-mean-fruit::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-mean-fruit::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-mean-fruit::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #fccb90 0%, #d57eeb 100%);
  background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%); }

.scrollbar-deep-blue::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-deep-blue::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-deep-blue::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #e0c3fc 0%, #8ec5fc 100%);
  background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%); }

.scrollbar-ripe-malinka::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-ripe-malinka::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-ripe-malinka::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #f093fb 0%, #f5576c 100%);
  background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%); }

.scrollbar-cloudy-knoxville::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-cloudy-knoxville::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-cloudy-knoxville::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-linear-gradient(330deg, #fdfbfb 0%, #ebedee 100%);
  background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); }

.scrollbar-morpheus-den::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-morpheus-den::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-morpheus-den::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#30cfd0), to(#330867));
  background-image: -webkit-linear-gradient(bottom, #30cfd0 0%, #330867 100%);
  background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%); }

.scrollbar-rare-wind::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-rare-wind::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-rare-wind::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#a8edea), to(#fed6e3));
  background-image: -webkit-linear-gradient(bottom, #a8edea 0%, #fed6e3 100%);
  background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%); }

.scrollbar-near-moon::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-near-moon::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-near-moon::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-image: -webkit-gradient(linear, left bottom, left top, from(#5ee7df), to(#b490ca));
  background-image: -webkit-linear-gradient(bottom, #5ee7df 0%, #b490ca 100%);
  background-image: linear-gradient(to top, #5ee7df 0%, #b490ca 100%); }  
	<!--스크롤바-->



.navi{	
	height: 30%;
    margin-top: 0;
}
.navi div{
	color:#754F44;
    border: 1px solid white;
    background: #FDD692;
    height: 20%;
    text-align: center;
    font-size: 200%;
    font-weight: bold;
}
.menu-bar{            
    	background-color:white;           
        height: 100%;
        overflow: auto;
        position: fixed;
        display: relative;
    }
    .test{
    	border: 1px solid black;
    }    
    .test-header{
    	background: black;
        text-align: center;
        position: fixed;
        color: white;
        z-index: 1;
    }
    .content{
    	display: relative;
    }
    /* #title{
    	text-align: center;
    	font-size: 200%;
    	font-weight: bold;
    	margin-bottom: 3%;
    } */
    .no-padding{
    	padding: 0;
    }
    .content-sub-title{
        text-align: center;
        font-size: 200%;
        font-weight: bold;
        margin-bottom: 5%;
    }

/*
    #FBFFB9
    #FDD692
    #EC7357
    #754F44
*/
</style>

</head>

<div class="col-lg-12 navi">
	<div>관리자 홈</div>
	<div>신고</div>
    <div>문의</div>
    <div>재료요청</div>
    <div>회원조회</div>
    <div>재료관리</div>  
</div>
<form id="shortCuts" method="POST">
	<input type="hidden" value="${m.mNum}" name="mNum"></input>
</form>


<script>
	$('.navi').children().hover(function(){
		$(this).css({
			'background' : '#EC7357',
			'color' : '#FBFFB9',
			'cursor' : 'pointer'
		});
	}, function(){
		$(this).css({
			'background' : '#FDD692',
			'color' : '#754F44'
		});
	})

	function goShortCut(address){
		$('#shortCuts').attr('action', "${pageContext.request.contextPath}/"+address).submit();
	}
	
	
	$('.navi').children().eq(0).on('click',function(){
		//관리자 홈메뉴로가기
		goShortCut("admin/goAdmin.do");
	})
	$('.navi').children().eq(1).on('click',function(){
		//신고 메뉴로가기
		goShortCut("admin/goReport.do");		
	})
	$('.navi').children().eq(2).on('click',function(){
		//문의 메뉴로가기
		goShortCut("admin/goQNA.do");		
	})
	$('.navi').children().eq(3).on('click',function(){
		//재료요청 메뉴로가기
		goShortCut("admin/goRequestIngredient.do");					
	})
	$('.navi').children().eq(4).on('click',function(){
		//회원조회 메뉴로가기	
		goShortCut("admin/goSearchMember.do");		
	})
	$('.navi').children().eq(5).on('click',function(){
		//재료추가 메뉴로가기
		goShortCut("admin/goIng.do");		
	})

</script>

      
</html>