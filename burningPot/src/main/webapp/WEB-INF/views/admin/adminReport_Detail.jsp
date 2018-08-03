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
            	<div class="col-lg-10 rounded test" style="text-align:justify; padding: 3%;">${b.rpContent}</div>                    
            </div>            
            <br />
            <hr class="col-lg-12"/>
            <br />
            
            <div class="col-lg-12">
            	<div class="col-lg-10 test" style="heigh:200px;">
            		<div class="row">
            			<div class="col-lg-4">
            				<img src="${pageContext.request.contextPath}/resources/img/recipeContent/${rp.rImg}" style="margin-top: 3%;"/>
            			</div>
            			<div class="col-lg-7 offset-lg-1 no-padding">
            				<div class="col-lg-11" style="font-size:200%; margin-top:2%; background: #FDD692;">${rp.rName}</div>
            				<div class="col-lg-11" style="font-size:200%; background:#EC7357;">${rp.mName}</div>
            				<br />
            				<!-- 레시피 보러가기는 레시피 상세보기로 링크를 건다 -->
            				<button class="btn btn-success" onclick="showRecipe();">레시피 보러가기</button>
            				<button class="btn btn-danger" onclick="deleteThisRecipe();">레시피 삭제하기</button>  
            				<br /><br />    				
            			</div>            			
            		</div>
            	</div>            
            </div>
            <br /><br />
            <div class="col-lg-12" align="center">            	
                <button class="btn btn-primary" id="returnList">목록으로</button>                
            </div>
                      
            <form action="${pageContext.request.contextPath}/admin/${servletMapping}" method="POST" id="toList">
            	<input type="hidden" name="mNum" value="${m.mNum}" />
            </form>
            <br>
            <hr class="col-lg-12"/>
    		
        	<br><br>
        	<script>
        		$('#comment').keyup(function(){
        			$('#cLength').text($('#comment').val().length);        			
        		});
        	           	
            	$('#returnList').on('click', function(){
            		//목록으로 돌아간다
            		$('#toList').submit();
            	});
            	
            	function deleteThisRecipe(){
            		var number = ${rp.rNum};
            		
            		swal({
            			  title: "삭제를 진행합니까?",
            			  text: "레시피를 삭제할 경우 관련 자료들은 모두 삭제됩니다",
            			  icon: "warning",
            			  buttons: true,
            			  dangerMode: true,
            			})
            			.then((willDelete) => {
            			  if (willDelete) {
            			    //삭제를 누를 경우
            			    $.ajax({
            					url: "${pageContext.request.contextPath}/admin/deleteRecipe.do",
            					data:{
            						rNum : number
            					}, success: function(data){
            						swal("작업성공!", "선택하신 레시피가 삭제되었습니다", "success").then((value) => {
            							location.href="${pageContext.request.contextPath}/admin/goReport.do";
            						});
            					}, error: function(data){
            						swal("작업실패!", "레시피 삭제에 실패하였습니다", "error");
            					}
            				})
            			  } else {
            				//취소를 누를 경우
            			    swal("알림", "레시피 삭제가 중단 되었습니다", "info");
            			  }
            			});  
            	}
            	
            	function showRecipe(){
            		var number =${rp.rNum};            		
            		window.open(
            				"${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+number, '_blank'	
            		);
            	}
            	
            	
        	</script>
        	
        </div>
    </div>
	
	
	
</body>
</html>