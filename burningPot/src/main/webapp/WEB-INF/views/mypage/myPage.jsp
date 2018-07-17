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
</style>
<title>Insert title here</title>
</head>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<body><div style="height:20%;"></div>

	<div class="container" style=" width : 100%; height:300px; padding: 1%;">
            <div id="myinfo" style="width:49%; height: 100%; float: left; border: 1px solid lightgray">             
                <img src="${pageContext.request.contextPath }/resources/img/dlalwl.jpg" class="rounded float-left" style="width:30%; height: 80%; padding: 1%;">
                
                <div class="row text-center">
                    
                    <div class="col-sm-12">
                      <br>
                      <div class="alert alert-secondary" role="alert">
                          아이디 : dkdlel
                      </div>
                      <div class="alert alert-success" role="alert">
                          닉네임 : 동길이
                      </div>                                           
                      <div class="alert alert-info" role="alert">
                            Email : dkfjdkfj@naver.com
                      </div>
                    </div>
                    </div>
                                 
                  <div class="col-sm-12">
                      <button type="button" class="btn btn-default btn-sm" >이미지변경</button>
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
                                      <input type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" placeholder="아이디 받아온 값" maxlength="20">
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
                                    <label for="inputNickname" class="control-label">닉네임</label>
                                  </div>
                                  <div class="col-sm-7">
                                      <input type="text" class="form-control" id="nickname" data-rule-required="true" placeholder="닉네임" maxlength="15">
                                  </div>
                                  <div id="ChackNic">
                                    <button type="button" class="btn btn-default btn-sm">중복확인</button>
                                  </div>
                              </div>
                              
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">수정</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                               
                            </div>
                          </div>
                        </div>
                      </div>
                    <button type="button" class="btn btn-default btn-sm">회원탈퇴</button>
                  </div>
                </div>
                 
            <div id="refrigerator" style="width:49%; height: 100%; float: right; border: 1px solid lightgray;">
                  <img src="${pageContext.request.contextPath }/resources/img/sodekdrh.png" class="rounded float-left" style="width:30%; height: 100%; float: left; padding: 1%;">
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
                    <a class="na na1 nav-link active" href="#">내가 올린 레시피</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na2 nav-link" href="#">내가 쓴 글</a>
                  </li>
                  <li class="nav-item">
                    <a class="na na3 nav-link" href="#">좋아요</a>
                  </li>
                </ul><br>              
                <button type="button" class="btn btn-default btn-sm">리뷰</button>
                <button type="button" class="btn btn-default btn-sm">Q&A</button>
                <button type="button" class="btn btn-default btn-sm">신고</button>
                <br>
                <br>

          <table id="mypage1" class="table table-hover" style="border: 1px solid lightgray;">
            <tbody>
              <tr class="active" id="he" style="border: 2px solid saddlebrown">               
                  <th width="10%">번호</th>
                  <th width="30%">제목</th>
                  <th width="15%">작성자</th>
                  <th width="20%">작성일</th>
                  <th width="10%">조회</th>
                  <th width="15%">
                    수정|삭제
                  </th>
              </tr>
              <tr class="active">
                <td scope="row">2</td>
                  <td>이곳이 내용</td>
                  <td>일길동</td>
                  <td>2018-07-11</td>
                  <td>211</td>
                  <td>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                  </td>
                    
              </tr>
              <tr class="active">
                <td scope="row">3</td>
                  <td>이곳이 내용</td>
                  <td>이길동</td>
                  <td>2018-07-11</td>
                  <td>211</td>
                  <td>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                  </td>
              </tr>
              <tr class="active">
                <td scope="row">4</td>
                  <td>이곳이 내용</td>
                  <td>삼길동</td>
                  <td>2018-07-11</td>
                  <td>211</td>
                  <td>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                      <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                  </td>
              </tr>
            </tbody>

          </table>

          <table id="mypage2" class="table table-hover" style="display:none;">
              <tbody>
                <tr class="active" id="he" style="border: 2px solid saddlebrown">               
                    <th width="10%">번호</th>
                  <th width="30%">제목</th>
                  <th width="15%">작성자</th>
                  <th width="20%">작성일</th>
                  <th width="10%">조회</th>
                  <th width="15%">
                    수정|삭제
                  </th>
                </tr>
                <tr class="active">
                    <td scope="row">2</td>
                      <td>이곳이 내용</td>
                      <td>사길동</td>
                      <td>2018-07-11</td>
                      <td>211</td>
                      <td>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                      </td>
                      
                  </tr>
                  <tr class="active">
                      <td scope="row">3</td>
                        <td>이곳이 내용</td>
                        <td>오길동</td>
                        <td>2018-07-11</td>
                        <td>211</td>
                        <td>
                            <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                            <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                        </td>
                    </tr>
                    <tr class="active">
                        <td scope="row">4</td>
                          <td>이곳이 내용</td>
                          <td>육길동</td>
                          <td>2018-07-11</td>
                          <td>211</td>
                          <td>
                              <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                              <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                          </td>
                      </tr>
              </tbody>
  
            </table>
            <table id="mypage3" class="table table-hover" style="display:none;">
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
                  <tr>
                      <td scope="row">2</td>
                        <td>이곳이 내용</td>
                        <td>칠길동</td>
                        <td>2018-07-11</td>
                        <td>211</td>
                        <td>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                          <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                        </td>
                    </tr>
                    <tr class="active">
                        <td scope="row">3</td>
                          <td>이곳이 내용</td>
                          <td>팔길동</td>
                          <td>2018-07-11</td>
                          <td>211</td>
                          <td>
                              <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                              <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                          </td>
                    </tr>
                    <tr class="active">
                        <td scope="row">4</td>
                          <td>이곳이 내용</td>
                          <td>구길동</td>
                          <td>2018-07-11</td>
                          <td>211</td>
                          <td>
                             <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">수정</button>
                             <button type="button" class="btn btn-default btn-sm" onclick="updateDev();">삭제</button>
                          </td>
                    </tr>
                </tbody>
    
              </table>

          </div>
          <script>
            
              $('.na1').on('click', function(){
                  $('.na1').removeClass("disabled").addClass("active");
                  $('.na2').removeClass("active").addClass("disabled");
                  $('.na3').removeClass("active").addClass("disabled");
                  $('#mypage1').css('display', 'inline-table');
                  $('#mypage2').css('display', 'none');
                  $('#mypage3').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });
               $('.na2').on('click', function(){
                  $('.na1').removeClass("active").addClass("disabled");
                  $('.na2').removeClass("disabled").addClass("active");
                  $('.na3').removeClass("active").addClass("disabled");  
                  $('#mypage2').css('display', 'inline-table');
                  $('#mypage1').css('display', 'none');
                  $('#mypage3').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });                  
               $('.na3').on('click', function(){
                  $('.na1').removeClass("active").addClass("disabled");
                  $('.na2').removeClass("active").addClass("disabled");
                  $('.na3').removeClass("disabled").addClass("active");
                  $('#mypage3').css('display', 'inline-table');
                  $('#mypage1').css('display', 'none');
                  $('#mypage2').css('display', 'none');
                  // $('.nav-link').css('border','1px solid red');
               });
             </script>
</body>
</html>