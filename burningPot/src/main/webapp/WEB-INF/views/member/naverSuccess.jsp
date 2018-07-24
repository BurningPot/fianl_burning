<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		var gender = ${result}.response.gender;
		var name = ${result}.response.name;
		var birthday = ${result}.response.birthday;
		var id = ${result}.response.id;
		var birthday = ${result}.response.birthday;
		var profile_image = ${result}.response.profile_image;
		var age = ${result}.response.age;
		
		$("#name").html("환영합니다. "+name+"님");
		$("#email").html(email);
		$("#gender").html(gender);
		$("#name").html(name);
		$("#birthday").html(birthday);
		$("#id").html(id);
		$("#profile_image").html(profile_image);
		$("#age").html(age);
		
	  });
</script>

</head>
<body>
<div style="height:20%;"></div>

	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>SIST Naver_Login Success</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>
	<h4 style="text-align: center" id="gender"></h4>
	<h4 style="text-align: center" id="name"></h4>
	<h4 style="text-align: center" id="birthday"></h4>
	<h4 style="text-align: center" id="id"></h4>
	<h4 style="text-align: center" id="profile_image"></h4>
	<h4 style="text-align: center" id="birthday"></h4>
	<h4 style="text-align: center" id="age"></h4>

</body>
</html>
