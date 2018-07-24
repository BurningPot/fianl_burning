<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta charset="utf-8"/>
        <title>레시피 상세보기</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/RecipeDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-grid.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-reboot.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/recipe/RecipeDetail.js"></script>
    </head>

    <body>
        <c:import url="/WEB-INF/views/common/header.jsp" />
        
		<div style="height: 20%;"></div>
        
        <div class="container">

            <!-- 레시피 이미지 및 간단한 정보 영역 -->
            <div class="row recipeTitle mt-5 ml-3 mr-3 css1">
                <div class="col-5 mt-3 mb-3 pl-0 css3">
                    <img class="img-fluid rounded float-left" src="${pageContext.request.contextPath}/resources/img/recipeContent/${recipe.rImg}" alt="대표이미지">
                </div>
                <div class="col-7 mt-3 mb-3 css3">
                    <!-- 레시피 제목 -->
                    <p class="font-weight-bold mt-1 mb-1 recipeName css4">${recipe.rName}</p>
                           				
       				<!-- 작성자 회원 번호 -->
       				<input type="hidden" name="mNum" value="${recipe.mNum}" />
                    
                    <!-- 작성자 이름 -->
                    <p class="font-weight-normal mt-2 mb-1 css4">by. ${recipe.mName} 님</p>

                    <!-- 레시피 한줄 소개 -->
                    <p class="font-weight-normal mt-2 mb-1 css4">${recipe.rIntro}</p>

                    <!-- 조리 정보 -->
                    <div class="css5 mt-2">
                        <div class="row col-12">
                            <div class="col-3 text-center css4">
                                <img src="${pageContext.request.contextPath}/resources/img/recipe/people.PNG" alt="인분">
                            </div>
                            <div class="col-3 text-center css4">
                                <img src="${pageContext.request.contextPath}/resources/img/recipe/time.PNG" alt="시간">
                            </div>
                            <div class="col-3 text-center css4">
                                <img src="${pageContext.request.contextPath}/resources/img/recipe/level.PNG" alt="난이도">
                            </div>
                        </div>
                    </div>
                    <div class="css5">
                        <div class="row col-12">
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">
                                <c:choose>
                                	<c:when test="${recipe.quantity == 1}">
                                		1인분
                                	</c:when>
                                	<c:when test="${recipe.quantity == 2}">
                                		2인분
                                	</c:when>
                                	<c:when test="${recipe.quantity == 3}">
                                		3인분
                                	</c:when>
                                	<c:when test="${recipe.quantity == 4}">
                                		4인분
                                	</c:when>
                                	<c:when test="${recipe.quantity == 5}">
                                		5인분
                                	</c:when>
                                	<c:otherwise>
                                		5인분 이상
                                	</c:otherwise>
                                </c:choose>
                                </p>
                            </div>
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">
                                <c:choose>
                                	<c:when test="${recipe.rTime == 1}">
                                		10분 이내
                                	</c:when>
                                	<c:when test="${recipe.rTime == 2}">
                                		20분 이내
                                	</c:when>
                                	<c:when test="${recipe.rTime == 3}">
                                		30분 이내
                                	</c:when>
                                	<c:when test="${recipe.rTime == 4}">
                                		60분 이내
                                	</c:when>
                                	<c:otherwise>
                                		60분 이상
                                	</c:otherwise>
                                </c:choose>
                                </p>
                            </div>
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">
                                <c:choose>
                                	<c:when test="${recipe.rLevel == 1}">
                                		아무나
                                	</c:when>
                                	<c:when test="${recipe.rLevel == 2}">
                                		초급
                                	</c:when>
                                	<c:when test="${recipe.rLevel == 3}">
                                		중급
                                	</c:when>
                                	<c:otherwise>
                                		고급
                                	</c:otherwise>
                                </c:choose>
								</p>
                            </div>
                        </div>
                    </div>

                    <!-- 평점 및 댓글 수 확인 -->
                    <div class="mt-2 mb-1 css4">
                        <div class="row col-12 align-items-center">
                            <p class="font-weight-normal mr-2 mb-0 detailData">평점</p>
                            <img class="starCss" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="1">
                            <img class="starCss" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="2">
                            <img class="starCss" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="3">
                            <img class="starCss" src="${pageContext.request.contextPath}/resources/img/recipe/halfStar.png" alt="4">
                            <img class="starCss" src="${pageContext.request.contextPath}/resources/img/recipe/emptyStar.png" alt="5">
                            <p class="font-weight-normal ml-2 mb-0 detailData">점</p>
                            <p class="font-weight-normal ml-3 mb-0 mr-3 detailData">/</p>
                            <p class="font-weight-normal mb-0 detailData">리뷰 ()</p>
                        </div>
                    </div>

                    <!-- 좋아요, 신고하기, 조회수 확인-->
                    <div class="css4 mt-2">
                        <div class="row col-12 pr-0">
                            <div class="btnFontCss p-0 mr-4"><img class="mr-1 mb-1" src="${pageContext.request.contextPath}/resources/img/recipe/lookIcon.png" alt="조회수">조회수(${recipe.rCount})</div>
                            <button type="button" class="btnFontCss btn btn-light p-0 mr-4"><img class="mr-1 mb-1" src="${pageContext.request.contextPath}/resources/img/recipe/goodIcon.png" alt="좋아요"/>좋아요(${recipe.rRecommend})</button>
                            <button type="button" class="btnFontCss btn btn-light p-0"><img class="mr-1 mb-1" src="${pageContext.request.contextPath}/resources/img/recipe/badIcon.png" alt="신고하기">신고하기</button>                           
                        </div>
                    </div>
                </div>
            </div>

            <!-- 재료 정보 영역 -->
            <div class="row recipeBox mt-2 ml-3 mr-3">
                <div class="col-12 pl-3 mt-3 mb-3 css3">
                    <div>
                        <label class="mb-0 align-self-center dataTitle css2" style="width:130px;" for="ingredientData" id="ingredientData"><b>재료</b></label>
                    </div>

                    <div class="row mt-3 ml-3 mr-3">
                        <div class="col-6 css5">
                            <div>
                                <label class="mb-0 align-self-center detailData css2" style="width:130px;" for="mainIngredient" id="mainIngredient"><b>[주재료]</b></label>
                            </div>
                            <!-- 주재료 -->
                            <div class="row ml-1 mr-1 justify-content-between">
                            	<c:forEach items="${mainNameList}" var="mainName" varStatus="status">
                           	 		<c:forEach items="${mainQuan}" var ="mainQuan" varStatus="status2">
										<c:if test="${status.index == status2.index}">
			                                	<div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 ingredientDetail">${mainName.iName}</div>
			                                	<div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">${mainQuan}</div>
										</c:if>
									</c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <div class="col-6 css5">
                            <div>
                                <label class="mb-0 align-self-` detailData css2" style="width:130px;" for="addIngredient" id="addIngredient"><b>[부재료]</b></label>
                            </div>
							<!-- 부재료 -->
                            <div class="row ml-1 mr-1 justify-content-between">
                                <c:forEach items="${subList}" var="sub" varStatus="status">
									<c:choose>
										<c:when test="${status.count % 2 == 1}">
		                                	<div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 ingredientDetail">${sub}</div>
										</c:when>
										<c:otherwise>
			                                <div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">${sub}</div>
	                                	</c:otherwise>
									</c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- 조리순서 정보 영역 -->
            <div class="row recipeBox mt-2 ml-3 mr-3">
                <div class="col-12 pl-3 mt-3 mb-3 css3">
                    <div>
                        <label class="mb-0 align-self-center dataTitle css2" style="width:130px;" for="recipeData" id="recipeData"><b>조리 순서</b></label>
                    </div>
                    
                    <c:forEach items="${contentList}" var="contentList" varStatus="status">
                    	<div class="row mt-4 ml-5 mr-3">
	                        <div class="col-8 css5">
	                            <div class="row ml-1 mr-1">
	                                <div class="col-1 p-0 text-center">
	                                    <span class="border border-light rounded-circle pl-2 pr-2 circleNum">${contentList.rStep}</span>
	                                </div>
	                                <div class="col pr-0">
	                                    <p class="font-weight-normal mb-0 css4 rContent">${contentList.rContent}</p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-4 css5">
	                            <div class="row ml-1 mr-1">
	                                <img class="img-fluid rounded float-left" src="${pageContext.request.contextPath}/resources/img/recipeContent/${contentList.rContentimg}" alt="${contentList.rContentimg}">
	                            </div>
	                        </div>
	                    </div>
                   </c:forEach>

					<c:if test="${m.mNum == recipe.mNum}">
						<form action="selectDetail.do" method="POST">
							<!-- 레시피 번호 -->
							<input type="hidden" id="recipeNum" name="rNum" value="${recipe.rNum}" />
							<div class="text-center mt-5 mb-2">
								<input type="submit" id="submitBtn"  class="submitBtn pt-1 pb-1 pr-2 pl-2" value="수정하기">
							</div>
						</form>
					</c:if>
                </div>
            </div>

            <!-- 온라인 쇼핑 링크 버튼 영역 -->
            <div class="row recipeBox d-flex flex-row-reverse mt-2 ml-3 mr-3 pr-5 css3">
                <div class="col-12 pl-3 mt-3 mb-3 css3">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/img/recipe/delveryImg.PNG" style="width:90px; height:60px;" alt="장보기아이콘">
                        <label class="mb-0 align-self-center dataTitle css2" style="width:80px;" for="commentData" id="commentData"><b>장보기</b></label>
                        <p class="font-weight-normal mt-2 mb-1 css4">부족한 재료는 편하고 빠르게 주문하세요~!</p>
                    </div>
                </div>
                <a href="http://emart.ssg.com/" target="_blank"><img class="shoppingBtn mb-2" src="${pageContext.request.contextPath}/resources/img/recipe/emartIcon.png" alt="이마트"></a>
                &nbsp;&nbsp;&nbsp;
                <a href="https://www.homeplus.co.kr/app.exhibition.speedshopping.SpeedShopping.ghs?comm=usr.speedshopping.getShoppingList" target="_blank">
                    <img class="shoppingBtn mb-2" src="${pageContext.request.contextPath}/resources/img/recipe/homeplusIcon.png" alt="홈플러스">
                </a>
                &nbsp;&nbsp;&nbsp;
                <a href="http://www.lottesuper.co.kr/handler/Index-Start?&CHL_NO=382183&utm_source=google&utm_medium=cpc&utm_campaign=goole_%ED%82%A4%EC%9B%8C%EB%93%9C%EA%B2%80%EC%83%89&utm_content=%EB%B8%8C%EB%9E%9C%EB%93%9C_%EB%A1%AF%EB%8D%B0%EC%8A%88%ED%8D%BC&utm_term=%EB%A1%AF%EB%8D%B0%EC%8A%88%ED%8D%BC&gclid=EAIaIQobChMImeKa6PGT3AIVQYqPCh1Q0wf2EAAYAiAAEgK_HPD_BwE" target="_blank">
                    <img class="shoppingBtn mb-2" src="${pageContext.request.contextPath}/resources/img/recipe/lotteIcon.PNG" alt="롯데슈퍼">
                </a>
            </div>

            <!-- 댓글 정보 영역 -->
            <div class="row recipeBox mt-2 ml-3 mr-3 mb-5">
                <div class="col-12 pl-3 mt-3 mb-3 css3">
                    <div>
                        <label class="mb-0 align-self-center dataTitle css2" style="width:50px;" for="commentData" id="commentData"><b>댓글</b></label>
                        <label class="mb-0 align-self-center commentTotalCss css2" style="width:50px;" for="commentData" id="commentData"><b>2</b></label>
                    </div>
                </div>

                <!-- 댓글 확인 -->
                <div class="row ml-0 mb-3 col-12 css3">
                    <div class="col-1 pl-0 ml-3 mr-2 css4">
                        <img class="rounded-circle float-left userImgCss" src="${pageContext.request.contextPath}/resources/img/recipe/userImg.PNG" alt="userImg">
                    </div>
                    <div class="col-10 pl-0 css4">
                        <div class="row ml-0 mb-2 css1">
                            <p class="detailData mb-0 mr-4"><b>pjy0629</b></p>
                            <p class="font-weight-normal mr-3 detailData mb-0">2018-07-09 21:17:48</p>
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="1">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="2">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="3">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="4">
                            <img class="starCss mt-1 mr-3" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="5">
                            <button type="button" class="btn btn-light p-0 mr-2 commentFontCss">수정</button>
                            <p class="font-weight-normal mr-2 detailData mb-0 commentFontCss">|</p>
                            <button type="button" class="btn btn-light p-0 commentFontCss">삭제</button>                    
                        </div>
                        <div>
                            <p class="commentFontCss">너무 맛있어요~ 진짜 밖에서 사먹는 것보다 맛있는거 같아요 너무 맛있어요~ 진짜 밖에서 사먹는 것보다 맛있는거 같아요</p>
                        </div>
                    </div>
                </div>
                <div class="row ml-0 mb-3 col-12 css3">
                    <div class="col-1 pl-0 ml-3 mr-2 css4">
                        <img class="rounded-circle float-left userImgCss" src="${pageContext.request.contextPath}/resources/img/recipe/userTestImg.jpg" alt="userImg">
                    </div>
                    <div class="col-10 pl-0 css4">
                        <div class="row ml-0 mb-2 css1">
                            <p class="detailData mb-0 mr-4"><b>kh1234</b></p>
                            <p class="font-weight-normal mr-3 detailData mb-0">2018-07-09 20:58:35</p>
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="1">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="2">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="3">
                            <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="4">
                            <img class="starCss mt-1 mr-3" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="5">
                            <button type="button" class="btn btn-light p-0 mr-2 commentFontCss">수정</button>
                            <p class="font-weight-normal mr-2 detailData mb-0 commentFontCss">|</p>
                            <button type="button" class="btn btn-light p-0 commentFontCss">삭제</button>                    
                        </div>
                        <div>
                            <p class="commentFontCss">집에 있는 칠리소스로 해도 되나요?</p>  
                        </div>
                    </div>
                </div>
            
                <!-- 댓글 작성 -->
                <form class="col-12" method="POST">
                    <div class="row mt-5 ml-0 mb-3 mr-0 pr-0 col css3 justify-content-md-center">
                        <div class="col-8 mb-2 css5">
                            <textarea class="form-control mt-2" name="recipeContent" id="recipeContent" style="resize:none;" rows="3" placeholder="  맛 평가를 해주세요!"></textarea>
                        </div>
                        <div class="col-3 mb-2 css5">
                            <div class="row mt-2 mb-1 ml-3">
                                <p class="commentFontCss"><b>점수</b></p>
                            </div>
                            <div class="row mb-2 ml-3">
                                <img class="starCss mt-1 mr-2" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="1">
                                <img class="starCss mt-1 mr-2" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="2">
                                <img class="starCss mt-1 mr-2" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="3">
                                <img class="starCss mt-1 mr-2" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="4">
                                <img class="starCss mt-1" src="${pageContext.request.contextPath}/resources/img/recipe/fullStar.png" alt="5">
                            </div>
                            <div class="row ml-3">
                                <input type="submit" class="submitBtn pt-1 pb-1 pr-2 pl-2" value="   등          록   ">
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </body>
    
</html>