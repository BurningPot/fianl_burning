<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-4.1.1/bootstrap.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading/fakeLoader.css">
		<script src="${pageContext.request.contextPath}/resources/js/loading/fakeLoader.js"></script>

		<!-- fontawsome CDN -->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
			integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
			crossorigin="anonymous">
		
		<style>
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
				width: 25%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			/* recipe 등록 버튼 */
			.regist_recipe_btn_after{
				width: 25%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			/* login 버튼 */
			.login_btn_after{
				width: 25%; 
				height:100%; 
				float: left; 
				/* margin-left: -4%;
				padding-left: 3%;
    			padding-right: 3%; */
				padding: 1%;
			}
			.logOut_btn_after{
				width: 25%; 
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
		    /* margin-left: 2%; */
		    padding: 1%;
		    /* border: 1px solid red; */
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
			width: 95.4%;
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
			padding-left: 7%;
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
			margin-left: 2%;
			/* border: 1px solid red; */
		}
		
		.rec_recipe_link {
			width: 8%;
			text-align: center;
			/* margin-left: 4%; */
			border: none;
			background: no-repeat;
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
			padding-top : 25%;		
		    font-size: 500%;	
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
			width: 20%;
			height: 100%;
			float: right;
			display : inline-grid;
			/* border: 1px solid blue; */
		}
		
		.aver_btn_area {
			/* position: relative; */
			padding: 3%;
			/* z-index: 3; */
			width: 78%;
			height: 100%;
			float: left;
			/* border: 1px solid green; */
		}
		
		.like_btn {
			width: 100%;
			/*  height: 100%; */
			outline: none;
			border: none;
			background: no-repeat;
			font-size: 200%;
			text-align: center;
			color: #FDD692;
			display : inline-grid;
			/* background: white;
					border-radius: 5%; */
			/* z-index: 4;
			position: relative; */
		}
		
		.recipe_levle_and_time_and_writer_area {
			/* padding-top: 3%; */
			width: 100%;
			height: 10%;
		    display: inline-flex;
			
			/* margin-top: 5%; */
		}
		.recipe_level{
			width:33.3%;
			height:100%;
			border: 1px solid red;
			
		}
		.recipe_time{
			width:33.3%;
			height:100%;
			border: 1px solid green;
		}
		.recipe_writer{
			width:33.3%;
			height:100%;
			border: 1px solid blue;
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
				width: 25%; 
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
			    width: 25%;
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
				width: 25%;
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
	    	    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.menu_home_btn_after{
				width: 20%;
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
			.regist_recipe_btn_after{
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
			.login_btn_after{
				width: 20%;
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
				width: 90%; 
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
	    	    width: 20%;
			    height: 100%;
			    float: left;
			    margin-left: 0;
			    /* padding-left: 3%; */
			    padding: 0.5%;
			    /* padding-right: 3%; */
			    /* padding: 1%; */
		    }
			.menu_home_btn_after{
				width: 20%;
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
			.regist_recipe_btn_after{
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
			.login_btn_after{
				width: 20%;
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
				width: 90%; 
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
						<a class="home_btn" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
							<img class="img-logo" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</a>
					</div>
				</div>
				<div class="b-seg-search nav navbar-nav">
					<div class="search_bar_area active">
						<input class="search_bar" type="text" placeholder="">
						<button class="btn_search" type="submit">
							<img class="btn_img"
								src="${pageContext.request.contextPath }/resources/img/돋보기.PNG">
						</button>
					</div>
					
					<div class="recommend_recipe_area active">
						<div class="rec_recipe">
							<span class="rec_recipe_link">&lt;인기 레시피&gt; 
							<a class="rec_reipe_a" href="#">추천 레시피 1</a> 
							<a class="rec_reipe_a" href="#">추천 레시피 2</a> 
							<a class="rec_reipe_a" href="#">추천 레시피 3</a> 
							<a class="rec_reipe_a" href="#">추천 레시피 4</a> 
							<a class="rec_reipe_a" href="#">추천 레시피 5</a>
							</span>
						</div>
					</div>
				</div>
				<!-- 로그인 안했을 때 -->
	      		<c:if test="${empty m}">
	      		<div class="b-seg-right_before nav navbar-nav navbar-right">
	      		
					<div class="menu_full">
				      	<div class="menu_home_btn">
							<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
								<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
							</button>
						</div>
				        <div class="login_btn">
			          		<button class="menuBtn" data-tooltip-text="LOGIN!!" type="button" data-toggle="modal" data-target="#loginModal">
				              <i class="far fa-user fa-3x"></i>
				          	</button>
				        </div>
				        <div class="regist_recipe_btn">
				          <button class="menuBtn" data-tooltip-text="Recipe Regist!!">
				              <i class="fas fa-utensils fa-3x"></i>
				          </button>
				        </div>
				        <div class="board_btn" data-tooltip-text="Board!!">
				          <button class="menuBtn">
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
						<button class="menuBtn_after" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
							<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</button>
					</div>
			        <div class="login_btn_after">
		          		<button class="menuBtn_after" data-tooltip-text="MYPAGE!!" type="button">
		          			<i class="far fa-user fa-3x"></i>
			            </button>
			        </div>
			        <div class="regist_recipe_btn_after">
			          <button class="menuBtn_after" data-tooltip-text="Recipe Regist!!">
			              <i class="fas fa-utensils fa-3x"></i>
			          </button>
			        </div>
			        <div class="board_btn_after" data-tooltip-text="Board!!">
			          <button class="menuBtn_after">
			              <i class="far fa-list-alt fa-3x"></i>
			          </button>
			        </div>
			        <div class="logOut_btn_after" data-tooltip-text="Logout!!">
			          <button class="menuBtn_after" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">
			              <i class="fas fa-sign-out-alt fa-3x"></i>
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
						<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
							<img class="home_logo_btn_img" src="${pageContext.request.contextPath }/resources/img/logo.png">
						</button>
					</div>
					
			        <div class="login_btn_before">
		          		<button class="menuBtn" data-tooltip-text="LOGIN!!" type="button" data-toggle="modal" data-target="#loginModal">
			              <i class="far fa-user fa-3x"></i>
			          	</button>
			        </div>
			        <div class="regist_recipe_btn_before">
			        	<button class="menuBtn" data-tooltip-text="Recipe Regist!!">
			              <i class="fas fa-utensils fa-3x"></i>
			          	</button>
			        </div>
			        <div class="board_btn_before" data-tooltip-text="Board!!">
			          	<button class="menuBtn">
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
						<button class="menuBtn" data-tooltip-text="HOME!!" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
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
			              <i class="fas fa-utensils fa-3x"></i>
			          </button>
			        </div>
			        <div class="board_btn_after" data-tooltip-text="Board!!">
			          <button class="menuBtn">
			              <i class="far fa-list-alt fa-3x"></i>
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
								<button type="submit" class="btn btn-outline-warning">로그인</button>
							</div>
						</div>
						<hr />
					</div>
				</form>
				<!-- SNS 로그인 -->
				<div class="text-center" style="margin-top: 1%">
					<a href="#"><img height="42"
						src="${pageContext.request.contextPath }/resources/img/facebook_login.png" /></a>
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
	    	if (confirm("로그아웃 하시겠습니까??") == true){//확인
		    	location.href='${pageContext.request.contextPath}/member/memberLogout.do'
        	}else{//취소
        	    return;
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
		           <form action="#" method="post" class="form-horizontal" role="form"> 
		           <div class="modal-body">
		             <div class="form-group row">
		                 <label for="userName" class="control-label col-xs-2 col-sm-2"><i class="fas fa-user fa-2x"></i></label>
		                 <input type="text" class="form-control col-xs-9 col-sm-9" name="userName" placeholder="이름" required>
		                 <br />
		             </div>
		             <div class="form-group row">
		                 <label for="email" class="control-label col-xs-2 col-sm-2 "><i class="far fa-envelope fa-2x"></i></label>
		                 <input type="password" class="form-control col-xs-9 col-sm-9" name="email" placeholder="이메일" required>
		             </div>
		             <div class="form-group row">
		                 <label for="birth" class="control-label col-xs-2 col-sm-2 "><i class="fas fa-birthday-cake fa-2x"></i></label>
		                 <input type="password" class="form-control col-xs-9 col-sm-9" name="birth" placeholder="ex)년도/월/일  -> 00/00/00" required>
		             </div>
		             <div class="form-group row">
		              <div class="col-sm-7">
		              	<div class="col-sm-6">
		              		<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findPwdModal();">비밀번호를 잊으셨나요?</button>
						</div>
		              </div>
		             </div>
		           </div>
		           <div class="modal-footer">
					<button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
		               <button type="submit" class="btn btn-warning" >아이디 찾기</button>
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
	                 <input type="text" class="form-control col-xs-9 col-sm-9" name="userId" placeholder="아이디" required>
	                 <br />
	             </div>
	             <div class="form-group row">
	                 <label for="email" class="control-label col-xs-2 col-sm-2 "><i class="far fa-envelope fa-2x"></i></label>
	                 <input type="password" class="form-control col-xs-9 col-sm-9" name="email" placeholder="이메일" required>
	             </div>
	             <div class="form-group row">
	                 <label for="birth" class="control-label col-xs-2 col-sm-2 "><i class="fas fa-birthday-cake fa-2x"></i></label>
	                 <input type="password" class="form-control col-xs-9 col-sm-9" name="birth" placeholder="ex)년도/월/일  -> 00/00/00" required>
	             </div>
	             <div class="form-group row">
	              <div class="col-sm-7">
	              	<div class="col-sm-6">
	              		<button type="button" class="btn btn-link" data-dismiss="modal" onclick="findIdModal();">아이디를 잊으셨나요?</button>
					</div>
	              </div>
	             </div>
	           </div>
	           <div class="modal-footer">
				<button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
	               <button type="submit" class="btn btn-warning" >비밀번호 찾기</button>
	           </div>
	           </form> 
	 		</div>
	    </div>
    </div>
    	<!-- 비밀번호 찾기 모달 끝 -->
    	
    	<!-- 희준 script -->
	<script>
	
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
	  /* 로그인 스크립트 끝 */
	  
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