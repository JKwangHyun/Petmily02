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
	* {
  		box-sizing: border-box;
	}
	.search-box-container {
  		display: inline-block;
  		box-sizing: content-box;
  		height: 40px;
  		width: 40px;
  		padding: 0;
  		background-color: #fff;
  		border: 3px solid #f44336;
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
  		position:relative;
  		margin:0 auto;
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
  		width: 40px;
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
  		color: #d32f2f;
	}
</style>
<script>
	$.fn.toggleState = function(b) {
	   $(this).stop().animate({
	      width: b ? "400px" : "40px"
	   }, 600, "easeOutElastic" );
	}

	$(document).ready(function() {
	   var container = $(".container");
	   var boxContainer = $(".search-box-container");
	   var submit = $(".submit");
	   var searchBox = $(".search-box");
	   var response = $(".response");
	   var isOpen = false;
	   submit.on("mousedown", function(e) {
	      e.preventDefault();
	      boxContainer.toggleState(!isOpen);
	      isOpen = !isOpen;
	      if(!isOpen) {
	         handleRequest();
	      } else {
	         searchBox.focus();
	      }   
	   });
	   searchBox.keypress(function(e) {
	      if(e.which === 13) {
	         boxContainer.toggleState(false);
	         isOpen = false;
	         handleRequest();
	      }
	   });
	   searchBox.blur(function() {
	      boxContainer.toggleState(false);
	      isOpen = false;
	   });
	   function handleRequest() {
	      // You could do an ajax request here...
	      var value = searchBox.val();
	      searchBox.val('');
	      if(value.length > 0) {
	         response.text(('Searching for "' + value + '" . . .'));
	         response.animate({
	            opacity: 1
	         }, 300).delay(2000).animate({
	            opacity: 0
	         }, 300);
	      }
	   }
	});
	   
</script>
<body>
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:black;">
	</div>
	
	<div id="content1" style="position:relative;width:100%;height:480px;background-color:white;">
	</div>
	
	<div id="content2" style="position:relative;width:100%;height:50px;background-color:#F7F7F7;">
		<div style="position:relative;width:520px;height:50px;margin:0 auto">
			<div class="search-box-container">
				<button class="submit"><i class="fa fa-search"></i></button>
	    		<input class="search-box">
			</div>
		</div>
	</div>
	

	<div id="content3" style="position:relative;width:100%;height:320px;background-color:#f0efef;">
		<div style="position:relative;width:1140px;height:320px;margin:0 auto">
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
		</div>
	</div>
	
</body>
</html>