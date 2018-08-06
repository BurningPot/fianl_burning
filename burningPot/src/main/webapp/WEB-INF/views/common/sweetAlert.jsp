<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script>
$(function(){
	var msgTitle = '${msgTitle}';
	var msg = '${msg}';
	var success = '${success}';
	
	if(success!=''){
		swal(msgTitle, msg, "success").then((value) => {
			location.href="${pageContext.request.contextPath}${loc}";
		});
	}else{
		swal(msgTitle, msg).then((value) => {
			location.href="${pageContext.request.contextPath}${loc}";
		});
	}
});

</script>
