<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="/WEB-INF/views/admin/adminBoard_Detail.jsp"/>

<style>
	.ingSearchContent{	
		padding-top: 5%;
		text-align: center;
		font-weight: bold;
		font-size: 150%;
	}
	.modal-body{
		max-height: 600px;
		overflow-y: auto;		
	}
	.modalTitle{
		margin-top: 3%;
		padding-bottom: 1.5%;
		border-bottom: 1px solid lightgray;
	}
	.resultContents{
		border-bottom: 1px solid lightgray;
		padding-bottom: 1.5%; 
		padding-top: 1.5%;
	}
	.search-no-result{
		text-align: center;
		font-size: 150%;
		font-weight: bold;
	}
	.no-result-icon{
		color: red;
		margin: 2%;
	}

</style>

<div class="modal fade searchIngredient" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      	<div class="modal-header">
        <h5 class="modal-title">재료 간단 검색</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modalTitle">
      	<div class="row">
      		<div class="col-lg-8 offset-lg-2">
				<input type="text" class="form-control" id="searchKeyword"/>
      		</div>
      		<div class="col-lg-2">
      			<i class="fa fa-search search-ing-btn" style="font-size:36px"></i>
      		</div>
      	</div>
      </div>
      <div class="modal-body search-ing-result">
      
		<div class="col-lg-12 resultContents">
			<ol>
				<li>검색어를 입력해주세요!</li>
				<li>아무것도 입력하지 않을 경우 전체 재료가 검색됩니다</li>
			</ol>
		</div>
		
		<script>
			$('.search-ing-btn').on('click',function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/searchIngredientAjax.do",
					dataType: "json",
					data: {
						keyword: $('#searchKeyword').val()
					}, success: function(data){
						console.log(data);
						console.log(data.length);
						
						var html ="";
						var htmlNoResult = "";
						
						if(data.length == 0){
							htmlNoResult = '<div class="col-lg-12 no-result-icon" align="center"><i class="fas fa-exclamation-triangle fa-3x"></i></div><div class="col-lg-12 search-no-result">검색 결과가 존재하지 않습니다</div>';
							console.log(htmlNoResult);
							$('.search-ing-result').empty();
							$('.search-ing-result').append(htmlNoResult);
						}else{							
							for(var i =0 ; i< data.length; i++){
								html += '<div class="col-lg-12 resultContents">';
								html += '<span class="row">';
								html += '<span class="col-lg-5 ingSearchImg">';
								html += '<img src="${pageContext.request.contextPath}/resources/img/ingredient/'+data[i].iImage+'" class="col-lg-12" alt=""/>';
								html += '</span>';
								html += '<span class="col-lg-7 ingSearchContent test">';
								html += data[i].iName;
								html += '</span></span></div>';							
							}
							
							$('.search-ing-result').empty();
							$('.search-ing-result').append(html);							
						}	
					}, error: function(data){
						console.log("재료검색 실패!");
					}
				});
			});
		
		</script>
			
				
      </div>
      <div class="modal-footer justify-content-center">        
        <button type="button" class="btn btn-primary">재료추가하러가기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


</html>