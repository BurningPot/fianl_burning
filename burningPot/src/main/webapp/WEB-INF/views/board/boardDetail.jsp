<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>게시판 상세보기</title>
<!-- custom css -->
<link
	href="${pageContext.request.contextPath }/resources/css/board/board.css"
	rel="stylesheet">
</head>
<body>
	<div style="height: 20%;"></div>
	<div class="container containerTop col-sm-6 col-sm-offset-3">
		<h1 align="left">게시판 상세보기</h1>
		<p>
			<i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은
				글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i>
		</p>
		<br />
		<div class="row ">
			<table class="table tableDetil"
				style="text-align: left;">
				<colgroup>
					<col width="10%">
					<!-- 글 번호 -->
					<col width="50%">
					<!--  제목   -->
					<col width="10%">
					<!-- 작성자 -->
					<col width="30%">
					<!-- <!-- 작성일
					<col width="10%">
					<col width="20%"> -->
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${board.bTitle}<input type="hidden" name="b_no" value="${board.bNum}"></td>
						<th>작성시간</th>
						<td>${board.bDate}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.mName}</td>
						<th>조회수</th>
						<td>${board.bCount}</td>
					</tr>

					<tr>
						<td colspan="6"
							style="min-height: 200px; text-align: left; border-bottom: 2px solid #a1a1a1;">
							<%-- <p style="word-wrap: break-word; white-space: pre-wrap; white-space: -moz-pre-wrap; white-space: -pre-wrap; white-space: -o-pre-wrap; word-break: break-all; background-color: white; border: none;">
								${board.bContent}
							</p> --%>
							<p>
								${board.bContent}
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="text-right">
			<input type="button" class="btn btn-warning "onclick="goUpdateView();" value="수정">
			<input type="button" class="btn btn-warning " onclick="goBoardDelete(); " value="삭제">
			<input type="button" class="btn btn-warning " onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'" value="목록">
		</div>
	</div>
	<br /><br />
	<div class="container col-sm-6 col-sm-offset-3 ">
		<h3>
			<i class="far fa-edit"></i> 답변
		</h3>
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<th>작성자</th>
						<td width="35%" align="center">사용자</td>
						<th>답변시간</th>
						<td width="35%" align="center">2018.06.05</td>
					</tr>
					<tr>
						<td colspan="4">감사합니다</td>
					</tr>
					<!-- 관리자일때만-->
					<tr>
						<td colspan="4" align="right" style="border-bottom: none;">
							<input type="hidden" id="c_no" name="c_no" value=5> <br /> 
							<input type="button" class="btn btn-warning btn-sm" value="수정" onclick="bCommentUpdate(this);"> 
							<input type="button" class="btn btn-warning btn-sm" value="삭제" onclick="bCommentDelete(this);">
						</td>
					</tr>
	
				</tbody>
			</table>
		</div>
	</div>
	<br />
	<br />
	<form action="#"
		method="post" id="addComment">
		<div class="container col-sm-6 col-sm-offset-3">
			<label id="subject"><h3><i class="far fa-edit"></i> 답변하기</h3></label>
			<div class="form-group">
				<input type="hidden" name="c_writer" value="사용자" /> <input type="hidden" name="b_no" value="5" />
				<textarea style="height: 150px;" name="c_content" id="c_content1" class="form-control"></textarea>
			</div>
			<div class="text-right">
				<button class="btn btn-warning btn-sm" type="submit">등록</button>
			</div>
		</div>
	</form>

	<form method="post">
		<div class="container col-sm-6 col-sm-offset-3" style="display: none;"
			id="modifyCommentContent">
			<div class="row">
				<label id="subject"><h3>
						<i class="far fa-edit"></i> 답변 수정하기
					</h3></label>
				<div class="form-group">
					<input type="hidden" name="b_no" value="5" />
					<textarea style="height: 150px;" name="c_content" id="c_content2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="row pull-right">
				<button class="btn btn-success " type="button" id="modifyComment">수정</button>
				&nbsp;
				<button class="btn btn-success " type="button" onclick="refresh();">취소</button>
			</div>
		</div>
	</form>
	<br />
	<div class="container col-sm-6 col-sm-offset-3">
		<br /> <br /> <br /> <br />
		<hr style="border: 1px solid #a1a1a1;" />
		<div class="row ">

			<table class="table" id="nextTable">
				<tbody>
					<tr>
						<th>이전글</th>
						<td align="center" onclick="prevBoard();" id="prevTd"><span>
								이전글이 없습니다.</span></td>
					</tr>

					<tr>
						<th>다음글</th>
						<td align="center" onclick="nextBoard();"><span> 다음글이없습니다.</span></td>
					</tr>
					
				</tbody>
			</table>

		</div>
	</div>

<script>
	// 새로고침
	function refresh() {

		location.reload();
	}

	// 댓글 내용 확인
	$('#addComment').submit(function() {
		if ($('#c_content1').val() == "") {
			alert('관리자! 답변 내용 입력하시오');
			$('#c_content1').focus();
			return false;
		}
	});

	$(function() {
		$('#nextTable tr td').mouseenter(function() {
			$(this).css({
				"background" : "#dedede",
				"cursor" : "pointer"
			});
		}).mouseleave(function() {
			$(this).css({
				"background" : "white"
			});
		})
	});
	function prevBoard() {
	
		alert('이전글이 없습니다.');
	
	}
	
	function nextBoard() {
	
		alert('다음글이 없습니다.');
	
	}
</script>
</body>
</html>