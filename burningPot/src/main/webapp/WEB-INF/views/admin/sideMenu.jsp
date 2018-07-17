<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.navi{	
	height: 30%;
    margin-top: 10%;
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

/*
    #FBFFB9
    #FDD692
    #EC7357
    #754F44
*/
</style>

</head>
<form>
<div class="col-lg-12 navi">
	<div>신고</div>
    <div>문의</div>
    <div>재료요청</div>
    <div>회원조회</div>
    <div>재료추가</div>  
</div>
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


	$('.navi').children().eq(0).on('click',function(){
		//신고 메뉴로가기
		$(this).parent().parent().attr("action","${pageContext.request.contextPath}/admin/goReport.do").submit();			
	})
	$('.navi').children().eq(1).on('click',function(){
		//문의 메뉴로가기
		$(this).parent().parent().attr("action","${pageContext.request.contextPath}/admin/goQNA.do").submit();				
	})
	$('.navi').children().eq(2).on('click',function(){
		//재료요청 메뉴로가기
		$(this).parent().parent().attr("action","${pageContext.request.contextPath}/admin/goRequestIngredient.do").submit();		
	})
	$('.navi').children().eq(3).on('click',function(){
		//회원조회 메뉴로가기		
		$(this).parent().parent().attr("action","${pageContext.request.contextPath}/admin/goSearchMember.do").submit();			
	})
	$('.navi').children().eq(4).on('click',function(){
		//재료추가 메뉴로가기
		$(this).parent().parent().attr("action","${pageContext.request.contextPath}/admin/goIng.do").submit();
	})

</script>

      
</html>