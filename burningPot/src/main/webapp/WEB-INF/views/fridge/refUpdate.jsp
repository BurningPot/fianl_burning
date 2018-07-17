<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>냉장고 수정</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fridge/css/hkLocal.css?ver=2">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fridge/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
    <div class="container font">
        <div class="row" style="height:25vh;"></div>
        <div class="row" style="height:80vh;">
            <div class="col-sm-1 text-right" style="margin-right:-2.1%;">
				<a class="btn bg-1 mb-1 mt-5" style="margin:0%;" onclick="checkCategory('Abg-1');">곡&nbsp;&nbsp;&nbsp;류&nbsp;</a>
				<a class="btn bg-2 mb-1" style="margin:0%;" onclick="checkCategory('Bbg-2');">채소류&nbsp;</a>
				<a class="btn bg-3 mb-1" style="margin:0%;" onclick="checkCategory('Cbg-3');">육&nbsp;&nbsp;&nbsp;류&nbsp;</a>
				<a class="btn bg-4 mb-1" style="margin:0%;" onclick="checkCategory('Dbg-4');">해산물&nbsp;</a>
				<a class="btn bg-5 mb-1" style="margin:0%;" onclick="checkCategory('Ebg-5');">유제품&nbsp;</a>
				<a class="btn bg-6 mb-1" style="margin:0%;" onclick="checkCategory('Fbg-6');">기&nbsp;&nbsp;&nbsp;타&nbsp;</a>
            </div>
            <div class="col-sm-7">
            <div class="row" style="height:1vh;"></div>
                <div id="ingredient" class="rounded p-4">
                    <div id="real-ingre" class="row">  
                    	<!-- 재료 부분 -->     
                    </div>
                </div>
            </div>
            <div class="col-sm-4 ref-side">
                <div style="height:3vh;">
                	<span id="info">재료를 냉장고에 등록해주세요!&nbsp;&nbsp;</span>
                </div>
                <div id="ref-box" class="ref">
                    <div class="blank"></div>
                    <div id="refrigerator" class="rounded m-r" style="background: rgb(218, 241, 238); height:40vh; padding-top:1vh; padding-left:0.5vh;">
                        <div id="real-ref" class="row" style="margin-left:0.2vh; margin-right:0.5vh;"></div>
                    </div>
                </div>
                <div style="height:5vh;">
                    <button class="btn btn-block com" onclick="refMain();">수정 완료</button>
                </div>
            </div>
        </div>
        <div class="row" style="height:10vh;"></div>
    </div>

<script>
	$(document).ready(checkCategory('Abg-1'));
	
	function checkCategory(info){
		var category = info.substring(0,1);
		var bgColor = info.substring(1,5);
	    $('#ingredient').attr('class', bgColor+' rounded p-4');
		var inRef = [];
		$('#real-ref').children().each(function(){
			inRef.push($(this).attr('id'));  
		}); 

	    jQuery.ajaxSettings.traditional = true;
	    $.ajax({
	    	url : "${pageContext.request.contextPath}/fridge/checkCategory.do",
	    	type : "Get",
	    	data : {keyword : category, inRef : inRef},
			dataType : "json",
			success : function(data){
 				$('#real-ingre').children().remove();
				$.each(data, function(key, value){
					$('#real-ingre').append(`<div class="ingre m-1" id="`+value.iNum+`"><img src="${pageContext.request.contextPath}/resources/img/ingredient/`+value.iImage+`" alt="ingredient image" class="rounded-circle inIngre" title="`+value.iName+`"></div>`)
				});
				dragDrop();
				
			}, error : function(error, msg){
				console.log(error+' : '+msg);
			}
    	});
	}
	 
    function refMain(){
    	var inRef = [];
		$('#real-ref').children().each(function(){
			inRef.push($(this).attr('id'));  
		}); 
		
		location.href="${pageContext.request.contextPath}/fridge/refMain.do?inRef="+inRef;
    }
	    
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/js/hkLocal.js"></script>

</body>
</html>