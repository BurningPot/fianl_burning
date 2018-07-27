$(function () {
	// textarea 줄바꿈
	$(".rContent").each(function(index, value) {
		if ($(this).val().match(/(<br>|<br\/>|<br \/>)/g)) {
			$(this).val($(this).replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
		}
	});
	
	// top 버튼 추가
	$(".top_btn").append("<a href='#' class='click mt-2'>제목</a>");
	$(".top_btn").append("<a href='#ingredientData' class='followArea mt-2'>재료</a>");
	$(".top_btn").append("<a href='#recipeData' class='followArea mt-2'>순서</a>");
	$(".top_btn").append("<a href='#shoppingData' class='followArea mt-2'>쇼핑</a>");
	$(".top_btn").append("<a href='#commentData' class='followArea mt-2'>댓글</a>");

	$('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
          $('html, body').animate({
            scrollTop: target.offset().top - 100
          }, 300);
          return false;
      }
    });

	// ------------------------------------- 좋아요 버튼 영역 -------------------------------------
	$("#goodBtn").click(function() {
		var textArr = $(this).text().split(" ");
		
		if (textArr[1] != "취소") {
			$.ajax ({
	    		url : path + "/recipe/insertRecommend.do",
	    		data : {rNum : $("#rNum").val()},
	    		dataType : "json",
	    		async : false,
	    		success : function(data) {
    				alert("좋아요를 눌렀습니다.");
    				$('#goodBtn').children().remove();
    				$("#goodBtn").text("");
    				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요 취소" + ` (`+ data +`)`);
	    		}, error : function(e) {
	    			alert("좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)");
	    		}
	    	});
		} else {
			$.ajax ({
	    		url : path + "/recipe/deleteRecommend.do",
	    		data : {rNum : $("#rNum").val()},
	    		dataType : "json",
	    		async : false,
	    		success : function(data) {
    				alert("좋아요를 취소 했습니다.");
    				$('#goodBtn').children().remove();
    				$("#goodBtn").text("");
    				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요" + `(`+ data +`)`);
	    		}, error : function(e) {
	    			alert("좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)");
	    		}
	    	});
		}
	});
	
	// ------------------------------------- 신고하기 버튼 영역 -------------------------------------
	$('#reportBtn').click(function() {
//		$('#formId').attr("action", "goReportForm.do");
//		$('#formId').submit();
		console.log("신고확인");
	});
		
    // ------------------------------------- 댓글 영역 -------------------------------------
	 $('#reviewSubmitBtn').click(function(e) {
        if(confirm('댓글을 등록하시겠습니까?')){
    		if (mem != "") {
        		$.ajax ({
    	    		url : path + "/recipe/insertReview.do",
    	    		data : {rNum : $("#rNum").val(),
    	    					mNum : mem,
    	    					grade : $("#scoreText").val(),
    	    					rvContent : $("#reviewContent").val()},
    	    		dataType : "json",
    	    		async : false,
    	    		success : function(data) {
        				alert("댓글이 등록되었습니다.");
    	    		}, error : function(e) {
    	    			alert("댓글 등록 오류 발생 (관리자에게 문의 바랍니다.)");
    	    		}
    	    	});
    		} else {
    			console.log("비어있음");
    			alert("로그인 이후 사용 가능한 서비스 입니다. (로그인 이후 사용 바랍니다.)");
    		}
		} else {
            e.preventDefault();
            console.log("작성취소");
        }
    });
	 
});

// ------------------------------------- 별 클릭 영역 -------------------------------------
function starClick(chk) {
	if (chk ==1) {
		$(".scoreStar").each(function(index, value) {
			if (index < chk) {
				$(this).attr("src", path + "/resources/img/recipe/fullStar.png");
			} else {
				$(this).attr("src", path + "/resources/img/recipe/emptyStar.png");
			}
		});
		$("#scoreText").val("1");
	} else if (chk == 2) {
		$(".scoreStar").each(function(index, value) {
			if (index < chk) {
				$(this).attr("src", path + "/resources/img/recipe/fullStar.png");
			} else {
				$(this).attr("src", path + "/resources/img/recipe/emptyStar.png");
			}
		});
		$("#scoreText").val("2");
	} else if (chk == 3) {
		$(".scoreStar").each(function(index, value) {
			if (index < chk) {
				$(this).attr("src", path + "/resources/img/recipe/fullStar.png");
			} else {
				$(this).attr("src", path + "/resources/img/recipe/emptyStar.png");
			}
		});
		$("#scoreText").val("3");
	} else if (chk == 4) {
		$(".scoreStar").each(function(index, value) {
			if (index < chk) {
				$(this).attr("src", path + "/resources/img/recipe/fullStar.png");
			} else {
				$(this).attr("src", path + "/resources/img/recipe/emptyStar.png");
			}
		});
		$("#scoreText").val("4");
	} else {
		$(".scoreStar").each(function(index, value) {
			if (index < chk) {
				$(this).attr("src", path + "/resources/img/recipe/fullStar.png");
			} else {
				$(this).attr("src", path + "/resources/img/recipe/emptyStar.png");
			}
		});
		$("#scoreText").val("5");
	}
}