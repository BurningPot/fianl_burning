<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta charset="utf-8"/>
        <title>레시피 수정</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/RecipeUpdateForm.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-grid.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-reboot.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/recipe/RecipeUpdateForm.js"></script>
    </head>

    <body>
        <c:import url="/WEB-INF/views/common/header.jsp" />
        
		<div style="height: 20%;"></div>
        
        <div class="container">
	        <form id="formId" action="updateRecipe.do" method="POST" enctype="multipart/form-data" accept="image/*">
               	<!-- 레시피 정보 입력 영역 -->
                <div class="row recipeBox mt-5">
                    <div class="col-sm-9 pl-3 mt-3 mb-3 testCss">
                        <div class="input-group mt-3 align-self-center">
                            <label class="mb-0 align-self-center dataTitle" style="width:130px;" for="recipeTitle" id="recipeTitle-add"><b>레시피 제목</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="text" class="form-control textStyle" name="rName" placeholder="레시피 제목을 입력해주세요." aria-label="recipeTitle" aria-describedby="recipeTitle-add" value="${recipe.rName}">
                            <!-- 레시피 번호 -->
      							<input type="hidden" name="rNum" value="${recipe.rNum}" />
                        </div>
                        <div class="input-group mt-5">
                            <label class="mb-0 align-self-center dataTitle" style="width:130px;" for="recipeIntroduce" id="recipeIntroduce-add"><b>한줄 소개</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="text" class="form-control textStyle"  name="rIntro"placeholder="레시피를 소개해주세요. 예)맥주와 잘 어울리는 안주" aria-label="recipeIntroduce" aria-describedby="recipeIntroduce-add" value="${recipe.rIntro}">
                        </div>
                        <div class="input-group mt-5">
                            <label class="mb-0 align-self-center dataTitle" style="width:130px;" for="recipeData"><b>요리 정보</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <label class="mb-0 align-self-center"><b>인원</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <select class="custom-select selectStyle" name="quantity" id="people">
                                <option value="0" selected>인원</option>
                                	<option value="1" <c:if test="${recipe.quantity == 1}">selected</c:if>>1인분</option>
                                	<option value="2" <c:if test="${recipe.quantity == 2}">selected</c:if>>2인분</option>
                                	<option value="3" <c:if test="${recipe.quantity == 3}">selected</c:if>>3인분</option>
                                	<option value="4" <c:if test="${recipe.quantity == 4}">selected</c:if>>4인분</option>
                                	<option value="5" <c:if test="${recipe.quantity == 5}">selected</c:if>>5인분</option>
                                	<option value="6" <c:if test="${recipe.quantity == 6}">selected</c:if>>5인분 이상</option>
                            </select>
                            &nbsp;&nbsp;&nbsp;
                            <label class="mb-0 align-self-center"><b>시간</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <select class="custom-select selectStyle" name="rTime" id="cookTime">
                                <option value="0" selected>시간</option>
                                <option value="1" <c:if test="${recipe.rTime == 1}">selected</c:if>>10분 이내</option>
                                <option value="2" <c:if test="${recipe.rTime == 2}">selected</c:if>>20분 이내</option>
                                <option value="3" <c:if test="${recipe.rTime == 3}">selected</c:if>>30분 이내</option>
                                <option value="4" <c:if test="${recipe.rTime == 4}">selected</c:if>>60분 이내</option>
                                <option value="5" <c:if test="${recipe.rTime == 5}">selected</c:if>>60분 이상</option>
                            </select>
                            &nbsp;&nbsp;&nbsp;
                            <label class="mb-0 align-self-center"><b>난이도</b></label>
                            &nbsp;&nbsp;&nbsp;
                            <select class="custom-select selectStyle" name="rLevel" id="cookLevel">
                                <option value="0" selected>요리난이도</option>
                                <option value="1" <c:if test="${recipe.rLevel == 1}">selected</c:if>>아무나</option>
                                <option value="2" <c:if test="${recipe.rLevel == 2}">selected</c:if>>초급</option>
                                <option value="3" <c:if test="${recipe.rLevel == 3}">selected</c:if>>중급</option>
                                <option value="4" <c:if test="${recipe.rLevel == 4}">selected</c:if>>고급</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3 card align-self-center mt-3 mb-3" style="border:none;">
                        <img class="card-img titleImage" id="titleImgArea" src="${pageContext.request.contextPath}/resources/img/recipeContent/${recipe.rImg}" alt="대표사진">
                        <input type="file" id="titleImg" class="fileArea" name="rImgFile" onchange="LoadImg(this,1);">
       					<input type="hidden" name="originTitleImg" id="originTitleImg" value="${recipe.rImg}" />
                    </div>
                </div>  
                
                <!-- 레시피 재료 입력 영역 -->
                <div class="row recipeBox mt-2">
                    <div class="col-12 pl-3 mt-3 mb-3 testCss">
                        <div>
                            <label class="mb-0 align-self-center dataTitle" style="width:130px;" for="ingredientData" id="ingredientData"><b>재료 정보</b></label>
                        </div>

                        <!-- 주재료 추가 영역 -->
                        <div class="mainIngredient row mt-4 pl-5 css2">
                            <div class="col-sm-2">
                                <label class="mb-0 pt-1 pb-1 align-self-center text-center ingredientStyle" style="width:90px;" for="mainIngredient" id="mainIngredientTitle"><b>주 재 료</b></label>
                            </div>
                            <div class="col-sm-10 p-0 mainAddArea">
                            	<c:forEach items="${mainNameList}" var="mainName" varStatus="status">
	                                <div class="row m-0 pr-3 mb-2 input-group mainAddForm">
	                                	<c:forEach items="${mainQuan}" var ="mainQuan" varStatus="status2">
											<c:if test="${status.index == status2.index}">
			                                    <select class="custom-select selectStyle category" name="category">
			                                        <option>카테고리</option>
			                                        <c:forEach items="${categoryList}" var="c">
			                                        	<option value="${c.category}" <c:if test="${mainName.category == c.category}">selected</c:if>>${c.cName}</option>
			                                        </c:forEach>
			                                    </select>
			                                    &nbsp;&nbsp;&nbsp;
			                                    <select class="custom-select selectStyle ingrdient" name="iNum">
			                                        <!-- <option value="0" selected>식재료</option> -->
			                                    </select>
			                                    &nbsp;&nbsp;&nbsp;
			                                    <input type="text" class="form-control textStyle mainAddText" name="iQuan" placeholder="계량 정보 예) 300g or 1/2개" aria-label="mainIngredient" aria-describedby="mainIngredientTitle" value="${mainQuan}">
			                                    <div class="col-1 delBtnArea">
			                                        <button type="button" class="addBtn p-0 btn btn-light"><img src="${pageContext.request.contextPath}/resources/img/recipe/delete.png" class="addBtnImg mt-2 mb-2 mainDelIcon" style="display:none;" alt="삭제"></button>
			                                    </div>
		                                    </c:if>
	                                    </c:forEach>
	                                </div>
                                </c:forEach>
                                <c:forEach items="${mainNum}" var="mainNum">
                                   	<input type="hidden" class="mainNum" value="${mainNum}"/>
                                   </c:forEach>
                            </div>
                        </div>
                        <div class="mainArea mt-2 ml-5 css1 text-center">
                           	<button type="button" class="addBtn btn btn-light" id="mainAddBtn"><img src="${pageContext.request.contextPath}/resources/img/recipe/plus.PNG" class="addBtnImg" alt="추가">&nbsp;<b>추가</b></button>
                     	 	</div>

                        <!-- 부재료 추가 영역 -->
                        <div class="row addIngredient mt-4 pl-5 css2">
                            <div class="col-sm-2">
                                <label class="mb-0 pt-1 pb-1 align-self-center text-center ingredientStyle" style="width:90px;" for="addIngredient" id="addIngredientTitle"><b>부 재 료</b></label>
                            </div>
                            <div class="col-sm-10 p-0 subAddArea">
                                <c:forEach items="${subList}" var="sub" varStatus="status">
									<c:choose>
										<c:when test="${status.count % 2 == 1}">
                           					<div class="row m-0 pr-3 mb-2 input-group subAddForm">
			                                    <input type="text" class="form-control textStyle subIngredient"name="subIngredient"  placeholder="식재료명" aria-label="addIngredient" aria-describedby="addIngredientTitle" value="${sub}">
			                                    &nbsp;&nbsp;&nbsp;
	                                   	</c:when>
										<c:when test="${status.count % 2 == 0}">
                                    			<input type="text" class="form-control textStyle subIngredientQuan"name="subIngredient"  placeholder="계량 정보 예) 300g or 2T or 1/2개" aria-label="addIngredient" aria-describedby="addIngredientTitle" value="${sub}">
			                                    <div class="col-1 delBtnArea">
			                                        <button type="button" class="addBtn p-0 btn btn-light"><img src="${pageContext.request.contextPath}/resources/img/recipe/delete.png" class="addBtnImg mt-2 mb-2 subDelIcon" style="display:none;" alt="삭제"></button>
			                                    </div>
			                                </div>
                                   		</c:when>
									</c:choose>
                       			</c:forEach>
                            </div>
                        </div>
                           <div class="addArea mt-2 ml-5 css1 text-center">
                            <button type="button" class="addBtn btn btn-light" id="subAddBtn"><img src="${pageContext.request.contextPath}/resources/img/recipe/plus.PNG" class="addBtnImg" alt="추가">&nbsp;<b>추가</b></button>
                        </div>
                    </div>
                </div>

                <!-- 레시피 내용 입력 영역 -->
                <div class="row recipeBox mt-2 mb-5">
                    <div class="col-12 pl-3 mt-3 mb-3 testCss">
                        <div>
                            <label class="mb-0 align-self-center dataTitle" style="width:130px;" for="recipeContentTitle" id="recipeContentTitle"><b>요리 순서</b></label>
                        </div>

                        <!-- 레시피 순서 입력(글, 이미지) -->
                        <div class="row recipeContentArea mt-3">
                        	<c:forEach items="${contentList}" var="contentList" varStatus="status">
	                            <div class="row col-12 recipeContentForm">
	                                <div class="col-2 css3" style="text-align:right;">
	                                    <p class="recipeContentStepCss stepText text-right">Step ${contentList.rStep}</p>
	                                </div>
	                                <div class="col-6 mb-0 form-group css3">
	                                    <textarea class="form-control mt-2 mb-4 recipeContent" name="rContent" style="resize:none;" rows="7" placeholder="  예 ) 소고기는 기름기를 제거하고 적당한 크기로 썰어주세요.">${contentList.rContent}</textarea>
	                                </div>
	                                <div class="col-4 mb-0 css3">
	                                    <img class="addRecipeImg mt-2 mb-4 img-thumbnail subImage subImgArea" src="${pageContext.request.contextPath}/resources/img/recipeContent/${contentList.rContentimg}" alt="요리사진">
	                                    <button type="button" class="addBtn p-0 ml-2 btn btn-light"><img src="${pageContext.request.contextPath}/resources/img/recipe/delete.png" class="addBtnImg mt-2 mb-2 recipeDelIcon" style="display:none;" alt="삭제"></button>
	                                    <input type="file" class="fileArea subImg" name="rContentimg" onchange="LoadImg(this,2);">
       									<input type="hidden" class="originSubImg" name="originSubImg" value="${contentList.rContentimg}" />
	                                </div>
	                            </div>
                           	</c:forEach>
                        </div>
                        <div class="addArea mt-2 css1 text-center">
                            <button type="button" class="addBtn btn btn-light" id="recipeAddBtn"><img src="${pageContext.request.contextPath}/resources/img/recipe/plus.PNG" class="addBtnImg" alt="추가">&nbsp;<b>추가</b></button>
                        </div>
                       
                    </div>
                </div>

                <!-- 작성, 취소 버튼 영역 -->
                <div class="row justify-content-center mb-5 testCss">
                    <input type="submit" class="submitBtn pt-1 pb-1 pr-2 pl-2" value="수정하기">
                    &nbsp;&nbsp;&nbsp;
                    <input type="reset" class="cancleBtn pt-1 pb-1 pr-2 pl-2" value="취소하기">
                    &nbsp;&nbsp;&nbsp;
                   	<button type="button" class="deleteBtn">삭제하기</button>
                </div>
            </form>
        </div>
        
        <script>
        	var path = "${pageContext.request.contextPath}";
        	var mainNum = new Array();
        	<c:forEach items="${mainNum}" var = "num">
        		mainNum.push("${num}");
        	</c:forEach>
        </script>
    </body>
    
</html>