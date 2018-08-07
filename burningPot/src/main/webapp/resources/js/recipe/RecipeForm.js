$(function () {

    $(".fileArea").hide();
    
	// top 버튼 추가
	$(".top_btn").append("<a href='#' class='click mt-2'>제목</a>");
	$(".top_btn").append("<a href='#ingredientData' class='followArea mt-2'>재료</a>");
	$(".top_btn").append("<a href='#subAddBtn' class='followArea mt-2'>순서</a>");

	$('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
          $('html, body').animate({
            scrollTop: target.offset().top - 100
          }, 300);
          return false;
      }
    });

    // ------------------------------------- 주재료 기능 영역 -------------------------------------
    // 주재료 추가 버튼
    $('#mainAddBtn').click(function() {
    	var chk = 0;
    	$(".mainAddForm").each(function(index, item) {
    		chk = index;
    	});
    	if (chk < 9) {
            var obj = $('.mainAddForm').eq(0).clone(true);
            $(obj).find('.ingredientList').remove();
            $(obj).find('.mainAddText').val("");
            $('.mainAddArea').append(obj);
    	} else {
    		swal("주재료 추가 제한!", "재료는 10개까지 입력 가능합니다.", "error");
    	}
    });

    // 주재료 삭제 버튼 보여주는 기능
    $('.mainAddForm').mouseover(function() {
        $(this).children().find('.mainDelIcon').show();
    });

    // 주재료 삭제 버튼 없어지는 기능
    $('.mainAddForm').mouseout(function() {
        $(this).children().find('.mainDelIcon').hide();
    });

    // 주재료 입력 폼 삭제하는 기능
    $('.mainDelIcon').click(function(e) {
        if ($('.mainDelIcon').length > 1) {
            $(this).parent().parent().parent().remove();
        } else {
    		swal("주재료 제한!", "한 개 이상의 주재료를 입력해 주세요.", "error");
        }
    });
    
    // 글자수 제한 기능
    $(".mainAddText").on('keyup', function() {
    	if($(this).val().length > 15) {
    		swal("글자 제한!", "15자 이내로 입력해주세요.", "error");
            $(this).val($(this).val().substring(0, 15));
        }
    });

    // ------------------------------------- 부재료 기능 영역 -------------------------------------
    // 부재료 추가 버튼
    $('#subAddBtn').click(function() {
    	var chk = 0;
    	$(".subAddForm").each(function(index, item) {
    		chk = index;
    	});
    	if (chk < 9) {
	        var obj = $('.subAddForm').eq(0).clone(true);
	        $(obj).find('.subIngredient').val("");
	        $(obj).find('.subIngredientQuan').val("");
	        $('.subAddArea').append(obj);
    	} else {
    		swal("부재료 추가 제한!", "재료는 10개까지 입력 가능합니다.", "error");
    	}
    });

    // 부재료 삭제 버튼 보여주는 기능
    $('.subAddForm').mouseover(function() {
        $(this).children().find('.subDelIcon').show();
    });

    // 부재료 삭제 버튼 없어지는 기능
    $('.subAddForm').mouseout(function() {
        $(this).children().find('.subDelIcon').hide();
    });

    // 부재료 입력 폼 삭제하는 기능
    $('.subDelIcon').click(function() {
        if ($('.subDelIcon').length > 1) {
            $(this).parent().parent().parent().remove();
        } else {
            swal("부재료 제한!", "한 개 이상의 주재료를 입력해 주세요.", "error");
        }
    });
    
	 // 글자수 제한 기능
	$(".subIngredientQuan").on('keyup', function() {
		if($(this).val().length > 15) {
    		swal("글자 제한!", "15자 이내로 입력해주세요.", "error");
	        $(this).val($(this).val().substring(0, 15));
	    }
	});

    // ------------------------------------- 레시피 등록 기능 영역 -------------------------------------
    // 레시피 폼 추가 버튼
    $('#recipeAddBtn').click(function() {
        var obj = $('.recipeContentForm').last().clone(true);
        var text = $(obj).find('.stepText').text();
        $(obj).find('.stepText').text("Step "+(Number.parseInt(text.substr(text.indexOf(" ")+1))+1));
        $(obj).find('.recipeContent').val("");
        $(obj).find('.subImage').attr("src", path + "/resources/img/recipe/addImg.png");
        $('.recipeContentArea').append($(obj));
    });

    // 레시피 내용 삭제 버튼 보여주는 기능
    $('.recipeContentForm').mouseover(function() {
        $(this).children().find('.recipeDelIcon').show();
    });

    // 레시피 내용 삭제 버튼 없어지는 기능
    $('.recipeContentForm').mouseout(function() {
        $(this).children().find('.recipeDelIcon').hide();
    });

    // 레시피 내용 입력 폼 삭제하는 기능
    $('.recipeDelIcon').click(function() {
        var step = $(this).parent().parent().siblings().find('.stepText').text();
        if ($('.recipeDelIcon').length > 1) {
            $(this).parent().parent().parent().remove();
        } else {
            swal("레시피 제한!", "한 개 이상의 레시피 내용을 입력해 주세요.", "error");
        }

        $('.recipeContentForm').each(function(index, item) {
            var text = $(this).find('.stepText').text();
            if (Number.parseInt(text.substr(text.indexOf(" ")+1)) > Number.parseInt(step.substr(step.indexOf(" ")+1))) {
                $(this).find('.stepText').text("Step "+(Number.parseInt(text.substr(text.indexOf(" ")+1))-1));
            }
        });
    });

    // ------------------------------------- 이미지 등록 기능 영역 -------------------------------------
    // 대표 사진
    $("#titleImgArea").click(function(){
        $("#titleImg").click();
    });

    // 레시피 사진
    $(".subImgArea").click(function(){
        $(this).siblings(".subImg").click();
    });

    // ------------------------------------- 버튼 영역 -------------------------------------
    // 저장하기 버튼 클릭 시
    $('#submitBtn').on('click', function() {
//        if(confirm('작성을 완료하시겠습니까?')){
//        	if(validate()){
//        		$('.recipeContentForm').each(function(index, value) {
//        			$(this).children().siblings().find('.recipeContent').val($(this).children().siblings().find('.recipeContent').val().replace(/(\n|\r\n)/g, '<br>'));
//        		});
//        	} else {
//        		e.preventDefault();
//        	}
//		} else {
//            e.preventDefault();
//        }
        swal("레시피 작성을 완료하시겠습니까?", {
    		buttons: {
    			catch: {
    				text: "등록",
    				value: "catch",
    			}, cancel: "취소"
    		},
    	}).then((value) => {
    		switch (value) {
			    case "catch":
			    	if(validate()){
		        		$('.recipeContentForm').each(function(index, value) {
		        			$(this).children().siblings().find('.recipeContent').val($(this).children().siblings().find('.recipeContent').val().replace(/(\n|\r\n)/g, '<br>'));
		        		});
		        		$("#formId").submit();
		        		break;
		        	} else {
		        		e.preventDefault();
		        		break;
		        	}
			 
			    default:
			    	swal("등록 취소!", "댓글 등록을 취소하였습니다.", "error", {button:false});
			  }
    	});
    });

    // 취소하기 버튼 클릭 시
    $('.cancleBtn').click(function(e) {
        if(confirm('작성을 취소하시겠습니까?')){
		} else {
            e.preventDefault();
        }
    });
    
	// ------------------------------------- 카테고리 영역 -------------------------------------
    // 주재료 카테고리 선택
    $('.category').change(function() {
    	var obj = $(this);
    	$.ajax ({
    		url : path + "/recipe/selectIngredientList.do",
    		data : {category : $(this).find("option:selected").text()},
    		dataType : "json",
    		success : function(data) {
    			if (data.length > 0) {
    				$(obj).siblings('.ingrdient').children().siblings('.ingredientList').remove();
	    			$.each(data, function(key, value) {
	    				 $(obj).siblings('.ingrdient').append("<option class='ingredientList' value=" + value.iNum + ">" + value.iName + "</option>");
	    			});
    			} else {
    	            swal("식재료 조회 오류!", $(this).find("option:selected").text() + " 관련 식재료 조회에 실패했습니다!", "error");
    			}
    		}, error : function(e) {
    			swal("식재료 조회 오류!", $(this).find("option:selected").text() + " 관련 식재료 조회에 실패했습니다!", "error");
    		}
    	});
    });
    
    $(window).scroll(function(event){ 
    	if ($('.container input').is(':focus') == true) {
        	$('.container input:focus').blur();
    	}
	});

});

// ------------------------------------- 이미지 등록 기능 영역 -------------------------------------
function LoadImg(value, num) {
        var reader = new FileReader();
        var pathpoint = value.value.lastIndexOf('.');
        var filepoint = value.value.substring(pathpoint+1, value.length);
        var filetype = filepoint.toLowerCase();
        
        if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {
            reader.onload = function(e) {
                switch(num){
                case 1:
                    $(".titleImage").attr("src", e.target.result);
                    break;
                case 2:
                    $(value).siblings('.subImage').attr("src", e.target.result);
                    break;
                }
            }
            reader.readAsDataURL(value.files[0]);
        } else {
        	swal("이미지 제한!", "이미지 파일만 선택 가능합니다!", "error");
        }
}

// ------------------------------------- 레시피 등록 시 빈칸 확인 영역 -------------------------------------
function validate() {
	var chk = true;
    var strArr = $('.titleImage').attr('src').split("/");
    
	if ($('#recipeTitle').val().trim().length < 1) {
    	swal("레시피 제목", "레시피 제목을 작성해주세요.", "error", {button:false});
		$('#recipeTitle').focus();
		return false;
	} else if ($('#recipeIntroduce').val().trim().length < 1) {
		swal("한줄 소개", "한줄 소개를 작성해주세요.", "error", {button:false});
		$('#recipeTitle').focus();
		return false;
	} else if ($('#people option:selected').val() == '0') {
		swal("인원 정보", "인원 정보를 작성해주세요.", "error", {button:false});
		$('#recipeTitle').focus();
		return false;
	} else if ($('#cookTime option:selected').val() == '0') {
		swal("시간 정보", "시간 정보를 작성해주세요.", "error", {button:false});
		$('#recipeTitle').focus();
		return false;
	} else if ($('#cookLevel option:selected').val() == '0') {
		swal("난이도 정보", "난이도 정보를 작성해주세요.", "error", {button:false});
		$('#recipeTitle').focus();
		return false;
	} else if (strArr[strArr.length - 1] == 'titleImg.PNG') {
		swal("타이틀 이미지", "타이틀 이미지를 작성해주세요.", "error", {button:false});
		$('html, body').animate({
			"scrollTop": 0
		}, 300);
		return false;
	} else {
		$('.category').each(function(index, value) {
			if ($(this).find('option:selected').val() == '0' || $(this).siblings('.ingrdient').find('option:selected').val() == '0' || $(this).siblings('.mainAddText').val().trim().length < 1) {
				swal("주재료", "주재료에 빈 칸이 있습니다.\n(칸을 삭제하거나 정보를 입력해주세요.)", "error", {button:false});
				$(this).focus();
				chk = false;
				return false;
			}
		});
		if (chk == false) {
			return chk;
		}
		$('.subIngredient').each(function(index, value) {
			if ($(this).val().trim().length < 1 || $(this).siblings('.subIngredientQuan').val().trim().length < 1) {
				swal("부재료", "부재료에 빈 칸이 있습니다.\n(칸을 삭제하거나 정보를 입력해주세요.)", "error", {button:false});
				$(this).focus();
				chk = false;
				return false;
			}
		});
		if (chk == false) {
			return chk;
		}
		$('.recipeContentForm').each(function(index, value) {
			var srcArr = $(this).children().siblings().find('.subImgArea').attr('src').split("/");
			if (srcArr[srcArr.length -1] == 'addImg.png' || $(this).children().siblings().find('.recipeContent').val().trim().length < 1){
				swal("요리 순서", "요리 순서에 빈 칸이 있습니다.\n(칸을 삭제하거나 정보를 입력해주세요.)", "error", {button:false});
				$(this).children().siblings().find('.recipeContent').focus();
				chk = false;
				return false;
			}
		});
		if (chk == false) {
			return chk;
		}
	}
	return true;
}