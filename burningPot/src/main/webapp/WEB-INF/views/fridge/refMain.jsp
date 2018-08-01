<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>냉장고 메인</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fridge/css/hkLocal.css?ver=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fridge/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400">
</head>
<body class="font">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container">
	    <div class="row" style="height:25vh;"></div>
	    <div class="row">
	        <div class="col-sm-4 ref-side">
	            <div class="ref">
	                <div class="blank"></div>
	                <div id="refrigerator" class="rounded p-r m-r">
	                    <div id="ref" class="recipe row">
							<c:forEach var="ingre" items="${list}">
								<c:choose>
									<c:when test="${ingre.expiration < 0}">										
										<div class="ingre m-1" id="${ingre.iNum}" style="position:relative;">
											<div class="rounded-circle re-danger" title="${ingre.iName}(유통기한 ${-ingre.expiration}일 경과)"></div>
											<img src="${pageContext.request.contextPath}/resources/img/ingredient/${ingre.iImage}" alt="ingredient image" class="rounded-circle inIngre" style="position:relative;">
										</div>								
									</c:when>
									<c:when test="${ingre.expiration < 4}">
										<div class="ingre m-1" id="${ingre.iNum}" style="position:relative;">
											<div class="rounded-circle re-warning" title="${ingre.iName}(유통기한 ${ingre.expiration}일 남음)"></div>
											<img src="${pageContext.request.contextPath}/resources/img/ingredient/${ingre.iImage}" alt="ingredient image" class="rounded-circle inIngre" style="position:relative;">
										</div>									
									</c:when>
									<c:otherwise>
										<div class="ingre m-1" id="${ingre.iNum}">
											<img src="${pageContext.request.contextPath}/resources/img/ingredient/${ingre.iImage}" alt="ingredient image" class="rounded-circle inIngre" title="${ingre.iName}">
										</div>									
									</c:otherwise>
								</c:choose>
							</c:forEach>
	                    </div>                        
	                </div>
	            </div>
	            <div class="text-center mainBtn">
					<a href="${pageContext.request.contextPath}/fridge/refUpdate.do" class="cta" style="text-decoration: none;">
						<span>냉장고 수정</span>
						<svg width="15vh" height="2vh" viewBox="0 0 13 10">
							<path d="M1,5 L11,5"></path>
							<polyline points="8 1 12 5 8 9"></polyline>
						</svg>
					</a>
	            </div>
	        </div>
	
	        <div class="col-sm-1" style="margin-right:-5%"></div>
	
	        <div class="col-sm-7">
	            <div id="recipe" class="p-4 rounded rec-side left-arrow">
					<!-- 레시피 영역 -->
	            </div>
	            <div style="height:3vh;"></div>
	        </div>
	    </div>
	    <div class="row" style="height:10vh;"></div>
	</div>
	<script>
  		$(document).ready(function(){
			var inRef = [];
			$('#ref').children().each(function(){
				inRef.push($(this).attr('id'));
			})
			
	    	jQuery.ajaxSettings.traditional = true;
		 	$.ajax({
				url : "${pageContext.request.contextPath}/fridge/findRecipe.do",
				data : {inRef : inRef},
				success : function(data){
					$.each(data, function(key, value){
						if(value.untilReg < 4){		
							$('#recipe').append(
				                `<div class="recipe row">
				                    <div class="col-sm-4">
				                        <div style="height: 17vh; width:100%;" class="newReg">
				                            <a href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum=`+value.rNum+`">
				                        	<img src="${pageContext.request.contextPath}/resources/img/recipeContent/`+value.rImg+`" alt="food image" class="rounded recImg" style="max-height: 100%; min-width:100%;">
				                        	</a>
				                        </div>
				                    </div>
				                    <div class="col-sm-8">
				                        <div>
				                        <a href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum=`+value.rNum+`" class="btn recTitle">
				                        <h5><b>`+value.rName+`</b></h5></a></div>
				                        <div>`+value.rIntro+`</div>
				                        <div>작성자 : `+value.mName+`</div>
				                        <div>주재료 : `+value.iName+`</div>
				                    </div>
				                </div>
				                <hr>`)
						} else {
							$('#recipe').append(
				                `<div class="recipe row">
				                    <div class="col-sm-4">
				                        <div style="height: 17vh;">
				                            <a href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum=`+value.rNum+`">
				                        	<img src="${pageContext.request.contextPath}/resources/img/recipeContent/`+value.rImg+`" alt="food image" class="rounded recImg" style="max-height: 100%; min-width:100%;">
				                        	</a>
				                        </div>
				                    </div>
				                    <div class="col-sm-8">
				                        <div>
				                        <a href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum=`+value.rNum+`" class="btn recTitle">
				                        <h5><b>`+value.rName+`</b></h5></a></div>
				                        <div>`+value.rIntro+`</div>
				                        <div>작성자 : `+value.mName+`</div>
				                        <div>주재료 : `+value.iName+`</div>
				                    </div>
				                </div>
				                <hr>`)
						}
						
					});					
				}, error : function(error, msg){
					console.log(error+' : '+msg);
				}
			});
		});
	</script>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/js/hkLocal.js"></script>	
</body>
</html>