   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css"> --%>

	<!-- 아이콘 관련한 링크 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원조회 메뉴</title>
<style>



    .search-title{
        text-align: center;
        font-size: 200%;
        font-weight: bold;
        margin-bottom: 5%;

    }

    #photo{ 
        margin-top: 3%;
        margin-bottom: 3%;
    }
    #name{
    	margin-top: 13%;
        text-align: center;
        font-size: 130%;
        font-weight: bold;
    }   
    .detail-column{ 
        font-size: 150%; !important;
        height: 20%;!important;
        padding-top:1%;!important;
    	margin-bottom: 1%;!important;
    	background:  #FDD692;   !important; 
    	color: #754F44;	!important;
    }
    #gender .fas{
    	font-size: 150%;
    }
    .whenEmpty div:first-child{
    	color: #EC7357;
    	margin-top:2%;
    	margin-bottom:2%;
    	font-size:300%;  
    	text-align:center;  	
    }
    .whenEmpty div:nth-child(2){
    	font-size: 200%;
    	font-weight: bold;
    	text-align: center;
    	color: #754F44;    	
    }.whenEmpty div:nth-child(3){
    	font-size: 120%;
    	text-align: center;
    	margin-bottom:2%;
    	color:#754F44;
    }
    .detail-column div div:first-child{
    	text-align: center;  
    	font-size: 120%;  
    }        
   /*
    #FBFFB9
    #FDD692
    #EC7357
    #754F44
    */
    </style>



</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- 야매로 공간할당을 주어 처리한 부분 -->
	<div style="height:20%;"></div>
    

<c:import url="/WEB-INF/views/admin/adminCommonTitle.jsp"/>
<br /><br />
    <div class="row">
        <div class="col-lg-2 menu-bar">
             <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>         
        </div>
        <div class="col-lg-8 offset-lg-2 content">      

         <!--검색바-->
        <br><br>
        
         <div class="row">         
            <div class="col-lg-2 offset-lg-1"> 
                <select class="custom-select" name="customSelect">
                    <option selected>검색카테고리</option>
                    <option value="name">이름</option>
                    <option value="id">아이디</option>
                    <option value="gender">성별</option>                    
                </select>
            </div>
            <div class="col-lg-6">
                <input type="text" class="form-control keyword" name="keyword"  onkeypress="if(event.keyCode==13) {pressSearch();}">
            </div>         
            <div class="col-lg-2">
                <button class="btn btn-primary" id="searchMember-Btn" onclick="pressSearch();">검색</button>
                <button class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/goSearchMember.do'">전체보기</button>
            </div>                
        </div>        
		
		<script>
		function pressSearch(){
			var category = "";
			var keyword = "";			
			if($('.custom-select').val() == "" || $('.custom-select').val() == null || $('.custom-select').val() == '검색카테고리'){
				// 검색카테고리를 선택하지 않았을 경우				
				swal("알림", "검색카테고리를 먼저 선택해주세요", "info");
				
			}else if($('.keyword').val() == "" || $('.keyword').val() == null){
				//검색창에 아무것도 적지 않았을 경우
				swal("알림", "검색어를 입력해주세요", "info");
			}else{
				// 카테고리 선택  O, 검색창 입력 O				
				category = $('.custom-select').val();
				keyword = $('.keyword').val();
				toOtherPageWithKeyword(1,category, keyword);
				//location.href="${pageContext.request.contextPath}/admin/goSearchMember.do?customSelect="+category+"&keyword="+keyword;
			}
		}		
		</script>
						
        <br><br>
        <!--회원리스트 표시되는 곳-->        
        <table class="table col-lg-12" id="member-table">
            <thead>
                <tr>      
                	<th></th>              
                    <th scope="col">회원번호</th>
                    <th scope="col">이름</th>
                    <th scope="col">아이디</th>
                </tr>
        	</thead>
        	<tbody>            
            <c:forEach items="${list}" var="m">
                <tr class="member-list"> 
                	<td></td>                   
                    <td>${m.mNum}</td>
                    <td>${m.mName}</td>
                    <td>${m.mId}</td>
                </tr> 
            </c:forEach>             
            </tbody>
        </table>
        <div class="col-lg-12 whenEmpty" style="display:none; background:#FDD692">
        	<div class="col-lg-12" ><i class="fas fa-exclamation-triangle fa-2x"></i></div>
        	<div class="col-lg-12">검색결과가 존재하지 않습니다!</div>
        	<div class="col-lg-12">다른 검색어로 입력해보면 어떨까요?</div>    
        </div>
        <br /><br />
        <form id="toOtherPage" method="POST" action="${pageContext.request.contextPath}/admin/goSearchMember.do">
        	<input type="hidden" name="mNum" value="${m.mNum}"/>
        	<input type="hidden" id="form_cPage" name="cPage" value=""/>
        	<input type="hidden" id="form_customSelect" name="customSelect" value=""/>
        	<input type="hidden" id="form_keyword" name="keyword" value=""/>        	
        </form>
        
        <!-- 멤버검색결과가 없을경우에는? -->
        <script>
        $(function(){        	
        	if($('tbody').text().trim().length == 0){
        		console.log("비었어!");
        		$('#member-table').css('display', 'none');
        		$('.pagenation-member').css('display', 'none');
        		$('.whenEmpty').css('display', 'inline-block');
        	}
        });
        function toOtherPageWithKeyword(cPage, customSelect, keyword){
        	$('#form_cPage').val(cPage);
        	$('#form_customSelect').val(customSelect);
        	$('#form_keyword').val(keyword);
        	$('#toOtherPage').submit();        	
        }
        function toOtherPage(cPage){
        	$('#form_cPage').val(cPage);
        	$('#toOtherPage').submit(); 
        }
        
        </script> 
         
        <div class="col-lg-10 offset-lg-1 pagenation-member">       
        <!-- pagenation -->
        <!-- 검색어와 함께할 경우 -->
        <c:if test="${customSelect != 'null' and keyword != 'null' }">        
		<div class="pagingArea col-lg-12" >
			<ul class="pagination justify-content-center">
			<!-- 한페이지씩 앞으로 이동 -->
			<c:if test="${cPage eq 1}">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>				
			</c:if>
			<c:if test="${cPage ne 1}">
				<li class="page-item"><a class="page-link" 
				onclick='toOtherPageWithKeyword("${cPage-1}", "${customSelect}", "${keyword}");'>Previous</a></li>							
			</c:if>			
				
			<!-- 각 페이지 별 리스트 작성 -->
			<c:forEach begin ="${startPage}" end ="${endPage}" var="i">
				<c:if test="${i eq cPage }">					
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i ne cPage }">
					<%-- <button onclick="location.href='${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${i}'">${i}</button> --%>
					<li class="page-item"><a class="page-link" 
					onclick='toOtherPageWithKeyword("${i}", "${customSelect}", "${keyword}");'>${i}</a></li>
				</c:if>				
			</c:forEach>			
				
			<!-- 한페이지씩 뒤로 이동 -->
			<c:if test="${cPage >= maxPage }">				
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>				
			</c:if>
			<c:if test="${cPage < maxPage }">				
				<li class="page-item"><a class="page-link" 
				onclick='toOtherPageWithKeyword("${cPage + 1 }", "${customSelect}", "${keyword}");'>Next</a></li>
			</c:if>	
			</ul>
		</div>
		</c:if>
		
		<!-- 검색어 없이 할 경우 -->
		<c:if test="${customSelect == 'null' and keyword == 'null' }">		
		<div class="pagingArea col-lg-12" >
			<ul class="pagination justify-content-center">
			<!-- 한페이지씩 앞으로 이동 -->
			<c:if test="${cPage eq 1}">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>				
			</c:if>
			<c:if test="${cPage ne 1}">
				<li class="page-item"><a class="page-link" 
				onclick='toOtherPage("${cPage-1}");'>Previous</a></li>							
			</c:if>			
				
			<!-- 각 페이지 별 리스트 작성 -->
			<c:forEach begin ="${startPage}" end ="${endPage}" var="i">
				<c:if test="${i eq cPage }">					
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i ne cPage }">
					<li class="page-item"><a class="page-link" 
					onclick='toOtherPage("${i}");'>${i}</a></li>
				</c:if>				
			</c:forEach>			
				
			<!-- 한페이지씩 뒤로 이동 -->
			<c:if test="${cPage >= maxPage }">				
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>				
			</c:if>
			<c:if test="${cPage < maxPage }">				
				<li class="page-item"><a class="page-link"
				onclick='toOtherPage("${cPage + 1 }");'>Next</a></li>
			</c:if>	
			</ul>
		</div>
		</c:if>
		<!-- pagenation -->  
   		</div>	
   		
        <br><br>
        <div class="col-lg-10 offset-lg-1 content-sub-title">회원상세정보</div>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-3">
                    <!-- 사진과 이름 -->
                    <div class="col-lg-12" id="photo">
                    	<img src="${pageContext.request.contextPath}/resources/img/profile/defaultPerson.png" alt="" class="col-lg-12"/>
                    </div>
                    <div class="col-lg-12" id="name">이름</div>
                    <input type="hidden" id="numberOfMember" value=""/>
                </div>

                <div class="col-lg-9" id="detail-info">
                    <!-- 아이디 이메일 성별 생년월일 -->
                    <div class="col-lg-10 detail-column offset-lg-1" style="border: 0px;">
                        <div class="row">
                            <div class="col-3" >아이디</div>
                            <div class="col-9" id="id"></div>
                        </div>
                    </div>
                    <div class="col-lg-10 detail-column offset-lg-1" style="border: 0px;">
                        <div class="row">
                            <div class="col-3">이메일</div>
                            <div class="col-9" id="email"></div>
                        </div>
                    </div>
                    <div class="col-lg-10 detail-column offset-lg-1" style="border: 0px;">
                        <div class="row">
                            <div class="col-3">성별</div>
                            <div class="col-9" id="gender">
                            <i class="fas fa-venus" style="display : none; color: #f902dd"></i><i class="fas fa-mars" style="display : none; color: blue;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 detail-column offset-lg-1" style="border: 0px;">
                        <div class="row">
                            <div class="col-3">생년월일</div>
                            <div class="col-9" id="birth"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        $('.member-list').hover(function(){
        	$(this).css({
        		'background' : 'lightgray',
        		'cursor' : 'pointer'        		
        	});
        }, function(){
        	$(this).css({
        		'background' : 'white'
        	});
        });
        
        $('.member-list').on('click', function(){
        	console.log($(this).children().eq(1).text());
        	
        	var memberNum = $(this).children().eq(1).text();        	   	
        	
        	$.ajax({
            	url : "${pageContext.request.contextPath}/admin/memberDetail.do",            	
            	dataType : "json",
            	data : {mNum : memberNum},
            	success : function(data){
            		var name = data.name;
            		var id = data.id;
            		var email = data.email;
            		var gender = data.gender;
            		var birthDate = data.birthDate;
            		var picture = data.picture;
            		var memberNumber = memberNum;
            		console.log('회원정보 : '+name+', '+id+', '+email+', '+gender+', '+birthDate+', '+picture);
            		
            		$('#name').text(name);
            		$('#numberOfMember').val(memberNumber);
            		$('#id').text(id);
            		$('#email').text(email);
            		$('#photo').children('img').attr('src', '${pageContext.request.contextPath}/resources/img/profile/'+picture);
            		if(gender == 'M'){
            			$('#gender').children('.fa-venus').css('display','none');
            			$('#gender').children('.fa-mars').css('display','inline');
            		}else if(gender == 'F'){
            			$('#gender').children('.fa-venus').css('display','inline');
            			$('#gender').children('.fa-mars').css('display','none');
            		}else{
            			/* location.href="" */ //에러페이지로 넘어간다
            		}  
            		$('#birth').text(birthDate); 
            	}, error: function(data){
            		swal('작업실패!', "회원의 정보를 읽어오지 못했습니다", 'error');
            	} 
            });
        });
        
        </script>
        <br><br>
        
        <div class="col-lg-12" align="center">
            <button class="btn btn-primary" onclick="expelTheBadOne()">탈퇴시키기</button>
        </div>
        <br><br>
		
		<script>
			function expelTheBadOne(){
				//ajax로 하자
				var mNum = $('#numberOfMember').val();
				console.log(mNum);
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/updateExpelMember.do',
					data:{
						mNum : mNum
					}, success: function(data){	
						swal('작업성공!', "회원번호 ["+data+"] 가 강제 탈퇴 되었습니다", 'success').then((value) => { 
							//location.href="${pageContext.request.contextPath}/admin/goSearchMember.do";
							toOtherPage(1);
						});
					}, error: function(data){
						swal('작업실패!', '강제탈퇴에 실패했습니다', 'error');
					}
				})
				 
			}
		</script>
        </div>
    </div>
</body>
</html>