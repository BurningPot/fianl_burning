<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script
	src='${pageContext.request.contextPath}/resources/css/board/annyang/annyang.js'></script>
</head>
<script>
	function speechOn() {
		var m = '${m}';
		var mNum = '${m.getmNum()}';
		annyang.start({
			autoRestart : false,
			continuous : true
		})
		var recognition = annyang.getSpeechRecognizer();
		var final_transcript = '';
		recognition.interimResults = true;
		recognition.onresult = function(event) {
			var interim_transcript = '';
			final_transcript = '';
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					final_transcript += event.results[i][0].transcript;
					//console.log("final_transcript=" + final_transcript);
					//annyang.trigger(final_transcript); //If the sentence is "final" for the Web Speech API, we can try to trigger the sentence
				} else {
					interim_transcript += event.results[i][0].transcript;
				}
			}
			
			$('#speechVal').val(interim_transcript + final_transcript);

			if (final_transcript.includes("게시판")) {
				if (final_transcript.includes("글")) {
					if (final_transcript.includes("쓰기")) {
						goSpeech(final_transcript);
						location.href = "${pageContext.request.contextPath}/board/insertBoard.do";
					}
				} else if (final_transcript.includes("글쓰기")) {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/board/insertBoard.do";
				} else if (final_transcript.includes("목록")) {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/board/boardList.do";
				} else {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/board/boardList.do";
				}
			} else if (final_transcript.includes("글쓰기")) {
				goSpeech(final_transcript);
				if(m) location.href = "${pageContext.request.contextPath}/board/insertBoard.do";
				else loginUser();
			} else if (final_transcript.includes("마이페이지")||final_transcript.includes("마이 페이지")) {
				goSpeech(final_transcript);
				if(m) location.href = "${pageContext.request.contextPath}/mypage/myPage.do?mNum="+mNum;
				else loginUser();
			} else if (final_transcript.includes("레시피")
					|| final_transcript.includes("요리")) {
				if(!final_transcript.includes("번")){
					
				if (final_transcript.includes("등록")) {
					if(m) location.href = "${pageContext.request.contextPath}/recipe/recipeForm.do";
					else loginUser();
				} else if (final_transcript.includes("추가")) {
					if(m) location.href = "${pageContext.request.contextPath}/recipe/recipeForm.do";
					else loginUser();
				}else if (final_transcript.includes("찾아")) {
					if (final_transcript.includes("으로")) {
						var speechToken = final_transcript.split('으로');
						goSpeech(final_transcript);
						location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
								+ speechToken[0];
					} else if (final_transcript.includes("로")){
						var speechToken = final_transcript.split('로');
						goSpeech(final_transcript);
						location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
								+speechToken[0];
					} else if(final_transcript.includes("줘")){
						var speechToken = final_transcript.split('찾아');
						goSpeech(final_transcript);
						location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+speechToken[0];
					}else{
						goSpeech(final_transcript);
						location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+final_transcript;
					}
				}else if (final_transcript.includes("으로")) {
					var speechToken = final_transcript.split('으로');
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+ speechToken[0];
				} else if (final_transcript.includes("로")){
					var speechToken = final_transcript.split('로');
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+ speechToken[0];
				}else {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
						+final_transcript;
				}

				
				}
				else if(final_transcript.includes("번째")){
					if(final_transcript.includes("첫")){
						detailRecipe(Number(1));
					}else if(final_transcript.includes("두")){
						detailRecipe(Number(2));
					}else if(final_transcript.includes("세")){
						detailRecipe(Number(3));
					}else if(final_transcript.includes("네")){
						detailRecipe(Number(4));
					}else if(final_transcript.includes("다섯")){
						detailRecipe(Number(5));
					}else if(final_transcript.includes("여섯")){
						detailRecipe(Number(6));
					}else if(final_transcript.includes("일곱")){
						detailRecipe(Number(7));
					}else if(final_transcript.includes("여덟")){
						detailRecipe(Number(8));
					}else if(final_transcript.includes("아홉")){
						detailRecipe(Number(9));
					}else if(final_transcript.includes("열")){
						detailRecipe(Number(10));
					}else{
						location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="+final_transcript;
					}
				}else if(final_transcript.includes("번")){
					if(final_transcript.includes("레시피")){
						var speechToken = final_transcript.split('번');
						goSpeech(final_transcript);
						location.href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+$('.recipeList').children('li').eq(Number(speechToken[0])-1).children().children().children().eq(2).val();
					}
				}
			} else if (final_transcript.includes("검색")) {
				if (final_transcript.includes("으로")) {
					var speechToken = final_transcript.split('으로');
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+ speechToken[0];
				} else if (final_transcript.includes("로")) {
					var speechToken = final_transcript.split('로');
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+ speechToken[0];
				} else {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="
							+final_transcript;
				}
			} else if (final_transcript.includes("냉장고")) {
				goSpeech(final_transcript);
				if(m) location.href = "${pageContext.request.contextPath}/fridge/refMain.do";
				else loginUser();
			} else if (final_transcript.includes("로그아웃")) {
				if (m) {
					goSpeech(final_transcript);
					location.href = "${pageContext.request.contextPath}/member/memberLogout.do";
				} else {
					goSpeech(final_transcript);
					alert('이미 로그아웃 상태입니다.');
				}
			} else if (final_transcript.includes("로그인")) {
				if (m) {
					goSpeech(final_transcript);
					alert('이미 로그인한 상태입니다.');
				} else {
					if(final_transcript.includes("네이버")){
						goSpeech(final_transcript);
						location.href ="${pageContext.request.contextPath}/login/naverLog.do";
					}else if(final_transcript.includes("구글")){
						goSpeech(final_transcript);
						location.href ="${pageContext.request.contextPath}/login/googleLogin.do";
					}else{
						goSpeech(final_transcript);
						$('#loginModal').modal();
					}
						
				}

			}else if(final_transcript.includes("번")){
					var speechToken = final_transcript.split('번');
					goSpeech(final_transcript);
					location.href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+$('.recipeList').children('li').eq(Number(speechToken[0])-1).children().children().children().eq(2).val();
			
			}else if(final_transcript.includes("뒤로")) {
				goSpeech(final_transcript);
				window.history.go(-1);
			}else if(final_transcript.includes("앞으로")) {
				goSpeech(final_transcript);
				window.history.go(1);
			}else if(final_transcript.includes("홈으로")) {
				goSpeech(final_transcript);
				location.href ="${pageContext.request.contextPath}/home/showHome.do";
			}else if(final_transcript.includes("위로")){
				$('html, body').animate({
					"scrollTop": 0
				}, 300);
			}else if(final_transcript.includes("아래로")){
				$('html, body').animate({
					"scrollTop": $(document).height()
				}, 300);
			}else if(final_transcript.includes("스크롤")){
				if(final_transcript.includes("천천히")){
					$('html, body').animate({
						"scrollTop": $(document).height()
					}, 20000);
				}else if(final_transcript.includes("빠르게") || final_transcript.includes("빨리")){
					$('html, body').animate({
						"scrollTop": $(document).height()
					}, 10000);
				}else{
					$('html, body').animate({
						"scrollTop": $(document).height()
					}, 20000);
				}
			}else if(final_transcript.includes("음성")){
				  if(final_transcript.includes("꺼")){
					  speechOff();
				}
			}else{
				goSpeech(final_transcript);
				location.href = "${pageContext.request.contextPath}/home/searchRecipe.do?searchR="+final_transcript;
			}
			
		};
		
	}
	
	
	function goSpeech(key){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/setSKey.do",
			type:"POST",
			data : {key:key},
			success:function(data){
				console.log(data);
			},error:function(data){
				console.log("음성검색 ajax 실패");
			}
		});
	}
	
	function loginUser(){
		alert('로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요!');
		$('#loginModal').modal();
	}
	
	function detailRecipe(num){
		location.href="${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum="+num;
	}
	
	function speechOff(){
		$('#speechInput').hide("slow");
	  	
	  	annyang.removeCommands();
	  	annyang.abort();
	  	
	  	$('#speechBtn').css("color","black");  
	  	$('#spSw').val(0);
	  	$('#speechVal').val('');
	  	
	}
	
	

</script>
</html>