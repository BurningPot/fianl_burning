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
    #comment{
    	text-align:justify;    	
    	resize: none;    	
    }
    #insertComment div div:first-child{
    	/* 사진들어가는 칸 */	
    }
    #insertComment div div:nth-child(2){
    	background: #FDD692;
    	text-align: justify;    	
    }
    
    #insertComment div div:nth-child(2) div:first-child{
    	/*댓글작성자 정보뜨는 곳*/
    	font-size: 120%;
    	font-weight: bold;
    	
    }
    
    #insertComment div div:nth-child(2) div:nth-child(2){
    	/*댓글내용*/      	
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
    
        <div class="col-lg-8 offset-lg-2 content" align="center"> 
        	<div class="row first-row col-lg-12">        		
            	<div class="col-lg-1 offset-lg-1 column-title">제목</div>
                <div class="col-lg-9">${b.bTitle}</div>
            </div>
            <div class="row first-row col-lg-12">
            	<div class="col-lg-1 offset-lg-1 column-title">작성자</div>
                <div class="col-lg-6">${b.mId}</div>
                <div class="col-lg-1 column-title">작성일</div>
                <div class="col-lg-2">${b.bDate}</div>
            </div>
            
            <div class="row first-row col-lg-12">            	
            	<div class="col-lg-1 offset-lg-1 column-title">번호</div>
                <div class="col-lg-6">${b.bNum}</div>
                <div class="col-lg-1 column-title">답변</div>
                <div class="col-lg-2">${b.reply}</div>
            </div>
            <br>
			<div class="col-lg-12">
            	<div class="col-lg-10 test" style="text-align:justify; padding: 3%;">${b.bContent}</div>                    
            </div>            
            
            <br /><br />
            <div class="col-lg-12" align="center">
            	<button class="btn btn-danger" id="deleteBoard">삭제하기</button>
                <button class="btn btn-primary" id="returnList">목록으로</button>
                <c:if test="${commonTitle eq '재료요청 게시판'}">
                <button class="btn btn-success" id="searchIngredient" data-toggle="modal" data-target=".searchIngredient">재료검색</button>
                </c:if>
            </div>
                      
            
            <br>
            <hr class="col-lg-12"/>
           	
            <div class="col-lg-12">
            	<textarea class="col-lg-10 test" id="comment" name="comment" cols="4" rows="5" maxlength="500" placeholder="답변은 500자 이내로 입력해주세요"></textarea> 
            </div>
           
    		<div class="col-lg-2 offset-lg-9" style="font-size: 100%;">
    			<span id="cLength">0</span>/<span id="cMaxlength">500</span>
    		</div>
        	<br><br>
        	<script>
        		$('#comment').keyup(function(){
        			$('#cLength').text($('#comment').val().length);        			
        		});
        	</script>
        	
        	<div class="col-lg-12" align="center">
            	<button class="btn btn-success submitComment">답글달기</button>               
            </div>
           
        	<br /><br /> 
        	<div class="col-lg-10" id="insertComment">        		
            	<c:forEach items="${bcList}" var="bc">
            	
            	<div class="row commentWindow">
            		<div class="col-lg-2">
            			<img src="${pageContext.request.contextPath}/resources/img/defaultPerson.png" class="rounded float-left col-lg-12" alt="...">
            		</div>
            		<div class="col-lg-10">
            			<div class="row">
            				<div class="col-lg-11">
            					${bc.mId} 
            					<span style="display:none">${bc.mNum}</span>
            					<span style="display:none">${bc.bcNum}</span>
            				</div>
            				<div class="col-lg-1">
            					<button type="button" class="close" aria-label="Close">            						
  									<span aria-hidden="true">&times;</span>
								</button>
								<input type="hidden" value="${bc.bcNum}" class="bcNum"/>	
            				</div>
            			</div>
            			<div class="col-lg-11">
            				${bc.bcContent}
            			</div> 
            		</div>
            		<hr class="col-lg-12"/>
           		</div>           	
           		
           		</c:forEach>
            </div> 
        	
        	 <script>
            	$('#deleteBoard').on('click',function(){
            		//게시글 지워지게 한다
            		var bNum = $('.first-row').eq(2).children().eq(1).text();            		
            		
            		$.ajax({
            			url : "${pageContext.request.contextPath}/admin/deleteBoard.do",
            			data:{
            				bNum : bNum
            			}, success: function(data){
            				alert("게시글을 삭제했습니다");
            				location.href="${pageContext.request.contextPath}/admin/${servletMapping}";
            			}, error: function(){
            				alert("게시글을 삭제하는데 실패하였습니다");
            			}
            		})
            		
            	});
            	$('#returnList').on('click', function(){
            		//목록으로 돌아간다
            		location.href="${pageContext.request.contextPath}/admin/${servletMapping}";
            	});
           
        	$('.submitComment').on('click', function(){
      			YorN = true; // 삭제할때 갯수가 1개이면 답변은 처리가 안된것이므로 N으로 바꾸는것
      						 // true일때 Y를 , false일 때 N을 넣자
        		
        		var comment = $('#comment').val();   
        		var mNum = ${mNum}; 
        		
        		//ajax로 댓글달기 
        		$.ajax({
        			url: '${pageContext.request.contextPath}/admin/insertBoardComment.do',
        			data: {
        				comment: comment,
        				mNum: mNum,
        				bNum: ${b.bNum}        				
        			},
        			success: function(data){
        				var mId = "${mId}";
        				
        				/* if(mId == 'admin'){
        					mId = '관리자';
        				}         */	
        				
        				alert('댓글작성이 완료되었습니다!');
        				var html = "";
        				html += '<div class="row">';
        				html += '<div class="col-lg-2">';
        				html += '<img src="${pageContext.request.contextPath}/resources/img/defaultPerson.png" class="rounded float-left col-lg-12" alt="...">';
        				html += '</div><div class="col-lg-10">';
        				html += '<div class="row">';
        				html += '<div class="col-lg-11">'+ mId +'<span style="display:none">'+mNum+'</span></div>' 				        				
        				html += '<div class="col-lg-1"><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
        				html += '<input type="hidden" value="'+data.bcNum+'" class="bcNum"/></div></div>';
        				html += '<div class="col-lg-11">'+comment+'</div></div><hr class="col-lg-12"/></div>';
        				
        				$('#insertComment').append(html);
        				
        				//ajax로 댓글달기가 완료된 후에는 게시판의 답변 컬럼을 N에서 Y로 바꿔야 한다!
                		//update를 사용해서 바꾸자 (ajax), mNum만 넘기면 되요
        				updateQnA(YorN); 
        			},error: function(){
        				console.log('댓글작성 실패!');
        				alert("댓글 작성에 실패하였습니다!");
        			}
        		});	
        	});  
        	
        	function updateQnA(YorN){
        		var bNum = ${b.bNum};
        		        		
        		$.ajax({
        			url: "${pageContext.request.contextPath}/admin/updateBoardReply.do",
        			data: {
        				bNum : bNum,    
        				YorN : YorN
        			},
        			success: function(data){
        				console.log(data+'개 업데이트 완료');
        				location.href="${pageContext.request.contextPath}/admin/${detailMapping}?bNum="+bNum;
        			}, error: function(){
        				console.log("업데이트 실패");
        			}        			
        		});
        		
        	};   
        	
        	$('.close').on('click',function(){        		
        		var bcNum = $(this).siblings('.bcNum').val();
        		var bNum = ${b.bNum};
        		var commentLength = $('.commentWindow').length;
        		console.log('삭제버튼 클릭');
        		// bcNum을 받아서 삭제할 수 있게 한다
        		$.ajax({
        			url: "${pageContext.request.contextPath}/admin/deleteBoardComment.do",
        			data: {
        				bcNum : bcNum,
        				commentEa: commentLength
        			}, success: function(){
        				alert('글 삭제가 완료되었습니다!');
        				
 						if(commentLength == 1){
 							//댓글이 더이상 존재 하지 않을 경우 답변컬럼을 'N'으로 바꾸어 놓아야 한다
 							YorN = false;
 							updateQnA(YorN);
 						}  						
        				console.log('댓글갯수 : '+ $('.commentWindow').length);
        				location.href="${pageContext.request.contextPath}/admin/${detailMapping}?bNum="+bNum;
        			}, error: function(){
        				alert('글 삭제에 실패하였습니다!');
        			}
        		});        		
        	});
        	</script>
        	
        </div>
    </div>
	
	
	
</body>
</html>