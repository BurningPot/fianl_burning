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
<title>문의게시판</title>

<style>
.tableHead{
	background: #754F44;
    color: #FBFFB9;
    text-align: center;
    font-size: 140%;
}
.tableContent{        	
	text-align: center;
    padding: 0.5%;
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
    <div class="row tableHead col-lg-12">
    	<div class="col-lg-1">번호</div>
        <div class="col-lg-6">제목</div>
        <div class="col-lg-2">작성자</div>
        <div class="col-lg-2">작성일</div>
        <div class="col-lg-1">답변</div>            
    </div>
      
    <!-- db의 내용들이 들어올 곳이다 -->      
    <form id="goDetail">
    <c:forEach items="${list}" var="b" varStatus="status">
    	
    <div class="row tableContent col-lg-12">  
    	<div class="col-lg-1 boardNumber">${b.bNum}</div>	<!-- 글번호 -->
        <div class="col-lg-6">${b.bTitle}</div>	<!-- 제목 -->
        <div class="col-lg-2">${b.mId}</div>	<!-- 작성자 -->
        <div class="col-lg-2">${b.bDate}</div>	<!-- 작성일 -->
        <div class="col-lg-1">${b.reply}</div>	<!-- 답변여부 -->        
    </div>    	
    </c:forEach>
    </form>
    	
    <script>
    	$('.tableContent').hover(function(){
    		$(this).css({
    			background: '#FDD692',
    			cursor : 'pointer'					
    		})
    	}, function(){
    		$(this).css({
    			background: 'white',
    			color: 'black'
    		})
    	});
    		
    	</script>
	</div>
<br><br><br>
    

	<!-- Paging -->
	<%-- 페이지바를 위한 Utils의 정적메소드 사용 --%> 
   	<% 
      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
      String servletMapping = (String)request.getAttribute("servletMapping");     
      
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
      
   %>
   <%= com.kh.pot.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, servletMapping) %>
	<script>
	$('.tableContent').on('click', function(){    			
		var bNumber = $(this).children().eq(0).text();  
		
		location.href='${pageContext.request.contextPath}/admin/${detailMapping}?bNum='+bNumber;
	});
	</script>

</div>
                
                
</div>

</body>
</html>