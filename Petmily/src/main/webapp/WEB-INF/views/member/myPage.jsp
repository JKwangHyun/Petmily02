<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
		background-color:#f0efef;
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
		margin:0px 15px;
		color:white;
		cursor:pointer;
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
		margin:0px 15px;
		color:white;
		cursor:pointer;
	}
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
	#update_container {
		animation-name: animate_update;
  		animation-duration: 0.4s;
	}
	
	@keyframes animate_profile {
		from {left:200px;opacity:1}
		to {left:0px; opacity:1}
	}
	@keyframes animate_profile2 {
		from {left:0px;opacity:1}
		to {left:270px; opacity:1}
	}
	@keyframes animate_update {
		from {right:-400px;opacity:1}
		to {right:0px; opacity:1}
	}
	@keyframes animate_update2 {
		from {right:0px;opacity:1}
		to {right:-600px; opacity:0}
	}
</style>
<script>
	$(document).ready(function(){
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
		
		// 수정하기 클릭
		$('#user_edit').click(function() {
			$('#pu').css('width','1050px');
			$("#profile_container").css("animation-name","animate_profile");
			$("#profile_container").css("animation-duration","0.4s");
			$("#update_container").css("display","block");
			$("#update_container").css("animation-name","animate_update");
			$("#update_container").css("animation-duration","0.4s");
		});
		$('#edit').click(function() {
			$("#profile_container").css("animation-name","animate_profile2");
			$("#profile_container").css("animation-duration","0.4s");
			$("#update_container").css("animation-name","animate_update2");
			$("#update_container").css("animation-duration","0.4s");
			setTimeout(function() {
				$("#update_container").css("display", "none");
				$('#pu').css('width','500px');
				}, 400);
		});
	});
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href="home"><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="adoption"><a href="#">Adoption Of Pets</a></li>
				<li id="community"><a href="#">Community</a></li>
				<li><a href="#">Find Pet Hospital</a></li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<li><a href="mypage"><i class="fas fa-user-circle" style="font-size:25px;margin-top:-1px;"></i><font style="position:relative;top:-2px;"> ${Login.name} 님</font></a></li>
				<li><a href="logout" style="margin:0;">Logout</a></li>
			</ul>
		</div>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:170px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Registration</a></li>
			<li><a href="">Adoption</a></li>
		</ul>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:150px;height:85px;background-color:#333;z-index:10;left:385px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Notice</a></li>
			<li><a href="">Sharing Info</a></li>
		</ul>
	</div>
	
	<!-- 프로필 -->
	<div id="profile" style="position:relative;width:100%;height:380px;top:50px;">
		<div id="pu" style="width:500px; margin:0 auto;">
			<div id="profile_container" style="position:relative;width:500px;height:380px;float:left; background-color:#F8F8F8;border-radius:20px;">
				<div style="position:relative;top:30px;border-radius:50%;border:3px solid #333; width:130px;height:130px;margin:0 auto;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
				<div style="position:relative; width:500px;height:190;top:50px;">
					<table style="width:500px;">
						<tr align="center">
	                		<td colspan="2" style="font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;">${Login.name}</td>
	              		</tr>
	              		<tr align="center" style="height:40px;" >
	                		<td colspan="2" style="font-size:15px;font-family: 'Nanum Square';font-weight:bold;color:#333;opacity:0.7">${Login.id}</td>
	             		</tr>
	             		 <tr align="center" style="height:40px;">
	                		<td colspan="2" style="font-size:15px;font-family: 'Nanum Square';font-weight:bold;color:#333;">${Login.detail}<font style="font-size:14px;font-family: 'Nanum Square';font-weight:bold;color:#333;">을 키워봤습니다.</font></td>
	              		</tr>
						<tr height="20"></tr>
						<tr align="center">
							<td id="user_edit" style="font-size:18px;font-family: 'Nanum Square';font-weight:bold;color:#333;cursor:pointer"><i style="color:#FBBC05;"class="fas fa-user-edit"></i> 수정하기</td>
	                		<td id="user_out" style="font-size:18px;font-family: 'Nanum Square';font-weight:bold;color:#333;cursor:pointer"><i style="color:#da532c;"class="fas fa-user-times"></i> 탈퇴하기</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="update_container" style="position:relative;margin-left:30px;width:500px;height:380;float:left;background-color:#F8F8F8;border-radius:20px;display:none;">
				<button type="button" id="edit">닫기</button>
			</div>
			<div id="delete_container" style="position:relative;margin-left:30px;width:500px;height:380;float:left;background-color:#F8F8F8;border-radius:20px;display:none;">
				<button type="button" id="delete">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>