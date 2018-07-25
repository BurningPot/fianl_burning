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
	<!--스크롤바-->
	.scrollbar {
    margin-left: 30px;
    float: left;   
    width: 65px;
    background: #fff;
    overflow-y: scroll;
    margin-bottom: 25px;
}
.force-overflow {
    min-height: 450px;
}

.scrollbar-primary::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #4285F4; }


.scrollbar-default::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-default::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-default::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #2BBBAD; }

.scrollbar-secondary::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #F5F5F5;
  border-radius: 10px; }

.scrollbar-secondary::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5; }

.scrollbar-secondary::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
  background-color: #aa66cc; }
	<!--스크롤바-->
	.ingMenu-search{
		height: 209px; 		
	}
	.search-detail{
		overflow-y : auto;
		font-size: 120%;
		height: 209px; 
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
	.add-remove-Category{
		padding: 0.5%;
	}
	.add-remove-Category div:first-child{
		padding: 0.5%;
	}
	.adding-menu{
		border: 1px dashed black;
		padding: 1%;
		display: none;
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

<!-------------------------------------- 재료검색 부분--------------------------------------------------->     
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
        		<div class="col-lg-6 ing search-detail test no-padding scrollbar scrollbar-primary">
        				
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
        	
<!-------------------------------------- 재료검색 부분 END--------------------------------------------------->        	
        	
<!-------------------------------------- 재료정보 표시 부분--------------------------------------------------->        	
        	        	
        	<div class="col-lg-12" style="margin-bottom: 3%; margin-top:5%;font-size: 150%;">재료 정보</div>        	
        	<div class="col-lg-12 ingredient-information">        		
        	</div> 
        	
        	<hr class="col-lg-12"/>
        	        	
        	<div class="col-lg-12">
        		<button class="btn btn-success" id="ing-insert">재료/분류 추가하기</button>
        		<button class="btn btn-primary" id="ing-update">수정하기</button>
        		<button class="btn btn-danger" id="ing-delete" onclick="deleteIngredient();">삭제하기</button>
        	</div>   
        	        	
        	<script>   
        	//재료 추가하기 버튼을 누르면 하단에 숨겨져있던 추가/제거 기능 창을 보여준다
        	$('#ing-insert').click(function(){
        		$('.adding-menu').slideToggle("fast", function(){
        			$('html').animate({scrollTop: $('.adding-menu').offset().top}, 400);
        		});
        	})
        	
        	//재료이름을 클릭하면 하단에 재료의 모든 정보를 표시해주는 창을 생성시킨다
        	function clickIngName(){
        		$('.search-detail').children().on('click', function(){	
        		console.log('아이넘은 들어가니..'+$(this).text());
        		var iName = $(this).text();
        		//표 디자인이 완성되면 ajax로 연결시켜보자
        	$.ajax({
        		url: "${pageContext.request.contextPath}/admin/showIngSearchResult.do",
        		data:{
        			"iName" : iName
        		}, success: function(data){
        			console.log(data[0]);
        			        			
        			var html ='';
        			var keywordList ='';
        			if(data[0].keyword != ""){
        				for(var i =0; i< data.length; i++){        				
            				keywordList += "#"+data[i].keyword;
            			}
        			}        			
        			
        			var formData = $('<form id="fileForm" enctype="multipart/form-data" method="post">');
        			
					html += '<div class="row">';   
					html += '<div class="col-lg-4">';
					html += '<img src="${pageContext.request.contextPath}/resources/img/ingredient/'+data[0].iImage+'" class="col-lg-12" id="titleImg"/>';
        			html += '<br /><br /><div class="custom-file"><label class="custom-file-label text-justify" for="uploading" id="uploadingName">파일선택</label><input type="file" class="custom-file-input" id="uploading" name="upFile" onchange="LoadImg(this)"/></div>';        			
 					html += '</div>';       
 					html += '<div class="col-lg-8 no-padding" style="font-size: 130%;">';
 					html += '<div class="row col-lg-12 no-padding ing-info-firstLine">';
 					html += '<div class="col-lg-6">'+data[0].cName+'&nbsp;&gt&nbsp;'+data[0].subCName+'</div>';
 					html += '<div class="col-lg-6"><div class="row">유통기한 :&nbsp;<input type="text" class="form-control col-lg-3 ing-exdate" value="'+data[0].exDate+'"/>일</div></div>';
 					html += '</div>';
 					html += '<div class="col-lg-12 ing-info-secondLine">[<span id="iNumber">'+data[0].iNum+'</span>]&nbsp;<input type="text" class="col-lg-6 ing-iName" value="'+data[0].iName+'"/></div>';
 					html += '<div class="col-lg-12 no-padding ing-info-thirdLine">';
 					html += '<div class="col-lg-12">관련키워드</div>';
 					html += '<div class="col-lg-12"><input type="text" class="form-control col-lg-12 ing-keyword" value="'+keywordList+'"/><div class="col-lg-12">*키워드 입력시 띄어쓰기없이 #(재료명)으로 입력해주세요*</div></div>';
 					html += '</div></div></div>';
 					html += '<input type="hidden" value="'+data[0].iNum+'" name="iNum" id="h_iNum"/>';
 					html += '<input type="hidden" value="'+data[0].iImage+'" name="img" id="h_img"/>';
 					html += '<input type="hidden" value="'+data[0].exDate+'" name="exdate" id="h_exdate"/>';
 					html += '<input type="hidden" value="'+data[0].iName+'" name="iName" id="h_iName"/>';
 					html += '<input type="hidden" value="'+keywordList+'" name="keyword" id="h_keyword"/>';
 					html += '<input type="hidden" value="'+data[0].cName+'" name="cName"/>';
 					html += '<input type="hidden" value="'+data[0].subCName+'" name="subCName"/>';
 					
 					$(formData).append(html);
 					$('.ingredient-information').empty();
        			//$('.ingredient-information').append(html);          			        			
        			$('.ingredient-information').append(formData);
        			showImgName();
        			
        			updateIngInfo();
        			
        		}, error: function(data){
        			console.log('조회실패.. ㅠㅠ');
        		}
        	});
        	});
        	}
        	
        	//재료삭제버튼을 눌렀을 경우 해당창에 띄워진 재료를 삭제한다
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
        	
        	// 재료 정보 수정하기를 눌렀을 때 해당 창에 있는 정보대로 재료정보를 수정한다
        	function updateIngInfo(){
        		$('#ing-update').on('click', function(){  			
  					
  					$('#h_exdate').val($('.ing-exdate').val());
  					$("#h_iName").val($('.ing-iName').val());
  					$("#h_keyword").val($('.ing-keyword').val());
        			
        			$('#fileForm').attr('action', '${pageContext.request.contextPath}/admin/updateIngInfo.do').submit();
        		});        		
        	}        	
        	</script>
        
<!-------------------------------------- 재료정보 표시 부분 END--------------------------------------------------->           
        
<!-------------------------------------- 카테고리/ 추가삭제 부분--------------------------------------------------->        	
        	<br /><br /><br />
        	<div class="col-lg-12" style="margin-bottom: 3%; font-size: 150%;">재료 검색</div>    
        	<div class="col-lg-12 adding-menu">
        		<!-- 카테고리 추가 메뉴 -->
        		<div class="col-lg-12" style="margin-top:1%;">카테고리 추가/삭제</div>
        		<br />
        		<div class="row text-center add-remove-Category addCategory">
        			<div class="col-lg-2">추가하기</div>
        			<div class="col-lg-2">
        				<select class="custom-select">
        					<option selected>--큰분류--</option>
        					<c:forEach items="${distinctList}" var ="ing">
        						<option value="${ing.cName}">${ing.cName}</option>	
       						</c:forEach>        					
        				</select>
        			</div>
        			
        			<div class="col-lg-7"><input type="text" class="form-control" id="add-subCategory"/></div>
        			<div class="col-lg-1"><button class="btn btn-primary">추가</button></div> 
        		</div>
        		
        		<script>
        		//카테고리 추가하는 기능
        		$('.addCategory').children().find('button').on('click', function(){
        			var bigCategory = $('.addCategory').children().find('select').val();
            		var text = $('#add-subCategory').val();
            		console.log(bigCategory);
            		console.log(text);
        			
        			if(bigCategory == "" || bigCategory == null){
        				alert("카테고리를 선택후 추가해주세요");
        			}else if(text == "" || text == null){
        				alert('세부카테고리를 입력해주세요');
        			}else{
        				// 카테고리에 추가하기
        				$.ajax({
        					url: "${pageContext.request.contextPath}/admin/insertNewCategory.do",
        					data:{
        						bigCategory: bigCategory,
        						text: text
        					}, success: function(data){
        						if(data == -1){
        							alert("이미 존재하는 세부카테고리 이름입니다");
        							$('#add-subCategory').val("");
        						}else if(data == 0){
        							alert("카테고리 생성에 실패하였습니다");
        							$('#add-subCategory').val("");
        						}else{
        							alert(data+"개의 카테고리를 생성하였습니다!");
        							$('#add-subCategory').val("");
        							location.href="${pageContext.request.contextPath}/admin/goIng.do";
        						}
        					}, error: function(data){
        						alert("카테고리 생성에 실패하였습니다");
        						$('#add-subCategory').val("");
        					}
        				})
        			}
        		});        		
        		</script>       		
        		<br />
        		<!-- 카테고리 삭제메뉴 -->
        		<div class="row text-center add-remove-Category removeCategory">
        			<div class="col-lg-2">삭제하기</div>
        			<div class="col-lg-2">
        				<select class="custom-select">
        					<option selected value="null">--큰분류--</option>
        					<c:forEach items="${distinctList}" var ="ing">
        						<option value="${ing.cName}">${ing.cName}</option>	
       						</c:forEach>        					
        				</select>
        			</div>
        			<div class="col-lg-7">
        				<select class="custom-select">
        					<option selected value="null">--큰분류를 먼저 선택해주세요--</option>        				
        				</select>
        			</div>
        			<div class="col-lg-1"><button class="btn btn-primary">삭제</button></div> 
        		</div>
        		
        		<script>
        		//카테고리 삭제 기능 중 큰 분류를 선택했을때 세부 분류가 뜨게 하는 기능
        		$('.removeCategory').children().find('select').eq(0).change(function(){
        			//큰분류를 선택했을 경우! 이제 세부분류가 뜨게 해야한다
        			var cName = $(this).val();
        			var $select = $('.removeCategory').children().find('select').eq(1); //여기에 새로운 내용 append
        			console.log(cName);        				 
        			$.ajax({
        				url:"${pageContext.request.contextPath}/admin/selectBigCategory.do",
						data:{
							bCategory: cName
						}, success: function(data){
							var html = "";
							for(var i = 0 ; i< data.length; i++){
								html += '<option value="'+data[i].subCName+'">'+data[i].subCName+'</option>';
							}				
							
							if(cName == "null"){
								$select.empty();
								$select.append('<option selected value="null">--큰분류를 먼저 선택해주세요--</option>');
							}else{
								$select.empty();
								$select.append(html);									
							}
							//삭제버튼을 누르면 카테고리를 삭제하는 기능을 버튼에 준다
							deleteBtnForCategory();
							
							
						}, error: function(){
							alert("재료카테고리 불러오기에 실패했습니다"); 
						}
        			})						
        		});
				
        		//삭제버튼을 누를경우 카테고리 정보가 삭제되게 한다  	
        		function deleteBtnForCategory(){
        			$('.removeCategory').children().find('button').on('click', function(){
        				//삭제버튼을 누르면 카테고리 정보를 삭제해야지!
        				var inputCName = $('.removeCategory').children().find('select').eq(0).val();
        				var inputSubCName = $('.removeCategory').children().find('select').eq(1).val();
        				if(inputCName == "null"){
        					alert("큰분류를 먼저 선택해주세요");
        				}else if(inputSubCName == "null"){
        					alert("세부분류를 선택해주세요");
        				}else{
        					//삭제를 진행한다
        					$.ajax({
        						url: "${pageContext.request.contextPath}/admin/deleteCategory.do",
        						data:{
        							cName: inputCName,
        							subCName: inputSubCName
        						}, success: function(data){
        							alert(data+"개의 카테고리가 삭제되었습니다");
        							location.href="${pageContext.request.contextPath}/admin/goIng.do";
        						}, error: function(data){
        							alert("카테고리를 삭제하는데 실패하였습니다");
        						}
        					});
        				}
        				
        			});
        		}
        		</script>
<!-------------------------------------- 카테고리/ 추가삭제 부분 END--------------------------------------------------->        		

<!-------------------------------------- 재료/ 추가기능 부분 --------------------------------------------------->
        		
        		<div class="col-lg-12" style="margin-top:3%;">재료 추가하기</div>
        		<br />
        		<!-- 재료를 추가하는 메뉴 -->
        		<div class="col-lg-12 test">
        			<form method="post" encType="multipart/form-data" id="addIngForm">
        			<div class="row">
        				<div class="col-lg-4 test no-padding uploadImgBox">
        					<div class="col-lg-12 test" style="background: lightgray; height:100%; font-size:120%; padding:20%;">사진업로드</div>
        					<!-- 이미지가 들어오면 회색화면은 remove하고 사진을 append할거다 -->
        					<img src="" alt="" id="add-img" class="col-lg-12" style="height: 214.8px; position:relative"/>        					
        				</div>
        				<input type="file" id="addForUpload" multiple="multiple" name="addForUpload" onchange="loadImg(this)"/>
        				       				
        				<div class="col-lg-8 test" style="padding: 2%;">
        					<div class="row">
        						<div class="col-lg-2" style="padding:1%;">큰분류</div>
        						<div class="col-lg-4">
        						<select class="custom-select" id="add-ing-bigCategory" name="bigCategory">        						
        							<option class="selected" value="">분류를 선택해주세요</option> 
        							<c:forEach items="${distinctList}" var ="ing">
        								<option value="${ing.cName}">${ing.cName}</option>	
       								</c:forEach> 
        						</select>
        						</div>
        						<div class="col-lg-2" style="padding:1%;">세부분류</div>
        						<div class="col-lg-4">
        						<select class="custom-select" id="add-ing-subCategory" name="subCategory">        						
        							<option class="selected">큰분류를 선택해주세요</option>       								
        						</select>
        						</div>        						
        					</div>
        					<br />
        					<div class="row">
        						<div class="col-lg-2" style="padding:1%;">재료이름</div>
        						<div class="col-lg-6"><input type="text" class="form-control" name="ingName"/></div>
        						<div class="col-lg-2" style="padding:1%;">유통기한</div>
        						<div class="col-lg-2"><input type="text" class="form-control" placeholder="일단위" name="exdate"/></div>
        					</div>
        					<br />
        					<div class="col-lg-12">
        						<button class="btn btn-primary" onclick="addIngredient()">재료추가하기</button>
        					</div>
        				</div>        				
        			</div>
        			</form>
        		</div>
        	</div>
        	<br></br>
        	<script>
        	//재료 추가하기 버튼을 누를경우 컨트롤러 실행시킨다
        	function addIngredient(){
        		$('#addIngForm').attr("action", "${pageContext.request.contextPath}/admin/insertNewIngredient.do").submit();        		
        	}
        	
        	// 처음 창이 떴을 때 input:file은 보이지 않게 숨겨주는 기능
        	// 회색 div를 누르면 input:file이 실행되도록 하는 기능
			$(function(){
				$('#addForUpload').hide();
				$('#add-img').hide();
				$('.uploadImgBox').click(function(){
					$('#addForUpload').click();
				});
			})
			
        	//이미지 업로드 하기를 누르고 사진을 선택했을 때 사진을 미리 보여주기 하는 부분
			function loadImg(value) {
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('.uploadImgBox').children('div').remove();							
						$("#add-img").attr("src", e.target.result);	
						$('#add-img').show();
					}
					reader.readAsDataURL(value.files[0]);					
				} 
			}
			
        	//재료추가하기 부분에서 큰분류를 선택했을 경우 세부분류가 자동으로 생성되도록 하는 기능
			$('#add-ing-bigCategory').change(function(){
				var cName = $(this).val();
				if(cName == "" || cName == null){
					$('#add-ing-subCategory').empty();
					$('#add-ing-subCategory').append('<option class="selected">큰분류를 선택해주세요</option>');
				}else{
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/selectBigCategory.do",
						data:{
							bCategory: cName
						}, success: function(data){
							var html = "";
							for(var i = 0 ; i< data.length; i++){
								html += '<option value="'+data[i].subCName+'">'+data[i].subCName+'</option>';
							}        										
							$('#add-ing-subCategory').empty();
							$('#add-ing-subCategory').append(html);
						}, error: function(){
							alert("재료카테고리 불러오기에 실패했습니다"); 
						}
					});
				}
			});      	
        	        	
        	        	          	
        	function showImgName(){
        	//파일의 이름불러오는 방법은..?
        		$('#uploading').change(function(){
					var fileName = $(this).prop('files')[0].name;					
					$('#uploadingName').text(fileName);					
        			console.log(fileName);
				})	
        	} 
        	
        	function LoadImg(value) {        		
        		//이미지 업로드 하기를 누르고 사진을 선택했을 때 사진을 미리 보여주기 하는 부분
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#titleImg").attr("src", e.target.result);						
					}
					reader.readAsDataURL(value.files[0]);
				} 
			}
        	</script>
        	
        	
        </div>
    </div>
	
	
</body>
</html>