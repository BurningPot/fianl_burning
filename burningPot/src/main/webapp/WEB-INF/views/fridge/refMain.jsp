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
	                <div class="rounded p-r m-r">
	                    <div class="recipe row">
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/33.png" alt="ingredient image" class="rounded-circle" title="꼬막">
	                        </div>
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/47.png" alt="ingredient image" class="rounded-circle" title="고등어">
	                        </div>
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/55.png" alt="ingredient image" class="rounded-circle" title="주꾸미">
	                        </div>
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/47.png" alt="ingredient image" class="rounded-circle" title="고등어">
	                        </div>    
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/33.png" alt="ingredient image" class="rounded-circle" title="꼬막">
	                        </div>
	                        <div class="m-1 ingre">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/47.png" alt="ingredient image" class="rounded-circle" title="고등어">
	                        </div>    
	                            
	                    </div>                        
	                </div>
	            </div>
	            <div class="text-center" style="height:8vh;">
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
	            <div class="p-4 rounded rec-side left-arrow">
	                <div class="recipe row">
	                    <div class="col-sm-4">
	                        <div style="height: 12vh">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/food1.png" alt="food image" class="rounded" style="max-height: 100%; min-width:100%;">
	                        </div>
	                    </div>
	                    <div class="col-sm-8">
	                        <div><h5>한라봉 소스를 곁들인 주꾸미 볶음</h5></div>
	                        <div>건강에 좋고 맛도 좋은 간편 요리!(한줄소개)</div>
	                        <div>작성자 : 각설탕</div>
	                        <div>주재료 : 한라봉, 주꾸미</div>
	                    </div>
	                </div>
	                <hr>
	                <div class="recipe row">
	                    <div class="col-sm-4">
	                        <div style="height: 12vh">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/food2.png" alt="food image" class="rounded" style="max-height: 100%; min-width:100%;">
	                        </div>
	                    </div>
	                    <div class="col-sm-8">
	                        <div><h5>건강 간식 고구마 맛탕</h5></div>
	                        <div>반려견도 만들 수 있을만큼 쉬운 맛탕</div>
	                        <div>작성자 : 이수원준</div>
	                        <div>주재료 : 고구마</div>    
	                    </div>
	                </div>
	                <hr>
	                <div class="recipe row">
	                    <div class="col-sm-4">
	                        <div style="height: 12vh">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/food1.png" alt="food image" class="rounded" style="max-height: 100%; min-width:100%;">
	                        </div>
	                    </div>
	                    <div class="col-sm-8">
	                        <div><h5>한라봉 소스를 곁들인 주꾸미 볶음</h5></div>
	                        <div>건강에 좋고 맛도 좋은 간편 요리!(한줄소개)</div>
	                        <div>작성자 : 각설탕</div>
	                        <div>주재료 : 한라봉, 주꾸미</div>
	                    </div>
	                </div>
	                <hr>
	                <div class="recipe row">
	                    <div class="col-sm-4">
	                        <div style="height: 12vh">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/food2.png" alt="food image" class="rounded" style="max-height: 100%; min-width:100%;">
	                        </div>
	                    </div>
	                    <div class="col-sm-8">
	                        <div><h5>건강 간식 고구마 맛탕</h5></div>
	                        <div>반려견도 만들 수 있을만큼 쉬운 맛탕</div>
	                        <div>작성자 : 이수원준</div>
	                        <div>주재료 : 고구마</div>    
	                    </div>
	                </div>
	                <hr>
	                <div class="recipe row">
	                    <div class="col-sm-4">
	                        <div style="height: 12vh">
	                            <img src="${pageContext.request.contextPath}/resources/fridge/images/food2.png" alt="food image" class="rounded" style="max-height: 100%; min-width:100%;">
	                        </div>
	                    </div>
	                    <div class="col-sm-8">
	                        <div><h5>건강 간식 고구마 맛탕</h5></div>
	                        <div>반려견도 만들 수 있을만큼 쉬운 맛탕</div>
	                        <div>작성자 : 이수원준</div>
	                        <div>주재료 : 고구마</div>    
	                    </div>
	                </div>
	                <hr>
	            </div>
	            <div style="height:3vh;"></div>
	        </div>
	    </div>
	    <div class="row" style="height:10vh;"></div>
	</div>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fridge/js/hkLocal.js"></script>	
</body>
</html>