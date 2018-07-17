$(function () {

    $(".fileArea").hide();

    // ------------------------------------- 주재료 기능 영역 -------------------------------------
    // 주재료 추가 버튼
    $('#mainAddBtn').click(function() {
        var obj = $('.mainAddForm').eq(0).clone(true);
        $(obj).find('.ingredientList').remove();
        $(obj).find('.mainAddText').val("");
        $('.mainAddArea').append(obj);
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

    // ------------------------------------- 부재료 기능 영역 -------------------------------------
    // 부재료 추가 버튼
    $('#subAddBtn').click(function() {
        var obj = $('.subAddForm').eq(0).clone(true);
        $(obj).find('.subIngredient').val("");
        $(obj).find('.subIngredientQuan').val("");
        $('.subAddArea').append(obj);
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
    $('#submitBtn').on('click', function(e) {
        if(confirm('작성을 완료하시겠습니까?')){
        	if(validate()){
        		console.log("작성완료");
        	} else {
        		console.log("빈칸있음");
        		e.preventDefault();
        	}
		} else {
            e.preventDefault();
            console.log("작성취소");
        }
    });

    // 취소하기 버튼 클릭 시
    $('.cancleBtn').click(function(e) {
        if(confirm('작성을 취소하시겠습니까?')){
			console.log("작성취소-확인");
		} else {
            e.preventDefault();
            console.log("작성취소-취소");
        }
    });
    
	// ------------------------------------- 카테고리 영역 -------------------------------------
    // 주재료 카테고리 선택
    $('.category').change(function() {
    	var obj = $(this);
    	$.ajax ({
    		url : path + "/recipe/selectIngredientList.do",
    		data : {category : $(this).val()},
    		dataType : "json",
    		success : function(data) {
    			if (data.length > 0) {
    				$(obj).siblings('.ingrdient').children().siblings('.ingredientList').remove();
	    			$.each(data, function(key, value) {
	    				 $(obj).siblings('.ingrdient').append("<option class='ingredientList' value=" + value.iNum + ">" + value.iName + "</option>");
	    			});
    			} else {
    				alert(category + " 관련 식재료 조회에 실패했습니다!");
    			}
    		}, error : function(e) {
    			alert(category + " 관련 식재료 조회에 실패했습니다!");
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
}

// ------------------------------------- 레시피 등록 시 빈칸 확인 영역 -------------------------------------
function validate() {
	var chk = true;
    var strArr = $('.titleImage').attr('src').split("/");
    
	if ($('#recipeTitle').val().trim().length < 1) {
		alert("레시피 제목을 작성해주세요.");
		$('#recipeTitle').focus();
		return false;
	} else if ($('#recipeIntroduce').val().trim().length < 1) {
		alert("한줄 소개를 작성해주세요.");
		$('#recipeIntroduce').focus();
		return false;
	} else if ($('#people option:selected').val() == '0') {
		alert("인원 정보를 입력해주세요.");
		$('#people').focus();
		return false;
	} else if ($('#cookTime option:selected').val() == '0') {
		alert("시간 정보를 입력해주세요.");
		$('#cookTime').focus();
		return false;
	} else if ($('#cookLevel option:selected').val() == '0') {
		alert("난이도 정보를 입력해주세요.");
		$('#cookLevel').focus();
		return false;
	} else if (strArr[strArr.length - 1] == 'titleImg.PNG') {
		alert("타이틀 이미지를 등록해주세요.");
		$('html, body').animate({
			"scrollTop": 0
		}, 300);
		return false;
	} else {
		$('.category').each(function(index, value) {
			if ($(this).find('option:selected').val() == '0' || $(this).siblings('.ingrdient').find('option:selected').val() == '0' || $(this).siblings('.mainAddText').val().trim().length < 1) {
				alert("주재료에 빈 칸이 있습니다. (칸을 삭제하거나 정보를 입력해주세요.)");
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
				alert("부재료에 빈 칸이 있습니다. (칸을 삭제하거나 정보를 입력해주세요.)");
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
				alert("요리 순서에 빈 칸이 있습니다. (칸을 삭제하거나 정보를 입력해주세요.)");
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