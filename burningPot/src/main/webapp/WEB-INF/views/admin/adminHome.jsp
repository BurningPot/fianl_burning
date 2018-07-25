<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- chart.js -->
<script src="${pageContext.request.contextPath}/resources/js/admin/Chart.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/clock.css" />


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.graph-title{
		font-size: 200%;
		text-align: center;
		padding: 1%;
	}
	.popular-recipe, .top-writer{
		text-align: center;
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
   <script src="${pageContext.request.contextPath}/resources/js/admin/clock.js"></script>
	
	
	<c:import url="/WEB-INF/views/admin/adminCommonTitle.jsp"/>
	<br /><br /><br />
    <div class="row">
    	<!-- 사이드메뉴 -->
        <div class="col-lg-2 menu-bar">
            <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>            
        </div>
    
        <div class="col-lg-8 offset-lg-2 content" align="justify">         	
        	
        <!-- 시계들어가는 부분 -->
        <div class="col-lg-5 offset-lg-7">   
		<div class="clock">
			<div class="dial-container dial-container--hh js-clock" data-cur="9" data-start="0" data-end="12" data-dur="hh"></div> &nbsp;
			<div class="dial-container dial-container--mm js-clock" data-cur="2" data-start="0" data-end="5" data-dur="mm"></div><div class="dial-container dial-container--m js-clock" data-cur="3" data-start="0" data-end="9" data-dur="m"></div>  
   			&nbsp;
			<div class="dial-container dial-container--ss js-clock" data-cur="4" data-start="0" data-end="5" data-dur="ss"></div><div class="dial-container dial-container--s js-clock" data-cur="8" data-start="0" data-end="9" data-dur="s"></div>
  		</div>

 		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    	<script src="js/index.js"></script>			
        </div>
        <!-- 시계끝 -->	
        	<br /><br /><br />
        	<div class="row">
        		<!-- 성별분포 그래프 -->
        		<div class="col-lg-4 offset-lg-2">        	
        			<canvas id="genderDistribution" width="400" height="400"></canvas>
        		</div>
        		
        		<!-- 연령별 분포 그래프 -->
        		<div class="col-lg-4 offset-lg-1">
        			<canvas id="ageDistribution" width="400" height="400"></canvas>
        		</div>
        	</div>       	
        	<div class="row">
        		<div class="col-lg-4 offset-lg-2 graph-title">회원 성별 분포(명)</div>
        		<div class="col-lg-4 offset-lg-1 graph-title">회원 연령 분포(명)</div>
        	</div>
        	<br /><br /><br /><br />
        	        
        	<div class="row" style="text-align: center; font-size:200%;">
        		<div class="col-lg-4 offset-lg-2">작성한 레시피 갯수</div>
        		<div class="col-lg-4 offset-lg-1">가장 인기있는 레시피</div>
        	</div>
        	<br />  
        	<div class="row">
        		<!-- 가장 레시피 많이 쓴 사람 -->  
        		<div class="col-lg-4 offset-lg-2 test top-writer">
        			<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        				<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>
        				<div class="col-lg-7">작성자</div>        				
        				<div class="col-lg-2" style="color:gold"><i class="fas fa-file-alt"></i></i></div>
        			</div>
        			<c:forEach items="${topWriter}" var="top">
        			<div class="row" style="padding:0.5%;">
        				<div class="col-lg-2">${top.ranking}</div>
        				<div class="col-lg-7">${top.mName }</div>        				
        				<div class="col-lg-2">${top.counting }개</div>
        			</div>
        			</c:forEach>
        		</div>  
        	
        	
        		<!-- 가장 인기 많은 레시피 -->
        		<div class="col-lg-4 offset-lg-1 test popular-recipe">        	
        			<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        				<div class="col-lg-1" style="color: gold"><i class="fas fa-trophy"></i></div>
        				<div class="col-lg-3">작성자</div>
        				<div class="col-lg-6">레시피이름</div>
        				<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        			</div>
        			<c:forEach items="${popularRecipe}" var="pop">
        			<div class="row" style="padding:0.5%;">
        				<div class="col-lg-1">${pop.ranking}</div>
        				<div class="col-lg-3">${pop.mName }</div>
        				<div class="col-lg-6">${pop.rName }</div>
        				<div class="col-lg-2">${pop.counting }</div>
        			</div>
        			</c:forEach>
        		</div>        		
        		      	
        	</div>        
        	        
        	        	
        	<br><br>
        </div>
    </div>
    
	<script>
		$(function(){
			
			
		})
	
	
	
       	var ctx1 = $("#genderDistribution");
       	var genderChart = new Chart(ctx1, {
       	    type: 'pie',
       	    data: {
       	        labels: ["남자", "여자"],
       	        datasets: [{
       	            
       	            data: [${gender[0]}, ${gender[1]}],
       	            backgroundColor: [       	                
       	                'rgba(54, 162, 235, 0.5)',  
       	            	'rgba(255, 99, 132, 0.5)'
       	            ],
       	            borderColor: [
       	            	'rgba(54, 162, 235, 1)', 
       	                'rgba(255,99,132,1)'
       	                      	                
       	            ],
       	            borderWidth: 1
       	        }]
       	    },
       	    options: {
       	    	
       	        
       	    }
       	});
       	
       	var ctx2 = $("#ageDistribution");       	
       	      		
       	var ageChart = new Chart(ctx2, {
       	    type: 'bar',
       	    data: {
       	        labels: ["10대이하", "20대", "30대", "40대", "50대이상"],
       	        datasets: [{
       	            
       	            data: [${age[0]}, ${age[1]}, ${age[2]}, ${age[3]}, ${age[4]}], 
       	            backgroundColor: [
       	                'rgba(255, 99, 132, 0.5)',
       	                'rgba(54, 162, 235, 0.5)',
       	             	'rgba(255, 206, 86, 0.5)',
                     	'rgba(75, 192, 192, 0.5)',
                     	'rgba(153, 102, 255, 0.5)'       	                
       	            ],
       	            borderColor: [
       	                'rgba(255,99,132,1)',
       	                'rgba(54, 162, 235, 1)',  
       	             	'rgba(255, 206, 86, 1)',
                  		'rgba(75, 192, 192, 1)',
                  		'rgba(153, 102, 255, 1)'
       	            ],
       	            borderWidth: 1
       	        }]
       	    },
       	    options: {
       	    	legend: {
					display: false
       	        },
       	        
       	    	scales: {
       	            yAxes: [{
       	                ticks: {
       	                    beginAtZero:true
       	                }
       	            }]
       	        }
       	    }
       	});
       	
    </script>
	
	
</body>
</html>