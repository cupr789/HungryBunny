<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>CodePen - Login</title>
</head>

<link rel="stylesheet" href="${rPath}/css/login/reset.css">
<link rel="stylesheet" href="${rPath}/css/login/style.css" media="screen" type="text/css" />

<script> 
var cnt=0;

function login(){
	var params = "uiId,uiPwd";

	var au = new AjaxUtil("${root}/user/login",params,"POST");
	au.send(callback);  

	}
	

function callback(res){
	cnt++;

	alert(res.msg);
	if(res.biz){
		location.href="${root}/path/index";
	}
	if(cnt==5){
		alert("5회잘못입력하셧습니다");
		location.href="${root}/path/user/findUserInfo";
	}
	if(res.aiz){
		location.href="${root}/path/user/admin";
	}
}
function join(){
	location.href="${root}/path/user/join";
}
</script>

<body>
<section class="section">
	<div class="wrap">
		<div class="avatar">
			<img src="${rPath}/images/logo.png">
		</div>
		<input type="text" name="uiId" placeholder="Username" autofocus>
		<div class="bar">
			<i></i>
		</div>
		<input type="password" name="uiPwd" placeholder="Password"> <a href="${pPath}/user/findUserInfo" class="forgot_link">forgot ?</a>
		<button onclick="login()">로그인</button>
		<button onclick="join()">회원가입</button>
	</div>

	
</section>
<script src="${rPath}/js/login/index.js"></script>

</body>
</html>