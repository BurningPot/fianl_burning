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
	
	if (keyword == "review") {
		$('html, body').animate({
			scrollTop : $("#commentData").offset().top -100
		}, 300);
		return false;
	}

	// ------------------------------------- 좋아요 버튼 영역 -------------------------------------
//	$("#goodBtn").click(function() {
//		var textArr = $(this).text().split(" ");
//		console.log("확인");
//		
//		if (textArr[1] != "취소") {
//			console.log($(this).text());
//			$.ajax ({
//	    		url : path + "/recipe/insertRecommend.do",
//	    		data : {rNum : rNum},
//	    		dataType : "json",
//	    		async : false,
//	    		success : function(data) {
//    				alert("좋아요를 눌렀습니다.");
//    				$('#goodBtn').children().remove();
//    				$("#goodBtn").text("");
//    				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요 취소" + ` (`+ data +`)`);
//	    		}, error : function(e) {
//	    			alert("좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)");
//	    		}
//	    	});
//		} else {
//			console.log($(this).text());
//			$.ajax ({
//	    		url : path + "/recipe/deleteRecommend.do",
//	    		data : {rNum : rNum},
//	    		dataType : "json",
//	    		async : false,
//	    		success : function(data) {
//    				alert("좋아요를 취소 했습니다.");
//    				$('#goodBtn').children().remove();
//    				$("#goodBtn").text("");
//    				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요" + ` (`+ data +`)`);
//	    		}, error : function(e) {
//	    			alert("좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)");
//	    		}
//	    	});
//		}
//	});
		
    // ------------------------------------- 댓글 등록 영역 -------------------------------------
//	 $('#reviewSubmitBtn').click(function(e) {
//        if(confirm('댓글을 등록하시겠습니까?')){
//    		if (mem != "") {
//    			if ($("#reviewContent").val() != "") {
//    				console.log("등록");
//    				$("#formId").submit();
//    				alert("댓글 작성 완료");
//    			} else {
//    				alert("댓글 내용을 작성해주세요!");
//    			}
//    		} else {
//    			console.log("비어있음");
//    			alert("로그인 이후 사용 가능한 서비스 입니다. (로그인 이후 사용 바랍니다.)");
//    		}
//		} else {
//            e.preventDefault();
//            console.log("작성취소");
//        }
//    });
	 
	// ------------------------------------- 댓글 삭제 영역 -------------------------------------
//	 $(".reviewDelBtn").click(function(e) {
//		 console.log("확인");
//		 var area = $(this);
//		 if(confirm('댓글을 삭제하시겠습니까?')){
//			 area.parent().parent().parent().parent().submit();
//		 } else {
//            e.preventDefault();
//        }
//	 });
	 
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

//------------------------------------- 신고하기 버튼 영역 -------------------------------------
function reportInsert(){
   var rNo = $('#rNum').val();
   var message = $('#message-text').val();

   $.ajax ({
      url : path + "/recipe/insertReport.do",
      data : {rpContent : message, mNum : mem, rNum : rNo},
      success : function(data) {
         swal("신고 완료!", "해당 레시피에 대한 신고를 관리자에게 보냈습니다.", "success", {
              button: false,
         });
      }, error : function(e) {
         swal("신고 실패!", "신고 글 작성에 실패했습니다.", "error", {
              button: false,
         });
      }
   });   
}

function refresh(){
   $('#message-text').val("");
}

// ------------------------------------- 댓글 등록 영역 -------------------------------------
function reviewSubmit(e) {
	swal("댓글을 등록하시겠습니까?", {
		buttons: {
			catch: {
				text: "등록",
				value: "catch",
			}, cancel: "취소"
		},
	}).then((value) => {
		  switch (value) {
		    case "catch":
		    	if (mem != "") {
					if ($("#reviewContent").val() != "") {
						 swal("등록 완료!", "해당 댓글을 성공적으로 등록하였습니다.", "success", {button:false});
						 $("#formId").submit();
						 break;
					} else {
							swal("댓글 등록 실패!", "댓글 내용을 작성해주세요!", "error", {button:false});
							break;
					}
		    	} else {
					swal("댓글 등록 실패!", "로그인 이후 사용 가능한 서비스 입니다. \n(로그인 이후 사용 바랍니다.)", "error", {button:false});
					break;
				}
		 
		    default:
		    	swal("등록 취소!", "댓글 등록을 취소하였습니다.", "error", {button:false});
		  }
	});
//	if(confirm('댓글을 등록하시겠습니까?')){
//		if (mem != "") {
//			if ($("#reviewContent").val() != "") {
//				console.log("등록");
//				$("#formId").submit();
//				swal("댓글 작성 완료!", "댓글이 성공적으로 작성되었습니다.", "success", {
//		              button: false,
//		         });				
//			} else {
//				swal("댓글 등록 실패!", "댓글 내용을 작성해주세요!", "error", {
//		              button: false,
//		         });
//			}
//		} else {
//			console.log("비어있음");
//			swal("댓글 등록 실패!", "로그인 이후 사용 가능한 서비스 입니다. \n(로그인 이후 사용 바랍니다.)", "error", {
//	              button: false,
//	         });
//		}
//	} else {
//        e.preventDefault();
//    }
}

// ------------------------------------- 댓글 삭제 영역 -------------------------------------
function reviewDelete(e) {
	var area = $(e);
	
	swal("댓글을 삭제하시겠습니까?", {
		buttons: {
			catch: {
				text: "삭제",
				value: "catch",
			}, cancel: "취소"
		},
	}).then((value) => {
		  switch (value) {
		    case "catch":
				 swal("삭제 완료!", "해당 댓글을 성공적으로 삭제하였습니다.", "success", {button:false});
				 area.parent().parent().parent().parent().submit();
				 break;
		 
		    default:
		    	swal("삭제 취소!", "해당 댓글 삭제를 취소하였습니다.", "error", {button:false});
		    	e.preventDefault();
		  }
	});
}

function addGood(e) {
	var textArr = $(e).text().split(" ");
	
	if (textArr[1] != "취소") {
		$.ajax ({
    		url : path + "/recipe/insertRecommend.do",
    		data : {rNum : rNum},
    		dataType : "json",
    		async : false,
    		success : function(data) {
				swal("좋아요!", "좋아요버튼을 눌렀습니다.", "success", {
		              button: false,
		         });	
				$('#goodBtn').children().remove();
				$("#goodBtn").text("");
				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요 취소" + ` (`+ data +`)`);
    		}, error : function(e) {
    			swal("좋아요 버튼 오류!", "좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)", "error", {
		              button: false,
		         });	
    		}
    	});
	} else {
		console.log($(e).text());
		$.ajax ({
    		url : path + "/recipe/deleteRecommend.do",
    		data : {rNum : rNum},
    		dataType : "json",
    		async : false,
    		success : function(data) {
    			swal("좋아요 취소!", "좋아요 취소 버튼을 눌렀습니다.", "success", {
		              button: false,
		         });	
				$('#goodBtn').children().remove();
				$("#goodBtn").text("");
				$("#goodBtn").append(`<img class="mr-1 mb-1" src="` + path + `/resources/img/recipe/goodIcon.png" alt="좋아요"/>` + "좋아요" + ` (`+ data +`)`);
    		}, error : function(e) {
    			swal("좋아요 버튼 오류!", "좋아요 버튼 오류 발생 (관리자에게 문의 바랍니다.)", "error", {
		              button: false,
		         });	
    		}
    	});
	}
}