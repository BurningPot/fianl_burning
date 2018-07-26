<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<!-- 야매로 공간할당을 주어 처리한 부분 -->
	<div style="height: 15%;"></div>
	<div id="fakeLoader"></div>
	<div class="b-seg" id="b-seg">
		<div class="searchResultAndsearchBtn">
			<div class="searchRecipeCountArea">
				<%-- <b>"${list.size()}"</b>으로 검색한 결과 입니다.<br> --%>
				총 <b>${list.size()}</b>개의 맛있는 레시피가 있습니다.
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
			<c:forEach items="${list}" var="recipe">
				<li>
   					<div class='like_and_aver_area'>
   						<div class='like_btn_area'>
   							<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>
   								<i class='far fa-thumbs-up'></i>
   							</button>
   						</div>
   						<div class='aver_btn_area'>
   							<h5></h5>
   						</div>
   					</div>
   					<div class='recipe_img_area'>
   					<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/1.jpg'>
   						<div class='img_hover_area'>${recipe.rName}</div> 
   					</div>
   					<div class='recipe_levle_and_time_and_writer_area'>
   						<div class='recipe_level'>
   							<c:if test="${4 eq recipe.rLevel}">
   								고급
   							</c:if>
   							<c:if test="${3 eq recipe.rLevel}">
   								중급
   							</c:if>
   							<c:if test="${2 eq recipe.rLevel}">
   								초급
   							</c:if>
   							<c:if test="${1 eq recipe.rLevel}">
   								아무나
   							</c:if>
   						</div>
   						<div class='recipe_time'>
   							<c:if test="${1 eq recipe.rTime}">
   								10분 이내
   							</c:if>
   							<c:if test="${2 eq recipe.rTime}">
   								20분 이내
   							</c:if>
   							<c:if test="${3 eq recipe.rTime}">
   								30분 이내
   							</c:if>
   							<c:if test="${4 eq recipe.rTime}">
   								60분 이내
   							</c:if>
   							<c:if test="${5 eq recipe.rTime}">
   								60분 이상
   							</c:if>
   						</div>
   						<div class='recipe_quantity'>
   							<c:if test="${1 eq recipe.quantity}">
   								1인분
   							</c:if>
   							<c:if test="${2 eq recipe.quantity}">
   								2인분
   							</c:if>
   							<c:if test="${3 eq recipe.quantity}">
   								3인분
   							</c:if>
   							<c:if test="${4 eq recipe.quantity}">
   								4인분
   							</c:if>
   							<c:if test="${5 eq recipe.quantity}">
   								5인분
   							</c:if>
   							<c:if test="${6 eq recipe.quantity}">
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
		$(document).mouseup(function(e){
		    var container = $('.menuContainer');
		    if(!container.is(e.target) && container.has(e.target).length === 0)
		    container.hide();
		});
		$(window).bind("scroll", infinityScrollFunction);
		
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
            	console.log("끝");
            	
            var str1 = "★채우는 공간";   
            var str2 = "Recipe !";
            
            $.ajax({
               	url : "recipeObject.do",
               	type : "GET",
               	dataType : "json",
               	data:{
               		number: count
               	},success: function(data){
               		console.log("count는?: "+count);
               		count += 9;
               		console.log("성공?");
               		var level = "";
               		for (var i = 0; i < data.length; i++) {
               
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
                						"<h5>" + "</h5>"+
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
               	},
                 error: function(data){
                 	console.log("아직실패");
                 }           	 
		})
		}
        }
		
        /* $(function loadRecipe() {
        	
            var str1 = "★채우는 공간";   
            var str2 = "Recipe !";
           
             $.ajax({
            	url : "recipeObject.do",
            	type : "GET",
            	dataType : "json",
            	data:{
            		number: count
            	},
            	success : function(data){
           		 	var level = "";
            		for (var i = 0; i < data.length; i++) {
                       
        				console.log("count : " + count);
            			if(data[i].rLevel == 0){
            				level="하";
                		} else if(data[i].rLevel == 1){
                			level="중";
                		} else if(data[i].rLevel == 2) {
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
            						"<div class='recipe_quantity'>" + data[i].quantity + "인분" + "</div>" +
            					"</div>" +
            				"</li>").appendTo("ul");
        					        				   	
                                $(window).bind("scroll", infinityScrollFunction);
                             
                    }
            		count = count+8;
            	},error : function(){
            		alert('에러');
            	}
            }); 
            
            function infinityScrollFunction() {
				
                //현재문서의 높이를 구함.
                var documentHeight = $(document).height();
                console.log("documentHeight : " + documentHeight);

                //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
                //스크롤바가 맨 위쪽에 있을때 , 위치는 0
                console.log("window의 scrollTop() : " + $(window).scrollTop());
                //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
                console.log("window의 height() : " + $(window).height());

                //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
                //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
                var scrollHeight = $(window).scrollTop() + $(window).height();
                console.log("scrollHeight : " + scrollHeight);

                if (scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
                	/* 
                	var level = "";
            		for (var i = 0; i < data.length; i++) {
                        // count = i+1;
        				// console.log("count : " + count);
            			if(data[i].rLevel == 0){
            				level="하";
                		} else if(data[i].rLevel == 1){
                			level="중";
                		} else if(data[i].rLevel == 2) {
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
            					"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath}/resources/img/"+ 2 +".jpg'>" +
            						"<div class='img_hover_area'>" + data[i].rName + "</div>" +
            					"</div>" +
            					"<div class='recipe_levle_and_time_and_writer_area'>" +
            						"<div class='recipe_level'>" + level + "</div>" +
            						"<div class='recipe_time'>" + data[i].rTime + "분" + "</div>" +
            						"<div class='recipe_quantity'>" + data[i].quantity + "인분" + "</div>" +
            					"</div>" +
            				"</li>").appendTo("ul");
                    } //
            		loadRecipe();
                }
            }//function infinityScrollFunction()
            

        }); */

        function heartClicked(obj) {
            	 <%-- <%if(m != null){ %> --%>
                 <%-- var mId = '<%=m.getUser_id()%>'; --%>
            //     var id = $(obj).children().attr('id');
            //     console.log($(obj).children().attr('id'));
            //     console.log($(obj).children().get());	
            //     console.log(id.indexOf('R'));
            if ($(obj).children().hasClass('far fa-thumbs-up')) {
                $(obj).children().removeClass('far fa-thumbs-up').addClass('fas fa-thumbs-up');
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
                <%--  <%}else %> alert('로그인 한 뒤 사용하세요'); --%>
            }
            else if ($(obj).children().hasClass('fas fa-thumbs-up')) {
                $(obj).children().removeClass('fas fa-thumbs-up').addClass('far fa-thumbs-up');
            }
        }
        
       
    </script>
<%-- $("<li>" + "<a class='recipe_a' href='#'>" +
               		"<div class='recipe_img_area'>" +
	                    "<div class='like_and_aver_area'>" +
		               		"<div class='like_btn_area'>" +
		                		"<button onfocus=this.blur() type='button' class='like_btn' onclick='heartClicked(this);'>" +
		                			"<i class='far fa-thumbs-up'></i>" +
		                		"</button>" +
		               		"</div>" +
		                    "<div class='aver_btn_area'>" + 
		                    	"<h5>" + str2 + "</h5>"+
		                    "</div> " +
	                	"</div>" +
                    	"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath }/resources/img/"+ i +".jpg'>" +
                    "</div>" +
                    "<div class='recipe_title_area'>" +
                    	"<h5>" + "<span class='recipe_title'>" + str1 + "</span> " + "</h5>" +
               	   	"</div>" + "</a>" +
                  "</li>").appendTo("ul"); --%>

</body>
</html>