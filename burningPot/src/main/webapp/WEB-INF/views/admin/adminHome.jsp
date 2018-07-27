<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- chart.js -->
<script src="${pageContext.request.contextPath}/resources/js/admin/Chart.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/clock.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/cards.css" />

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
	.bigBox{
		padding-top: 2%;
		display:none;
		background: #EC7357;
	}
	.toggleBar{
		background:#5994f2;
		color: white;
		font-size: 150%;
		font-weight: bold;	
		padding:0.3%;	
	}
	.toggleBar i:first-child{
		display: inline;
	}
	.toggleBar i:nth-child(2){
		display:none;
	}
	.table-content{
		background:snow;
		padding:0.5%;
		
	}
	.content-title{
		text-align: center;
		font-size:200%;
		color: white;
		font-weight: bold;
	}
	.sub-title{
		font-size: 300%;
		font-family: 'Futura';
		color: #fff;
		text-align: center;			
		padding: 1.5%; 
		font-weight:bold;
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
	<br /><br />
    <div class="row">
    	<!-- 사이드메뉴 -->
        <div class="col-lg-2 menu-bar">
            <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>            
        </div>
    
        <div class="col-lg-8 offset-lg-2 content" align="justify">         	
        <div class="row" style="background:#EC7357; padding:1%;">
        <div class="col-lg-5 sub-title font-namu">환영합니다 관리자님</div>	
        <!-- 시계들어가는 부분 -->
        <div class="col-lg-5 offset-lg-2" align="right">   
		<div class="clock">
			<div class="dial-container dial-container--hh js-clock" data-cur="9" data-start="0" data-end="12" data-dur="hh"></div> &nbsp;
			<div class="dial-container dial-container--mm js-clock" data-cur="2" data-start="0" data-end="5" data-dur="mm"></div><div class="dial-container dial-container--m js-clock" data-cur="3" data-start="0" data-end="9" data-dur="m"></div>  
   			&nbsp;
			<div class="dial-container dial-container--ss js-clock" data-cur="4" data-start="0" data-end="5" data-dur="ss"></div><div class="dial-container dial-container--s js-clock" data-cur="8" data-start="0" data-end="9" data-dur="s"></div>
  		</div> 			
        </div>
        <!-- 시계끝 -->	
        </div>
        
        <br />
        	<div class="col-lg-12 test toggleBar">
        		<i class="fas fa-plus-square"></i>
        		<i class="fas fa-minus-square"></i>
        		&nbsp;회원관련통계
        	</div>
        	<div class="bigBox test">
        	<div class="row">
        		<!-- 성별분포 그래프 -->
        		<div class="cardContainer col-lg-5 offset-lg-1">
        			<div class="card">
    					<div class="front" style="font-size:250%; text-align:center;">
    					회원 성별 분포(명)<br>	
    					Click    					
    					</div>
    					<div class="back">
							<div class="col-lg-12">        	
        						<canvas id="genderDistribution" width="400" height="400"></canvas>
        					</div>
						</div>
  					</div>
        		</div>
        		
        		<!-- 연령별 분포 그래프 -->
        		<div class="cardContainer col-lg-5">
        			<div class="card">
    					<div class="front" style="font-size:250%; text-align:center;">
    					회원 연령 분포(명)<br>	
    					Click
    					</div>
    					<div class="back">
							<div class="col-lg-12">
        						<canvas id="ageDistribution" width="400" height="400"></canvas>
        					</div>
						</div>
  					</div>
        		</div>       		
        		
        	</div>
        	<br />
        	</div> 
        	
        	<br />        	        
        	
        	<div class="col-lg-12 test toggleBar">
        		<i class="fas fa-plus-square"></i>
        		<i class="fas fa-minus-square"></i>
        		&nbsp;레시피관련 순위
        	</div> 
        	<!-- 여기에 슬라이드 머리를 넣자 -->        
        	<div class="bigBox test">
        	<div class="row">        	      	        	
        	        	
        	<!-- 1 -->
        	<div class="col-lg-5 offset-lg-1 top-writer">
        	<div class="col-lg-12">        		
        		<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        			<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>
        			<div class="col-lg-7">작성자</div>        				
        			<div class="col-lg-2" style="color:gold"><i class="fas fa-file-alt"></i></i></div>        		
        		</div>        	
        	</div>	
        	<div class="col-lg-12 top-writer scrollbar-juicy-peach thin" style="height:190px; overflow-y:auto">        			
        		<c:forEach items="${topWriter}" var="top">
        		<div class="row table-content">
        			<div class="col-lg-2">${top.ranking}</div>
        			<div class="col-lg-7">${top.mName }</div>        				
        			<div class="col-lg-2">${top.counting }개</div>
        		</div>
        		</c:forEach>
        	</div> 
        	</div>
        	<!-- 1 -->
        	
        	<!-- 2 -->
        	<div class="col-lg-5 popular-recipe">
        	<div class="col-lg-12 popular-recipe">        	
        		<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        			<div class="col-lg-1" style="color: gold"><i class="fas fa-trophy"></i></div>
        			<div class="col-lg-3">작성자</div>
        			<div class="col-lg-6">레시피이름</div>
        			<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        		</div>
        	</div>	
        	<div class="col-lg-12 popular-recipe scrollbar-juicy-peach thin" style="height:190px; overflow-y:auto">        	
        		<c:forEach items="${popularRecipe}" var="pop">
        			<div class="row table-content">
        				<div class="col-lg-1">${pop.ranking}</div>
        				<div class="col-lg-3">${pop.mName }</div>
        				<div class="col-lg-6">${pop.rName }</div>
        				<div class="col-lg-2">${pop.counting }</div>
        			</div>
        		</c:forEach>
        	</div> 
        	</div>
        	<!-- 2 -->        	
        	</div>
        	        	     
        	<br />  
        	<div class="row content-title">
        		<div class="col-lg-5 offset-lg-1">작성한 레시피 갯수</div>
        		<div class="col-lg-5">가장 인기있는 레시피</div>
        	</div>
        	<br />  
        	</div>
        	<br>
        	
        	
        	<div class="col-lg-12 test toggleBar">
        		<i class="fas fa-plus-square"></i>
        		<i class="fas fa-minus-square"></i>
        		&nbsp;선호음식관련 통계(성별)
        	</div>
        	<div class="bigBox test">
        	
        		<div class="col-lg-12">
        		<div id="genderFavor" class="carousel slide" data-ride="carousel">
  					<div class="carousel-inner">
    					<div class="carousel-item active" style="text-align:center; background: #EC7357;">
     						<div class="col-lg-8 offset-lg-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>	
    					
    					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        				<c:forEach items="${maleFavor}" var="ma">
        					<div class="row table-content">
        						<div class="col-lg-1">&nbsp;</div>
        						<div class="col-lg-2">${ma.ranking}</div>        						
        						<div class="col-lg-6">${ma.rName }</div>
        						<div class="col-lg-2">${ma.counting }</div>
        					</div>
        				</c:forEach>
        				</div> 
        				<br />
        				<div class="col-lg-12 content-title">남성 선호 레시피</div>       				
        				</div> 
    					<div class="carousel-item" style="text-align:center; background: #EC7357;">
      						<div class="col-lg-8 offset-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>
        					
        					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        						<c:forEach items="${femaleFavor}" var="fe">
        						<div class="row table-content">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2">${fe.ranking}</div>        							
        							<div class="col-lg-6">${fe.rName }</div>
        							<div class="col-lg-2">${fe.counting }</div>
        						</div>
        					</c:forEach>
        					</div>
        					<br />
        					<div class="col-lg-12 content-title">여성 선호 레시피</div>   	
    					</div>    					
  					</div>
  				
  				<a class="carousel-control-prev" href="#genderFavor" role="button" data-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="sr-only">Previous</span>
  				</a>
  				
  				<div>
  				<a class="carousel-control-next" href="#genderFavor" role="button" data-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="sr-only">Next</span>
  				</a>
  				</div>
				</div>
        		
        		</div>
        	        	
        	<br />
        	</div>
        	
        	<br />
        	
        	<!-- 연령별 통계는 나중에하는게 좋을 것같다. 데이터가 충분치 않아서 특정 계층의 데이터가 너무 부족하다 -->
        	<div class="col-lg-12 test toggleBar">
        		<i class="fas fa-plus-square"></i>
        		<i class="fas fa-minus-square"></i>
        		&nbsp;선호음식관련 통계(연령별)
        	</div>
        	<div class="bigBox test">        	
        		<div class="col-lg-12">
        		<div id="ageFavor" class="carousel slide" data-ride="carousel">
  					<div class="carousel-inner">
    					<!-- 10대 -->
    					<div class="carousel-item active" style="text-align:center; background: #EC7357;">
     						<div class="col-lg-8 offset-lg-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>    					
    					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        				<c:forEach items="${maleFavor}" var="ma">
        					<div class="row table-content">
        						<div class="col-lg-1">&nbsp;</div>
        						<div class="col-lg-2">${ma.ranking}</div>        						
        						<div class="col-lg-6">${ma.rName }</div>
        						<div class="col-lg-2">${ma.counting }</div>
        					</div>
        				</c:forEach>
        				</div> 
        				<br />
        				<div class="col-lg-12 content-title">10대 선호 레시피</div>       				
        				</div> 
        				<!-- 20대 -->
    					<div class="carousel-item" style="text-align:center; background: #EC7357;">
      						<div class="col-lg-8 offset-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>
        					
        					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        						<c:forEach items="${femaleFavor}" var="fe">
        						<div class="row table-content">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2">${fe.ranking}</div>        							
        							<div class="col-lg-6">${fe.rName }</div>
        							<div class="col-lg-2">${fe.counting }</div>
        						</div>
        					</c:forEach>
        					</div>
        					<br />
        					<div class="col-lg-12 content-title">20대 선호 레시피</div>   	
    					</div>  
    					<!-- 30대 -->
    					<div class="carousel-item" style="text-align:center; background: #EC7357;">
      						<div class="col-lg-8 offset-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>
        					
        					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        						<c:forEach items="${femaleFavor}" var="fe">
        						<div class="row table-content">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2">${fe.ranking}</div>        							
        							<div class="col-lg-6">${fe.rName }</div>
        							<div class="col-lg-2">${fe.counting }</div>
        						</div>
        					</c:forEach>
        					</div>
        					<br />
        					<div class="col-lg-12 content-title">30대 선호 레시피</div>   	
    					</div>
    					<!-- 40대 -->
    					<div class="carousel-item" style="text-align:center; background: #EC7357;">
      						<div class="col-lg-8 offset-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>
        					
        					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        						<c:forEach items="${femaleFavor}" var="fe">
        						<div class="row table-content">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2">${fe.ranking}</div>        							
        							<div class="col-lg-6">${fe.rName }</div>
        							<div class="col-lg-2">${fe.counting }</div>
        						</div>
        					</c:forEach>
        					</div>
        					<br />
        					<div class="col-lg-12 content-title">40대 선호 레시피</div>   	
    					</div>
    					<!-- 50대 -->
    					<div class="carousel-item" style="text-align:center; background: #EC7357;">
      						<div class="col-lg-8 offset-2 popular-recipe">        	
        						<div class="row" style="padding:1%; background: #754F44; color:#FDD692">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2" style="color: gold"><i class="fas fa-trophy"></i></div>        							
        							<div class="col-lg-6">레시피이름</div>
        							<div class="col-lg-2" style="color:gold"><i class="far fa-thumbs-up"></i></div>
        						</div>
        					</div>
        					
        					<div class="col-lg-8 offset-lg-2 popular-recipe scrollbar-juicy-peach thin" style="height:220px; overflow-y:auto">        	
        						<c:forEach items="${femaleFavor}" var="fe">
        						<div class="row table-content">
        							<div class="col-lg-1">&nbsp;</div>
        							<div class="col-lg-2">${fe.ranking}</div>        							
        							<div class="col-lg-6">${fe.rName }</div>
        							<div class="col-lg-2">${fe.counting }</div>
        						</div>
        					</c:forEach>
        					</div>
        					<br />
        					<div class="col-lg-12 content-title">50대이상 선호 레시피</div>   	
    					</div>   							
  					</div>
  				
  				<a class="carousel-control-prev" href="#ageFavor" role="button" data-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="sr-only">Previous</span>
  				</a>
  				
  				<div>
  				<a class="carousel-control-next" href="#ageFavor" role="button" data-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="sr-only">Next</span>
  				</a>
  				</div>
				</div>
        		
        		</div>
        	        	
        	<br />
        	</div>
        	<br /><br />
        	        	
        	<script>
        	$(function(){        		
        		$(".toggleBar").click(function() {
        			var $bigBox = $(this).next('.bigBox');
        			var $toggleBar = $(this);
        			console.log('display상태가? : '+$bigBox.css('display'));
        			console.log($bigBox.css('display') != 'none');
        			
        			
        			$bigBox.slideToggle("slow",function(){
          				$('html').animate({scrollTop: $(this).offset().top}, 400);          				
          				if($bigBox.css('display') != 'none'){
            				$toggleBar.children('i').eq(0).css('display', 'none');
            				$toggleBar.children('i').eq(1).css('display', 'inline');                			
            			}else{
            				$toggleBar.children('i').eq(0).css('display', 'inline');
            				$toggleBar.children('i').eq(1).css('display', 'none');                			
            			}          				
          			});  
          		});
        		
        		$(".toggleBar").hover(function(){
        			$(this).css('cursor', 'pointer');
        		},function(){
        			
        		})
        		
        		
        	})        	
        	</script> 
        </div>
    </div>
    
	<script>
		$('.cardContainer').on('click', function () {
		  	$(this).children('.card').toggleClass('flipped');			
		});
	
	
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