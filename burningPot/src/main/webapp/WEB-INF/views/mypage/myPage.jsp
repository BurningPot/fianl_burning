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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
      #refBtn{
      	top: 30%;
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
	<div class="container" style=" width : 100%; height:300px; padding: 1%; background:white; background: 1px solid lightgray;">
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
                              <div class="form-group row" id="divPassword">
                                  <div class="col-sm-2">
                                    <label for="inputPassword" class="control-label">비밀번호</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" placeholder="비밀번호 변경" maxlength="20">
                                  </div>
                              </div>
                              <div class="form-group row" id="divPasswordCheck">
                                  <div class="col-sm-2">
                                    <label for="inputPasswordCheck" class="control-label">비밀번호 확인</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="비밀번호 변경 확인" maxlength="20">
                                  </div>
                              </div>
                              <!-- <div class="form-group row" id="divNickname">
                                  <div class="col-sm-2">
                                    <label for="nickName" class="control-label">닉네임</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="text" class="form-control nickChk" id="nickname" data-rule-required="true" placeholder="닉네임" maxlength="15">
                                      <div class="invalid-feedback text-left"><p id="wrnMsg4"></p></div>
                                  </div> -->
										<div class="form-group row">
											<label for="nicName" class="col-sm-2 control-label">닉네임</label>
											<div class="col-sm-7">
												<input type="text" class="form-control lastChk" name="mName"
													id="nicName"  value="${m.getmName() }" required>
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
                                      <input type="text" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="20" value="${m.getEmail() }">
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
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="sjBtn">수정</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                               
                            </div>
                          </div>
                        </div>
                     </div>
                     <script>
                     
                     // 정보수정
                     $(function(){
                    	 console.log('아이디'+$('#mId').val());
                    	 console.log($('#mGen').val());
                    	 $('#gen').text($('#mGen').val());
                    	 
                     });
                     	$('#sjBtn').on('click', function(){
                     		console.log("들어오냐");
                     		               		
                     		$.ajax({
                     			url : "${pageContext.request.contextPath}/mypage/mypageEnrollEnd.do",
                     			data : {
                     				nic: $('#nicName').val(),
                     				email : $('#email').val(),
                     				password : $('#password').val(),
                     				mId : $('#mId').val()  
                     			},
                     			success: function(data){
                     				alert("수정완료. 재로그인하세요");
                     				location.href="${pageContext.request.contextPath}/member/memberLogout.do";
                     			},
                     			error : function(){
                     				alert("변경할 내용을 입력해주세요");
                     			}
                     		})
                     	});
                     </script>
                    <button type="button" class="btn btn-default btn-sm" id="infoDel">회원탈퇴</button>
                  </div>
                </div>
                 
                 
            <div id="refrigerator" style="width:49%; height: 100%; float: right; border: 1px solid lightgray;">
                  <img src="${pageContext.request.contextPath }/resources/img/tmakxm.png" class="rounded float-left" style="width:30%; height: 100%; float: left; padding: 1%;">
                  
	                    <div id="ref" class="recipe row">
							<c:forEach var="ingre" items="${refList}">
								<div class="ingre m-1" id="${ingre.iNum}">
									<img src="${pageContext.request.contextPath}/resources/img/ingredient/${ingre.iImage}" alt="ingredient image" class="rounded-circle inIngre" title="${ingre.iName}" style="height : 7vh; width : 7vh;">
								</div>								
							</c:forEach>
	                    </div>        
                  <div id="refBtn" style="position:absolute;">
                  	<button type="button" class="btn btn-default btn-lg" onclick="gorefMain(this);">내 냉장고 가기</button>
                  </div>
            </div>
          </div> 

          <div class="container">
            <br>                        
              <ul class="nav nav-tabs nav-justified " style="background-color :#FDD692">
                  <li class="nav-item">
                    <a class="na na1 nav-link active" href="#">내가 올린 레시피</a>
                  </li>
                  <li class="nav-item"> 
                    <a class="na na2 nav-link"  id="posGo" href="#">내가 쓴 글</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na3 nav-link" id="likGo" href="#">좋아요</a>
                  </li>
                </ul><br>
                
               <form id="postForm">
				<input type="hidden" value="${ m.mNum }" name="mNum" />
			  </form>
			  
			  <form id="likeForm">
				<input type="hidden" value="${ m.mNum }" name="mNum" />
			  </form>
                

	
			<div id="mp1" class="col-lg-12" style="padding : 0;">
          <table id="mypage1" class="table table-hover" style="border: 1px solid lightgray;">
            <tbody class="myS" style="background : white; border:1px solid ligntgray;">
              <tr style="border: 2px solid saddlebrown; text-align: center; ">
                  <th width="10%">번호</th>
                  <th width="30%">제목</th>
                  <th width="15%">작성자</th>
                  <th width="20%">작성일</th>
                  <th width="10%">조회</th>
                  <th width="15%">
                    수정|삭제
                  </th>
              </tr>
              <!-- success : function(data) {
              	data.mypageList
              	
              	$('#mypage').attr(tr)
              	append()
              }; -->
              <c:forEach items="${ recipeList }" var="b">
              <tr id="${b.rNum }">
                <td class="rtd">${b.rNum }</td>
                  <td class="rtd">${b.rName }</td>
                  <td class="rtd">${b.mName }</td>
                  <td class="rtd">${b.rDate }</td>
                  <td class="rtd">${b.rCount }</td>
                  <td>
                      <button type="button" class="btn btn-default btn-sm updateMyRecipe">수정</button>
                      <button type="button" class="btn btn-default btn-sm deleteMyRecipe">삭제</button>
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
   	  
     // int mNum = Integer.parseInt(String.valueOf(request.getAttribute("mNum")));
      
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
     %>
   <%= com.kh.pot.common.util.sh_Utils.getPageBar(totalContents, cPage, numPerPage,"myPage.do",mNum) %>
   </div>
<br />
<br />
          </div>
          
           <form id="delForm">
             	<input type="hidden" value="${m.mNum }" name="formDel"/>
             </form>
             
             <form id="refreshMypage" action="${pageContext.request.contextPath}/mypage/myPage.do">
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
          
    
          
/*     // 파일 업로드 커스텀 관련 메소드
		$("#file-select").on('change', function(){
			var reader = new FileReader();
			
			// 파일을 업로드 하고 나서 다시 파일 선택 누른 뒤 취소버튼 눌렀을 때 발생하는 오류캐치
			if($(this)[0].files[0] == undefined){
				$("#file-text").val(filename);
				reader.readAsDataURL(file);
			} 
			else {
				if(reader)
					filename = $(this)[0].files[0].name; 
				else
					filename = $(this).val().split('/').pop().split('\\').pop(); // 예전 IE 경우 대비  
				
				var imgChk = filename.slice(filename.lastIndexOf(".")+1).toLowerCase();
				
				// 이미지 파일만 업로드하는 조건 부여
				if(imgChk != "gif" && imgChk != "jpg" && imgChk != "png"){
					alert("이미지파일(.jpg, .png, .gif)만 업로드 가능합니다.");
					$("#file-text").val("");
					$("#my-profile").css("content", "url('/gt/resources/images/profiles/"+ myProfile +"')");
				}
				else{
					$("#file-text").val(filename);
					file = $(this)[0].files[0];
					reader.readAsDataURL(file);
					reader.onload = function(){
						$("#my-profile").css("content", "url(" + reader.result + ")");
					};	
				}	
			}
		}); */
       // 이름 유효성 검사
      	$('#nicName').on('keyup', function(){
      		if(/^([가-힣a-zA-Z]{2,10})$/.test($('#nicName').val())){
      			$.ajax({
      				url:"${pageContext.request.contextPath}/mypage/checkNicDup.do",
      				data:{mName:$('#nicName').val()},
      				dataType:"json",
      				success: function(data){
      					if(data.isUsable == true){ 
      						$('#nicName').removeClass("is-invalid");
      						$('#nicName').addClass('is-valid');
      						$('#nicName').removeClass('lastChk');
      						
      						if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
      					 		$('#sjBtn').attr('disabled',false);
      					 	}
      					}else{
      						$('#nicName').removeClass("is-valid");
      						$('#nicName').addClass('is-invalid');
      						$('#wrnMsg4').text('이미 존재하는 닉네임입니다.');
      					}
      					
      				}, error:function(error, msg){
      					alert('닉네임 중복 체크 에러');
      				}
      			});
      		}else{
      			$('#nicName').removeClass("is-valid");
      			$('#nicName').addClass('is-invalid');
      			$('#wrnMsg4').text('닉네임을 2-10 글자 사이로 정해주세요, 특수 X');
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
               
               // 내가쓴 레시피 보러가기
               $(".rtd").on("click",function(){
        	      var rNum = $(this).parent().attr("id");
        	      console.log(rNum);
        	      location.href = "${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+rNum;
        	   }).hover(function(){
        		   $(this).css('cursor','pointer');
        	   });
               
               // 수정
               $('.updateMyRecipe').on('click',function(){
            	   var rNum = $(this).parent().parent().children().eq(0).text();
            	   console.log(rNum);
            	  location.href="${pageContext.request.contextPath}/recipe/selectDetail.do?rNum="+rNum;
              	  
               });
               
               /* // 레시피 수정하기 가기
               function updateDev(obj){
            	   var rNum = $(obj).parent().parent().children().eq(0).text();
            	  location.href="${pageContext.request.contextPath}/recipe/selectDetail.do?rNum="+rNum;
              	  
               } */
               
               //레시피 삭제
               $('.deleteMyRecipe').on('click',function(){
            		var rNum = $(this).parent().parent().children().eq(0).text();
            		console.log(rNum);
            		 $.ajax({
            			url : "${pageContext.request.contextPath}/mypage/myPagedelete.do",
            			data:{
            				rNum : rNum
            			}, success: function(data){
            				alert("게시글을 삭제했습니다");
            				$('#refreshMypage').submit();
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
               
               
               
             /* // 내가쓴글 보러가기
                $("tr[id]").on("click",function(){
                	var rNum = $(this).attr("id");
          	     
          	      location.href = "${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+rNum;
          	   }).hover(function(){
          		   $(this).css('cursor','pointer');
          	   }); */
               
             
              
          
           	
         /* // 게시글 삭제
        	function deleteMyBoard(){
        		if(confirm('글을 삭제 하시겠습니까?')==true){
        			location.href="${pageContext.request.contextPath}/mypage/myPagedelete.do?no="+$('#bNum').val();
        		}else{
        			return;
        		}
        	} */
               // 내가쓴 글 클릭시 이동
                $('#posGo').on('click', function(){
            	   $('#postForm').attr("action", "${pageContext.request.contextPath}/mypage/myPosts.do").submit();
               });
        	
        	// 내가좋아요 클릭시 이동
            $('#likGo').on('click', function(){
        	   $('#likeForm').attr("action", "${pageContext.request.contextPath}/mypage/myLike.do").submit();
           });
        	
        	
        	// 내가 좋아요 누른곳 클릭시 이동
        	$('#likGo').on('click', function(){
         	   $('#likeForm').attr("action", "${pageContext.request.contextPath}/mypage/myLike.do").submit();
            }); 
               
               // 회원탈퇴
               $('#infoDel').on('click', function(){
            	   var delConfirm = confirm('탈퇴 하시겠습니까?');
            	   if (delConfirm) {
            	      alert('탈퇴 되었습니다.');
            	      $('#delForm').attr("action", "${pageContext.request.contextPath}/mypage/deleteUserInfo.do").submit();
            	   }
            	   else {
            	     /*  alert('탈퇴가 취소되었습니다.'); */
            	     swal('실패');
            	   }
               });
             </script>
             
            
             
           </div>  
</body>
</html>