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
	<form id="updateFrm" action="${pageContext.request.contextPath}/board/updateBoardEnd.do" method="post">
		<div class="container containerTop col-sm-6 col-sm-offset-3">
			<h1 align="left">게시글 수정</h1>
			<p><!-- sd -->
				<i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은
					글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i>
			</p>
			<br />
			<div class="row">
				<table class="table tableDetil"
					style="text-align: left;">
					<colgroup>
						<col width="10%">
						<!-- 글 번호 -->
						<col width="15%">
						<col width="10%">
						<!--  제목   -->
						<col width="20%">
						<!-- 작성자 -->
						<col width="10%">
						<col width="30%"/>
						
					</colgroup>
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>${board.category}</td>
							<th>작성자</th>
							<td>${board.mName}</td>
							<input type="hidden" name="mNum" value="${board.mNum}" />
							<th>작성시간</th>
							<td>${board.bDate}</td>
						</tr>
						<tr>
							<div class="form-group">
								<th>제목</th>
								<td colspan="3"><input type="text" id="bTitle" name="bTitle" value="${board.bTitle}" class="form-control" />
								<input type="hidden" name="bNum" id="bNum" value="${board.bNum}"></td>
							</div>	
								<th>조회수</th>
								<td>${board.bCount}</td>
						</tr>
						<tr>
							<td colspan="6"
								style="min-height: 200px; text-align: left; border-bottom: 2px solid #a1a1a1;">
								<div id="summernote">${board.bContent}</div>
								<input type="hidden" id="bContent" name="bContent"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<input type="button" class="btn btn-warning " onclick="goBoardDetail();" value="취소">
				<input type="button" class="btn btn-warning " onclick="updateBoard();" value="저장">
			</div>
		</div>
	</form>
	<script>
	function goBoardDetail(){
		if (confirm("돌아가시면 작성하던 것이 저장되지 않습니다. 돌아 가시겠습니까?") == true){//확인
			location.href='${pageContext.request.contextPath}/board/boardDetail.do?no='+$('#bNum').val();
    	}else{//취소
    	    return;
    	}
	}
	
	function updateBoard(){
		if( $('#bTitle').val()==null || $('#bTitle').val()==""){
			alert('제목을 입력해 주세요!');
			 $('#bTitle').focus();
		}else if( $('#summernote').summernote('code')=='<p><br></p>' || $('#summernote').summernote('code').trim()==null){
			alert('본문을 입력해주세요!');
		}else{
			$('#bContent').val($('#summernote').summernote('code'));
			$('#updateFrm').submit();
		}
	}
	
	 $('#summernote').summernote({
	        lang : 'ko-KR', // default: 'en-US'
	        tabsize: 2,
	        height: 300,
	        focus : true,
	        toolbar: [
		        // [groupName, [list of button]]
		        ['style', ['bold', 'italic', 'underline', 'clear']],
		        ['font', ['strikethrough', 'superscript', 'subscript']],
		        ['fontsize', ['fontsize']],
		        ['color', ['color']],
		        ['para', ['ul', 'ol', 'paragraph']],
		        ['height', ['height']]
	    	]
	  });

	</script>

</body>
</html>