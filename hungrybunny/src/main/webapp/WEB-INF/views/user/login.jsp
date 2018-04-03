<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
		<input type="password" name="uiPwd" placeholder="Password"> 
		<a href="${pPath}/user/findUserInfo" class="forgot_link">forgot ?</a>
		<button onclick="login()">LOGIN</button>
		<button onclick="join()">JOIN</button>
	</div>
</section>

</body>
</html>