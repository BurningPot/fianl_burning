<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>

<!-- fontawsome CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/chkEmail.do" method="post" class="form-horizontal" id="sendMailFrm">
				<div class="form-group row">
	             	<div class="col-sm-12 text-center">
	             		<c:if test="${empty chkEmail}"> 
	              			<p id="warnText"><i class="fas fa-exclamation-triangle fa-1x"></i> 정확한 이메일을 쓰셔야 인증이 가능합니다.</p>
	              		</c:if>
	              		<c:if test="${!empty chkEmail}"> 
	              			<p id="sendText">
	              			메일을 전송했습니다.<br> 메일로 전송된 링크를 눌러 인증을 확인하세요</p>
	              		</c:if>
	              	</div>
	             </div>

			<label for="chkEmail" class="control-label col-xs-2 col-sm-2"><i class="fas fa-check fa-1x"></i> 이메일</label> 
			
			<c:if test="${empty chkEmail}"> 
				<input type="email" class="form-control lastChk" name="chkEmail" id="chkEmail" required>
				<div class="invalid-feedback text-left"><p id="wrnMsg4"></p></div>
				<br />
				<div class="col-sm-12 pull-right">
					<button type="button" class="btn btn-warning" onclick="sendEmBtn();">인증번호 보내기</button>
				</div>
			</c:if>
		</form>
		<form action="${pageContext.request.contextPath}/member/chkReEmail.do" method="post" class="form-horizontal" id="chkReEmailFrm">
			<c:if test="${!empty chkEmail}"> 
				<div class="row form-group">
					<div class="col-sm-10">
						<input type="email" class="form-control" name="confirmEmail" id="confirmEmail" readonly value="${chkEmail}">
					</div>
				</div>
			<br />
			<div class="col-sm-8 pull-right">
				<button type="button" class="btn btn-warning" onclick="EditMail();">편집</button>
				<button type="button" class="btn btn-warning" onclick="reSendEmail();">재발송</button>
				<button type="button" class="btn btn-warning" onclick="sendChildValue('${chkEmail}')" id="okBtn">이 이메일 사용하기</button>
			</div>
			</c:if>
		</form>
	</div>
	<script>	
	
	// 메일인증 완료 후 확인 시 최종 검사 
	function sendChildValue(emailAddr){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/checkEmailConfirm.do",
			data:{emailAddr:emailAddr},
			dataType:"json",
			success:function(data){
				if(data.isOk=='Y'){
					
					$("#email", opener.document).removeClass("is-invalid");
					$("#email", opener.document).addClass('is-valid');
					$("#email", opener.document).removeClass('lastChk');
					
					if(!$("input", opener.document).hasClass('is-invalid') && !$("input", opener.document).hasClass('lastChk')){
						$("#email", opener.document).attr('disabled',false);
					}
					
					opener.setChildValue(emailAddr);
					window.close();
				}else if(data.isOk=='N'){
					alert('입력한 메일에서 링크로 인증해 주세요');
				}else{
					alert('작성한 이메일을 확인하고 인증해주세요');
				}
			},error: function(error, msg){
				alert('최종 메일 확인 에러 ');
			}
		});
	}
	
	// 메일 수정
	function EditMail(){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/deleteConfirmMail.do",
			data:{emailAddr:$('#confirmEmail').val()},
			dataType:"json",
			success: function(data){
				if(data.isDelete == true){
					window.opener.showPopup(); 
					setInterval("closeSelf()",100);
				}else{
					alert('키를 발급받지 않은 회원입니다.');					
				}
				
			}, error:function(error, msg){
				alert('메일 편집 에러');
			}
		});
	}

	//popup() 열릴 때 까지 기다렸다가 자기 자신을 닫기 위한 함수. 
	function closeSelf(){ 
	  if(EnrollJsp && !EnrollJsp.closed) 
	    self.close(); 
	} 

	// 인증번호 보내기 버튼
	function sendEmBtn(){
		if(!$('#chkEmail').hasClass('is-invalid') && !$('#chkEmail').hasClass('lastChk')){
			$('#sendMailFrm').submit();
		}else{
			alert('실제 사용하는 올바른 이메일을 입력해주세요!');
		}
	}
	
	// 재발송 버튼
	function reSendEmail(){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/deleteConfirmMail.do",
			data:{emailAddr:$('#confirmEmail').val()},
			dataType:"json",
			success: function(data){
				if(data.isDelete == true){
					$('#chkReEmailFrm').submit();
				}else{
					alert('실제 사용하는 올바른 이메일을 입력해주세요!');
				}
				
			}, error:function(error, msg){
				alert('메일  재전송 에러');
			}
		});
		
	}
	
	
	// 이메일 유효성 검사
	$('#chkEmail').on('keyup',function(){
		 var email = $('#chkEmail').val().trim();
			
			if(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(email)){
				$.ajax({
					url:"${pageContext.request.contextPath}/member/checkEmailDup.do",
					data:{email:email},
					dataType:"json",
					success: function(data){
						if(data.isUsable == true){ 
							$('#chkEmail').removeClass("is-invalid");
							$('#chkEmail').addClass('is-valid');
							$('#chkEmail').removeClass('lastChk');
							if(!$('input').hasClass('is-invalid') && !$('input').hasClass('lastChk')){
						 		$('#smBtn').attr('disabled',false);
						 	}
						}else{
							$('#chkEmail').removeClass("is-valid");
							$('#chkEmail').addClass('is-invalid');
							$('#wrnMsg4').text('이미 등록된 이메일 입니다.');
						}
						
					}, error:function(error, msg){
						alert('이메일 중복 체크 에러');
					}
				});
					
			}else{
				$('#chkEmail').removeClass("is-valid");
				$('#chkEmail').addClass('is-invalid');
				$('#wrnMsg4').text('이메일 형식을 확인해 주세요!');
			}
	 });
	
	</script>
</body>
</html>