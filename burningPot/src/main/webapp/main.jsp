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
		<ul class="recipeList">

		</ul>
		
	</div>

	<script>

		$(document).mouseup(function(e){
		    var container = $('.menuContainer');
		    if(!container.is(e.target) && container.has(e.target).length === 0)
		    container.hide();
		});
        $(function () {
        	
            var count = 1;

            var str1 = "★채우는 공간";   
            var str2 = "Recipe !";

            //$(window).scroll(function() { });
            //문서가 로드되면 20 row 생성 그리고 생성이 완료되면 scroll 이벤트 바인딩
            for (var i = 1; i <= 8; i++) {
                count = i;
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
						"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath }/resources/img/"+ i +".jpg'>" +
						"<div class='img_hover_area'>"+ str2 +"</div>" +
					"</div>" +
					"<div class='recipe_levle_and_time_and_writer_area'>" +
						"<div class='recipe_level'>" + "</div>" +
						"<div class='recipe_time'>" + "</div>" +
						"<div class='recipe_writer'>" + "</div>" +
					"</div>" + 
				"</li>").appendTo("ul");
                if (count == 8) {
                    $(window).bind("scroll", infinityScrollFunction);
                    
                }
            }
            
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
                	
                	for (var i = 1; i < 9; i++) {
                    	count++;
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
            						"<img class='food_img img-thumbnail' src='${pageContext.request.contextPath }/resources/img/"+ i +".jpg'>" +
            						"<div class='img_hover_area'>"+ str2 +"</div>" +
            					"</div>" +
            					"<div class='recipe_levle_and_time_and_writer_area'>" +
            						"<div class='recipe_level'>" + "</div>" +
            						"<div class='recipe_time'>" + "</div>" +
            						"<div class='recipe_writer'>" + "</div>" +
            					"</div>" + 
            				"</li>").appendTo("ul");
                    }
                }
            }//function infinityScrollFunction()
            

        });

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