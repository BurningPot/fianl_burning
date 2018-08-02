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
					console.log("final_transcript=" + final_transcript);
					//annyang.trigger(final_transcript); //If the sentence is "final" for the Web Speech API, we can try to trigger the sentence
				} else {
					interim_transcript += event.results[i][0].transcript;
					console.log("interim_transcript=" + interim_transcript);
				}
			}
			// document.getElementById('result').innerHTML =  '중간값:='+interim_transcript+'<br/>결과값='+final_transcript;
			// console.log('interim='+interim_transcript+'|final='+final_transcript);
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
						$('#loginModal').modal();
					}
						
				}

			}else if(final_transcript.includes("게시글")){
				if(final_transcript.includes("번째")){
					var speechToken = final_transcript.split('번째');
					goSpeech(final_transcript);
					console.log();
				}else if(final_transcript.includes("번")){
					console.log();
				}
			}
		};
		
	}
	
	
	function goSpeech(key){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/setSKey.do",
			type:"POST",
			data : {key:key},
			success:function(data){
				console.log("음성검색 ajax 성공"+data);
			},error:function(data){
				console.log("음성검색 ajax 실패");
			}
		});
	}
	
	function loginUser(){
		alert('로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요!');
		$('#loginModal').modal();
	}
	
	

</script>
</html>