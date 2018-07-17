<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta charset="utf-8"/>
        <title>레시피 등록</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe/RecipeDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-grid.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap-reboot.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/recipe/RecipeDetail.js"></script>
    </head>

    <body>
        <c:import url="/WEB-INF/views/common/header.jsp" />
        
        <!-- 야매로 공간할당을 주어 처리한 부분 -->
		<div style="height: 20%;"></div>
        
        <div class="container">

            <!-- 레시피 이미지 및 간단한 정보 영역 -->
            <div class="row recipeTitle mt-5 ml-3 mr-3 css1">
                <div class="col-5 mt-3 mb-3 pl-0 css3">
                    <img class="img-fluid rounded float-left" src="../../Image/test.PNG" alt="대표이미지">
                </div>
                <div class="col-7 mt-3 mb-3 css3">
                    <!-- 레시피 제목 -->
                    <p class="font-weight-bold mt-1 mb-1 recipeName css4">칠리 새우 덮밥</p>

                    <!-- 레시피 한줄 소개 -->
                    <p class="font-weight-normal mt-2 mb-1 css4">피크닉 갈 때 싸가기 좋은 쉬림프 박스!</p>

                    <!-- 조리 정보 -->
                    <div class="css5 mt-3">
                        <div class="row col-12">
                            <div class="col-3 text-center css4">
                                <img src="../../Image/people.PNG" alt="인분">
                            </div>
                            <div class="col-3 text-center css4">
                                <img src="../../Image/time.PNG" alt="시간">
                            </div>
                            <div class="col-3 text-center css4">
                                <img src="../../Image/level.PNG" alt="난이도">
                            </div>
                        </div>
                    </div>
                    <div class="css5">
                        <div class="row col-12">
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">2인분</p>
                            </div>
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">30분 이내</p>
                            </div>
                            <div class="col-3 text-center detailAreaCss css4">
                                <p class="font-weight-normal mb-0 detailData">아무나</p>
                            </div>
                        </div>
                    </div>

                    <!-- 평점 및 댓글 수 확인 -->
                    <div class="mt-3 mb-1 css4">
                        <div class="row col-12 align-items-center">
                            <p class="font-weight-normal mr-2 mb-0 detailData">평점</p>
                            <img class="starCss" src="../../Image/fullStar.png" alt="1">
                            <img class="starCss" src="../../Image/fullStar.png" alt="2">
                            <img class="starCss" src="../../Image/fullStar.png" alt="3">
                            <img class="starCss" src="../../Image/halfStar.png" alt="4">
                            <img class="starCss" src="../../Image/emptyStar.png" alt="5">
                            <p class="font-weight-normal ml-2 mb-0 detailData">점</p>
                            <p class="font-weight-normal ml-3 mb-0 mr-3 detailData">/</p>
                            <p class="font-weight-normal mb-0 detailData">리뷰 (</p>
                            <p class="font-weight-normal mb-0 detailData">)</p>
                        </div>
                    </div>

                    <!-- 좋아요, 신고하기, 조회수 확인-->
                    <div class="css4 mt-3">
                        <div class="row col-12 pr-0">
                            <button type="button" class="btnFontCss btn btn-light p-0 mr-4"><img class="mr-1 mb-1" src="../../Image/lookIcon.png" alt="조회수">조회수()</button>
                            <button type="button" class="btnFontCss btn btn-light p-0 mr-4"><img class="mr-1 mb-1" src="../../Image/goodIcon.png" alt="좋아요"/>좋아요()</button>
                            <button type="button" class="btnFontCss btn btn-light p-0"><img class="mr-1 mb-1" src="../../Image/badIcon.png" alt="신고하기">신고하기</button>                           
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
                            
                            <div class="row ml-1 mr-1 justify-content-between">
                                <div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    칵테일 새우
                                </div>
                                <div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1컵(종이컵)
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    다진 마늘
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1스푼
                                </div>
                            </div>
                        </div>
                        <div class="col-6 css5">
                            <div>
                                <label class="mb-0 align-self-center detailData css2" style="width:130px;" for="addIngredient" id="addIngredient"><b>[부재료]</b></label>
                            </div>

                            <div class="row ml-1 mr-1 justify-content-between">
                                <div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    버터
                                </div>
                                <div class="col-6 mt-3 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1조각
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    케찹
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    2스푼
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    고추가루
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1스푼
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    설탕
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1스푼
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    간장
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1스푼
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 ingredientDetail">
                                    식초
                                </div>
                                <div class="col-6 mb-3 pl-0 pr-0 pb-1 text-right ingredientDetail">
                                    1스푼
                                </div>
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
                    
                    <div class="row mt-4 ml-5 mr-3">
                        <div class="col-7 css5">
                            <div class="row ml-1 mr-1">
                                <div class="col-1 p-0 text-center">
                                    <span class="border border-light rounded-circle pl-2 pr-2 circleNum">1</span>
                                </div>
                                <div class="col pr-0">
                                    <p class="font-weight-normal mb-0 css4">새우는 물에 넣고 해동시켜주세요.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-5 css5">
                            <div class="row ml-1 mr-1">
                                <img class="img-fluid rounded float-left" src="../../Image/one.PNG" alt="1">
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4 ml-5 mr-3">
                        <div class="col-7 css5">
                            <div class="row ml-1 mr-1">
                                <div class="col-1 p-0 text-center">
                                    <span class="border border-light rounded-circle pl-2 pr-2 circleNum">2</span>
                                </div>
                                <div class="col pr-0">
                                    <p class="font-weight-normal mb-0 css4">케찹, 고추가루, 설탕, 간장 식초, 물을 넣고 섞어주세요. 케찹, 고추가루, 설탕, 간장 식초, 물을 넣고 섞어주세요.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-5 css5">
                            <div class="row ml-1 mr-1">
                                <img class="img-fluid rounded float-left" src="../../Image/two.PNG" alt="2">
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-5 mb-2">
                        <button type="button" class="submitBtn">수정하기</button>
                    </div>
                </div>
            </div>

            <!-- 온라인 쇼핑 링크 버튼 영역 -->
            <div class="row recipeBox d-flex flex-row-reverse mt-2 ml-3 mr-3 pr-5 css3">
                <div class="col-12 pl-3 mt-3 mb-3 css3">
                    <div>
                        <img src="../../Image/delveryImg.PNG" style="width:90px; height:60px;" alt="장보기아이콘">
                        <label class="mb-0 align-self-center dataTitle css2" style="width:80px;" for="commentData" id="commentData"><b>장보기</b></label>
                        <p class="font-weight-normal mt-2 mb-1 css4">부족한 재료는 편하고 빠르게 주문하세요~!</p>
                    </div>
                </div>
                <a href="http://emart.ssg.com/" target="_blank"><img class="shoppingBtn mb-2" src="../../Image/emartIcon.png" alt="이마트"></a>
                &nbsp;&nbsp;&nbsp;
                <a href="https://www.homeplus.co.kr/app.exhibition.speedshopping.SpeedShopping.ghs?comm=usr.speedshopping.getShoppingList" target="_blank">
                    <img class="shoppingBtn mb-2" src="../../Image/homeplusIcon.png" alt="홈플러스">
                </a>
                &nbsp;&nbsp;&nbsp;
                <a href="http://www.lottesuper.co.kr/handler/Index-Start?&CHL_NO=382183&utm_source=google&utm_medium=cpc&utm_campaign=goole_%ED%82%A4%EC%9B%8C%EB%93%9C%EA%B2%80%EC%83%89&utm_content=%EB%B8%8C%EB%9E%9C%EB%93%9C_%EB%A1%AF%EB%8D%B0%EC%8A%88%ED%8D%BC&utm_term=%EB%A1%AF%EB%8D%B0%EC%8A%88%ED%8D%BC&gclid=EAIaIQobChMImeKa6PGT3AIVQYqPCh1Q0wf2EAAYAiAAEgK_HPD_BwE" target="_blank">
                    <img class="shoppingBtn mb-2" src="../../Image/lotteIcon.PNG" alt="롯데슈퍼">
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
                        <img class="rounded-circle float-left userImgCss" src="../../Image/userImg.PNG" alt="userImg">
                    </div>
                    <div class="col-10 pl-0 css4">
                        <div class="row ml-0 mb-2 css1">
                            <p class="detailData mb-0 mr-4"><b>pjy0629</b></p>
                            <p class="font-weight-normal mr-3 detailData mb-0">2018-07-09 21:17:48</p>
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="1">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="2">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="3">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="4">
                            <img class="starCss mt-1 mr-3" src="../../Image/fullStar.png" alt="5">
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
                        <img class="rounded-circle float-left userImgCss" src="../../Image/userTestImg.jpg" alt="userImg">
                    </div>
                    <div class="col-10 pl-0 css4">
                        <div class="row ml-0 mb-2 css1">
                            <p class="detailData mb-0 mr-4"><b>kh1234</b></p>
                            <p class="font-weight-normal mr-3 detailData mb-0">2018-07-09 20:58:35</p>
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="1">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="2">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="3">
                            <img class="starCss mt-1" src="../../Image/fullStar.png" alt="4">
                            <img class="starCss mt-1 mr-3" src="../../Image/fullStar.png" alt="5">
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
                    <div class="row mt-5 ml-0 mb-3 mr-5 pr-0 col css3">
                        <div class="col-8 mb-2 css5">
                            <textarea class="form-control mt-2" name="recipeContent" id="recipeContent" style="resize:none;" rows="3" placeholder="  맛 평가를 해주세요!"></textarea>
                        </div>
                        <div class="col-4 mb-2 css5">
                            <div class="row mt-2 mb-1 ml-3">
                                <p class="commentFontCss"><b>점수</b></p>
                            </div>
                            <div class="row mb-2 ml-3">
                                <img class="starCss mt-1 mr-2" src="../../Image/fullStar.png" alt="1">
                                <img class="starCss mt-1 mr-2" src="../../Image/fullStar.png" alt="2">
                                <img class="starCss mt-1 mr-2" src="../../Image/fullStar.png" alt="3">
                                <img class="starCss mt-1 mr-2" src="../../Image/fullStar.png" alt="4">
                                <img class="starCss mt-1" src="../../Image/fullStar.png" alt="5">
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