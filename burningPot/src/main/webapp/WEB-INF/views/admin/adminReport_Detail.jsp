<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    
    .first-row div:not(.column-title){
    	border: 1px solid #FDD692;
    	text-align: justify;
    	padding: 0.5%;
    	padding-left: 1%; 
    }
    .column-title{
    	background: #FDD692;
    	text-align: center; 
    	padding: 0.5%;
    	
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
	<br /><br />
    <div class="row">
    	<!-- 사이드메뉴 -->
        <div class="col-lg-2 menu-bar">
            <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>            
        </div>
    
        <div class="col-lg-8 offset-lg-2 content" align="center"> 
        	<div class="row first-row col-lg-12">        		
            	<div class="col-lg-1 offset-lg-1 column-title">제목</div>
                <div class="col-lg-9">${b.rpContent}</div>
            </div>
            <div class="row first-row col-lg-12">
            	<div class="col-lg-1 offset-lg-1 column-title">작성자</div>
                <div class="col-lg-6">${b.mName}</div>
                <div class="col-lg-1 column-title">작성일</div>
                <div class="col-lg-2">${b.rpDate}</div>
            </div>
            
            <div class="row first-row col-lg-12">            	
            	<div class="col-lg-1 offset-lg-1 column-title">번호</div>
                <div class="col-lg-6">${b.rpNum}</div>
                <div class="col-lg-1 column-title">답변</div>
                <div class="col-lg-2"></div>
            </div>
            <br>
			<div class="col-lg-12">
            	<div class="col-lg-10 test" style="text-align:justify; padding: 3%;">${b.rpContent}</div>                    
            </div>            
            
            <br /><br />
            <div class="col-lg-12" align="center">            	
                <button class="btn btn-primary" id="returnList">목록으로</button>                
            </div>
                      
            
            <br>
            <hr class="col-lg-12"/>
    		
        	<br><br>
        	<script>
        		$('#comment').keyup(function(){
        			$('#cLength').text($('#comment').val().length);        			
        		});
        	</script>
        	<br /><br /> 
        	        	
        	 <script>            	
            	$('#returnList').on('click', function(){
            		//목록으로 돌아간다
            		location.href="${pageContext.request.contextPath}/admin/${servletMapping}";
            	});
        	
        	</script>
        	
        </div>
    </div>
	
	
	
</body>
</html>