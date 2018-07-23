<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- chart.js -->
<script src="${pageContext.request.contextPath}/resources/js/admin/Chart.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.graph-title{
		font-size: 200%;
		text-align: center;
		padding: 1%;
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
    
        <div class="col-lg-8 offset-lg-2 content" align="justify">         	
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
        		<!-- 가장 레시피 많이 쓴 사람 -->
        		<div class="col-lg-4 offset-lg-2">        	
        			
        		</div>        		
        		<!-- 가장 인기 많은 레시피 -->
        		<div class="col-lg-4 offset-lg-1">
        			
        		</div>        	
        	</div>
        	<div class="row">
        		<div class="col-lg-4 offset-lg-2 graph-title">회원 성별 분포(명)</div>
        		<div class="col-lg-4 offset-lg-1 graph-title">회원 연령 분포(명)</div>
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