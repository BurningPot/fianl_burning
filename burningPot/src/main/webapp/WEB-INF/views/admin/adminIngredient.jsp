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
	.ingMenu-search{
		height: 209px; 		
	}
	.search-detail{
		overflow-y : auto;
		font-size: 120%;
	}
	.search-detail > div{
		
	}	
	.ing-Uppercategory{
		font-size: 120%;				
	}	
	.ing-Lowercategory{
		font-size: 120%;
	}
	.ing-Uppercategory > div{
		padding: 1%; 		
	}
	.ing-Lowercategory > div{
		padding: 1%; 
		
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
	.modal-title{
		margin-top: 3%;
		padding-bottom: 1.5%;
		font-size: 130%;
		
	
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
<script>
	
function hoveringDiv(){	
	
	$('.ing').children().hover(function(){			
		$(this).css({
			"cursor" : "pointer",
			"background" : "#FDD692"
		});		
	}, function(){			
		$(this).css({
			"background" : "white"
		});		
	});
	
}

	$(function(){
		hoveringDiv();
	});
	</script>
	

    <div class="row">
    	<!-- 사이드메뉴 -->
        <div class="col-lg-2 menu-bar">
            <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>            
        </div>
    
        <div class="col-lg-8 offset-lg-2 content" align="center"> 
        	<div class="col-lg-12" style="margin-bottom: 3%; font-size: 150%;">재료 검색</div>        	
        	
        	<div class="row ingMenu-search">        	
        		<div class="col-lg-6 search-category test">
        			<div class="row">
        				<div class="col-lg-6 no-padding" style="border-right: 1px solid black;height: 208px;">
        					<div class="col-lg-12 ing ing-Uppercategory no-padding">
        						<c:forEach items="${distinctList}" var ="ing">
        						<div class="col-lg-12">${ing.cName}</div>        					
       						</c:forEach>
        					</div>
        				</div>        				
        				<div class="col-lg-6 ing ing-Lowercategory no-padding">        					  				
        				</div>        				
        			</div>
        		</div>
        		<div class="col-lg-6 ing search-detail test no-padding">        			
        		</div>
        	</div>
        	
        	<script>	
        		// 큰분류 선택하면 세부분류가 떠오르게 한다
        		$('.ing-Uppercategory').children().on('click', function(){        			
        			$('.search-detail').empty();
        			var cName = $(this).text();
        			
        			console.log(cName);
        			$.ajax({
        				url: "${pageContext.request.contextPath}/admin/selectBigCategory.do",
        				data: {
        					bCategory: cName
        				},success: function(data){
        					var html = "";
        					for(var i = 0; i< data.length; i++){
        						html += '<div class="col-lg-12">'+data[i].subCName+'</div>';      						
        					}
        					$('.ing-Lowercategory').empty();
        					$('.ing-Lowercategory').append(html);
        					
        					selectSubCategory();
        					// 여기에 호버 함수 넣기
        					hoveringDiv();
        				}, error: function(data){
        					console.log("세부정보 불러오기 실패");
        				}
        			})
        		});        		       		
        		
        		function selectSubCategory(){
        			// 세부분류 선택하면 재료 리스트가 나온다
            		$('.ing-Lowercategory').children().on('click', function(){
            			var subCName = $(this).text();
            			console.log(subCName);   	        			
            			
            			$.ajax({
            				url: "${pageContext.request.contextPath}/admin/selectSubCategory.do",
            				data:{
            					subCategory : subCName
            				}, success: function(data){
            					var subHtml = "";
            					for(var i = 0; i< data.length; i++){
            						subHtml += '<div class="col-lg-12">'+data[i].iName+'</div>';      						
            					}
            					$('.search-detail').empty();
            					$('.search-detail').append(subHtml);           					
            					
            					// 여기에 호버 함수 넣기
            					hoveringDiv();
            					clickIngName();
            				}, error: function(data){
            					console.log("재료리스트 불러오기 실패");
            				}            				
            			});
            		}); 
        		}  	        		
        	</script>        	    	
        	
        	<div class="col-lg-12" style="margin-bottom: 3%; margin-top:5%;font-size: 150%;">재료 정보</div>        	
        	<div class="col-lg-12 ingredient-information">
        		<%-- <div class="row">
        			<div class="col-lg-4">
        				<img src="${pageContext.request.contextPath}/resources/img/ingredient/ing_1.jpg" class="col-lg-12"/>
        				<br /><br>
        			<button class="btn btn-default">수정하기</button>
        				<br/><br/> 
        			</div>
        			<div class="col-lg-8 no-padding" style="font-size: 130%;">
						<div class="row col-lg-12 no-padding ing-info-firstLine">
							<div class="col-lg-6">상위카테고리 > 하위카테고리</div>
							<div class="col-lg-6">유통기한 : <span>7</span>일</div>							
						</div>
						<div class="col-lg-12 ing-info-secondLine">
							[1] &nbsp; 국수
						</div>
						<div class="col-lg-12 no-padding ing-info-thirdLine">							
							<div class="col-lg-12">관련키워드</div>							
							<div class="col-lg-12">국수, 마른국수, 마른것 </div>	
													
						</div>
					</div>
        		</div>        	 --%>
        	</div> 
        	
        	<hr class="col-lg-12"/>
        	
        	<!-- 수정하기는 모달을 띄워 재료 정보를 수정하는 창을 띄워주고
				삭제하기는 바로 alert창에서 컨펌을 받은 후 삭제를 진행하고 다시 해당 페이지로 돌아오기한다        	
        	 -->
        	<div class="col-lg-12">
        		<button class="btn btn-primary" data-toggle="modal" data-target=".modify-ing">수정하기</button>
        		<button class="btn btn-danger" id="ing-delete" onclick="deleteIngredient();">삭제하기</button>
        	</div>
        	
        	<div class="modal fade modify-ing" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 				<div class="modal-dialog modal-lg">    				
    				<div class="modal-content">
    					<div class="modal-header">
    						<h5 class="modal-title">재료 간단 검색</h5>
    						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         						<span aria-hidden="true">&times;</span>
        					</button>
    					</div>
    					<div class="modal-body">
    						재료수정 메뉴들
    					</div>
    					<div class="modal-footer">
    						버튼
    					</div>
    				</div>
 				 </div>
			</div>
        	
        	
        	<br /><br /><br />
        	<script>
        		function deleteIngredient(){
        			var iNumber = $('#iNumber').text();
        			
        			var c = confirm("선택하신 재료를 삭제하시겠습니까?");
					if(c == true){
						$.ajax({
	        				url:"${pageContext.request.contextPath}/admin/deleteIngredient.do",
	        				data:{
	        					iNumber : iNumber
	        				}, success: function(data){
	        					alert("삭제가 완료되었습니다");
	        					location.href="${pageContext.request.contextPath}/admin/goIng.do";
	        				}, error: function(data){
	        					alert("삭제에 실패했습니다 다시 시도해주세요");
	        				}
	        			})
					}else{
						alert("재료 삭제가 취소되었습니다!");
					}        			
        			
        		}
        	
        	</script>
        	
        	<script>
        	function clickIngName(){
        	$('.search-detail').children().on('click', function(){	
        		console.log('아이넘은 들어가니..'+$(this).text());
        		var iName = $(this).text();
        	//표 디자인이 완성되면 ajax로 연결시켜보자
        	$.ajax({
        		url: "${pageContext.request.contextPath}/admin/showIngSearchResult.do",
        		data:{
        			iName : iName
        		}, success: function(data){
        			console.log(data[0]);
        			        			
        			var html ='';
        			var keywordList ='';
        			var exdate = data[0].exDate;
        			if(exdate == 0){
        				exdate ="";
        			}
        			for(var i =0; i< data.length; i++){        				
        				keywordList += '#'+data[i].keyword+'&nbsp;';
        			}
        			
					html += '<div class="row">';   
					html += '<div class="col-lg-4">';
					html += '<img src="${pageContext.request.contextPath}/resources/img/ingredient/'+data[0].iImage+'" class="col-lg-12"/>';
        			html += '<br /><br>';        			
 					html += '</div>';       
 					html += '<div class="col-lg-8 no-padding" style="font-size: 130%;">';
 					html += '<div class="row col-lg-12 no-padding ing-info-firstLine">';
 					html += '<div class="col-lg-6">'+data[0].cName+'>'+data[0].subCName+'</div>';
 					html += '<div class="col-lg-6">유통기한 : <span>'+exdate+'</span>일</div>';
 					html += '</div>';
 					html += '<div class="col-lg-12 ing-info-secondLine">[<span id="iNumber">'+data[0].iNum+'</span>]&nbsp;'+data[0].iName+'</div>';
 					html += '<div class="col-lg-12 no-padding ing-info-thirdLine">';
 					html += '<div class="col-lg-12">관련키워드</div>';
 					html += '<div class="col-lg-12">'+keywordList+'</div>';
 					html += '</div></div></div>';
 					
 					$('.ingredient-information').empty();
        			$('.ingredient-information').append(html);  
        			
        		}, error: function(data){
        			console.log('조회실패.. ㅠㅠ');
        		}
        	});
        	});
        	}   
        	</script>
        	
        	
        	
        	       	
        </div>
    </div>
	
	
</body>
</html>