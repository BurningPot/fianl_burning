<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css">
 --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    
    .result-message{
    	font-size: 300%;
    	background: #FDD692;
    	color: black;
    	padding: 2%;
    }
    .result-message i{
    	font-size: 400%;
    	color:  #EC7357;
    }
    .ing-info-firstLine > div{
		padding: 1%;		
		
		background:  #754F44;
		color: #FBFFB9;
	}  
	.ing-info-secondLine{
		padding: 2%;
		font-size: 250%;
		border: 1px solid black;
	}
	.ing-info-thirdLine div:nth-child(1){
		padding: 1%;
		font-size: 120%;
		background: #754F44;
		color: #FBFFB9;
		border-bottom: 1px solid #754F44;
	}
	.ing-info-thirdLine div:nth-child(2){
		padding: 1%;
		font-size: 100%;
		background: #FDD692;
		color: #754F44;		
	}     
   /*
    #FBFFB9
    #FDD692
    #EC7357
    #754F44
    */
        
</style>




<title>관리자페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- 야매로 공간할당을 주어 처리한 부분 -->
	<div style="height:20%;"></div>
   
	
	<c:import url="/WEB-INF/views/admin/adminCommonTitle.jsp"/>
	<br /><br /><br />
    <div class="row">
    	<!-- 사이드메뉴 -->
        <div class="col-lg-2 menu-bar">
            <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>            
        </div>
    
        <div class="col-lg-8 offset-lg-2 content" align="center"> 
        	<div class="col-lg-12 result-message">
        		<!-- 수행 결과에 따라 메세지가 뜨게 한다 -->
        		
        		<i class="far fa-grin-beam"></i>
        		<br />
        		${msg}  
        		      		
        	</div>
        		<br /><br /><br />
        		
        		<div class="row">  
					<div class="col-lg-4">
						<img src="${pageContext.request.contextPath}/resources/img/ingredient/${img}" class="col-lg-12"/>
        			</div>     			
 				     
 					<div class="col-lg-8 no-padding" style="font-size: 130%;">	
 						<div class="row col-lg-12 no-padding ing-info-firstLine">
 							<div class="col-lg-6">${cName}&nbsp;&gt;&nbsp;${subCName}</div>
 							<div class="col-lg-6">
 								<div class="row">유통기한 :&nbsp;${exdate}일</div>
 							</div>
 						</div>
 						<div class="col-lg-12 ing-info-secondLine test">[<span id="iNumber">${iNum}</span>]&nbsp;${iName}</div>
 						<div class="col-lg-12 no-padding ing-info-thirdLine test">
 							<div class="col-lg-12">관련키워드</div>
 							<div class="col-lg-12">
 							<c:forEach items="${keyword}" var = "k">
 								${k}
 							</c:forEach>
 							</div>
 						</div>
 					</div>
 				</div>  
			<br />       	
        	<div class="col-lg-12">
        		<button class="btn btn-primary" onclick="goAdminHome()">관리자 홈으로</button>
        		<button class="btn btn-success" onclick="goAdminIngredient()">재료관리메뉴로</button>
        	</div>
        	<br /><br />
        	
        	<script>
        	function goAdminHome(){
        		location.href="${pageContext.request.contextPath}/admin/goAdmin.do";
        	}
        	function goAdminIngredient(){
        		location.href="${pageContext.request.contextPath}/admin/goIng.do";
        	}
        	
        	</script>
        	
        	
        </div>
    </div>
	
	
	
</body>
</html>