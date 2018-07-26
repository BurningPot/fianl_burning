<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<style>
			.searchBtnUl{
				width: 100%;
				height:100%;
				list-style: none;
				float: left;
			    padding-top: 15%;
    			padding-left: 12%;
			}
			.searchBtnUl li {
				width: 15%; 
				height:100%; 
				float: left; 
				margin: 0;
			    margin-left: 1%;
				text-align: center;
				
			}
			/* 
				a:link = 방문 전 링크 상태 
				a:visited = 방문 후 링크 상태
				a:hover = 마우스 오버했을 때 링크 상태
				a:active = 클릭했을 때 링크 상태
			*/
			
			/* 1번 조회수가 많은 순서대로의 버튼 및 버튼 호버 */
			.searchBtnA1{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #c3e6cb;
				border: none;
				
			}
			
			.searchBtnUl > li:hover .searchBtnA1 {
				background : #FFB2F5;
			}
			.searchBtnA2{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #bee5eb;
				border: none;
			}
			.searchBtnA3{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #ffeeba;
				border: none;
			}
			
			
			 /* 이렇게 줄 경우 전체에 영향을 줌 */
			/*
			a:link {text-decoration: none; color: #333333;}
			a:visited {text-decoration: none; color: #333333;}
			a:active {text-decoration: none; color: #333333;}
			a:hover {text-decoration: none; color: #333333;} */
			
			/* .searchBtnA searchBtnA:link {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:visited {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:hover {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:active {
				text-decoration: none; color: #333333;
			} */
			
			 
			
		</style>
	</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div style="height: 15%;"></div>
	<div id="fakeLoader"></div>
	<div class="b-seg" id="b-seg">
		<div class="searchResultAndsearchBtn">
			<div class="searchRecipeCountArea">
				<b>"${searchRecipeWord}"</b>으로 검색한 결과 입니다.<br>
				총 <b>${searchTotalCount}</b>개의 맛있는 레시피가 있습니다.
			</div>
			<div class="searchBtn">
				<ul class="searchBtnUl">
		          <li><button type="button" class="searchBtnA1" onclick="inquiry();">조회</button></li>
			          <li><button type="button" class="searchBtnA2" onclick="recommand();">추천</button></li>
			          <li><button type="button" class="searchBtnA3" onclick="cookLevel();">난이도</button></li>
		        </ul>
			</div>
		</div>
		<ul class="recipeList">
			<c:forEach items="${searchRecipeList}" var="searchRecipe">
				<li>
					<div class='like_and_aver_area'>
						<div class='like_btn_area'>
							<button onfocus=this.blur() type='button' class='like_btn'
								onclick='heartClicked(this);'>
								<i class='far fa-thumbs-up'></i>
							</button>
						</div>
						<div class='aver_btn_area'>
							<h5></h5>
						</div>
					</div>
					<div class='recipe_img_area'>
						<img class='food_img img-thumbnail'
							src='${pageContext.request.contextPath}/resources/img/1.jpg'>
						<div class='img_hover_area'>${searchRecipe.rName}</div>
					</div>
					<div class='recipe_levle_and_time_and_writer_area'>
						<div class='recipe_level'>
							<c:if test="${4 eq searchRecipe.rLevel}">
   								최상
   							</c:if>
   							<c:if test="${3 eq searchRecipe.rLevel}">
   								상
   							</c:if>
   							<c:if test="${2 eq searchRecipe.rLevel}">
   								중
   							</c:if>
   							<c:if test="${1 eq searchRecipe.rLevel}">
   								하
   							</c:if>
						</div>
						<div class='recipe_time'>
	   							<c:if test="${1 eq searchRecipe.rTime}">
	   								10분 이내
	   							</c:if>
	   							<c:if test="${2 eq searchRecipe.rTime}">
	   								20분 이내
	   							</c:if>
	   							<c:if test="${3 eq searchRecipe.rTime}">
	   								30분 이내
	   							</c:if>
	   							<c:if test="${4 eq searchRecipe.rTime}">
	   								60분 이내
	   							</c:if>
	   							<c:if test="${5 eq searchRecipe.rTime}">
	   								60분 이상
	   							</c:if>
	   						</div>
	   						<div class='recipe_quantity'>
	   							<c:if test="${1 eq searchRecipe.quantity}">
	   								1인분
	   							</c:if>
	   							<c:if test="${2 eq searchRecipe.quantity}">
	   								2인분
	   							</c:if>
	   							<c:if test="${3 eq searchRecipe.quantity}">
	   								3인분
	   							</c:if>
	   							<c:if test="${4 eq searchRecipe.quantity}">
	   								4인분
	   							</c:if>
	   							<c:if test="${5 eq searchRecipe.quantity}">
	   								5인분
	   							</c:if>
	   							<c:if test="${6 eq searchRecipe.quantity}">
	   								5인분 이상
	   							</c:if>
	   						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

	<script>
		var count = 9;
		var keyWord = '${searchRecipeWord}';
		var num = '${searchTotalCount}';
		console.log("keyWord : " + keyWord);
		console.log("totalCount : " + num);
		$(document).mouseup(function(e){
		    var container = $('.menuContainer');
		    if(!container.is(e.target) && container.has(e.target).length === 0){
		    	container.hide();
		    }
		});
		$(window).bind("scroll", infinityScrollFunction); // 하나만 있어도 스크롤 관련된 부분이 다 처리됨
		
		function infinityScrollFunction(){
			
			
			//현재문서의 높이를 구함.
            var documentHeight = $(document).height();
            //console.log("documentHeight : " + documentHeight);

            //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
            //스크롤바가 맨 위쪽에 있을때 , 위치는 0
            //console.log("window의 scrollTop() : " + $(window).scrollTop());
            //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
            //console.log("window의 height() : " + $(window).height());

            //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
            //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
            var scrollHeight = $(window).scrollTop() + $(window).height();
            //console.log("scrollHeight : " + scrollHeight);
            
            
            
            if (scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
            	console.log("끝?");
            	 var str1 = "★채우는 공간";   
                 var str2 = "Recipe !";
	            $.ajax({
	            	url : "${pageContext.request.contextPath}/home/searchRecipeObject.do",
	            	type : "GET",
	            	data : {
	            		number : count,
	            		keyWord : keyWord
	            	},success: function(data){
	               		console.log("count는?: "+count);
	               		count += 9;
	               		console.log("성공?");
	               		var level = "";
	            		for(var i = 0; i < data.length; i++){
	            			console.log("count : " + count);
	            			if(data[i].rLevel == 1){
	                			level="아무나";
	                		} else if(data[i].rLevel == 2){
	                			level="초급";
	                		} else if(data[i].rLevel == 3) {
	                			level="중급";
	                		} else {
	                			level="고급";
	                		}
	            			if(data[i].rTime == 1){
	            				rTime="10분 이내";
	                		} else if(data[i].rTime == 2){
	                			rTime="20분 이내";
	                		} else if(data[i].rTime == 3) {
	                			rTime="30분 이내";
	                		} else if(data[i].rTime == 4) {
	                			rTime="60분 이내";
	                		} else {
	                			rTime="60분 이상";
	                		}
	            			if(data[i].quantity == 1){
	            				quantity = "1인분";
	                		} else if(data[i].quantity == 2){
	                			quantity = "2인분";
	                		} else if(data[i].quantity == 3) {
	                			quantity = "3인분";
	                		} else if(data[i].quantity == 4) {
	                			quantity = "4인분";
	                		} else if(data[i].quantity == 5) {
	                			quantity = "5인분";
	                		} else {
	                			quantity = "5인분 이상";
	                		}
	            			$("<li>" + 
	               				"<div class='like_and_aver_area'>" +
	               					"<div class='like_btn_area'>" +
	               						"<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>" +
	               							"<i class='far fa-thumbs-up'></i>" +
	               						"</button>" +
	               					"</div>" + 
	               					"<div class='aver_btn_area'>" + 
	               						"<h5>" + str1 + "</h5>"+
	               					"</div> " +
	               				"</div>" + 
	               				"<div class='recipe_img_area'>" +
	               				"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/"+ 1 +".jpg'>" +
	               					"<div class='img_hover_area'>" + data[i].rName + "</div>" +
	               				"</div>" +
	               				"<div class='recipe_levle_and_time_and_writer_area'>" +
	               					"<div class='recipe_level'>" + level + "</div>" +
	               					"<div class='recipe_time'>" + data[i].rTime + "분" + "</div>" +
	               					"<div class='recipe_writer'>" + data[i].quantity + "인분" + "</div>" +
	               				"</div>" +
	               			"</li>").appendTo(".recipeList");
		            		}
	            		
	            	}, error : function(data){
	            		console.log("검색 후 레시피 불러오기를 실패하였습니다.");
	            	}
	            });       
			}
        }
		
		function inquiry(){
			count = 9;
			var keyWord = '${searchRecipeWord}';
			var str1 = "★채우는 공간";   
            var str2 = "Recipe !";
			console.log("keyWord : " + keyWord);
			$.ajax({
				url : "${pageContext.request.contextPath}/home/inquiryBefore.do",
				dataType : "json",
				type : "GET",
				data : {
					keyWord : keyWord
				}, success : function(data){
					console.log("조회순서로 정렬 성공!");
					var level = "";
					// 기존 scroll이벤트 제거
					$(window).unbind("scroll");
					$(".recipeList").empty();
					
            		for(var i = 0; i < data.length; i++){
            			console.log("count : " + count);
            			if(data[i].rLevel == 1){
                			level="하";
                		} else if(data[i].rLevel == 2){
                			level="중";
                		} else if(data[i].rLevel == 3) {
                			level="상";
                		} else {
                			level="최상";
                		}
					$("<li>" + 
          				"<div class='like_and_aver_area'>" +
          					"<div class='like_btn_area'>" +
          						"<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>" +
          							"<i class='far fa-thumbs-up'></i>" +
          						"</button>" +
          					"</div>" + 
          					"<div class='aver_btn_area'>" + 
          						"<h5>" + str1 + "</h5>"+
          					"</div> " +
          				"</div>" + 
          				"<div class='recipe_img_area'>" +
          				"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/"+ 1 +".jpg'>" +
          					"<div class='img_hover_area'>" + data[i].rName + "</div>" +
          				"</div>" +
          				"<div class='recipe_levle_and_time_and_writer_area'>" +
          					"<div class='recipe_level'>" + level + "</div>" +
          					"<div class='recipe_time'>" + data[i].rTime + "분" + "</div>" +
          					"<div class='recipe_writer'>" + data[i].quantity + "인분" + "</div>" +
          				"</div>" +
          			"</li>").appendTo(".recipeList");
            		}
            		//$(document).mouseup(function(e){
            		    //var container = $('.menuContainer');
            		   // if(!container.is(e.target) && container.has(e.target).length === 0){
            		    //	container.hide();
            		   // }
            		//}); 

            		$(window).bind("scroll", inquiryInfinityScrollFunction);
            		
				}, error : function(data){
					console.log("조회 순서로 정렬 실패!");
				}
			});
		}
		
		function inquiryInfinityScrollFunction(){
			//var endCount = ${inquiryEndCount};
			//console.log("endCount : " + endCount);
			//if(endCount <= num){
			//현재문서의 높이를 구함.
            var documentHeight = $(document).height();
            //console.log("documentHeight : " + documentHeight);

            //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
            //스크롤바가 맨 위쪽에 있을때 , 위치는 0
            //console.log("window의 scrollTop() : " + $(window).scrollTop());
            //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
            //console.log("window의 height() : " + $(window).height());

            //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
            //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
            var scrollHeight = $(window).scrollTop() + $(window).height();
            //console.log("scrollHeight : " + scrollHeight);
            
            
          
            if (scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
            	 var str1 = "★채우는 공간";   
                 var str2 = "Recipe !";
                 
                $.ajax({
	            	url : "${pageContext.request.contextPath}/home/inquiryAfter.do",
	            	dataType : "json",
	            	type : "GET",
	            	data : {
	            		number : count,
	            		keyWord : keyWord
	            	},success: function(data){
	               		count += 9;
	               		
	               		console.log("레시피 정렬 마우스 밑으로 내려가면 성공");
	               		console.log("정렬 후 count : " + count)
	               		var level = "";
	               		$(".recipeList").remove("li");
	            		for(var i = 0; i < data.length; i++){
	            			
	            			if(data[i].rLevel == 1){
	                			level="하";
	                		} else if(data[i].rLevel == 2){
	                			level="중";
	                		} else if(data[i].rLevel == 3) {
	                			level="상";
	                		} else {
	                			level="최상";
	                		}
						$("<li>" + 
	          				"<div class='like_and_aver_area'>" +
	          					"<div class='like_btn_area'>" +
	          						"<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>" +
	          							"<i class='far fa-thumbs-up'></i>" +
	          						"</button>" +
	          					"</div>" + 
	          					"<div class='aver_btn_area'>" + 
	          						"<h5>" + str1 + "</h5>"+
	          					"</div> " +
	          				"</div>" + 
	          				"<div class='recipe_img_area'>" +
	          				"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/"+ 1 +".jpg'>" +
	          					"<div class='img_hover_area'>" + data[i].rName + "</div>" +
	          				"</div>" +
	          				"<div class='recipe_levle_and_time_and_writer_area'>" +
	          					"<div class='recipe_level'>" + level + "</div>" +
	          					"<div class='recipe_time'>" + rTime + "</div>" +
	          					"<div class='recipe_quantity'>" + quantity + "</div>" +
	          				"</div>" +
	          			"</li>").appendTo(".recipeList");
	            		}
	            		
	            		 /* Top 버튼 */
	           		   $(document).ready(function () {
	           				$(window).scroll(function () {
	           					var _scrollTop = $(this).scrollTop(),
	           						$gotopBtn = $('.top_btn');
	           					if (_scrollTop > 10) { $gotopBtn.fadeIn(); }
	           					else { $gotopBtn.fadeOut(); }
	           				})
	           				$('.click').bind("click", function () {
	           					/* $('.click').css('text-decoration', 'none'); */
	           					$('html, body').animate({
	           						"scrollTop": 0
	           					}, 300);
	           				});
	           			});
	            		
	            		$(window).bind("scroll", inquiryInfinityScrollFunction);
	            		
					}, error : function(data){
						console.log("조회 순서로 정렬 실패!");
					}
				});
			}
			
			function inquiryInfinityScrollFunction(){
				
				//현재문서의 높이를 구함.
	            var documentHeight = $(document).height();
	            //console.log("documentHeight : " + documentHeight);
	
	            //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
	            //스크롤바가 맨 위쪽에 있을때 , 위치는 0
	            //console.log("window의 scrollTop() : " + $(window).scrollTop());
	            //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
	            //console.log("window의 height() : " + $(window).height());
	
	            //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
	            //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
	            var scrollHeight = $(window).scrollTop() + $(window).height();
	            //console.log("scrollHeight : " + scrollHeight);
	            
	           
	          
	            if (scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
	           		var str1 = "★채우는 공간";   
	                var str2 = "Recipe !";
	                
	                $.ajax({
		            	url : "${pageContext.request.contextPath}/home/inquiryAfter.do",
		            	dataType : "json",
		            	type : "GET",
		            	data : {
		            		number : count,
		            		keyWord : keyWord
		            	},success: function(data){
		               		count += 9;
		               		
		               		//$("<div class='top_btn'>" + "<a href='#' class='click'>" + "Top" + "</a>" + "</div>").after(".menuContainer");
		               		
		               		console.log("레시피 정렬 마우스 밑으로 내려가면 성공");
		               		console.log("정렬 후 count : " + count)
		               		var level = "";
		               		// $(".recipeList").remove("li");
		               		
		            		for(var i = 0; i < data.length; i++){
		            			
		            			if(data[i].rLevel == 1){
		                			level="아무나";
		                		} else if(data[i].rLevel == 2){
		                			level="초급";
		                		} else if(data[i].rLevel == 3) {
		                			level="중급";
		                		} else {
		                			level="고급";
		                		}
		            			if(data[i].rTime == 1){
		            				rTime="10분 이내";
		                		} else if(data[i].rTime == 2){
		                			rTime="20분 이내";
		                		} else if(data[i].rTime == 3) {
		                			rTime="30분 이내";
		                		} else if(data[i].rTime == 4) {
		                			rTime="60분 이내";
		                		} else {
		                			rTime="60분 이상";
		                		}
		            			if(data[i].quantity == 1){
		            				quantity = "1인분";
		                		} else if(data[i].quantity == 2){
		                			quantity = "2인분";
		                		} else if(data[i].quantity == 3) {
		                			quantity = "3인분";
		                		} else if(data[i].quantity == 4) {
		                			quantity = "4인분";
		                		} else if(data[i].quantity == 5) {
		                			quantity = "5인분";
		                		} else {
		                			quantity = "5인분 이상";
		                		}
		            			$("<li>" + 
		               				"<div class='like_and_aver_area'>" +
		               					"<div class='like_btn_area'>" +
		               						"<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>" +
		               							"<i class='far fa-thumbs-up'></i>" +
		               						"</button>" +
		               					"</div>" + 
		               					"<div class='aver_btn_area'>" + 
		               						"<h5>" + str1 + "</h5>"+
		               					"</div> " +
		               				"</div>" + 
		               				"<div class='recipe_img_area'>" +
		               				"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/"+ 1 +".jpg'>" +
		               					"<div class='img_hover_area'>" + data[i].rName + "</div>" +
		               				"</div>" +
		               				"<div class='recipe_levle_and_time_and_writer_area'>" +
		               					"<div class='recipe_level'>" + level + "</div>" +
		               					"<div class='recipe_time'>" + rTime + "</div>" +
		               					"<div class='recipe_quantity'>" + quantity + "</div>" +
		               				"</div>" +
		               			"</li>").appendTo(".recipeList");
		            		}
		            		
		            		//$(".searchBtnA1").click(function(){
		            			//$("<div class='top_btn'>" + "<a href='#' class='click'>" + "Top" + "</a>" + "</div>").after(".b-seg");
		            		//});
		            		
		            		
		            	}, error : function(data){
		            		console.log("정렬 후 레시피 불러오기를 실패하였습니다.");
		            	}
		            });       
				}
				
	        }
			
	        function heartClicked(obj) {
	            	
	            //     var id = $(obj).children().attr('id');
	            //     console.log($(obj).children().attr('id'));
	            //     console.log($(obj).children().get());	
	            //     console.log(id.indexOf('R'));
	            if ($(obj).children().hasClass('far fa-thumbs-up')) {
	                $(obj).children().removeClass('far fa-thumbs-up').addClass('fas fa-thumbs-up');
	            }
	                // if(id.indexOf('R') != -1)	{
	                //     $.ajax({
	                <%-- //         url:"<%=request.getContextPath()%>/likerooms.it", --%>
	                //         type:"get",
	                //         data : {
	                //             rId : id,
	                //             mId : mId
	                //         },
	                //         success:function(data){
	                //             alert(data+'님 숙소찜목록에 성공적으로 추가했습니다');		    						
	                //         }
	                // });
	                // }else{
	                //     $.ajax({
	                <%-- //         url:"<%=request.getContextPath()%>/liketrips.it", --%>
	                //         type:"get",
	                //         data : {
	                //             tId : id,
	                //             mId : mId
	                //         },
	                //         success:function(data){
	                //             alert(data+'님 트립찜목록에 성공적으로 추가했습니다');		    						
	                //         }
	                //     });
	                // }
	
	                // }else{
	                //     $(obj).children().removeClass('glyphicon-heart').addClass('glyphicon-heart-empty');
	                //     if(id.indexOf('R') != -1)	{
	                //         $.ajax({
	                <%-- //             url:"<%=request.getContextPath()%>/likerooms.del", --%>
	                //             type:"get",
	                //             data : {
	                //                 rId : id,
	                //                 mId : mId
	                //             },
	                //             success:function(data){
	                //                 alert(data+'님 숙소찜목록에서 성공적으로 삭제했습니다');		    						
	                //             }
	                //         });
	                // }else{
	                //     $.ajax({
	                <%-- //         url:"<%=request.getContextPath()%>/liketrips.del", --%>
	                //         type:"get",
	                //         data : {
	                //             tId : id,
	                //             mId : mId
	                //         },
	                //         success:function(data){
	                //             alert(data+'님 트립찜목록에 성공적으로 삭제했습니다');		    						
	                //         }
	                //     });
	                // }
	                // }
	              
		            else if ($(obj).children().hasClass('fas fa-thumbs-up')) {
		                $(obj).children().removeClass('fas fa-thumbs-up').addClass('far fa-thumbs-up');
		            }
			}
	        }
	    </script>
	</body>
</html>