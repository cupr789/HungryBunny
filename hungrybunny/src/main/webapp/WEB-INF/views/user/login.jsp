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
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">HungyrBunny!</div>
            </div>
            <div class="panel-body">
                <a id="login-form">
                    <div>
                        <input type="text" class="form-control" name="uiId" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="uiPwd" placeholder="Password">
                    </div>
                    <a href="${pPath}/user/findUserInfo">아이디/비밀번호찾기</a>
                    <div>
                        <button type="button" onclick="login()" class="form-control btn btn-primary">로그인</button>
                    </div>
                    <div>
                         <button type="button" onclick="join()" class="form-control btn btn-primary">회원가입</button>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
</section>

</body>
</html>