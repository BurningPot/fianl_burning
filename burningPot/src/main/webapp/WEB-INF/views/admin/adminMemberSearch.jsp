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
/* .menu-bar{            
    	background-color:white;           
        height: 100%;
        overflow: auto;
        position: fixed;
        display: relative;
    }
    .test{
    	border: 1px solid black;
    }   
    .content{
    	display: relative;
    }
    #title{
    	text-align: center;
    	font-size: 200%;
    	font-weight: bold;
    	margin-bottom: 3%;
    }
	*/
    
    .navi{
    	height: 30%;
        margin-top: 10%;
	}
    .navi div{
    	color:#754F44;
        border: 1px solid white;
        background: #FDD692;
        height: 20%;
        text-align: center;
        font-size: 200%;
        font-weight: bold;
	}   
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
   
    #detail-info>div{            
        border: 1px solid;
        font-size: 150%;
        height: 26%;
        padding-top:1.5%;
    	margin-bottom: 1%;            
    }
    #gender .fas{
    	font-size: 150%;
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
<br /><br /><br />
    <div class="row">
        <div class="col-lg-2 menu-bar">
             <c:import url="/WEB-INF/views/admin/sideMenu.jsp"/>         
        </div>
        
        
        <div class="col-lg-8 offset-lg-2 content">       

         <!--검색바-->
        <br><br>
        <form>
         <div class="row">
         
            <div class="col-lg-2 offset-lg-2">
                <select class="custom-select" name="customSelect">
                    <option selected>검색카테고리</option>
                    <option value="name">이름</option>
                    <option value="id">아이디</option>
                    <option value="gender">성별</option>                    
                </select>
            </div>
            <div class="col-lg-6">
                <input type="text" class="form-control keyword" name="keyword">
            </div>
            <div class="col-lg-2">
                <button class="btn btn-primary" id="searchMember-Btn">검색</button>
            </div>
         
        </div>
         </form>  
		
		<script>
		$('#searchMember-Btn').on('click', function(){
			if($('.custom-select').val() == "" || $('.custom-select').val() == null || $('.custom-select').val() == '검색카테고리'){
				// 검색카테고리를 선택하지 않았을 경우
				alert('검색카테고리를 선택해주세요!');
			}else if($('.keyword').val() == "" || $('.keyword').val() == null){
				//검색창에 아무것도 적지 않았을 경우
				alert('검색어를 입력해주세요');
			}else{
				// 카테고리 선택  O, 검색창 입력 O				
				$(this).parent().parent().attr('action', '/admin/goSearchMember.do').submit();
			}
		});		
		
		</script>
						
        <br><br>
        <!--회원리스트 표시되는 곳-->
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">회원번호</th>
                    <th scope="col">이름</th>
                    <th scope="col">아이디</th>
                </tr>
        	</thead>
        	<tbody>
            
            <c:forEach items="${list}" var="m">
                <tr class="member-list">
                    <th scope="row">${status.count}</th>
                    <td>${m.mNum}</td>
                    <td>${m.mName}</td>
                    <td>${m.mId}</td>
                </tr> 
            </c:forEach>  
            </tbody>
        </table>
         <br /><br />
               
        <!-- pagenation -->
        <c:if test="${customSelect != 'null' and keyword != 'null' }">        
		<div class="pagingArea col-lg-12" >
			<ul class="pagination justify-content-center">
			<!-- 한페이지씩 앞으로 이동 -->
			<c:if test="${cPage eq 1}">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>				
			</c:if>
			<c:if test="${cPage ne 1}">
				<li class="page-item"><a class="page-link" 
				href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${cPage-1}&customSelect=${customSelect}&keyword=${keyword}">Previous</a></li>							
			</c:if>			
				
			<!-- 각 페이지 별 리스트 작성 -->
			<c:forEach begin ="${startPage}" end ="${endPage}" var="i">
				<c:if test="${i eq cPage }">					
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i ne cPage }">
					<%-- <button onclick="location.href='${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${i}'">${i}</button> --%>
					<li class="page-item"><a class="page-link" 
					href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${i}&customSelect=${customSelect}&keyword=${keyword}">${i}</a></li>
				</c:if>				
			</c:forEach>			
				
			<!-- 한페이지씩 뒤로 이동 -->
			<c:if test="${cPage >= maxPage }">				
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>				
			</c:if>
			<c:if test="${cPage < maxPage }">				
				<li class="page-item"><a class="page-link" 
				href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${cPage + 1 }&customSelect=${customSelect}&keyword=${keyword}">Next</a></li>
			</c:if>	
			</ul>
		</div>
		</c:if>
		
		<c:if test="${customSelect == 'null' and keyword == 'null' }">		
		<div class="pagingArea col-lg-12" >
			<ul class="pagination justify-content-center">
			<!-- 한페이지씩 앞으로 이동 -->
			<c:if test="${cPage eq 1}">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>				
			</c:if>
			<c:if test="${cPage ne 1}">
				<li class="page-item"><a class="page-link" 
				href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${cPage-1}">Previous</a></li>							
			</c:if>			
				
			<!-- 각 페이지 별 리스트 작성 -->
			<c:forEach begin ="${startPage}" end ="${endPage}" var="i">
				<c:if test="${i eq cPage }">					
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i ne cPage }">
					<%-- <button onclick="location.href='${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${i}'">${i}</button> --%>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${i}">${i}</a></li>
				</c:if>				
			</c:forEach>			
				
			<!-- 한페이지씩 뒤로 이동 -->
			<c:if test="${cPage >= maxPage }">				
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>				
			</c:if>
			<c:if test="${cPage < maxPage }">				
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/goSearchMember.do?cPage=${cPage + 1 }">Next</a></li>
			</c:if>	
			</ul>
		</div>
		</c:if>
		<!-- pagenation -->  
   		   		
   		
        <br><br>
        <div class="col-lg-12 search-title">회원상세정보</div>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-3">
                    <!-- 사진과 이름 -->
                    <div class="col-lg-12" id="photo">
                    	<img src="${pageContext.request.contextPath}/resources/img/defaultPerson.png" alt="" class="col-lg-12"/>
                    </div>
                    <div class="col-lg-12" id="name">이름</div>
                </div>

                <div class="col-lg-9" id="detail-info">
                    <!-- 아이디 이메일 성별 생년월일 -->
                    <div class="col-lg-10 offset-lg-1">
                        <div class="row">
                            <div class="col-3" >아이디</div>
                            <div class="col-9" id="id"></div>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-lg-1">
                        <div class="row">
                            <div class="col-3">이메일</div>
                            <div class="col-9" id="email"></div>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-lg-1">
                        <div class="row">
                            <div class="col-3">성별</div>
                            <div class="col-9" id="gender">
                            <i class="fas fa-venus" style="display : none; color: pink"></i><i class="fas fa-mars" style="display : none; color: blue;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 offset-lg-1">
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
        	/* map.put("name", m.getmName());
    		map.put("id", m.getmId());
    		map.put("email", m.getEmail());
    		map.put("gender", m.getGender());
    		map.put("birthDate", m.getBirthDate());
    		map.put("picture", m.getmPicture()); */        	
        	
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
            		
            		console.log('회원정보 : '+name+', '+id+', '+email+', '+gender+', '+birthDate+', '+picture);
            		
            		if(picture != null){
            			// 사진 있을 경우 사진이 표시되게 하자
            		}
            		
            		$('#name').text(name);
            		$('#id').text(id);
            		$('#email').text(email);
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
            		alert('회원의 정보를 읽어오지 못했습니다');
            	} 
            });
        });
        
        </script>
        <br><br><br /><br />
        <div class="col-lg-12" align="center">
            <button class="btn btn-primary">탈퇴시키기</button>
        </div>
        <br><br>

        
          

        </div>
    </div>
</body>
</html>