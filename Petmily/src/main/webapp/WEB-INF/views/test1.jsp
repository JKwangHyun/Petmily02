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
		position:relative;float:left;width:250px;height:250px;background-color:white;margin:35px 10px
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
	});
	
	
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:221F1F;">
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
	<div id="menu_slide_Community" style="position:absolute;width:190px;height:85px;background-color:221F1F;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">공지사항</a></li>
			<li><a href="">정보공유 게시판</a></li>
		</ul>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:190px;height:85px;background-color:221F1F;z-index:10;left:337px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
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
    	<div class="container">
		    <div class="search-box-container">
			    <button class="submit"><i class="fa fa-search" style="padding-left: 15px;"></i></button>
			    <input class="search-box">
		    </div>
    	</div>
    	<i class="fas fa-th-large" style="position:relative;float:right;margin-top:10px;margin-right:430px;font-size:30px;color:gray"></i>
   </div>
	

	<div id="content3" style="position:relative;width:100%;height:320px;background-color:#f0efef;">
		<div style="position:relative;width:1080px;height:320px;margin:0 auto">
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
		</div>
	</div>
	
</body>
</html>