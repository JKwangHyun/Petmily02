<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1</title>
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
	}
	.petList {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;
	}
	.petlist a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.petList2 {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:0 10px;text-align:center;
	}
	.petlist2 a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.container {
        display: block;
		position: absolute;
        text-align: center;
        width: 100%;
        top: 50%;
        padding: 50px 0;
        -moz-transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        -o-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        
	}
	h1 {
	  font-family: "Lato";
	  font-size: 1.3em;
	  color: #fff;
	  letter-spacing: 1px;
	  margin-bottom: 50px;
	}
	h3 {
	  display: block;
	  height: 19px;
	  margin-top: 30px;
	  font-family: "Lato";
	  font-size: 1em;
	  color: #fff;
	  opacity: 0;
	}
	.search-box-container {
	  display: inline-block;
	  box-sizing: content-box;
	  height: 40px;
	  width: 40px;
	  padding: 0;
	  background-color: #fff;
	  border: 3px solid #221F1F;
	  border-radius: 28px;
	  overflow: hidden;
	}
	.search-box-container * {
	  display: inline-block;
	  margin: 0;
	  height: 100%;
	  padding: 5px;
	  border: 0;
	  outline: none;
	}
	.search-box {
	  width: calc(100% - 50px);
	  padding: 0 20px;
	  float: left;
	  font-family: "Lato";
	  font-size: 1em;
	  color: #212121;
	  background-color: #fff;
	}
	.submit {
	  float: right;
	  width: 50px;
	  left: 0;
	  top: 0;
	  font-size: 1.2em;
	  text-align: center;
	  cursor: pointer;
	  background-color: #fff;
	}
	.fa {
	  display: inline !important;
	  line-height: 100%;
	  pointer-event: none;
	  color: #221F1F;
	}
	li a {
		font-size:16px;
		display:block;
		margin:0px 15px;
		text-decoration:none;
		color:white;
	}
	#menu li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		height:37px;
	}
	#sign li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
	}
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
	.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
	#square_menu a{
		text-decoration:none;
		color:white;
	}
	
</style>
<script>
	$.fn.toggleState = function (b) {
		$(this).stop().animate(
		{
			width: b ? "400px" : "40px" },
		    600,"easeOutElastic");
	};
	
	$(document).ready(function () {
		var container = $(".container");
		var boxContainer = $(".search-box-container");
		var submit = $(".submit");
		var searchBox = $(".search-box");
		var response = $(".response");
		var isOpen = false;
		submit.on("mousedown", function (e) {
			e.preventDefault();
			boxContainer.toggleState(!isOpen);
			isOpen = !isOpen;
			if (!isOpen) {
				handleRequest();
			} else {
				searchBox.focus();
			}
		});
		searchBox.keypress(function (e) {
			if (e.which === 13) {
				boxContainer.toggleState(false);
				isOpen = false;
				handleRequest();
			}
		});
		searchBox.blur(function () {
			boxContainer.toggleState(false);
			isOpen = false;
		});
		function handleRequest() {
			var value = searchBox.val();
			searchBox.val("");
			if (value.length > 0) {
				response.text('Searching for "' + value + '" . . .');
				response.
				animate(
				{
					opacity: 1 },
				300).
				delay(2000).
				animate(
				{
					opacity: 0 },
				300);
			}
		}
		
		// menu_slide 
		$("#menu_slide_Community,#menu_slide_Adoption").css("display","none");
		$("#community,#menu_slide_Community").mouseout(function() {
			$("#menu_slide_Community").stop().slideUp("fast");
		});
		$("#community,#menu_slide_Community").mouseover(function() {
			$("#menu_slide_Community").stop().slideDown("fast");
		});
		$("#adoption,#menu_slide_Adoption").mouseout(function() {
			$("#menu_slide_Adoption").stop().slideUp("fast");
		});
		$("#adoption,#menu_slide_Adoption").mouseover(function() {
			$("#menu_slide_Adoption").stop().slideDown("fast");
		});
		
		// 네모 menu
		$("#square,#square_back,#square_menu").mouseover(function() {
			$("#square_back").css("display","block");
			$("#square_menu").css("display","block");
			$("#square").css("color","white");
		});
		$("#square,#square_back,#square_menu").mouseout(function() {
			$("#square_back").css("display","none");
			$("#square_menu").css("display","none");
			$("#square").css("color","gray");
		});
		
		// menu 선택 시 
		$("#dog").mouseover(function() {
			$("#dog").css("font-weight","bold");
		});
		$("#dog").mouseout(function() {
			$("#dog").css("font-weight","normal");
		});
		$("#cat").mouseover(function() {
			$("#cat").css("font-weight","bold");
		});
		$("#cat").mouseout(function() {
			$("#cat").css("font-weight","normal");
		});
		$("#other").mouseover(function() {
			$("#other").css("font-weight","bold");
		});
		$("#other").mouseout(function() {
			$("#other").css("font-weight","normal");
		});
	});
	
	
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href=""><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="community"><a href="#">Community</a></li>
				<li id="adoption"><a href="#">Adoption Of Pets</a></li>
				<li><a href="#">Find Pet Hospital</a></li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<li><a href="#">Sign In</a></li>
				<li><a href="#">Sign Up</a></li>
			</ul>
		</div>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:190px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">공지사항</a></li>
			<li><a href="">정보공유 게시판</a></li>
		</ul>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:190px;height:85px;background-color:#333;z-index:10;left:337px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">분양 등록</a></li>
			<li><a href="">분양 하기</a></li>
		</ul>
	</div>
	
	<div id="content1" style="position:relative;width:100%;height:480px;background-color:white;">
		<div style="position:relative;margin:0 auto; width:1200px;height:480px;">
			<div style="position:relative;float:left;width:800px;height:100%;">
				<pre style="position:relative ;display:block; top:100;left:-180;">
					<font size="35" style="font-family:serif;">Animal is</font>
					<font size="35" style="font-family:serif;">Love</font>
					<font size="35" style="font-family:serif;">with PetMily</font>
				</pre>
				<div style="position:relative;top:100;left:80;">
					<input type="button" value="Sign Up" style="border:0; border-radius:10px;color:white;font-size:30px;background-color:221F1F">
					<input type="button" value="Adoption" style="border:0;border-radius:10px;color:white;font-size:30px;background-color:221F1F">
				</div>
			</div>
			<div style="position:relative;float:left;width:400px;height:100%;">
				<iframe src="https://giphy.com/embed/8UHB9thDBfbOTaRJNn" width="280px" height="280px" style="position:absolute;pointer-events:none;cursor:default;top:100px;left:80px;" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
			</div>
		</div>
	</div>
	
	<div id="content2" style="position:relative;width:100%;height:50px;background-color:#F7F7F7;margin:0 auto;">
    	<div style="position:relative;width:1060px;height:50px;margin:0 auto">
	    	<div class="container">
			    <div class="search-box-container">
				    <button class="submit"><i class="fa fa-search" style="padding-left: 15px;"></i></button>
				    <input class="search-box">
			    </div>
	    	</div>
	    	<div id="square_back" style="position:absolute;width:60px;height:40px;right:-20;margin-top:5px;background-color:#333;border-radius:5px;display:none;"></div>
	    	<div id="square_menu" style="position:absolute;z-index:10;margin-top:5px;right:-160;width:150px;height:200px;background-color:#333;border-radius:10px;display:none;">
	    		<div style="width:150px;height:50px;text-align:center;color:white;font-size:20;pointer-events:none;cursor:default;">Select</div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href=""  id="dog"><i class="fas fa-dog"></i> Dogs</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="" id="cat"><i class="fas fa-cat"></i> Cats</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="" id="other"><i class="fas fa-paw"></i> Others</a></div>
	    	</div>
	    	<i id="square" class="fas fa-th-large" style="position:absolute;right:0;margin-top:11px;font-size:30px;color:gray"></i>
   		</div>
	</div>

	<!-- 네모 메뉴바 -->
	<!-- <div id="ddd" style="position:absolute;z-index:9999;top:535px;right:180;width:200px;height:200px;background-color:221F1F;border-radius:10px;"></div> -->
		
	<!-- 분양 리스트 -->
	<div id="content3" style="position:relative;width:100%;height:700px;background-color:#f0efef;">
		<div style="position:relative;width:1080px;height:320px;margin:0 auto">
			<div class="petList" >
				<img class="pets" src="resources/img/dog1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 미니 핀  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 2</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/dog3.jpg"  />
				<a href="" >
				<i class="fas fa-venus" style="color:hotpink;"></i> 
				<i class="fas fa-venus" style="color:hotpink;"></i> 
				<i class="fas fa-mars"style="color:#4285F4;"></i>
				 포메라니안  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 2</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/cat1.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 고양이  5개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 37&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/rabbit1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 토끼  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 37&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
		</div>
		<div style="position:relative;width:1080px;height:320px;margin:0 auto">
			<div class="petList2">
				<img class="pets" src="resources/img/cat2.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 페르시안  4개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 39&nbsp;<i class="fas fa-thumbtack"> 5</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/hamster1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 햄스터 2살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 13&nbsp;<i class="fas fa-thumbtack"> 0</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/dog2.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 푸들 6개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 29&nbsp;<i class="fas fa-thumbtack"> 7</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/cat3.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 랙돌 5개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
		</div>
	</div>
	
</body>
</html>