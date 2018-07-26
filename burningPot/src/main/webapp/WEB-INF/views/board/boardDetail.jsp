<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>게시판 상세보기</title>
<!-- custom css -->
<link
	href="${pageContext.request.contextPath}/resources/css/board/board.css"
	rel="stylesheet">
</head>
<body>
	<div style="height: 20%;"></div>
	
	<!-- 게시판 본문 -->
	<div class="container containerTop col-sm-6 col-sm-offset-3">
		<h1 align="left">게시판 상세보기</h1>
		<p><!-- sd -->
			<i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은
				글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i>
		</p>
		<div class="row">
			<table class="table tableDetil"
				style="text-align: left;">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="25%">
					<col width="10%">
					<col width="20%"/>
				</colgroup>
				<tbody>
					<tr>
						<c:set var="mPic" value="${board.mPicture}" />
						<td colspan="6" style="font-weight: bold; border-top-style:none;">
							
							<c:if test="${fn:contains(mPic, 'https:')}">
								<img src="${board.mPicture}" class="rounded-circle" alt="Cinque Terre" width="70px" height="70px">&nbsp;&nbsp;&nbsp;${board.mName}
							</c:if>
							<c:if test="${!fn:contains(mPic, 'https:')}">
								<img src="${pageContext.request.contextPath}/resources/img/profile/${board.mPicture}" class="rounded-circle" alt="Cinque Terre" width="70px" height="70px">&nbsp;&nbsp;&nbsp;${board.mName}
							</c:if>
							
						</td>
					</tr>
					<tr align="center">
						<input type="hidden" name="mNum" value="${board.mNum}" />
						<th>카테고리</th>
						<c:if test="${board.category eq '공지사항'}">
							<td>[${board.category}]</td>
						</c:if>
						<c:if test="${board.category ne '공지사항'}">
							<c:if test="${board.category eq 'QNA'}">
								<td>Q&A</td>
							</c:if>
							<c:if test="${board.category ne 'QNA'}">
								<td>${board.category}</td>
							</c:if>	
						</c:if>
						<th>작성시간</th>
						<td>${board.bDate} 15:30</td>
						<th>조회수</th>
						<td>${board.bCount}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${board.bTitle}</td>
						<input type="hidden" name="bNum" id="bNum" value="${board.bNum}">
					</tr>

					<tr>
						<td colspan="6"
							style="min-height: 200px; text-align: left; border-bottom: 2px solid #754F44;">
							<p>
								${board.bContent}
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="text-right">
			<c:if test="${m.mNum eq board.mNum}">
				<input type="button" class="btn btn-warning "onclick="updateBoard();" value="수정">
				<input type="button" class="btn btn-danger " onclick="deleteBoard(); " value="삭제">
			</c:if>
			<input type="button" class="btn btn-success " onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'" value="목록">
		</div>
	</div>
	<!-- 게시판 본문 끝 -->
	<br /><br />
	
	<!-- 댓글 -->
	<div class="container col-sm-6 col-sm-offset-3 ">
		
		<div class="row">
			<table class="table">
				<tbody>
					<c:if test="${!empty boardComList}">
						<c:forEach items="${boardComList}" var="bc">
							<div style="border-radius: 25px;">
								<tr>
									<input type="hidden" name="bcmNum" value="${bc.mNum}"/>
									<th width="10%" rowspan="2">
									<c:if test="${!fn:contains(mPic, 'https:')}">
										<img src="${pageContext.request.contextPath}/resources/img/profile/${bc.mPicture}" class="rounded-circle" alt="Cinque Terre" width="50px" height="50px">
									</c:if>
									<c:if test="${fn:contains(mPic, 'https:')}">
										<img src="${bc.mPicture}" class="rounded-circle" alt="Cinque Terre" width="50px" height="50px">
									</c:if>
									</th>
									<th width="35%" style="color:#754F44; font-weight: bold;">${bc.mName}</th>
									<th width="22%" align="right">
										<c:if test="${bc.mNum eq m.mNum}">
											<input type="hidden" id="bcNum" name="bcNum" value="${bc.bcNum}">
											<input type="button" class="btn btn-outline-warning btn-sm" value="수정" onclick="updateBoardComment(this);"> 
											<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="deleteBoardComment(this);">
										</c:if>
									</th>
									<td width="33%" align="right">2018.12.30 15:31</td>
									<%-- <td width="30%" align="center">${bc.bcDate}</td> --%>
								</tr>
								<tr>
									<td colspan="3" id="befContent">${bc.bcContent}</td>
								</tr>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty boardComList}">
						<td align="center">작성된 댓글이 없습니다.</td>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/board/InsertBoardComment.do" method="post" id="insertComentFrm">
		<div class="container col-sm-6 col-sm-offset-3" >
		<label><h4><i class="far fa-edit"></i> 댓글달기</h4></label>
			<div class="form-group">
				<input type="hidden" name="mNum" value="${m.mNum}" /> <input type="hidden" name="bNum" value="${board.bNum}"/><input type="hidden" name="mId" value="${m.mId}" id="mmId" />
				<textarea style="height: 80px;" name="bcContent" id="bcContent" class="form-control"></textarea>
			</div>
			<div class="row">
				<div class="text-left col-sm-6">
				</div>
				<div class="text-right col-sm-6">
					<button class="btn btn-outline-warning btn-sm" type="button" onclick="insertComment();">등록</button>
				</div>
			</div>
		</div>
	</form>

	<form action="${pageContext.request.contextPath}/board/updateBoardComment.do" method="post" id="updateComFrm">
		<div class="container col-sm-6 col-sm-offset-3"
			id="modifyCommentContent" style="display: none;" >
			<div class="row">
				<div class="form-group col-sm-5">
					<label id="subject"><h3><i class="far fa-edit"></i> 댓글 수정하기</h3></label>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
						<input type="hidden" name="bcNum" id="updateBcNum" /><input type="hidden" name="bNum" value="${board.bNum}"/>
						<textarea style="height: 80px;" name="bcContent" id="updateContent"
							class="form-control"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="text-left col-sm-6"></div>
				<div class="text-right col-sm-6">
					<button class="btn btn-success " type="button" onclick="refresh();">취소</button>
					<button class="btn btn-success " type="button" onclick="updateComment();">수정</button>
				</div>
			</div>
		</div>
	</form>
	<br />
	<div class="container col-sm-6 col-sm-offset-3">
		<br /> <br /> <br /> <br />
		<hr style="border: 1px solid #754F44;" />
		<div class="row ">

			<table class="table" id="nextTable">
				<tbody>
					<tr>
						<th>이전글</th>
						<td align="center" onclick="prevBoard();" id="prevTd"><span>
								이전글이 없습니다.</span>
						</td>
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
	
	// 게시글 수정
	function updateBoard(){
		location.href="${pageContext.request.contextPath}/board/updateBoard.do?no="+$('#bNum').val();
	}
	
	// 게시글 삭제
	function deleteBoard(){
		if(confirm('글을 삭제 하시겠습니까?')==true){
			location.href="${pageContext.request.contextPath}/board/deleteBoard.do?no="+$('#bNum').val();
		}else{
			return;
		}
	}
	
	
	
	// 댓글 등록
	function insertComment(){
		if($('#mmId').val()==null || $('#mmId').val()==""){
			alert('로그인 후 이용하실 수 있습니다.');
			$("#loginModal").modal();
		}else{
			if($('#bcContent').val() == "" || $('#bcContent').val() ==null){
				alert('댓글을 입력 후 등록 해주세요!');
			}else{
				 $('#insertComentFrm').submit();
			}
		}
	}

	//댓글 삭제
	function deleteBoardComment(obj){
		console.log($(obj).parent().children().eq(0).val());
		 if(confirm('댓글을 삭제 하시겠습니까?')==true){
			location.href="${pageContext.request.contextPath}/board/deleteBoardComment.do?bNum="+$('#bNum').val()+"&bcNum="+$(obj).parent().children().eq(0).val();
		}else{
			return;
		}
	}
	
	// 댓글 수정 전 확인용 함수
	function updateBoardComment(obj){
		console.log('댓글 번호 : '+$(obj).parent().children().eq(0).val());
		$('#insertComentFrm').css("display","none");
		$('#modifyCommentContent').css("display","block");
		
		$('#updateContent').focus();
		$('#updateBcNum').val($(obj).parent().children().eq(0).val());
		$('#updateContent').val($(obj).parent().parent().next().children().text());
		
		$('*').removeClass('g');
		$(obj).parent().parent().next().children().addClass('g');
	}
	
	// 댓글 수정 완료 후 저장 버튼
	function updateComment(){
		
		$('#updateComFrm').submit();
		
	}

	// 새로고침
	function refresh() {
		if(confirm('댓글 수정을 취소하기겠습니까?')) location.reload();
		else return;
	}
	
	
	//이전 글, 다음 글 확인용  
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