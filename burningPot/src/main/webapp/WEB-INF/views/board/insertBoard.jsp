<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>

<!-- custom css -->
<link href="${pageContext.request.contextPath }/resources/css/board/board.css" rel="stylesheet">

</head>
<body>
	<div style="height: 20%;"></div>
	<form id="insertFrm" action="${pageContext.request.contextPath}/board/insertBoardEnd.do" method="post">
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
								<select id="category" class="form-control" name="category">
									<option selected>선택하세요</option>
									<c:if test="${m.mCategory eq '관리자'}">
										<option value="공지사항">공지사항</option>
									</c:if>
									<option value="QNA">Q&A</option>
									<option value="재료요청">재료요청</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</td>
						<td> </td>
						<th>작성자</th>
						<td>
							<div class="form-group">
								<input type="text" name="mName" value="${m.mName}" class="form-control" readonly/>
								<input type="hidden" name="mNum" value="${m.mNum}" />
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">제목</th>
						<td colspan="4"><input type="text" name="bTitle" id="bTitle"
							class="form-control"></td>
					</tr>
					<tr>
						<td colspan="5">
							<div id="summernote"></div>
							<input type="hidden" id="bContent" name="bContent"/>
						</td>
					</tr>
					<tr style="border-bottom: none;">
						<td colspan="5" align="right">
							<input type="reset" class="btn btn-success " onclick="getList();"value="목록">
							<input type="button" class="btn btn-success " onclick="insertText();" value="저장">
						</td>	
					</tr>
				</tbody>
			</table>

		</div>
	</form>


	<script>
		/*summernote 설정 */
 		 $('#summernote').summernote({
			        //placeholder: 'ㅋㅋ',
			        
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

		 /* $(document).ready(function() {
			 $('#summernote').summernote({
				// lang : 'ko-KR', // default: 'en-US' 
				placeholder : 'Hello bootstrap 4',
				height : 300,
				focus : true
			}); 
		});  */
		
		function getList(){
			if (confirm("목록으로 돌아가면 작성하던 것이 삭제됩니다. 목록으로 가시겠습니까?") == true){//확인
				location.href='${pageContext.request.contextPath}/board/boardList.do';
        	}else{//취소
        	    return;
        	}
		}
		
		function insertText(){
			if( $('#bTitle').val()==null || $('#bTitle').val()==""){
				alert('제목을 입력해 주세요!');
				 $('#bTitle').focus();
				 
			}else if($('#category').val()=='선택하세요' || $('#category').val()==null || $('#category').val()==""){
				alert('카테고리를 선택해주세요!');
				$('#category').focus(); 
			}else if( $('#summernote').summernote('code')=='<p><br></p>' || $('#summernote').summernote('code').trim()==null){
				alert('본문을 입력해주세요!');
			}else{
				$('#bContent').val($('#summernote').summernote('code'));
				$('#insertFrm').submit();
			}
		}
		
	</script>
	
</body>
</html>