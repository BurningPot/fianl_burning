<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<c:set var="pi" value="${ requestScope.pi }"/>
<c:set var="listCount" value="${ pi.listCount }"/>
<c:set var="currentPage" value="${ pi.currentPage }"/>
<c:set var="maxPage" value="${ pi.maxPage }"/>
<c:set var="startPage" value="${ pi.startPage }"/>
<c:set var="endPage" value="${ pi.endPage }"/>


<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
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
				<i class="fas fa-utensils"></i>  게시판
			</h2>
		</div>
		<div class="container containerTop">

				<div class="form-group row col-sm-12 custyle justify-content-sm-center">
					<!-- 검색 영역 -->
					<div class="col col-sm-2">
						<select class="form-control" id="searchCondition" name="searchCondition">
							<option selected>선택하기</option>
							<option value="sAll">전체</option>
							<option value="sTit">제목</option>
							<option value="sEnt">내용</option>
							<option value="sCon">제목+내용으로 검색</option>
							<option value="sMem">작성자로 검색</option>
						</select>
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="search" class="form-control pressEnt" placeholder="검색 하기 " id="searchBoard" name="searchBoard"> 
							<button class="btn btn-secondary input-group-btn" type="button" onclick="searchBoard();">검색</button>
						</div> 
					</div>
				</div>
		
			<br />
			<div class="row">
				<div class="col-sm-3 text-left">
					<p>총 ${listCount}건의 게시물이 있습니다.</p>
				</div>
				<div class="form-group col-sm-7 row text-center">
					<div class="col col-sm-12">
					 <div class="form-check form-check-inline" id="radioOption">
					 	<input type="radio" class="form-check-input" name="radioOption" id="radioOption0" value="allCon">
						<label for="radioOption0">전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="form-check-input" name="radioOption" id="radioOption1" value="noti">
						<label for="radioOption1">공지사항</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="form-check-input" name="radioOption" id="radioOption2" value="qna">
						<label for="radioOption2">Q&A</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="form-check-input" name="radioOption" id="radioOption3" value="ingre">
						<label for="radioOption3">재료요청</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="form-check-input" name="radioOption" id="radioOption4" value="ex">
						<label for="radioOption4">기타</label>
					  </div>
					</div>
				</div>
			 
				<div class="col-sm-2 text-right">
					<button class="btn btn-info" onclick="insertBoard();">글쓰기</button>
					<input type="hidden" id="mNum" value="${m.mNum}"/>
				</div>
			</div>
				<!-- 검색 끝 -->
			<c:if test="${listCount != 0}">
				<table
					class="table table-striped custab table-hover tableList table-responsive-sm"
					id="tbl-board">
					<thead>
						<tr>
							<th>No</th>
							<th>구분</th>
							<th class="text-center">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변여부</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="b">
						<tr id="${b.bNum}">
							<td>${b.bNum}</td>
							<c:if test="${b.category eq '공지사항'}">
								<td>[${b.category}]</td>
							</c:if>
							<c:if test="${b.category ne '공지사항'}">
								<c:if test="${b.category eq 'QNA'}">
									<td>Q&A</td>
								</c:if>
								<c:if test="${b.category ne 'QNA'}">
									<td>${b.category}</td>
								</c:if>	
							</c:if>
							
							<td>
								<c:if test="${fn:length(b.bTitle)>30}">
									${fn:substring(b.bTitle,0,30)} . . .
								</c:if>
								<c:if test="${fn:length(b.bTitle)<=30}">
									${b.bTitle}
								</c:if>
								<c:if test="${sysDate eq b.bDate}">
									<sup><span style="font-size:18px; color:red; text-shadow:2px 2px white;">new</span></sup>
								</c:if>
							</td>
							<td>
								<c:if test="${fn:length(b.mName)>6}">
									${fn:substring(b.mName,0,5)} . . .
								</c:if>
								<c:if test="${fn:length(b.mName)<=5}">
									${b.mName}
								</c:if>
							</td>
							<td>${b.bDate}</td>
							<c:if test="${b.category eq '공지사항'}">
								<td></td>
							</c:if>
							<c:if test="${b.category ne '공지사항'}">
								<td>${b.reply}</td>
							</c:if>
							<td>${b.bCount}</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징처리할 부분 -->
				
					<div class="pagingArea col-lg-12" >
					<ul class="pagination justify-content-center">
						<!-- 가장 첫 페이지로 이동 -->
						<li class="page-item">
							<a class="page-link" href="${ pageContext.request.contextPath }/board/boardList.do?currentPage=1&searchBoard=${searchBoard}&searchCondition=${searchCondition}&searchType=${searchType}">처음</a>
						</li>
						
					<!-- 한페이지 씩 앞으로 이동 -->
					<c:if test="${ currentPage <= 1 }">
						<li class="page-item disabled">
							<a class="page-link" href="#">&lt;</a>
						</li>
					</c:if>
					<c:if test="${ currentPage > 1 }">
						<li class="page-item ">
							<a class="page-link" href="${ pageContext.request.contextPath }/board/boardList.do?currentPage=${ currentPage-1 }&searchBoard=${searchBoard}&searchCondition=${searchCondition}&searchType=${searchType}">&lt;</a>
						</li>
					</c:if>
					
					<!-- 각 페이지 별 리스트 작성 -->
					
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i eq currentPage }">
							<li class="page-item active">
								<a class="page-link" href="#">${i}</a>
							</li>
						</c:if>
						<c:if test="${ !(i eq currentPage) }">
							<li class="page-item">
								<a class="page-link" href="${ pageContext.request.contextPath }/board/boardList.do?currentPage=${ i }&searchBoard=${searchBoard}&searchCondition=${searchCondition}&searchType=${searchType}">${ i }</a>
							</li>
						</c:if>
						
					</c:forEach>
					
					<!-- 한페이지 씩 뒤로 이동 -->
					<c:if test="${currentPage >= maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#">&gt;</a>
						</li>
					</c:if>
					<c:if test="${currentPage < maxPage }">
						<li class="page-item">
							<a class="page-link" href="${ pageContext.request.contextPath }/board/boardList.do?currentPage=${ currentPage +1 }&searchBoard=${searchBoard}&searchCondition=${searchCondition}&searchType=${searchType}">&gt;</a>
						</li>
					</c:if>
					
					<!-- 가장 마지막 페이지로 이동 -->
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/board/boardList.do?currentPage=${ maxPage }&searchBoard=${searchBoard}&searchCondition=${searchCondition}&searchType=${searchType}">마지막</a>
					</li>
					
					</ul>
					</div>
			</c:if>
			<c:if test="${listCount == 0}">
			<br /><br /><br />
				<div class="row text-center">
					<div class="col-sm-12">
						<p style="color:red; font-size:20px; font-weight: bold;">검색된 게시물이 없습니다. <br />검색조건을 확인 후 다시 검색해주세요!!</p>
					</div>
				</div>
			</c:if>
		</div>
	</div>
<script>
	$('.pressEnt').keypress(function(event) {
	    if (event.key === "Enter") {
	    	searchBoard();
	    }
	});

	$(function(){
		var sb = '${searchBoard}';
		var sc = '${searchCondition}';
		var st = '${searchType}';
		
		if(sb) $('#searchBoard').val(sb);
		if(sc) $('#searchCondition').val(sc);
		
		if (st) {
			if (st == 'allCon') {
				$('#radioOption1').attr('checked', false);
				$('#radioOption2').attr('checked', false);
				$('#radioOption3').attr('checked', false);
				$('#radioOption4').attr('checked', false);
				$('#radioOption0').attr('checked', true);
			} else if (st == 'noti') {
				$('#radioOption0').attr('checked', false);
				$('#radioOption2').attr('checked', false);
				$('#radioOption3').attr('checked', false);
				$('#radioOption4').attr('checked', false);
				$('#radioOption1').attr('checked', true);
			}else if (st == 'qna') {
				$('#radioOption1').attr('checked', false);
				$('#radioOption0').attr('checked', false);
				$('#radioOption3').attr('checked', false);
				$('#radioOption4').attr('checked', false);
				$('#radioOption2').attr('checked', true);
			}else if (st == 'ingre') {
				$('#radioOption1').attr('checked', false);
				$('#radioOption2').attr('checked', false);
				$('#radioOption0').attr('checked', false);
				$('#radioOption4').attr('checked', false);
				$('#radioOption3').attr('checked', true);
			}else if (st == 'ex') {
				$('#radioOption1').attr('checked', false);
				$('#radioOption2').attr('checked', false);
				$('#radioOption3').attr('checked', false);
				$('#radioOption0').attr('checked', false);
				$('#radioOption4').attr('checked', true);
			}
		}

	});
	
	$('#radioOption').on("click",function(){
		var st = $(":input:radio[name=radioOption]:checked").val();
		console.log(st);
		location.href="${pageContext.request.contextPath}/board/boardList.do?searchBoard="+$('#searchBoard').val()+"&searchCondition="+$('#searchCondition').val()+"&searchType="+st;
	});

	function searchBoard(){
		var st = $(":input:radio[name=radioOption]:checked").val();
		location.href="${pageContext.request.contextPath}/board/boardList.do?searchBoard="+$('#searchBoard').val()+"&searchCondition="+$('#searchCondition').val()+"&searchType="+st;
	}
	
	
	   $("tr[id]").on("click",function(){
	      var boardNo = $(this).attr("id");
	      location.href = "${pageContext.request.contextPath}/board/boardDetail.do?no="+boardNo;
	   }).hover(function(){
		   $(this).css('cursor','pointer');
	   });
	   
	function insertBoard(){
		if( $('#mNum').val() == null ||$('#mNum').val() ==""){
			alert('로그인 후 이용하실 수 있습니다.');
			$("#loginModal").modal();
		}else location.href='${pageContext.request.contextPath}/board/insertBoard.do';
	}
	
	
	
	
</script>
</body>
</html>