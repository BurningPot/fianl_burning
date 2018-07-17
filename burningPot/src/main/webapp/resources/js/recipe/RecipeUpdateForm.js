$(function () {

    $(".fileArea").hide();

    // ------------------------------------- 주재료 기능 영역 -------------------------------------
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

    // ------------------------------------- 버튼 영역 -------------------------------------
    $('.submitBtn').click(function(e) {
        if(confirm('레시피 수정을 완료하시겠습니까?')){
			console.log("수정완료");
		} else {
            e.preventDefault();
            console.log("수정취소");
        }
    });

    $('.cancleBtn').click(function(e) {
        if(confirm('레시피 수정을 취소하시겠습니까?')){
			console.log("수정취소-완료");
		} else {
            e.preventDefault();
            console.log("수정취소-취소");
        }
    });

    $('.deleteBtn').click(function(e) {
        if(confirm('레시피를 삭제하시겠습니까?')){
			console.log("삭제완료");
		} else {
            e.preventDefault();
            console.log("삭제취소");
        }
    });

});