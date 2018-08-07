<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/speech.jsp" />
<!DOCTYPE html>
<html>

	<head>
		<title>Burning Pot</title>
		
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/bootstrap-4.1.1/bootstrap.css">
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading/fakeLoader.css">
		<script src="${pageContext.request.contextPath}/resources/js/loading/fakeLoader.js"></script>

		<!-- fontawsome CDN -->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
			integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
			crossorigin="anonymous">
		
		<!--summernote  -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
		
		<style>
		
			/* 레시피 목록 클릭 시 이동 a 태그 */
			.recipe_move_detail{
				width:100%; 
				height:100%; 
				display:block; 
				line-height: 300px;
				cursor:pointer;
    			font-size: 80%;
			}
			
			/* 목록 정렬 버튼 css */
			.searchBtnUl{
				width: 100%;
				height:100%;
				list-style: none;
				float: left;
			    padding-top: 7%;
			    padding-bottom : 2%;
    			padding-left: 12%;
    			margin : 0;
			}
			.searchBtnUl li {
				width: 15%; 
				height:100%; 
				float: left; 
				margin: 0;
			    margin-left: 1.5%;
				text-align: center;
				
			}
			/* 
				a:link = 방문 전 링크 상태 
				a:visited = 방문 후 링크 상태
				a:hover = 마우스 오버했을 때 링크 상태
				a:active = 클릭했을 때 링크 상태
			*/
			
			/* 1번 조회수가 많은 순서대로의 버튼 및 버튼 호버 */
			.searchBtnA1{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #c3e6cb;
				border: none;
				cursor : pointer;
				border-radius: 5%;	
				font-weight: bolder;			
			}
			
			.searchBtnUl > li:hover .searchBtnA1 {
				background : #FFB2F5;
			}
			.searchBtnA2{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #bee5eb;
				border: none;
				cursor : pointer;
				border-radius: 5%;
				font-weight: bolder;	
			}
			
			.searchBtnUl > li:hover .searchBtnA2 {
				background : #FFB2F5;
			}
			.searchBtnA3{
				display: block; 
				font-size: 25px;
				width:100%; 
				height: 100%;
				background: #ffeeba;
				border: none;
				cursor : pointer;
				border-radius: 5%;	
				font-weight: bolder;
			}
			
			.searchBtnUl > li:hover .searchBtnA3 {
				background : #FFB2F5;
			}
			
			
			 /* 이렇게 줄 경우 전체에 영향을 줌 */
			/*
			a:link {text-decoration: none; color: #333333;}
			a:visited {text-decoration: none; color: #333333;}
			a:active {text-decoration: none; color: #333333;}
			a:hover {text-decoration: none; color: #333333;} */
			
			/* .searchBtnA searchBtnA:link {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:visited {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:hover {
				text-decoration: none; color: #333333;
			}
			.searchBtnA searchBtnA:active {
				text-decoration: none; color: #333333;
			} */
			
			 
			/* 추천검색어 css */
			.badge {
			    font-size: 100%;
			}
			..rec_recipe >span {
				font-size: 150%;
			}
			
			/* 검색 후 정렬 버튼 css */
			.searchResultAndsearchBtnA{
				width:100%; 
				height:10%; 
				padding-top : 1%;
			}
			.searchResultAndsearchBtnB{
				width:100%; 
				height:15%; 
				padding-top : 1%;
			}						
			.searchBtn{
				width:50%;
				height:100%; 
				float:left; 
				/* border:1px solid red;  */
				
			}
			.list-group {
				padding:0; 
				margin:0;
			    display: flex;
			    flex-direction: row; 
			    padding-left: 0;
			    margin-bottom: 0;
			}
			.list-group-item {
				margin: 0; 
				list-style: none; 
				float:left; 
				display:block; 
				margin-right:5%;
			}
			.list-group-item > a {
				display:block; important;
			}
			
			/* 검색된 레시피 갯수 css */
			.searchRecipeCountArea{
			    font-size: 18px;
			    color: #333;
			    padding: 10px 0 20px 8px;
			    width:50%; 
			    float:left; 
			    padding-left : 10%;
				cursor : default;
				font-weight: bolder;			   
			}
			.searchRecipeCountArea > b{
				color: #74b243; /* 폰트 색상 */
			    font-size: 30px;
		    }
		
			/* 말풍선 */
			[data-tooltip-text]:hover {
	          position: relative;
	        }
	
	        [data-tooltip-text]:hover:after {
	          background-color: #000000;
	          background-color: rgba(0, 0, 0, 0.8);
	          box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	          border-radius: 5px;
	          color: #FFFFFF;
	          font-size: 12px;
	          content: attr(data-tooltip-text);
	          margin-bottom: 10px;
	          top: 130%;
	          left: 0;    
	          padding: 7px 12px;
	          position: absolute;
	          width: auto;
	          min-width: 50px;
	          max-width: 300px;
	          word-wrap: break-word;
	          z-index: 9999;
	        }
	        
			/* 메뉴 바 안의 home 버튼 */
			.menu_home_btn{
				display: none;
				border-radius: 50%;
								
			}
			.menu_home_btn_after{
				display: none;
				border-radius: 50%;
			}
			
			.menuContainer{
		        width: 100%;
		        height: 20%;
		        margin-top: -12%;
	            margin-left: 10%;
		        display: none;
	       }
			
			.home_logo_btn_img{
				width: 100%;
				height: 100%;
				border-radius: 50%;
			}
			/* myPage 버튼 */
			.board_btn{
				width: 32%; 
				height:100%; 
				float: left; 
				margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%;
				/* padding: 1%; */
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn{
				width: 32%; 
				height:100%; 
				float: left; 
				margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%;
				/* padding: 1%; */
			}
			/* login 버튼 */
			.login_btn{
				width: 32%; 
				height:100%; 
				float: left; 
				margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%;
				/* padding: 1%; */
			}
			.board_btn_after{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			.fredge_btn_after{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn_after{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			.fredge_img{
				width:100%;
				height:90%;
				border-radius: 50%;
			}
			/* login 버튼 */
			.login_btn_after{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			.logOut_btn_after{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			/* recipe hover css */
			.img_hover_area{
				border-radius : 5%;
				position: absolute;
				width: 100%;
				height:100%;
				top: 0;
				left: 0;
				opacity: 0; /* 투명도 */
				background : rgba(0,0,0,0.7);
				transition:all 400ms; /*  */
			}
			/* 메뉴 바 */
			.menu{
		         background: white;
		         padding-right: 12%;
		         float: right;
		         /* border: 5px solid #754F44; */
		         width: 300px; 
		         height:100px; 
		         padding: 0.5%; 
		         border-radius: 5%;
	        }
	        .menu_full{
		         background: #FDD692;
		         float: right;
		         /* border: 5px solid #754F44; */
		         width: 100%; 
		         height:100%; 
		         border-radius: 5%;
	             /* padding: 4%; */		         
	        }
	        
	        .b-seg-right {
				width: 30%;
				height: 100%;
				text-align: center;
				float: right;
				background: #FDD692;
				display: none;
				padding-top: 3%;
			}
	        .menuBtn {
         		outline: none;
	          	border: none;
	         	border-radius: 50%;
	      	    background: #FDD692;
	      		border: 5px solid #754F44;
	       	  	width:100%; 
	        	height:100%; 
	        	border-radius: 50%;
	         	padding : 0 0;
	         	cursor : pointer;
	        }
	        .menuBtn_after{
	        	outline: none;
	            border: none;
		        border-radius: 50%;
		        background: #FDD692;
		        border: 5px solid #754F44;
		        width:100%; 
		        height:100%; 
		        border-radius: 50%;
		        padding : 0 0;
		        cursor : pointer;
	        }
	        
	        .triangle {display:inline-block; width:0; height:0; border-style:solid; border-width:30px; margin-bottom: -4%;}
	        
	        .triangle.test_2 {border-color:transparent transparent #754F44 transparent; }
	        
	        .tri{
	          padding-left: 88%;
	          position: relative;
	        }
	        
	
		/* li 전체 a 태그 속성 */
		.recipe_a {
			color: red;
			text-decoration: none;
		}	
		
		/* a 태그 클릭 시 색상 및 클릭 후 색상과 밑줄 해결해야 됨 */
		
		/* li 전체 a 태그 속성 끝 */
		
		/* top으로 올라가는 버튼 속성 */
		.top_btn {
			display: none;
			position: fixed;
			right: 15px;
			bottom: 15px;
		}
		
		.top_btn a {
			display: block;
			width: 40px;
			height: 40px;
			border: 1px solid #FDD692;
			border-radius: 50%;
			/* 모양을 둥굴게 */
			background: #FDD692;
			text-decoration: none;
			font-size: 13px;
			font-weight: bold;
			text-align: center;
			line-height: 40px;
			color: #333;
		}
		
		.top_btn a:hover, .top_btn a:focus {
			background: #333;
			text-decoration: none;
			border: 1px solid black;
			color: #fff;
		}
		/* top으로 올라가는 버튼 부분 */
		
		/* navbar : 보더 컬러 스타일 */
		.navbar-inverse {
			/* border-color : #FDD692;  */
			
		}
		
		.search-title {
			text-align: center;
			font-size: 200%;
			font-weight: bold;
			margin-bottom: 5%;
		}
		
		#photo {
			height: 80%;
			background: lightgray;
			margin-top: 3%;
			margin-bottom: 3%;
		}
		
		#name {
			text-align: center;
			font-size: 130%;
			font-weight: bold;
		}
		
		#detail-info>div {
			border: 1px solid;
			font-size: 150%;
			height: 26%;
			padding-top: 1.5%;
			margin-bottom: 1%;
		}
		
		.navi {
			height: 30%;
			margin-top: 10%;
		}
		
		.navi div {
			color: #754F44;
			border: 1px solid white;
			background: #FDD692;
			height: 20%;
			text-align: center;
			font-size: 200%;
			font-weight: bold;
		}
		
		.menu-bar {
			background-color: white;
			height: 100%;
			overflow: auto;
			position: fixed;
			display: relative;
		}
		
		.test {
			border: 1px solid black;
		}
		
		.test-header {
			background: black;
			text-align: center;
			position: fixed;
			color: white;
			z-index: 1;
		}
		
		.content {
			display: relative;
		}
		
		#title {
			text-align: center;
			font-size: 200%;
			font-weight: bold;
			/* margin-bottom: 3%; */
		}
		
		html {
			height: 100%;
		}
		
		body {
			height: 100%;
		}
		
		.n-header {
			position: fixed;
			z-index: 100;
			width: 100%;
			height: 15%;
			/* border-bottom-left-radius: 5%;
			border-bottom-right-radius: 5%;  */
			/* overflow: auto;
			position: fixed; */
			/* background: grey; */
			background: #FDD692;
			/* border: 1px solid grey; */
		    padding-left: 10%;
    		padding-right: 10%;
		}
		
		.container-fluid{
			padding-right: 0;
    		padding-left: 0; 
		}
		
		
		.b-seg {
			width: 100%;
			height: 100%;
			display: none;
			/* border: 1px solid #FDD692; */
		}
		
		.header_content {
			width: 100%;
			height: 100%;
			background: #FDD692;
			display: inline-block;
		}
		
		.b-seg-logo {
			width: 10%;
			height: 100%;
			/* text-align: center; */
			float: left;
			background: #FDD692;
			/* display: inline-block; */
			/* border: 1px solid red; */
		}
		
		.b-seg-search {
			width: 60%;
			height: 100%;
			background: #FDD692;
			display: inline-block;
			float: left;
		    padding-top: 2%;			
			/* margin-left: 0.1%; */
			/* border: 1px solid red; */
		}
		
		.b-seg-right {
			width: 30%;
			height: 100%;
			text-align: center;
			float: right;
			background: #FDD692;
			display: none;
			padding-top: 3%;
		    
			
			/* border: 1px solid red; */
		}
		.b-seg-right_before {
			width: 28%;
			height: 100%;
			text-align: center;
			float: right;
			background: #FDD692;
			display: inline-block;
	        margin-left: 2%;
	        padding : 1%;
			/* border: 1px solid red; */
		}
		.b-seg-right_after {
		    width: 28%;
		    height: 100%;
		    text-align: center;
		    float: right;
		    background: #FDD692;
		    display: inline-block;
		    padding: 1%;
		    cursor : default;
		}
		
		.recipeList {
			list-style: none;
			height: 100%;
			/*  padding-top : 15%; */
			/* display:inline-table; */
			text-align: center;
		}
		
		.recipeList>li {
			width: 22%;
			height: 45%;
			border: 2px solid black;
			border-radius: 5%;
			margin-right: 1%;
			margin-top: 1%;
			display: inline-block;
		}
		
		.seg_login_img {
			padding-top: 3%;
			display: inline-block;
			width: 70%;
			height: 70%;
		}
		
		.seg_btn_area {
			/* text-align: center; */
			/* padding: 2%; */
			width: 100%;
			/* height: 80%; */			
			/* border: 1px solid red; */
		}
		
		.menu_btn {
			outline: none;
			border:0;
			background : #FDD692;
		    width: 50%;
    		height: 75%; 
			font-size: 50%;
			padding-top: 3%;
			
			/* margin-right: 3%; */
			/* top: 10px; */
			/* border-radius : 50%; */
		}
		
		.member_btn {
			width: 40%;
			/* padding-right: 2%; */
			/* height: 70%; */
			font-size: 100%;
			/* margin-left: 3%; */
			/* top: 10px; */
		}
		
		.search_bar_area {
			width: 100%;
			height: 50%;
			padding-left: 3%;
			display: inline-block;
			/* border: 1px dashed red; */
		}
		
		.search_bar {
			width: 90%;
			height: 80%;
			text-align: center;
			outline: none;
			border: none;
			font-size: 200%;
			float: left;
			display: inline-block;
		}
		
		.btn_search {
			width: 4.5%;
			height: 80%;
			outline: none;
			border: none;
			/* margin-top: 3%; */
			float: left;
			/* margin-left: -3.6%;  */
			padding: 0%;
			display: inline-block;
		}
		
		.btn_img {
			width: 100%;
			height: 100%;
		}
		
		.recommend_recipe_area {
			width: 100%;
			height: 48%;
			display: inline-block;
			/* padding-top: 3%; */
			padding-left: 11%;
			/* text-align: center; */
			/* margin-left: -5%; */
			/* border: 1px dashed black; */
		}
		
		.rec_recipe {
			width: 100%;
			float: left;
		}
		
		.rec_reipe_a {
			/* float: left; */
			display: inline-block;
			margin-top: 1%;
			margin-left: 30%;
			/* border: 1px solid red; */
			cursor:pointer;
		}
		
		#rec_recipe_link {
			width: 12%;
			text-align: center;
			/* margin-left: 4%; */
			border: none;
			cursor : default;
			/* background: no-repeat; */
		}
		
		.img-thumbnail {
			border-radius: 5%;
			/* position: relative;
			z-index: 1; */
		}
		
		.recipe_img_area {
			border: 1px solid black;
			border-radius: 5%;
			width: 100%;
			height: 80%;
			position: relative;
			/*z-index: 1; */
		}
		
		.recipe_img_area:hover .img_hover_area {
			opacity:1;
			text-align : center;
			color: red;
			/* padding-top : 25%;	 */	
		    font-size: 200%;	
		}
		
		.food_img {
			width: 100%;
			height: 100%;
			/* position: relative;
			z-index: 1; */
		}
		
		.like_and_aver_area {
			/*  border:1px solid green;  */
			/* position: absolute;
			z-index: 2; */
			width: 100%;
			height: 10%;
			padding-right: 2%;
		}
		
		.like_btn_area {
			/* padding: 3%; */
			/* position: relative;
			z-index: 3; */
			width: 30%;
			height: 100%;
			float: right;
			display : inline-grid;
			
			/* border: 1px solid blue; */
		}
		
		.aver_btn_area {
			padding-top: 1%;
			width: 70%;
			height: 100%;
			float: left;
			cursor: default;
			font-size: 150%;
			font-weight: bolder;	
			/* color: steelblue; */
		}
		
		.like_btn {
			width: 100%;
			outline: none;
			border: none;
			background: no-repeat;
			font-size: 200%;
			text-align: center;
			color: rgb(117, 79, 68);
			display : inline-grid;
			cursor : pointer;		
		}
		
		.recipe_levle_and_time_and_writer_area {
			/* padding-top: 3%; */
			width: 100%;
			height: 10%;
		    display: inline-flex;
			cursor: default;
			/* margin-top: 5%; */
		}
		.recipe_level{
			width:33.3%;
			height:100%;
			border-right: 2px solid black;
			font-size: 150%;
    		font-weight: bolder;
		}
		.recipe_time{
			width:33.3%;
			height:100%;
			border-right: 2px solid black;
			font-size: 150%;
    		font-weight: bolder;
		}
		.recipe_quantity{
			width:33.3%;
			height:100%;
			font-size: 150%;
    		font-weight: bolder;
		}
		
		.img_icon {
			width: 100%;
			height: 100%;
			/* margin-left: -15%; */
			/*border-radius: 45%; */
		}
		
		.sec {
			width: 100%;
			height: 80%;
			text-align: center;
		}
		
		.img-logo {
			width: 100%;
			height: 100%;
			display: inline-block;
			position: relative;
		}
		
		.logo_wrap {
			width: 100%;
			height: 100%;
		}
		
		.home_btn {
			border: none;
			background: #FDD692;
			outline: none;
			width: 150%;
			height: 100%;
			cursor:pointer;
		}
		
		.table-head {
			background: lightgray;
			text-align: center;
		}
		
		.table-content {
			text-align: center;
		}
		
		.menu-title {
			text-align: center;
			font-size: 200%;
		}
		
		@media all and (max-width: 1200px) {
			
			.fredge_img{
				width:100%;
				height:90%;
				border-radius: 50%;
			}
			.menuContainer {
			    width: 100%;
			    height: 100%;
			    margin-top: -2.5%;
			    margin-left: 40%;
			    display: none;
			}
			
			.tri {
			    padding-left: 85%;
			    position: relative;
			    width: 100%;
			    height: 100%;
			}
			
			.menu_before {
			    background: white;
			    /* padding-right: 12%; */
			    float: right;
			    border: 5px solid #754F44;
			    width: 80%;
			    height: 100%;
			    margin-top: -12.5%;
			    padding: 0.5%;
			    margin-right: -15%;
			    border-radius: 5%;
			}
			
			.menu_full{
				display: none;
	        }
			.triangle{
				margin-bottom: -8%;
			}
			.recipeList > li {
				width: 44%;
			}
			
			.member_btn {
				width: 44%;
				font-size: 70%;
			}
			.rec_recipe{
				display: none;
			}
			.seg_btn_area {
			    width: 100%;
			    height: 100%;
		        padding-bottom: 20%;
			}
			
			.b-seg-right_before {
				width: 12%;
				height: 100%;
				text-align: center;
				float: right;
				background: #FDD692;
				display: inline-block;
		        margin-left: 2%;
		        padding : 1%;
				/* border: 1px solid red; */
			}
			.b-seg-right_after {
				width: 12%;
				height: 100%;
				text-align: center;
				float: right;
				background: #FDD692;
				display: inline-block;
		        margin-left: 2%;
		        padding : 1%;
				/* border: 1px solid red; */
			}
		
			.recipe_img_area:hover .img_hover_area {
				opacity:1;
				text-align : center;
				color: red;
				padding-top : 20%;
			    font-size: 500%;
			}
			.logo_wrap {
				width: 100%;
				height: 100%;
				display: none;
			}
			.menu_home_btn_before{
				width: 33%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%; */
				/* padding: 1%; */
				display: block;
			    padding: 0.5%;
			}
			.logOut_btn_before{
	    	    width: 25%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.menu_home_btn_after{
				width: 25%; 
				height:100%; 
				float: left; 
				margin-left: -4%;
			/* 	padding: 1%; */
				display: block;
			}
			
	        .menu_after {
			    background: white;
			    padding-right: 12%;
			    float: right;
			    border: 5px solid #754F44;
			    width: 100%;
			    height: 80%;
			    padding: 0.5%;
			    margin-top: -13.5%;
			    border-radius: 5%;
			}
	        /* myPage 버튼 */
			.board_btn_before{
			    width: 33%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn_before{
				width: 25%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* login 버튼 */
			.login_btn_before{
				width: 33%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			
			/* 로그인 이후 축소될 경우의 버튼 모양 */
			.logOut_btn_after{
	    	    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.menu_home_btn_after{
				width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			
			 /* myPage 버튼 */
			.board_btn_after{
			    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			.fredge_btn_after{
			    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn_after{
				width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* login 버튼 */
			.login_btn_after{
				width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
		  
			.btn_search {
				height: 100%;
			}
			.search_bar {
				width: 85%; 
				height: 100%;
			}
			.btn_search {
				width: 10%;
				height: 100%;
			}
			
			.b-seg-search {
				width: 84%;
				height: 100%;
				background: #FDD692;
				display: inline-block;
				float: left;
			    padding-top: 2%;
	
				/* margin-left: 0.1%; */
				/* border: 1px solid red; */
			}
			.b-seg-logo {
				width: 1%;
				height: 100%;
			}
			.n-header {
	    		padding-right: 10%;
			}
			.header_content {
				padding-top : 5%;
			}
			.b-seg-right {
			    width: 100%;
			    height: 100%;
			    text-align: center;
			    float: right;
			    background: #FDD692;
			    display: inline-block;
			    padding-top: 2%;
			    /* border: 1px solid red; */
			}
			.menu_btn {
			    outline: none;
			    border: 0;
			    background: #FDD692;
			    width: 100%;
			    height: 100%;
			    font-size: 50%;
			    padding-top: 3%;
			    /* margin-right: 3%; */
			    /* top: 10px; */
			    /* border-radius: 50%; */
			}
		}
		
		@media all and (max-width: 768px) {
			
			.fredge_img{
				width:100%;
				height:90%;
				border-radius: 50%;
			}
			.menu_after {
			    background: white;
			    padding-right: 12%;
			    float: right;
			    border: 5px solid #754F44;
			    width: 120%;
			    height: 80%;
			    margin-top: -20%;
			    padding: 0.5%;
			    border-radius: 5%;
			}
			
			.menuContainer {
			    width: 100%;
			    height: 100%;
		        margin-top: -4%;
			    /* margin-left: 40%; */
			    display: none;
			}
			
			.tri {
		        padding-left: 81%;
			    position: relative;
			    width: 100%;
			    height: 100%;
			}
			
			.menu_btn {
			    outline: none;
			    border: 0;
			    background: #FDD692;
			    width: 100%;
			    height: 100%;
			    font-size: 50%;
			    padding-top: 3%;
			    /* margin-right: 3%; */
			    /* top: 10px; */
			    /* border-radius: 50%; */
			}
			
			.menu_before {
			    background: white;
			    /* padding-right: 12%; */
			    float: right;
			    border: 5px solid #754F44;
		        width: 100%;
		   		height: 80%;	
			    margin-top: -19%;
			    padding: 0.5%;
			    margin-right: -15%;
			    border-radius: 5%;
			}
		
			.menu_full{
		         display: none;
	        }
			
			.recipeList>li {
				width: 90%;
			}
			.triangle{
				margin-bottom: -9%;
			}
			
			.b-seg-right_before {
			    width: 12%;
			    height: 100%;
			    text-align: center;
			    float: right;
			    background: #FDD692;
			    display: inline-block;
			    /* margin-left: 2%; */
			    /* padding: 1%; */
			    /* border: 1px solid red; */
			}
			
			.member_btn {
				width: 45%;
				font-size: 24%;
			}
			.rec_recipe{
				display: none;
			}
			.b-seg-right {
			    width: 100%;
			    height: 100%;
			    text-align: center;
			    float: right;
			    background: #FDD692;
			    display: inline-block;
		        padding-top: 25%;
			}
			.seg_btn_area {
			    /* text-align: center; */
			    padding: -1%;
			    width: 100%;
			    height: 100%;
			    /* border: 1px solid red; */
			}
			.recipe_img_area:hover .img_hover_area {
				opacity:1;
				text-align : center;
				color: red;
				padding-top : 15%;
			    font-size: 500%;
			}
			.logo_wrap {
				width: 100%;
				height: 100%;
				display: none;
			}
			.menu_home_btn{
				width: 20%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%; */
				/* padding: 1%; */
				display: block;
			    padding: 0.5%;
				
			}
			.menu_home_btn_after{
				width: 25%; 
				height:100%; 
				float: left; 
				margin-left: -4%;
			/* 	padding: 1%; */
				display: block;
			}
			.menu{
		         background: white;
		         padding-right: 12%;
		         float: right;
		         border: 5px solid #754F44;
		         width: 400px; 
		         height:100px; 
		         padding: 0.5%; 
		         border-radius: 5%
	        }
	        
	       /* 로그인 이후 축소될 경우의 버튼 모양 */
			.logOut_btn_after{
	    	    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.menu_home_btn_after{
				width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			
			 /* myPage 버튼 */
			.board_btn_after{
			    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			.fredge_btn_after{
			    width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn_after{
				width: 16.5%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* login 버튼 */
			.login_btn_after{
				width: 16%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
	        
	         /* myPage 버튼 */
			.board_btn{
			    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn{
			    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
			}
			/* login 버튼 */
			.login_btn {
			    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
		    .logOut_btn{
	    	    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.search_bar {
				width: 80%; 
				height: 100%;
			}
			.btn_search {
				width: 10%;
				height: 100%;
			}
			
			.b-seg-search {
				width: 74%;
				height: 100%;
				background: #FDD692;
				display: inline-block;
				float: left;
			    padding-top: 5%;
				/* margin-left: 0.1%; */
				/* border: 1px solid red; */
			}
			.b-seg-logo {
				width: 1%;
				height: 100%;
			}
			.n-header {
	    		padding-right: 10%;
			}
			.header_content {
				padding-top : 5%;
			}
			.b-seg-right_after {
				width: 12%;
				height: 100%;
				text-align: center;
				float: right;
				background: #FDD692;
				display: inline-block;
		        margin-left: 2%;
		        padding : 1%;
				/* border: 1px solid red; */
			}
		}
		</style>
</head>

<body>
		<nav class="n-header navbar navbar-inverse">
			<div class="header_content container-fluid">
				<div class="b-seg-logo navbar-header">
					<div class="logo_wrap navbar-brand">
						<%-- <a class="home_btn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath}/main.jsp'"> --%>
						<a class="home_btn" data-tooltip-text="Home" onclick="location.href='${pageContext.request.contextPath }/home/showHome.do'">
							<img class="img-logo" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</a>
					</div>
				</div>
				<div class="b-seg-search nav navbar-nav">
					<div class="search_bar_area active">
						<!-- 검색창 -->
						<input class="search_bar" id="searchRecipe" type="text" placeholder="">
						<button class="btn_search" type="button" onclick="searchRecipe();">
							<img class="btn_img"
								src="${pageContext.request.contextPath }/resources/img/돋보기.PNG">
						</button>
						<!-- 음성 검색 -->
						&nbsp;&nbsp;<i class="fas fa-microphone fa-3x" id="speechBtn" data-tooltip-text="speechMode"></i>
						<form class="row col-sm-12">
						<div id="speechInput" style="display:none; background:blue;">	
				        	<div class="input-group">
						     <div class="input-group-prepend">
						       <span class="input-group-text" style="background-color:green; color:white; "><i class="fas fa-microphone-alt"></i></span>
						    </div>
						    <input type="text" class="form-control" id="speechVal">
						    <input type="hidden" id="spSw" value="0"/>
						  </div>
						</div>
						</form>
					</div>
					
					<div class="recommend_recipe_area active">
						<div class="rec_recipe">
							<!-- <span class="badge badge-dark" id="rec_recipe_link">&lt;추천 레시피&gt; -->
							<span class="badge badge-pill badge-success" id="rec_recipe_link">추천 레시피 
							
							</span>
							<input type="hidden" id="isOpen" value="0" />
				         	<!-- onclick="location.href='${pageContext.request.contextPath}/board/goSpeech.do'" -->
						</div>
					</div>
						
				</div>
				
				<!-- 로그인 안했을 때 -->
	      		<c:if test="${empty m}">
	      		<div class="b-seg-right_before nav navbar-nav navbar-right">
					<div class="menu_full">
				      	<div class="menu_home_btn">
							<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath }/home/showHome.do'">
								<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
							</button>
						</div>
				        <div class="login_btn">
			          		<button class="menuBtn" data-tooltip-text="LOGIN!!" type="button" data-toggle="modal" data-target="#loginModal">
				              <i class="far fa-user fa-3x"></i>
				          	</button>
				        </div>
<!-- 				        <div class="regist_recipe_btn">
				          <button class="menuBtn" data-tooltip-text="Recipe Regist!!">
				              <i class="fas fa-utensils fa-3x"></i>
				          </button>
				        </div> -->
				        <div class="board_btn" data-tooltip-text="Board!!">
				          <button class="menuBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">
				              <i class="far fa-list-alt fa-3x"></i>
				          </button>
				        </div>
			      	</div>
			      	<div class="b-seg-right nav navbar-nav navbar-right">
					<div class="seg_btn_area">
						<button class="menu_btn" onclick="menuBar();"><i class="fas fa-bars fa-5x"></i></button>
					</div>
				</div>
		      </div>
		      </c:if>
		      <!-- 로그인했을 때 -->
      		  <c:if test="${!empty m}">
      		  <div class="b-seg-right_after nav navbar-nav navbar-right">
			      <div class="menu_full">
		      	  	<div class="menu_home_btn_after">
						<button class="menuBtn_after" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath }/home/showHome.do'">
							<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</button>
					</div>
					<c:if test="${m.mId != 'admin'}" >
				        <div class="login_btn_after">
			          		<button class="menuBtn_after" data-tooltip-text="MYPAGE!!" type="button" onclick="goToMyPage();">
			          			<i class="far fa-user fa-3x"></i>
				            </button>
				        </div>
				        <div class="regist_recipe_btn_after">
				          <button class="menuBtn_after" data-tooltip-text="Recipe Regist!!">
				              <i class="fas fa-utensils fa-3x" onclick="location.href='${pageContext.request.contextPath}/recipe/recipeForm.do'"></i>
				          </button>
				        </div>
				        <div class="board_btn_after" data-tooltip-text="Board!!">
				          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">
				              <i class="far fa-list-alt fa-3x"></i>
				          </button>
				        </div>
				        <div class="fredge_btn_after" data-tooltip-text="냉장고!!">
				          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/fridge/refMain.do'">
				              <img class="fredge_img" src="${pageContext.request.contextPath }/resources/img/fredge_btn_img.jpg"/>
				          </button>
				        </div>
				        <div class="logOut_btn_after" data-tooltip-text="Logout!!">
				          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">
				              <i class="fas fa-sign-out-alt fa-3x"></i>
				          </button>
				        </div>
			        </c:if>
			        <form action="${pageContext.request.contextPath}/mypage/myPage.do" method="GET" id="goToMyPageForm">
			        	
			        </form>
			        <script> 
			        	function goToMyPage(){
			        		$('#goToMyPageForm').submit();
			        	}
			        </script>
			        
			        
			        <c:if test="${m.mId == 'admin'}" >
				        <div class="login_btn_after">
			          		<button class="menuBtn_after" data-tooltip-text="관리자페이지!!" type="button" onclick="areYouAdmin();">
			          			<i class="far fa-user fa-3x"></i>
				            </button>
				        </div>
				        <div class="regist_recipe_btn_after">
				          <button class="menuBtn_after" data-tooltip-text="Recipe Regist!!">
				              <i class="fas fa-utensils fa-3x" onclick="location.href='${pageContext.request.contextPath}/recipe/recipeForm.do'"></i>
				          </button>
				        </div>
				        <div class="board_btn_after" data-tooltip-text="Board!!">
				          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">
				              <i class="far fa-list-alt fa-3x"></i>
				          </button>
				        </div>
				        <div class="logOut_btn_after" data-tooltip-text="Logout!!">
				          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">
				              <i class="fas fa-sign-out-alt fa-3x"></i>
				          </button>
				        </div>
			        </c:if>	
			        <form action="${pageContext.request.contextPath}/admin/goAdmin.do" method="POST" id="areYouAdmin">
			        	<input type="hidden" value="${m.mNum}" name="mNum"/>
			        </form>
			        			        
			        <script>
			        	function areYouAdmin(){
			        		$('#areYouAdmin').submit();			        		
			        	}
			        </script>
			        		        
		       	</div>
		       	<div class="b-seg-right nav navbar-nav navbar-right">
					<div class="seg_btn_area">
						<button class="menu_btn" onclick="menuBar();"><i class="fas fa-bars fa-5x"></i></button>
					</div>
		       	</div>
		      </div>
		    </c:if>
				<!-- <div class="b-seg-right nav navbar-nav navbar-right">
					<div class="seg_btn_area">
						<button class="menu_btn" onclick="menuBar();"><i class="fas fa-bars fa-5x"></i></button>
					</div>
				</div> -->
			</div>
			<!-- 로그인 안했을 때 --> 
			<!-- 1280 / 760 부분 -->
      		<c:if test="${empty m}">
				<div class="menuContainer">
			      <div class="tri">
			        <span class="triangle test_2"></span>
			      </div>
			      <div class="menu_before">
			      	<div class="menu_home_btn_before">
						<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath }/home/showHome.do'">
							<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</button>
					</div>
					
			        <div class="login_btn_before">
		          		<button class="menuBtn" data-tooltip-text="LOGIN!!" type="button" data-toggle="modal" data-target="#loginModal">
			              <i class="far fa-user fa-3x"></i>
			          	</button>
			        </div>
			        <!-- <div class="regist_recipe_btn_before">
			        	<button class="menuBtn" data-tooltip-text="Recipe Regist!!">
			              <i class="fas fa-utensils fa-3x"></i>
			          	</button>
			        </div> -->
			        <div class="board_btn_before" data-tooltip-text="Board!!">
			          	<button class="menuBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">
			              <i class="far fa-list-alt fa-3x"></i>
			          	</button>
			        </div>
			      </div>
			    </div>
	     	</c:if>
	       	<!-- 로그인했을 때 -->
      		<c:if test="${!empty m}">
		  	    <div class="menuContainer">
			      <div class="tri">
			        <span class="triangle test_2"></span>
			      </div>
			      <div class="menu_after">
			      	<div class="menu_home_btn_after">
						<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath }/home/showHome.do'">
							<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</button>
					</div>
		      		<div class="login_btn_after">
		          		<button class="menuBtn" data-tooltip-text="MYPAGE!!" type="button">
			              <i class="far fa-user fa-3x"></i>
			          	</button>
		          	</div>
		          	<div class="regist_recipe_btn_after">
			          <button class="menuBtn" data-tooltip-text="Recipe Regist!!">
			              <i class="fas fa-utensils fa-3x" onclick="location.href='${pageContext.request.contextPath}/recipe/recipeForm.do'"></i>
			          </button>
			        </div>
			        <div class="board_btn_after" data-tooltip-text="Board!!">
			          <button class="menuBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">
			              <i class="far fa-list-alt fa-3x"></i>
			          </button>
			        </div>
			        <div class="fredge_btn_after" data-tooltip-text="Fredge!!">
			          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/fridge/refMain.do'">
			              <img class="fredge_img" src="${pageContext.request.contextPath }/resources/img/fredge_btn_img.jpg"/>
			          </button>
			        </div>
			        <div class="logOut_btn_after" data-tooltip-text="Logout!!">
			          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">
			              <i class="fas fa-sign-out-alt fa-3x"></i>
			          </button>
			        </div>
			      </div>
			    </div> 
	     	</c:if>
			<div class="top_btn">
				<a href="#" class="click">Top</a>
			</div>
		</nav>

	<!-- 로그인모달 : https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fas fa-utensil-spoon"></i> login
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form id="loginFrm" action="${pageContext.request.contextPath }/member/login.do" method="post" class="form-horizontal" role="form">
					<div class="modal-body">
						<div class="form-group row">
							<label for="userId" class="control-label col-xs-2 col-sm-2">
								<i class="fas fa-user fa-2x"></i></label> 
								<input type="text" class="form-control col-xs-9 col-sm-9 enterk" name="userId" placeholder="아이디"  required> <br />
						</div>
						<div class="form-group row">
							<label for="password" class="control-label col-xs-2 col-sm-2 "><i
								class="fas fa-unlock-alt fa-2x"></i></label> <input type="password"
								class="form-control col-xs-9 col-sm-9 enterk" name="password"
								placeholder="비밀번호" required>
						</div>
						<div class="form-group row">
							<div class="col-sm-7">
								<!-- <div class="row"> -->
								<div class="col-sm-12">
									<button type="button" class="btn btn-link" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath }/member/memberEnroll.do'"> 회원이 아니신가요? </button>
								</div>
								<div class="col-sm-12">
									<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findIdModal();">아이디를 잊으셨나요?</button>
								</div>
								<div class="col-sm-12">
									<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findPwdModal();">비밀번호를 잊으셨나요?</button>
								</div>
							</div>
							
							<div class="col-sm-5">
								<br />
								<button type="button" class="btn btn-outline-warning"
									data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-warning">로그인</button>
							</div>
						</div>
						<hr />
					</div>
				</form>
				<!-- SNS 로그인 -->
	              <div class="text-center">   
		          	<a href="${pageContext.request.contextPath}/login/naverLog.do"><img height="40" src="${pageContext.request.contextPath}/resources/img/login/naver_Green.PNG"/></a>                
		       	  </div>
		       	  <div class="text-center" style="margin-top:1%">   
		          	<a href="${pageContext.request.contextPath}/login/googleLogin.do"><img height="43"
						src="${pageContext.request.contextPath}/resources/img/login/googleLogin.png" /></a>     
		       	  </div>
				<br />
				<!-- SNS 로그인 끝 -->
			</div>
		</div>
	</div>
	
  	<script>
	    $('.enterk').keypress(function(event) {
	        if (event.key === "Enter") {
	            $('#loginFrm').submit();
	        }
	    });
	    	    
	    function logoutFn(){
	    	swal({
				  title: "로그아웃!",
				  text: "로그아웃 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					location.href='${pageContext.request.contextPath}/member/memberLogout.do'
				  } else {
					    swal("취소 되었습니다.");
				}
	    }
    </script>
    
	<!-- 로그인 모달창 연동 부분 끝-->
	
	   <!-- 아이디 찾기 모달 시작 -->
	  	<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		   	<div class="modal-dialog" role="document">
		        <div class="modal-content">
		          <div class="modal-header">
		            <h5 class="modal-title" id="exampleModalLabel"><i class="far fa-question-circle"></i> 아이디 찾기</h5>
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		              <span aria-hidden="true">&times;</span>
		            </button>
		          </div>
		           <form action="#" method="post" class="form-horizontal" role="form" id="findIdFrm"> 
		           <div class="modal-body">
		             <div class="form-group row">
		                 <label for="email" class="control-label col-xs-2 col-sm-2 "><i class="far fa-envelope fa-2x"></i></label>
		                 <input type="text" class="form-control col-xs-9 col-sm-9 pressEntID" id="mEmail" placeholder="이메일" required>
		             </div>
		             <div class="form-group row">
		                 <label for="birth" class="control-label col-xs-2 col-sm-2 "><i class="fas fa-birthday-cake fa-2x"></i></label>
		                 <input type="text" class="form-control col-xs-9 col-sm-9 pressEntID" id="mBirth" placeholder="ex)년월일  -> YYMMDD" required>
		             </div>
		             <div class="form-group row text-center">
		             	<div class="col-sm-12">
				        	 <label id="idLabel"></label>
				         </div>
		             </div>
		             <div class="form-group row">
		              <div class="col-sm-7">
		              	<div class="col-sm-6">
		              		<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findPwdModal();">비밀번호를 잊으셨나요?</button>
						</div>
		              </div>
		              <div class="col-sm-5 text-right">
		              	<button type="button" class="btn btn-outline-warning" data-dismiss="modal" onclick="goLogin();">로그인하기</button>
		              </div>
		             </div>
		           </div>
		           <div class="modal-footer">
					<button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
		               <button type="button" class="btn btn-warning" onclick="findId();" >아이디 찾기</button>
		           </div>
		           </form> 
		 		</div>
		    </div>
	    </div>
    	<!-- 아이디 찾기 모달 끝 -->
    	
    	<!-- 비밀번호 찾기 모달 시작 -->
  	<div class="modal fade" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	   	<div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel"><i class="far fa-question-circle"></i> 비밀번호 찾기</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>
	           <form action="#" method="post" class="form-horizontal" role="form"> 
	           <div class="modal-body">
	             <div class="form-group row">
	                 <label for="userId" class="control-label col-xs-2 col-sm-2"><i class="fas fa-user fa-2x"></i></label>
	                 <input type="text" class="form-control col-xs-9 col-sm-9 pressEntPwd" name="userId" placeholder="아이디" id="pMId" required>
	                 <br />
	             </div>
	             <div class="form-group row">
	                 <label for="email" class="control-label col-xs-2 col-sm-2 "><i class="far fa-envelope fa-2x"></i></label>
	                 <input type="text" class="form-control col-xs-9 col-sm-9 pressEntPwd" name="email" placeholder="이메일" id="pEmail" required>
	             </div>
	             <div class="form-group row">
	                 <label for="birth" class="control-label col-xs-2 col-sm-2 "><i class="fas fa-birthday-cake fa-2x"></i></label>
	                 <input type="text" class="form-control col-xs-9 col-sm-9 pressEntPwd" name="birth" placeholder="ex) 년월일  -> YYMMDD" id="pBirth" required>
	             </div>
	             <div class="form-group row text-center">
	             	<div class="col-sm-12">
			        	 <label id="pwdLabel"></label>
			         </div>
	             </div>
	             <div class="form-group row">
	              <div class="col-sm-7">
	              	<div class="col-sm-6">
	              		<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findIdModal();">아이디를 잊으셨나요?</button>
					</div>
	              </div>
	              <div class="col-sm-5 text-right">
	              	<button type="button" class="btn btn-outline-warning" data-dismiss="modal" onclick="goLogin();">로그인하기</button>
	              </div>
	             </div>
	           </div>
	           <div class="modal-footer">
				<button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
	               <button type="button" class="btn btn-warning" onclick="findPwd();">비밀번호 찾기</button>
	           </div>
	           </form> 
	 		</div>
	    </div>
    </div>
   	<!-- 비밀번호 찾기 모달 끝 -->
   	
   	<!-- 희준 script -->
	<script>
	$(window).ready(function(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/home/recipeTop.do",
			type : "GET",
			success : function(data){
				console.log("top5 ajax 실행됨");
				console.log("data 길이 : " + data.length);
				var rNameRec ="";
				for(var i = 0; i < data.length; i++){
					rNameRec = data[i].rName;
					
					if(rNameRec.length <= 6){
						rNameRec = rNameRec.substring(0, 5);
        			} else {
        				rNameRec = rNameRec.substring(0, 5) + " ... ";
        			}
			
					$("<a class='rec_reipe_a badge badge-success' onclick=\"location.href='${pageContext.request.contextPath}/recipe/recipeDetail.do?rNum=" + data[i].rNum+ "'\">" + rNameRec + "</a>").appendTo('#rec_recipe_link');
				}
			}, error : function(data){
				console.log("top5 ajax 실행 안됨");
			}
		});
		
		// 음성 검색 
		var speech ='<c:out value="${sessionScope.speechKey}" />';
		if(speech){
			$('#speechVal').val(speech);
		  	$('#speechInput').show("slow");
			
			speechOn();
			
			$('#speechBtn').css("color","red");  
		  	$('#spSw').val(1);
		}
		
		
	});
	
	function searchRecipe(){
		$('#searchRecipe').on('')
		console.log("검색 값 : " + $('#searchRecipe').val());
				
		location.href="${pageContext.request.contextPath}/home/searchRecipe.do?searchR="+$('#searchRecipe').val();
	}
	
	$('#searchRecipe').keypress(function(event){
    	if(event.key == 'Enter'){
    		searchRecipe();
    	}
    });
	 /* $(window).resize(function () {
	        // width값을 가져오기
	        var chk = true;
	        var width_size = window.outerWidth;
	        if( window.outerWidth <= 1200 ){
		    	   if(chk){
		               $('.menuContainer').show();
		           } else {
		               $('.menuContainer').hide();
		           }
		           chk = !chk;
	    	   }
	    });
	     */
	/* 메뉴바 */
	 $(function() {
		 var chk = true;
       $('.menu_btn').click(function() {
          /*  console.log("window.outerWidth : " + window.outerWidth); */
	    	   if(chk){
	               $('.menuContainer').show();
	           } else {
	               $('.menuContainer').hide();
	           }
	           chk = !chk;
    	   /* } */

      });
       
       /* 예찬 */
	       $(window).resize(function () {
		        if(!chk){
		        	if( window.outerWidth >= 1200 ){
		        		$('.menuContainer').hide();
		        		chk = !chk;
		        	}
		        }       
		    });
     });
	 
	
	 
	/* Top 버튼 */
   $(document).ready(function () {
		$(window).scroll(function () {
			var _scrollTop = $(this).scrollTop(),
				$gotopBtn = $('.top_btn');
			if (_scrollTop > 10) { $gotopBtn.fadeIn(); }
			else { $gotopBtn.fadeOut(); }
		})
		$('.click').bind("click", function () {
			/* $('.click').css('text-decoration', 'none'); */
			$('html, body').animate({
				"scrollTop": 0
			}, 300);
		});
	});
   
   // 로딩 화면 script 부분
   $(document).ready(function(){
       $("#fakeLoader").fakeLoader({
         timeToHide:1500, // 로딩중에 걸리는 시간, 1000은 1초
         bgColor:"white", // 배경색
         spinner:"spinner1" // 로딩중으로 원하는 로딩이미지타입
       });
     });
   // 레시피 목록 보여지는 부분
   $(document).ready(function(){
       setTimeout(function(){
       	$('#b-seg').fadeIn().css('display','inline-block');
         }, 1500);
     });
	/* 희준 script 끝 */
   
	 /* 로그인 스크립트 시작 */
   function findIdModal(){
		 $("#findIdModal").modal();
	}

	function findPwdModal(){
		  $("#findPwdModal").modal();
	}
	
	function goLogin(){
		$("#loginModal").modal();
	}
	
	// 아이디 찾기 엔터키
	$('.pressEntID').keypress(function(event) {
	    if (event.key === "Enter") {
	    	findId();
	    }
	});
	
	// 비밀번호 찾기 엔터키
	$('.pressEntPwd').keypress(function(event) {
	    if (event.key === "Enter") {
	    	findPwd();
	    }
	});
	
	// 아이디 찾기
	function findId(){
		if( ($('#mEmail').val() != null && $('#mEmail').val() != "") && ($('#mBirth').val() != null && $('#mBirth').val() != "") ){
			$.ajax({
				url : "${pageContext.request.contextPath}/member/findMemberId.do",
				data : {mEmail : $('#mEmail').val(), mBirth : $('#mBirth').val() },
				type : "POST",
				success : function(data){
					if(data.isMember != false){
						$('#idLabel').children('p').remove();
						$("<p style='color:green;'>회원님의 아이디가 작성하신 이메일로 발송되었습니다.<br> 메일을 확인해주세요!</p>").appendTo('#idLabel');
					}else{
						$('#idLabel').children('p').remove();
						$("<p style='color:red;'>존재하는 회원이 아닙니다.</p>").appendTo('#idLabel');
					}
					/* $("<a class='rec_reipe_a badge badge-success' href='#'>" + data[i].rName + "</a>").appendTo('#rec_recipe_link'); */
				}, error : function(data){
					alert("아이디 찾기 오류");
				}
			});
		}else swal("항목을 모두 입력해주세요!","", "warning");
	}
	
	// 비밀번호 찾기
	function findPwd(){
		if( ($('#pMId').val() != null && $('#pMId').val() != "") && ($('#pEmail').val() != null && $('#pEmail').val() != "") && ($('#pBirth').val() != null && $('#pBirth').val() != "") ){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/findPwd.do",
				data : {pMId: $('#pMId').val(), pEmail : $('#pEmail').val(), pBirth : $('#pBirth').val()},
				type:"POST",
				success : function(data){
					console.log('data.isMember'+data.isMember);
					if(data.isMember != false){
						$('#pwdLabel').children('p').remove();
						$("<p style='color:green;'>회원님의 임시비밀번호가 메일로 전송되었습니다.<br>메일을 확인해주세요!</p>").appendTo('#pwdLabel');
					}else{
						$('#pwdLabel').children('p').remove();
						$("<p style='color:red;'>존재하지 않는 회원입니다.<br>입력된 내용을 확인해주세요!</p>").appendTo('#pwdLabel');
					}
				},error : function(){
					console.log('error ajax!');
				}
			});
		}else swal("항목을 모두 입력해주세요!","", "warning");
	}
	
	  /* 로그인 스크립트 끝 */
	  /* 음성버튼 */
	  $('#speechBtn').on("click",function(){

		   speechOn();
		   
		  if($('#spSw').val() == 0){
		  	$('#speechInput').show("slow");
		  	
		  	speechOn();
/* 		  	console.log('0:'+annyang.isListening()); */

			$('#speechBtn').css("color","red");  
		  	$('#spSw').val(1);
		  
		  }else if($('#spSw').val() == 1){
			 
		  	$('#speechInput').hide("slow");
		  	
		  	annyang.removeCommands();
		  	annyang.abort();
		  	$('#speechVal').val('');
		  	
		  	$('#speechBtn').css("color","black");  
		  	$('#spSw').val(0);
		  	
		  	<% 
     		session.removeAttribute("speechKey");
			%>
		  }
		  
		  /* speechInput */
	  });
	  
	  
	  /* 음성버튼 끝 */
	  
	</script>
	<%-- <div class="seg_btn_area">
		<c:if test="${empty m}">
			<button class="login_btn btn btn-success" type="button"
				data-toggle="modal" data-target="#loginModal">로그인</button>
			
		</c:if>
		 <c:if test="${!empty m}">
		 	<span><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${m.userId}" title="내정보보기">${m.userName}</a> 님, 안녕하세요</span>
		 	<span>${m.mName}</span>
        	&nbsp;
        	<button class="btn btn-success my-2 my-sm-0" type="button" onclick="logoutFn();">로그아웃</button>
		 </c:if>
	</div> --%>
		
</body>
</html>