$(function () {
	var mainNumList;

    $(".fileArea").hide();

    // textarea 줄바꿈
	$(".recipeContent").each(function(index, value) {
		$(this).text($(this).text().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
	});
	
	// top 버튼 추가
	$(".top_btn").append("<a href='#' class='click mt-2'>제목</a>");
	$(".top_btn").append("<a href='#ingredientData' class='followArea mt-2'>재료</a>");
	$(".top_btn").append("<a href='#recipeContentTitle' class='followArea mt-2'>순서</a>");

	$('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
          $('html, body').animate({
            scrollTop: target.offset().top - 100
          }, 300);
          return false;
      }
    });
	
	// 식재료 조회
	$('.category').each(function(index, value) {
		var obj = $(this);
		
    	$.ajax ({
    		url : path + "/recipe/selectIngredientList.do",
    		data : {category : $(this).find('option:selected').text()},
    		dataType : "json",
    		async : false,
    		success : function(data) {
    			if (data.length > 0) {
    				$(obj).siblings('.ingrdient').children().siblings('.ingredientList').remove();
    				$(obj).siblings('.ingrdient').append("<option class='ingredientList' value='0' selected>식재료</option>");
	    			$.each(data, function(key, value) {
	    				 $(obj).siblings('.ingrdient').append("<option class='ingredientList' value=" + value.iNum + ">" + value.iName + "</option>");
	    			});
    			} else {
    				alert(category + "관련 식재료 조회에 실패했습니다!");
    			}
    		}, error : function(e) {
    			alert(category + "관련 식재료 조회에 실패했습니다!");
    		}
    	});
    	
		$(this).siblings('.ingrdient').val(selectedNum(index));
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
			$(obj).children().siblings('.ingrdient').append("<option class='ingredientList' value='0' selected>식재료</option>");
	        $(obj).find('.category option:eq(0)').attr("selected", "selected");
	        $('.mainAddArea').append(obj);
    	} else {
    		alert("재료는 10개까지 입력 가능합니다.");
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
            alert("한 개 이상의 주재료를 입력해 주세요.");
        }
    });
    
    // 글자수 제한 기능
    $(".mainAddText").on('keyup', function() {
    	if($(this).val().length > 15) {
    		alert("15자 이내로 입력해주세요.");
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
    		alert("재료는 10개까지 입력 가능합니다.");
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
            alert("한 개 이상의 부재료를 입력해 주세요.");
        }
    });
    
	 // 글자수 제한 기능
	$(".subIngredientQuan").on('keyup', function() {
		if($(this).val().length > 15) {
			alert("15자 이내로 입력해주세요.");
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
            alert("한 개 이상의 레시피 내용을 입력해 주세요.");
        }

        $('.recipeContentForm').each(function(index, item) {
            var text = $(this).find('.stepText').text();
            if (Number.parseInt(text.substr(text.indexOf(" ")+1)) > Number.parseInt(step.substr(step.indexOf(" ")+1))) {
                $(this).find('.stepText').text("Step "+(Number.parseInt(text.substr(text.indexOf(" ")+1))-1));
            }
        });
    });
    
    // ------------------------------------- 카테고리 영역 -------------------------------------
    // 주재료 카테고리 선택
    $('.category').change(function() {
    	var obj = $(this);
    	$.ajax ({
    		url : path + "/recipe/selectIngredientList.do",
    		data : {category : $(this).find('option:selected').text()},
    		dataType : "json",
    		success : function(data) {
    			if (data.length > 0) {
    				$(obj).siblings('.ingrdient').children().siblings('.ingredientList').remove();
	    			$.each(data, function(key, value) {
	    				 $(obj).siblings('.ingrdient').append("<option class='ingredientList' value=" + value.iNum + ">" + value.iName + "</option>");
	    			});
    			} else {
    				alert(category + "관련 식재료 조회에 실패했습니다!");
    			}
    		}, error : function(e) {
    			alert(category + "관련 식재료 조회에 실패했습니다!");
    		}
    	});
    });
    
    $(window).scroll(function(event){ 
    	if ($('.container input').is(':focus') == true) {
        	$('.container input:focus').blur();
    	}
	});

    // ------------------------------------- 버튼 영역 -------------------------------------
    $('.submitBtn').click(function(e) {
        if(confirm('레시피 수정을 완료하시겠습니까?')){
        	if ($("#people").val() == 0) {
        		swal("인원 정보!", "인원 정보를 체크해주세요.", "error", {button:false});
                e.preventDefault();
        	} else if ($("#cookTime").val() == 0) {
        		swal("시간 정보!", "시간 정보를 체크해주세요.", "error", {button:false});
                e.preventDefault();
        	} else if ($("#cookLevel").val() == 0) {
        		swal("난이도 정보!", "난이도 정보를 체크해주세요.", "error", {button:false});
                e.preventDefault();
        	}
		} else {
            e.preventDefault();
            console.log("수정취소");
        }
    });

    $('.cancleBtn').click(function(e) {
        if(confirm('레시피 수정을 취소하시겠습니까?')){
			location.href=path;
		} else {
            e.preventDefault();
            console.log("수정취소-취소");
        }
    });

    $('.deleteBtn').click(function(e) {
        if(confirm('레시피를 삭제하시겠습니까?')){
			console.log("삭제완료");
			goDelete();
		} else {
            e.preventDefault();
            console.log("삭제취소");
        }
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

});
    
// selected될 식재료 번호 넘기기
function selectedNum(mainIndex) {
	var selectIndex;

	$('.mainNum').each(function(index, value) {
		if (mainIndex == index) {
			selectIndex = index;
			return false;
		}
	});
	
	return mainNum[selectIndex];
}


// ------------------------------------- 이미지 등록 기능 영역 -------------------------------------
function LoadImg(value, num) {
    var reader = new FileReader();
    var pathpoint = value.value.lastIndexOf('.');
    var filepoint = value.value.substring(pathpoint+1, value.length);
    var filetype = filepoint.toLowerCase();
    console.log("파일타입 : " + filetype);
    
    if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {
        reader.onload = function(e) {
            switch(num){
            case 1:
                $(".titleImage").attr("src", e.target.result);
	            $("#originTitleImg").val("");
                break;
            case 2:
                $(value).siblings('.subImage').attr("src", e.target.result);
	            $(value).siblings(".originSubImg").val("");
                break;
            }
        }
        reader.readAsDataURL(value.files[0]);
    } else {
    	alert("이미지 파일만 선택 가능합니다!");
    }
}

//------------------------------------- form action 변경 영역 -------------------------------------
function goDelete() {
	$('#formId').attr("action", "deleteRecipe.do");
	$('#formId').submit();
}