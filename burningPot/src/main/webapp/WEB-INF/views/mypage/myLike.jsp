<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>


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
      
      #
</style>
<title>마이페이지</title>
</head>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<body><div style="height:20%;"></div>

	<div class="container" style=" width : 100%; height:300px; padding: 1%;">
            <div id="myinfo" style="width:49%; height: 100%; float: left; border: 1px solid lightgray">
                            	
<%--             	<c:if test="${ m.mPicture == 'defaultPerson.png' }">
            		<img id="profileImg" src="${pageContext.request.contextPath }/resources/img/profile/${ m.mPicture}" class="rounded float-left" style="width:30%; height: 80%; padding: 1%; cursor: pointer; ">
            	</c:if>
                      
               <c:if test="${ m.mPicture != 'defaultPerson.png' }"> --%>
               		<img id="profileImg" src="${pageContext.request.contextPath }/resources/img/profile/${ m.mPicture }" class="rounded float-left" style="width:30%; height: 80%; padding: 1%; cursor: pointer; ">
<%--                </c:if> --%>
                <div id="profileWrap">
                	<form  id="fileForm" enctype="multipart/form-data"><input type="file" accept="image/*" id="profileBtn" name="profileBtn" onchange="LoadImg(this)"/>
                		<input type="hidden" name="oriHidden" value="${ m.mPicture }"/>
                		<input type="hidden"  name="numHidden" value="${m.mNum }"/>
                	</form>
                </div>
                
                   
                <input type="hidden" value="${m.mId}" id="mId"/>
                
                <div class="row text-center">
                    
                    <div class="col-sm-12">
                      <br>
                      <div class="alert alert-secondary" role="alert">
                          <td>ID : ${ m.getmId() }</td>
                      </div>
                      <div class="alert alert-success" role="alert">
                          <td>닉네임 : ${ m.getmName() }</td>
                      </div>                                           
                      <div class="alert alert-info" role="alert">
                            <td>이메일 : ${ m.getEmail() }</td>
                      </div>
                    </div>
                    </div>
                                 
                  <div class="col-sm-12">
                      
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
                                      <td>${ m.getmId() }</td>
                                  </div>
                              </div>
                              <div class="form-group row" id="divPassword">
                                  <div class="col-sm-2">
                                    <label for="inputPassword" class="control-label">비밀번호</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" placeholder="비밀번호" maxlength="20">
                                  </div>
                              </div>
                              <div class="form-group row" id="divPasswordCheck">
                                  <div class="col-sm-2">
                                    <label for="inputPasswordCheck" class="control-label">비밀번호 확인</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="비밀번호 확인" maxlength="20">
                                  </div>
                              </div>
                              <div class="form-group row" id="divNickname">
                                  <div class="col-sm-2">
                                    <label for="nickName" class="control-label">닉네임</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="text" class="form-control nickChk" id="nickname" data-rule-required="true" placeholder="닉네임" maxlength="15">
                                      <div class="invalid-feedback text-left"><p id="wrnMsg4"></p></div>
                                  </div>
                                  <div id="ChackNic">
                                    <button type="button" class="btn btn-default btn-sm" id="Dup">중복확인</button>
                                  </div>
                              </div>
                              <div class="form-group row" id="divEmail">
                                    <div class="col-sm-2">
                                      <label for="inputEmail" class="control-label">이메일</label>
                                    </div>
                                    <div class="col-sm-7">
                                      <input type="text" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="20">
                                    </div>
                             </div>
                             <div class="form-group row" id="gender">
                                    <div class="col-sm-2">
                                      <label for="inputGender" class="control-label">성별</label>
                                    </div>
                                    <div class="col-sm-7">
                                      <th>${gender}</th>
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
                    <button type="button" class="btn btn-default btn-sm">회원탈퇴</button>
                  </div>
                </div>
                 
            <div id="refrigerator" style="width:49%; height: 100%; float: right; border: 1px solid lightgray;">
                  <img src="${pageContext.request.contextPath }/resources/img/tmakxm.png" class="rounded float-left" style="width:30%; height: 100%; float: left; padding: 1%;">
                  <div class="refrigeratormenu">
                      뭐가들어가야 할까나
                      
                  </div>    
                  <button type="button" class="btn btn-default btn-sm">내 냉장고 가기</button>            
            </div>
          </div> 

          <div class="container">
            <br>                        
              <ul class="nav nav-tabs nav-justified " style="background-color :#FDD692">
                  <li class="nav-item">
                    <a class="na na1 nav-link " href="${pageContext.request.contextPath}/mypage/myPage.do">내가 올린 레시피</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na2 nav-link"  id="posGo" href="#">내가 쓴 글</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na3 nav-link active" href="#">좋아요</a>
                  </li>
                </ul><br>                              
                <br>
                <br>
                
                <form id="postForm">
				<input type="hidden" value="${ m.mNum }" name="mNum" />
			  </form>
            
            
            <div id="mp3"  class="col-lg-12" style="padding : 0">
            <table id="mypage3" class="table table-hover" style="border: 1px solid lightgray;">
                <tbody>
                  <tr  id="he" style="border: 2px solid saddlebrown">               
                      <th width="10%">번호</th>
                      <th width="30%">제목</th>
                      <th width="15%">작성자</th>
                      <th width="20%">작성일</th>
                      <th width="10%">조회</th>
                      <th width="15%">
                        수정|삭제
                      </th>
                  </tr>
                  <c:forEach items="${ list }" var="b">
              <tr id="${b.bNum }">
                <td>${b.bNum }</td>
                  <td>${b.bTitle }</td>
                  <td>${b.mName }</td>
                  <td>${b.bDate }</td>
                  <td>${b.bCount }</td>
                  <td>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();"  id="deleteMyBoard">삭제</button>
                        </td>
                    </tr>
                    </c:forEach>                   
                </tbody>    
              </table>
              	                            <%-- 페이지바를 위한 Utils의 정적메소드 사용 --%> 
   <% 
      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
      
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
     %>
   <%= com.kh.pot.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "myLike.do") %>              
          </div>
          </div>
          <script>
          
          // 이미지 변경 클릭시
          $(function(){
       	   $('#profileWrap').hide();
       	   
       	   $('#profileImg').click(function(){
       		   $('#profileBtn').click();
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
               
               $('#posGo').on('click', function(){
            	   $('#postForm').attr("action", "${pageContext.request.contextPath}/mypage/myPosts.do").submit();
               });
             </script>
</body>
</html>