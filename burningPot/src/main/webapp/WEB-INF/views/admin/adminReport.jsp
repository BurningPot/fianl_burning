<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css"> --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고게시판</title>

 <style>
     
        .table-head{
            background: lightgray;
            text-align: center;

        }
        .table-content{
            text-align: center;
        }
        .menu-title{
            text-align: center;
            font-size: 200%;
        }
         /*
    #FBFFB9
    #FDD692
    #EC7357
    #754F44
    */
    
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- 야매로 공간할당을 주어 처리한 부분 -->
	<div style="height:20%;"></div>
    


        
<c:import url="/WEB-INF/views/admin/adminCommonTitle.jsp"/>
<br><br><br>
<div class="row">
<div class="col-lg-2 menu-bar">
	<c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>  
</div>
            
<div class="col-lg-8 offset-lg-2 content"> 
	<!--여기 게시판이 들어갈거야-->
    <div class="container col-lg-12">
    	<div class="row table-head">
        	<div class="col-lg-1">번호</div>
            <div class="col-lg-6">제목</div>
            <div class="col-lg-2">작성자</div>
            <div class="col-lg-2">작성일</div>
            <div class="col-lg-1">신고수</div>
        </div>
    	<div class="row table-content">
    		<div class="col-lg-1">1</div>
        	<div class="col-lg-6">이것은 제목이다. 제목은 글 이름이다</div>
        	<div class="col-lg-2">한연두</div>
        	<div class="col-lg-2">2018/06/29</div>
        	<div class="col-lg-1">50</div>
    	</div>
	</div>
<br><br><br>
	<div class="col-lg-4 offset-lg-5">
		<nav aria-label="Page navigation example">
    		<ul class="pagination">
        		<li class="page-item"><a class="page-link" href="#">Previous</a></li>
            	<li class="page-item"><a class="page-link" href="#">1</a></li>
            	<li class="page-item"><a class="page-link" href="#">2</a></li>
            	<li class="page-item"><a class="page-link" href="#">3</a></li>
            	<li class="page-item"><a class="page-link" href="#">Next</a></li>
        	</ul>
   		</nav>
	</div>

</div>
                
                
</div>

</body>
</html>