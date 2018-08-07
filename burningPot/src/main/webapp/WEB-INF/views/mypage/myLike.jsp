<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@page import="com.kh.pot.member.model.vo.Member"%>
    <% Member m = (Member)session.getAttribute("m"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.main{
		background-image: url("${pageContext.request.contextPath}/resources/img/tlrekd2.jpg");
		-webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;

	}

	.container > ul > li > a{
        text-decoration:none;
        color:#495057;
      }
      #he{
        text-align: center;
      }
      .table > tbody > tr > td{       
        text-align: center;
      }
      /* #myinfo{       
        text-align: center;
      } */
      
      #refrigerator{             
        text-align: center; 
      }
      
      #profilePlaceholder {
      margin-left : 5px;
      	z-index: 100;
	    position: absolute;
	    top: 250px;
	    background: cornsilk;
      }
      
     .myS > tr {
    	border: 1px solid #ccc;
	    margin: 1% 0;
	    box-shadow: 3px 3px 2px #ccc;
	    transition: 0.5s;
      }
         #ref{
      	height: auto;
      	min-height: 100px;
      }
      #refBtn{
      	top: 35%;
      	left: 70%;
      	
      }
</style>
<title>마이페이지</title>
</head>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<body>
<div style="height:15%;"></div>
<div class="main col-lg-12">
<br />
<br />

	<div class="container" style=" width : 100%; height:300px; padding: 1%; background:white; background: 1px solid lightgray; position:relative;">
            <div id="myinfo" style="width:49%; height: 100%; float: left; border: 1px solid lightgray">
                            	
<%--             	<c:if test="${ m.mPicture == 'defaultPerson.png' }">
            		<img id="profileImg" src="${pageContext.request.contextPath }/resources/img/profile/${ m.mPicture}" class="rounded float-left" style="width:30%; height: 80%; padding: 1%; cursor: pointer; ">
            	</c:if>
                      
               <c:if test="${ m.mPicture != 'defaultPerson.png' }"> --%>
               		 <c:if test="${!fn:contains(m.mPicture, 'https:')}">
               		<img id="profileImg" src="${pageContext.request.contextPath }/resources/img/profile/${ m.mPicture }" class="rounded float-left" style="width:30%; height: 80%; padding: 1%; cursor: pointer; ">
				</c:if>
				<c:if test="${fn:contains(m.mPicture, 'https:')}">
					<img id="profileImg" src="${ m.mPicture }" class="rounded float-left" style="width:30%; height: 80%; padding: 1%; cursor: pointer; ">
				</c:if>
<%--                </c:if> --%>
                <div id="profileWrap">
                	<form  id="fileForm" enctype="multipart/form-data"><input type="file" accept="image/*" id="profileBtn" name="profileBtn" onchange="LoadImg(this)"/>
                		<input type="hidden" name="oriHidden" value="${ m.mPicture }"/>
                		<input type="hidden"  name="numHidden" value="${m.mNum }"/>
                	</form>
                </div>
                <div id="profilePlaceholder" style="display: none;">사진 변경 프로필 클릭</div>
                   
                <input type="hidden" value="${m.mId}" id="mId"/>
                <!-- 내정보 div -->
                <div class="row text-center">
                    <div class="col-sm-12">
                      <br>
                      	<div class="alert alert-secondary" role="alert">
                          <td>ID : ${ minfo.mId }</td>
                      	</div>
                      	<div class="alert alert-success" role="alert">
                          <td>닉네임 : ${ minfo.mName }</td>
                      	</div>                                           
                      	<div class="alert alert-info" role="alert">
                            <td> 이메일 : ${minfo.email }</td>
                      	</div>
                      	<input type="hidden" id="mGen" value="${m.gender }" />
                   </div>
                 </div>
                       
                <!-- 이미지 변경 버튼 -->
                <div class="col-sm-12">           
                    <!-- <button type="button" class="btn btn-default btn-sm"  id="UpImg">이미지변경</button> -->				
                    <button type="button" class="btn btn-default btn-sm btn-toggle" data-toggle="modal" data-target="#myModal">정보수정</button>
                    
                    <!-- 정보수정 모달창 -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">회원정보 수정</h4>
                            </div>
                            <div class="modal-body">
                              <div class="form-group row" id="divId">
                                  <div class="col-sm-2">
                                    <label for="inputId" class="control-label">아이디</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <td>${ minfo.mId }</td>
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <div class="col-sm-2">
                                    <label for="Password" class="control-label">비밀번호</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호 변경" maxlength="20">
                                      <div class="invalid-feedback text-left"><p id="wrnMsg1"></p></div>
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <div class="col-sm-2">
                                    <label for="password1" class="control-label">비밀번호 확인</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password"  class="form-control" id="password1" placeholder="비밀번호 변경 확인" maxlength="20">
                                      <div class="invalid-feedback text-left"><p id="wrnMsg2"></p></div>
                                  </div>
                              </div>
                             
										<div class="form-group row">
											<label for="nicName" class="col-sm-2 control-label">닉네임</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="mName"
													id="nicName"  value="${minfo.mName }" required>
												<div class="invalid-feedback text-left">
													<p id="wrnMsg4"></p>
												</div>
											</div>
										</div>
									
                              
                              <div class="form-group row" id="divEmail">
                                    <div class="col-sm-2">
                                      <label for="inputEmail" class="control-label">이메일</label>
                                    </div>
                                    <div class="col-sm-7">
                                      <input type="text" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="20" value="${minfo.email  }">
                                    <div class="invalid-feedback text-left">
													<p id="wrnMsg3"></p>
												</div>
                                    </div>
                             </div>
                             <div class="form-group row" id="gender">
                                    <div class="col-sm-2">
                                      <label for="inputGender" class="control-label">성별</label>
                                    </div>
                                    <div class="col-sm-7">
                                      <th><p id="gen"></p></th>
                                    </div>
                                  </div>
                         </div>                       
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default" data-dismiss="modal" id="sjBtn">수정</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                               
                            </div>
                          </div>
                        </div>
                     </div>
                     <script>
                     
 // 정보수정
                     
                     //비밀번호 유효성 검사
                    	$('#password').on('keyup', function(){
                            pwd = $('#password').val();          
                    		regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
                    		
                            if (regexp.test(pwd)) {
                    			$('#password').removeClass("is-invalid");
                    		 	$('#password').addClass('is-valid');
                    		 	$('#password').removeClass('lastChk');
                    			
                    		}else{
                    			$('#password').removeClass("is-valid");
                    			$('#password').addClass('is-invalid');
                    			$('#password').addClass('lastChk');
                    			$('#wrnMsg1').text('비밀번호를 확인 해주세요');
                    		}
                    	});
                    	
                    	// 비밀번호 확인
                    	$('#password, #password1').on('keyup',function(){
                    		 if($('#password').val() == $('#password1').val()){
                    			 	$('#password1').removeClass("is-invalid");
                    			 	$('#password1').addClass('is-valid');
                    			 	$('#password1').removeClass('lastChk');
                    				
                    		 }else{
                    			 $('#password1').removeClass("is-valid");
                    			 $('#password1').addClass('is-invalid');
                    		 	 $('#wrnMsg2').text('비밀번호가 일치하지 않습니다.');
                    		 	$('#password1').addClass('lastChk');
                    		 }
                    	 });
                    	
                    	// 닉네임 중복확인
                     $(function(){
                    	 console.log('아이디'+$('#mId').val());
                    	 console.log($('#mGen').val());
                    	 $('#gen').text($('#mGen').val());
                    	 
                     });
                     	$('#sjBtn').on('click', function(){
                     		console.log("들어오냐");
                     		if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
            			 	          		
	                     		$.ajax({
	                     			url : "${pageContext.request.contextPath}/mypage/mypageEnrollEnd.do",
	                     			data : {
	                     				nic: $('#nicName').val(),
	                     				email : $('#email').val(),
	                     				password : $('#password').val(),
	                     				mId : $('#mId').val()  
	                     			},
	                     			success: function(data){
	                     				location.reload();
	                     				/* alert("수정완료. 재로그인하세요");
	                     				location.href="${pageContext.request.contextPath}/member/memberLogout.do"; */
	                     			},
	                     			error : function(){
	                     				alert("변경할 내용을 입력해주세요");
	                     			}
	                     		});
                     		
            			 	}else{
            			 		alert('수정할 정확한 정보를 입력해주세요');
            			 	}
                     	});
                     	
                     // 이메일 유효성 검사
                    	$('#email').on('keyup',function(){
                    		 var email = $('#email').val().trim();
                    			
                    			if(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(email)){
                    				$.ajax({
                    					url:"${pageContext.request.contextPath}/member/checkEmailDup.do",
                    					data:{email:email},
                    					dataType:"json",
                    					success: function(data){
                    						if(data.isUsable == true){ 
                    							$('#email').removeClass("is-invalid");
                    							$('#email').addClass('is-valid');
                    							$('#email').removeClass('lastChk');
                    							
                    						}else{
                    							$('#email').removeClass("is-valid");
                    							$('#email').addClass('is-invalid');
                    							$('#wrnMsg3').text('이미 등록된 이메일 입니다.');
                    							$('#email').addClass('lastChk');
                    						}
                    						
                    					}, error:function(error, msg){
                    						alert('이메일 중복 체크 에러');
                    					}
                    				});
                    					
                    			}else{
                    				$('#email').removeClass("is-valid");
                    				$('#email').addClass('is-invalid');
                    				$('#email').addClass('lastChk');
                    				$('#wrnMsg3').text('이메일 형식을 확인해 주세요!');
                    			}
                    	 });
                     </script>
                    <button type="button" class="btn btn-default btn-sm">회원탈퇴</button>
                  </div>
                </div>
                 
            <div id="refrigerator" style="width:49%; height: 100%; float: right; border: 1px solid lightgray;">
                  <img src="${pageContext.request.contextPath }/resources/img/tmakxm.png" class="rounded float-left" style="width:30%; height: 100%; float: left; padding: 1%;">
                  		<div id="ref" class="recipe row" style="overflow:auto; width: 375px; height:200px;">
							<c:forEach var="ingre" items="${refList}">
								<div class="ingre m-1" id="${ingre.iNum}">
									<img src="${pageContext.request.contextPath}/resources/img/ingredient/${ingre.iImage}" alt="ingredient image" class="rounded-circle inIngre" title="${ingre.iName}" style="height : 7vh; width : 7vh;">
								</div>								
							</c:forEach>
	                    </div>    
	                    <div id="refBtn" style="right:40%; bottom:0%;">
                  <button type="button" class="btn btn-default btn-lg" onclick="gorefMain(this);">내 냉장고 가기</button>   
                  </div>         
            </div>
          </div> 

          <div class="container">
            <br>                        
              <ul class="nav nav-tabs nav-justified " style="background-color :#FDD692">
                  <li class="nav-item">
                    <a class="na na1 nav-link " id="recGo" href="#">내가 올린 레시피</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na2 nav-link"  id="posGo" href="#">내가 쓴 글</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na3 nav-link active" href="#">좋아요</a>
                  </li>
                </ul><br>
                
                <form id="postForm" method="POST">
				<input type="hidden" value="${ m.mNum }" name="mNum" />
			  </form>
			  
			  <form id="recipeForm" method="POST">
				<input type="hidden" value="${ m.mNum }" name="mNum" />
			  </form>
            
            
            <div id="mp3"  class="col-lg-12" style="padding : 0">
            <table id="mypage3" class="table table-hover" style="border: 1px solid lightgray;">
                <tbody class="myS" style="background : white; border:1px solid ligntgray;">
                  <tr style="text-align: center;">               
                      <th width="10%">번호</th>
                      <th width="30%">제목</th>
                      <th width="15%">작성자</th>
                      <th width="20%">작성일</th>
                      <th width="10%">조회</th>
                      <th width="15%">
                        좋아요
                      </th>
                  </tr>
                  <c:forEach items="${ likeList }" var="b">
              <tr id="${b.rNum }">
                <td class="rtd">${b.rNum }</td>
                  <td class="rtd">${b.rName }</td>
                  <td class="rtd">${b.mName }</td>
                  <td class="rtd">${b.rDate }</td>
                  <td class="rtd">${b.rCount }</td>
                  <td>
                          <button type="button" class="btn btn-default btn-sm cancelMyLikeRecipe">좋아요취소</button>
                        </td>
                    </tr>
                    </c:forEach>                   
                </tbody>    
              </table>
              	                            <%-- 페이지바를 위한 Utils의 정적메소드 사용 --%> 
   <% 
      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
      int mNum =m.getmNum();
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
     %>
   <%= com.kh.pot.common.util.sh_Utils.getPageBar(totalContents, cPage, numPerPage, "myLike.do", mNum) %>
          </div>
          </div>
          
          <form id="pageFrom" method="POST">
          	<input type="hidden" value="${m.mNum}" name="mNum"/>
          	<input type="hidden" value=<%= cPage %> name="cPage" id="cPageNum"/>
          </form>
          
          <form id="refreshMypage" action="${pageContext.request.contextPath}/mypage/myLike.do" method="POST">
             	<input type="hidden" value="${m.mNum }" name="mNum"/>
             </form>
             
          <script>
          
          // 이미지 변경 클릭시
          $(function(){
       	   $('#profileWrap').hide();
       	   
       	  
       	   
       	   $('#profileImg').on({
       		'mouseenter' : function() {
       			$('#profilePlaceholder').show();
       		} , 'mouseleave' : function() {
       			$('#profilePlaceholder').hide();
       		}, 'click' : function() {
       			$('#profilePlaceholder').hide();
       			$('#profileBtn').click();
       		} 
       	   });

          });
             
          function LoadImg(value) {
       	   var reader="";
       	   if (!value.files && value.files[0])
       	   reader = new FileReader();
       	   
   			 console.log(value.files[0].name);
   			// 이미지 확장자 구하는 코드
   			 if( value.files[0].name != "" ){

   					var ext = value.files[0].name.split('.').pop().toLowerCase();

   					      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {

   						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');

   						 return;

   					      }
   					      
   					      if (value.files && value.files[0]) {
   								var reader = new FileReader();
   								reader.onload = function(e) {
   								
   										$("#profileImg").attr("src", e.target.result);
   										$('#profileImg').show();


   								}
   								reader.readAsDataURL(value.files[0]);
   						
   							} 

   					}

   			console.log("사진들어오냐");
   		
   			 var form = $('#fileForm')[0];
   			 
   			 var data = new FormData(form);
   			 
   			 $.ajax({
   				 	
   				 	url : '${pageContext.request.contextPath}/mypage/updateImg.do',
   			        type: "POST",
   			        enctype: 'multipart/form-data',
   			        processData: false,  // Important!
   			        contentType: false,
   			        cache: false,
   			        data : data,
   			        success : function (data){
   			        	/* alert("성공"); */
   			        	},
   			        	error : function(data){
   			        		alert("실패");
   			        	}
   			        });
   		
   		}
          
       // 이름 유효성 검사
      	$('#nickName').on('keyup', function(){
      		if(/^([가-힣a-zA-Z]{2,10})$/.test($('#nickName').val())){
      			$.ajax({
      				url:"${pageContext.request.contextPath}/member/checkNameDup.do",
      				data:{mName:$('#nickName').val()},
      				dataType:"json",
      				success: function(data){
      					if(data.isUsable == true){ 
      						$('#nickName').removeClass("is-invalid");
      						$('#nickName').addClass('is-valid');
      						$('#nickName').removeClass('nickChk');
      						
      						if(!$('input').hasClass('is-invalid') && !$('input').hasClass('nickChk')){
      					 		$('#sjBtn').attr('disabled',false);
      					 	}
      					}else{
      						$('#nickName').removeClass("is-valid");
      						$('#nickName').addClass('is-invalid');
      						$('#Dup').text('이미 존재하는 닉네임입니다.');
      					}
      					
      				}, error:function(error, msg){
      					alert('닉네임 중복 체크 에러');
      				}
      			});
      		}else{
      			$('#nickName').removeClass("is-valid");
      			$('#nickName').addClass('is-invalid');
      			$('#wrnMsg3').text('닉네임을 2-10 글자 사이로 정해주세요, 특수 X');
      		}
      		
      	});
            
              $('.na1').on('click', function(){
                  $('.na1').removeClass("disabled").addClass("active");
                  $('.na2').removeClass("active").addClass("disabled");
                  $('.na3').removeClass("active").addClass("disabled");
                  $('#mp1').css('display', 'inline-table');
                  $('#mp2').css('display', 'none');
                  $('#mp3').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });
               $('.na2').on('click', function(){
                  $('.na1').removeClass("active").addClass("disabled");
                  $('.na2').removeClass("disabled").addClass("active");
                  $('.na3').removeClass("active").addClass("disabled");  
                  $('#mp2').css('display', 'inline-table');
                  $('#mp1').css('display', 'none');
                  $('#mp3').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });                  
               $('.na3').on('click', function(){
                  $('.na1').removeClass("active").addClass("disabled");
                  $('.na2').removeClass("active").addClass("disabled");
                  $('.na3').removeClass("disabled").addClass("active");
                  $('#mp3').css('display', 'inline-table');
                  $('#mp1').css('display', 'none');
                  $('#mp2').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });
               
            // 내가누른 좋아요 레시피 보러가기
               $(".rtd").on("click",function(){
        	      var rNum = $(this).parent().attr("id");
        	      console.log(rNum);
        	      location.href = "${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+rNum;
        	   }).hover(function(){
        		   $(this).css('cursor','pointer');
        	   });
            
             //레시피 삭제
               $('.cancelMyLikeRecipe').on('click',function(){
            		var rNum = $(this).parent().parent().children().eq(0).text();
            		var mNum = '${m.mNum}';
            		console.log(rNum);
            		console.log(mNum);
            		  $.ajax({           			  
            			 type:"POST",
            			url : "${pageContext.request.contextPath}/mypage/myLikedelete.do",          			
            			data:{
            				rNum : rNum,
            				mNum:mNum
            			}, success: function(data){
            				alert("좋아요를 취소했습니다");
            				$('#refreshMypage').submit();
            			}, error: function(){
            				alert("좋아요 취소가 실패하였습니다");
            			}
            		}) 		
            	});
             
               
               $('#deleteMyBoard').on('click',function(){
           		//게시글 지워지게 한다
           		var bNum = $('.first-row').eq(2).children().eq(1).text();            		
           		
           		$.ajax({
           			url : "${pageContext.request.contextPath}/mypage/myPage.do",
           			data:{
           				bNum : bNum
           			}, success: function(data){
           				alert("게시글을 삭제했습니다");
           				location.href="${pageContext.request.contextPath}/mypage/${servletMapping}";
           			}, error: function(){
           				alert("게시글을 삭제하는데 실패하였습니다");
           			}
           		})
           		
           	});
               
            // 내 냉장고 가기 버튼
               function gorefMain(obj){
           	   var mNum = $(obj).parent().parent().children().eq(0).text();
           	  location.href="${pageContext.request.contextPath}/fridge/refMain.do?mNum="+mNum;
             	  
              }
               
               $('#posGo').on('click', function(){
            	   $('#postForm').attr("action", "${pageContext.request.contextPath}/mypage/myPosts.do").submit();
               });
               
               $('#recGo').on('click', function(){
            	   $('#recipeForm').attr("action", "${pageContext.request.contextPath}/mypage/myPage.do").submit();
               });
             </script>
             
             </div>
</body>
</html>