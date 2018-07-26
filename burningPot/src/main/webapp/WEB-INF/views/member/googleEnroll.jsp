<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<!-- custom css -->
<link
	href="${pageContext.request.contextPath }/resources/css/board/board.css"
	rel="stylesheet">
</head>
<body>
	<div style="height: 20%;"></div>

	<div class="contatiner">
		<br />
		<div class="text-center">
			<h2>
				<i class="fas fa-utensils"></i> 구글 아이디로 로그인
			</h2>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-9 text-center">
				<form class="form-horizontal" name="memberEnrollFrm"
					action="${pageContext.request.contextPath}/member/memberEnrollGoogle.do" method="post"
					onsubmit="return validate();">
					
					<input type="hidden" name="mId" value="${member.mId}" />
					<input type="hidden" name="password" value="${member.password}" />
					<input type="hidden" name="mPicture" value="${member.mPicture}" />
					
					<div class="form-group row">
						<label for="userName" class="col-sm-2 control-label">닉네임</label>
						<div class="col-sm-5">
							<input type="text" class="form-control lastChk" name="mName"
								id="userName" required>
							<div class="invalid-feedback text-left">
								<p id="wrnMsg3"></p>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="col-sm-2 control-label">이메일</label>
						<div class="col-sm-5 row">
							<div class="col-sm-9">
								<input type="email" class="form-control lastChk" name="email"
									id="email" placeholder="로그인한 구글 이메일로 입력해주세요" required>
								<div class="invalid-feedback text-left">
									<p id="wrnMsg4"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="gender" class="col-sm-2 control-label">성별</label>
						<div class="col-sm-4 text-center">
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" name="gender"
									id="gender0" value="M" required="required"> <label
									for="gender0">남</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" class="form-check-input" name="gender"
									id="gender1" value="F" required="required"> <label
									for="gender1">여</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="birth" class="col-sm-2 control-label">생년월일</label>
						<div class="col-sm-5">
							<input type="text" class="form-control lastChk" name="birth"
								id="birth" placeholder="생년월일을 입력해주세요! ex) YYMMDD" required
								onkeyup="isAbled(this);">
							<div class="invalid-feedback text-left">
								<p id="wrnMsg5"></p>
							</div>
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
		$(function() {
			var mName = '${member.mName}';
			var email = '${member.email}';
			var gen = '${member.gender}';
			var bir = '${member.birthDate}';

			console.log(mName + ", " + email + ", " + gen + ", " + bir);

			if (mName) {
				$('#userName').val(mName);
				$('#userName').removeClass("is-invalid");
				$('#userName').addClass('is-valid');
				$('#userName').removeClass('lastChk');
				if (!$('input').hasClass('is-invalid')
						&& !$('input').hasClass('lastChk')) {
					$('#smBtn').attr('disabled', false);
				}
			}

			if (email) {
				$('#email').val(email);
				$('#email').removeClass("is-invalid");
				$('#email').addClass('is-valid');
				$('#email').removeClass('lastChk');
				if (!$('input').hasClass('is-invalid')
						&& !$('input').hasClass('lastChk')) {
					$('#smBtn').attr('disabled', false);
				}
			}

			if (bir) {
				var yymmdd = '${member.birthDate}';
				var list = yymmdd.split("-");
				var yy = list[0].substring(2, 4);
				$('#birth').val(yy + list[1] + list[2]);
				$('#birth').removeClass("is-invalid");
				$('#birth').addClass('is-valid');
				$('#birth').removeClass('lastChk');
				if (!$('input').hasClass('is-invalid')
						&& !$('input').hasClass('lastChk')) {
					$('#smBtn').attr('disabled', false);
				}
			}

			if (gen) {
				if (gen == 'M') {
					$('#gender1').attr('checked', false);
					$('#gender0').attr('checked', true);
				} else if (gen == 'F') {
					$('#gender0').attr('checked', false);
					$('#gender1').attr('checked', true);
				}
			}

		});

		$('#email')
				.on(
						'keyup',
						function() {
							var email = $('#email').val().trim();

							if (/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
									.test(email)) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/member/checkEmailDup.do",
											data : {
												email : email
											},
											dataType : "json",
											success : function(data) {
												if (data.isUsable == true) {
													$('#email').removeClass(
															"is-invalid");
													$('#email').addClass(
															'is-valid');
													$('#email').removeClass(
															'lastChk');
													if (!$('input').hasClass(
															'is-invalid')
															&& !$('input')
																	.hasClass(
																			'lastChk')) {
														$('#smBtn').attr(
																'disabled',
																false);
													}
												} else {
													$('#email').removeClass(
															"is-valid");
													$('#email').addClass(
															'is-invalid');
													$('#wrnMsg4').text(
															'이미 등록된 이메일 입니다.');
												}

											},
											error : function(error, msg) {
												alert('이메일 중복 체크 에러');
											}
										});

							} else {
								$('#email').removeClass("is-valid");
								$('#email').addClass('is-invalid');
								$('#wrnMsg4').text('이메일 형식을 확인해 주세요!');
							}
						});

		// 이름 유효성 검사
		$('#userName')
				.on(
						'keyup',
						function() {
							if (/^([가-힣a-zA-Z]{2,10})$/.test($('#userName')
									.val())) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/member/checkNameDup.do",
											data : {
												mName : $('#userName').val()
											},
											dataType : "json",
											success : function(data) {
												if (data.isUsable == true) {
													$('#userName').removeClass(
															"is-invalid");
													$('#userName').addClass(
															'is-valid');
													$('#userName').removeClass(
															'lastChk');

													if (!$('input').hasClass(
															'is-invalid')
															&& !$('input')
																	.hasClass(
																			'lastChk')) {
														$('#smBtn').attr(
																'disabled',
																false);
													}
												} else {
													$('#userName').removeClass(
															"is-valid");
													$('#userName').addClass(
															'is-invalid');
													$('#wrnMsg3').text(
															'이미 존재하는 닉네임입니다.');
												}

											},
											error : function(error, msg) {
												alert('닉네임 중복 체크 에러');
											}
										});
							} else {
								$('#userName').removeClass("is-valid");
								$('#userName').addClass('is-invalid');
								$('#wrnMsg3').text(
										'닉네임을 2-10 글자 사이로 정해주세요, 특수 X');
							}

						});

		// 생년월일 유효성 검사
		$('#birth')
				.on(
						'keyup',
						function() {
							var regexp = /^[0-9][0-9](([0][0-9])|([1][0-2]))([0][0-9]|([1-2][0-9])|[3][0-1])$/;
							birth = $('#birth').val();

							if (regexp.test(birth)) {
								$('#birth').removeClass("is-invalid");
								$('#birth').addClass('is-valid');
								$('#birth').removeClass('lastChk');

								if (!$('input').hasClass('is-invalid')
										&& !$('input').hasClass('lastChk')) {
									$('#smBtn').attr('disabled', false);
								}
							} else {
								$('#birth').removeClass("is-valid");
								$('#birth').addClass('is-invalid');
								$('#wrnMsg5').text(
										'양식을 확인해 주세요(년/월/일) -> yy/mm/dd');
							}
						});

		//빈 칸 검사
		function isAbled(obj) {
			if ($(obj).val().trim().length < 2) {
				$(obj).removeClass("is-valid");
				$(obj).addClass('is-invalid');

			} else {
				$(obj).removeClass("is-invalid");
				$(obj).addClass('is-valid');
				$(obj).removeClass('lastChk');
				if (!$('input').hasClass('is-invalid')
						&& !$('input').hasClass('lastChk')) {
					$('#smBtn').attr('disabled', false);
				}
			}
		}

		/* 회원가입 최종 검사 */
		function validate() {
			console.log($('#chkEmail').val() + ", " + $('#userName').val()
					+ ", " + $('#birth').val());
		}
	</script>

</body>
</html>