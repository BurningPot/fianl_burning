<%@page import="java.io.PrintStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css">
	<script	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>


<title>ErrorPage</title>
<style>
	div#error-container{
		text-align:center;
	}
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/admin/errorPage.jpg");
		background-size: cover;
	}
	.errorTop{
		color: white;
		text-align: center;
		font-size: 600%;
		text-shadow: 10px 10px 10px black, 10px 10px 10px black;		
	}
	.test-border{
		border: 1px solid white;
	}
	.error-title{
		color: red;
		text-align: right;
		font-size: 300%;
		font-weight: bold;
		padding-right: 5%;
		text-shadow: 0px 0px 10px black, 0px 0px 15px black, 0px 0px 20px black;
	}
	.error-content{
		color: orange;
		text-align: right;
		font-size: 200%;
		padding-right: 5%;
		text-shadow: 0px 0px 10px black, 0px 0px 15px black, 0px 0px 20px black;
	}
	.common-dialog{
		color: white;
		text-align: right;
		font-size: 200%;
		padding-right: 5%;
		text-shadow: 0px 0px 10px black, 0px 0px 15px black, 0px 0px 20px black;
	}
</style>
</head>
<body>
	<input type="hidden" id="errorText" value="<%= exception.getMessage() %>" />
	
	<div class="col-lg-4 offset-lg-8 errorTop">
		Oops!
	</div>
	<br /><br />
	<div class="col-lg-6 offset-lg-6 error-title"></div>
	<br />
	<div class="col-lg-6 offset-lg-6 error-content"></div>
	<br />
	<p class="col-lg-6 offset-lg-6 common-dialog">
		관련 에러가 반복적으로 발생할 경우 <br>Q&A 게시판에 문의 해주시거나,<br>고객센터로 연락 주시기 바랍니다
	</p>
	
	
	<div class="col-lg-6 offset-lg-6" style="padding-right: 6%;" align="right">
		<button class="btn btn-primary">메인으로가기</button>	
		<button class="btn btn-success">Q&A게시판</button>	
	</div>
	
	
	<script>
		var errorText = new Array();
		errorText = $('#errorText').val().split(',');
		$('.error-title').text(errorText[0]);
		$('.error-content').text(errorText[1]);		
	</script>
</body>
</html>