<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
  <head>
    <title>회원가입</title>
    <!-- custom css -->
<link href="${pageContext.request.contextPath }/resources/css/board/board.css" rel="stylesheet">
</head>
<body>
<div style="height:20%;"></div>

<div class="contatiner" >
	<br />
	<div class="text-center">
		<h2><i class="fas fa-utensils"></i> 회원가입 </h2>
	</div>
	<br />
	<div class="row">
	<div class="col-sm-3"></div>
	  <div class="col-sm-9 text-center">
	  	<form class="form-horizontal" name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return validate();">
		  <div class="form-group row">
		    <label for="userId" class="col-sm-2 control-label lastChk" for="userId">아이디</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="userId" name="mId" placeholder="한글 X, 3자리 이상" required>
				<div class="invalid-feedback text-left"><p id="wrnMsg"></p></div>
		      	<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="password" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control lastChk" name="password" id="password" placeholder="숫자 포함, 6-20내외" required>
		      <div class="invalid-feedback text-left"><p id="wrnMsg1"></p></div>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="password1" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control lastChk" id="password1"  required>
		      <div class="invalid-feedback text-left"><p id="wrnMsg2"></p></div>
		      
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="userName" class="col-sm-2 control-label">닉네임</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control lastChk" name="mName" id="userName" required>
		      <div class="invalid-feedback text-left"><p id="wrnMsg3"></p></div>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="email" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-5 row">
		    	<div class="col-sm-9">
		      		<input type="email" class="form-control lastChk" name="email" id="email" required readonly>
		      		<div class="invalid-feedback text-left"><p id="wrnMsg4"></p></div>
		      	</div>
		      	<div class="col-sm-3">
		      		<!-- <button type="button" class="btn btn-warning" onclick="EmailModal();">인증하기</button> -->
		      		<button type="button" class="btn btn-warning" onclick="showPopup();">인증하기</button>
		      	</div>
		      
		      <input type="hidden" name="emDuplicateCheck" id="emDuplicateCheck" value="0"/>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="gender" class="col-sm-2 control-label">성별</label>
		    <div class="col-sm-4 text-center">
		      <div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" required="required">
				<label for="gender0">남</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="form-check-input" name="gender" id="gender1" value="F" required="required">
				<label for="gender1">여</label>
			  </div>
		    </div>
		  </div>
		  <div class="form-group row">
		  	<label for="birth" class="col-sm-2 control-label">생년월일</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control lastChk" name="birth" id="birth" placeholder="ex)년도/월/일  -> 00/00/00" required onkeyup="isAbled(this);">
		      		<div class="invalid-feedback text-left"><p id="wrnMsg5"></p></div>
		    	</div>
		  </div>
		  <div class="form-group row">
		    <div class="col-sm-8">
		      <button type="reset" class="btn btn-warning">취소</button>
		      <button type="submit" class="btn btn-warning" id="smBtn" disabled>가입하기</button>
		    </div>
		  </div>
		</form>
	</div>
	</div>
	
</div>

	<script>
	
	// 인증 이메일 부모창으로 옮김
 	function setChildValue(emailAddr){
 		document.getElementById("email").value = emailAddr;
	}
	
 	// 이메일 인증 팝업창 실행
 	function showPopup() { 
	  window.name = "EnrollJsp";
	  window.open("${pageContext.request.contextPath}/member/sendMailView.do", "emailPop", "width=400, height=300, left=100, top=50"); 
	}

	
	// 아이디 유효성 검사
	 $('#userId').on('keyup',function(){
		var mId = $('#userId').val().trim();
		
		if(/^\w{3,19}$/.test(mId)){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkIdDup.do",
				data:{mId:mId},
				dataType:"json",
				success: function(data){
					if(data.isUsable == true){ 
						$('#userId').removeClass("is-invalid");
						$('#userId').addClass('is-valid');
						$('#userId').removeClass('lastChk');
						$("#idDuplicateCheck").val(1);
						if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
					 		$('#smBtn').attr('disabled',false);
					 	}
					}else{
						$('#userId').removeClass("is-valid");
						$('#userId').addClass('is-invalid');
						$('#wrnMsg').text('이미 존재하는 아이디 입니다.');
						$("#idDuplicateCheck").val(0);
					}
					
				}, error:function(error, msg){
					alert('중복 체크 에러');
				}
			});
				
		}else{
			$('#userId').removeClass("is-valid");
			$('#userId').addClass('is-invalid');
			$('#wrnMsg').text('아이디를 확인해 주세요!');
		}
	}); 
	
	//비밀번호 유효성 검사
	$('#password').on('keyup', function(){
        pwd = $('#password').val();          
		regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		
        if (regexp.test(pwd)) {
			$('#password').removeClass("is-invalid");
		 	$('#password').addClass('is-valid');
		 	$('#password').removeClass('lastChk');
			if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
		 		$('#smBtn').attr('disabled',false);
		 	}
		}else{
			$('#password').removeClass("is-valid");
			$('#password').addClass('is-invalid');
			$('#wrnMsg1').text('비밀번호를 확인 해주세요');
		}
	});
	
	// 비밀번호 확인
	$('#password, #password1').on('keyup',function(){
		 if($('#password').val() == $('#password1').val()){
			 	$('#password1').removeClass("is-invalid");
			 	$('#password1').addClass('is-valid');
			 	$('#password1').removeClass('lastChk');
				if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
			 		$('#smBtn').attr('disabled',false);
			 	}
		 }else{
			 $('#password1').removeClass("is-valid");
			 $('#password1').addClass('is-invalid');
		 	 $('#wrnMsg2').text('비밀번호가 일치하지 않습니다.');
		 	 
		 }
	 });
	
	// 이름 유효성 검사
	$('#userName').on('keyup', function(){
		if(/^([가-힣a-zA-Z]{2,10})$/.test($('#userName').val())){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkNameDup.do",
				data:{mName:$('#userName').val()},
				dataType:"json",
				success: function(data){
					if(data.isUsable == true){ 
						$('#userName').removeClass("is-invalid");
						$('#userName').addClass('is-valid');
						$('#userName').removeClass('lastChk');
						
						if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
					 		$('#smBtn').attr('disabled',false);
					 	}
					}else{
						$('#userName').removeClass("is-valid");
						$('#userName').addClass('is-invalid');
						$('#wrnMsg3').text('이미 존재하는 닉네임입니다.');
					}
					
				}, error:function(error, msg){
					alert('닉네임 중복 체크 에러');
				}
			});
		}else{
			$('#userName').removeClass("is-valid");
			$('#userName').addClass('is-invalid');
			$('#wrnMsg3').text('닉네임을 2-10 글자 사이로 정해주세요, 특수 X');
		}
		
	});
	
	// 생년월일 유효성 검사
	$('#birth').on('keyup', function(){
		var regexp =/^[0-9][0-9]\/(([0][0-9])|([1][0-2]))\/([0][0-9]|([1-2][0-9])|[3][0-1])$/;
		birth = $('#birth').val();
		
		if (regexp.test(birth)) {
			$('#birth').removeClass("is-invalid");
			$('#birth').addClass('is-valid');
			$('#birth').removeClass('lastChk');
			
			if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
		 		$('#smBtn').attr('disabled',false);
		 	}
	    }else{
	    	$('#birth').removeClass("is-valid");
			$('#birth').addClass('is-invalid');
			$('#wrnMsg5').text('양식을 확인해 주세요(년/월/일) -> yy/mm/dd');
	    }
	});
	
	//빈 칸 검사
	function isAbled(obj){
		if($(obj).val().trim().length<2){ 
			$(obj).removeClass("is-valid");
			$(obj).addClass('is-invalid');
			
		}else{
			$(obj).removeClass("is-invalid");
			$(obj).addClass('is-valid');
			$(obj).removeClass('lastChk');
			if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
		 		$('#smBtn').attr('disabled',false);
		 	}
		}
	}

	/* 회원가입 최종 검사 */
	function validate(){
		var userId = $('#userId');
		$.ajax({
			url:"${pageContext.request.contextPath}/member/deleteConfirmMail.do",
			data:{emailAddr:$('#email').val()},
			dataType:"json",
			success: function(data){
				if(data.isDelete == true){
					
					if(userId.val().trim().length<3){
						alert("아이디는 최소 3자리이상이어야 합니다.");
						userId.focus();
						return false;
					}
			
					// 아이디 중복 체크여부
					if($("#idDuplicateCheck").val() == 0){
						alert('사용 가능한 아이디가 아닙니다.');
						return false;
					}
					
					return true;
					
				}else{
					alert('인증이 되지 않은 회원입니다.');
					return false;
				}
						
			}, error:function(error, msg){
					alert('메일 삭제 에러');
				}
			});
	}
	
	</script>
	
	</body>
</html>