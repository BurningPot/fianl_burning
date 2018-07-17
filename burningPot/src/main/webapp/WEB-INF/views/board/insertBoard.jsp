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
	<form id="insertForm" action="#" method="post">
		<div class="container containerTop col-sm-8 " align="center"
			style="margin-top: 5%;">
			<h1 align="left">게시판</h1>
			<p align="left">
				<i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지
					않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i>
			</p>
			<br />

			<table class="table" style="table-layout: fixed">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%"/>
					<col width="15%"/>
				</colgroup>

				<tbody>
					<tr>
						<th>구분</th>
						<td>
							<div class="form-group">
								<select id="searchCondition" class="form-control">
									<option selected>선택 하세요</option>
									<option value="noti">[공지사항]</option>
									<option value="qa">Q&A</option>
									<option value="qa">재료신청</option>
									<option value="ex">기타</option>
								</select>
							</div>
						</td>
						<td> </td>
						<th>작성자</th>
						<td>
							<div class="form-group">
								<input type="text" name="user_id" value="${m.getmName()}" class="form-control" readonly/>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">제목</th>
						<td colspan="4"><input type="text" name="b_title" id="b_title"
							class="form-control"></td>
					</tr>
					<tr>
						<td colspan="5">
							<div id="summernote"></div>
						</td>
					</tr>
					<tr style="border-bottom: none;">
						<td colspan="5" align="right">
							<input type="reset" class="btn btn-success " onclick="getList();"value="목록">
							<input type="button" class="btn btn-success " onclick="valueChk();" value="저장">
						</td>	
					</tr>
				</tbody>
			</table>

		</div>
	</form>


	<script>
		/*summernote 설정 */
		$(document).ready(function() {
			$('#summernote').summernote({
				lang : 'ko-KR', // default: 'en-US'
				placeholder : 'Hello bootstrap 4',
				height : 300,
				focus : true
			});
		});
		
		function getList(){
			if (confirm("목록으로 돌아가면 작성하던 것이 삭제됩니다. 목록으로 가시겠습니까?") == true){//확인
				location.href='${pageContext.request.contextPath}/board/boardList.do';
        	}else{//취소
        	    return;
        	}
			
		}
	</script>
	
</body>
</html>