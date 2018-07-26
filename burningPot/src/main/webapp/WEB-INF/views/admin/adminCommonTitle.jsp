<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#common-title{
	text-align: center;
	font-size: 200%;
	font-weight: bold;
	border: 1px solid black;
	background-image: url("${pageContext.request.contextPath}/resources/img/admin/foodWallpaper.jpg");
	background-size: cover; 
	height: 20%;
	margin-top: -2%;	
} 
#common-title div{
	color: white;
	padding: 3%;
	letter-spacing: 0.5em;
	font-size: 150%;
	text-shadow: 3px 3px 21px black, 3px 3px 21px black, 3px 3px 21px black;
	text-align: center;
	
}
</style>
</head>
<div class="col-lg-12" id="common-title"><div class="col-lg-12 font-namu">${commonTitle}</div></div>
</html>