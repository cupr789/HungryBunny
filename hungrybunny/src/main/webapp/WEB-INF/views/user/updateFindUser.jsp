<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script >
function checkForm(form) {
	if (form.uiId.value == "") {
		alert("Error: 사용자아이디를 비워둘수없습니다.");
		form.username.focus();
		return false;
	}
	re = /^\w+$/;
	if (!re.test(form.uiId.value)) {
		alert("Error:사용자 아이디에는 영문, 숫자 및 밑줄만 포함해야 합니다.");
		form.uiId.focus();
		return false;
	}

	if (form.uiPwd.value != "" && form.uiPwd.value == form.uiPwd2.value) {
		if (form.uiPwd.value.length < 6) {
			alert("Error: 비밀 번호는 최소 6개의 문자를 포함해야 합니다!");
			form.uiPwd.focus();
			return false;
		}
		if (form.uiPwd.value == form.uiId.value) {
			alert("Error: 비밀 번호는 사용자 이름과 달라야 합니다!");
			form.uiPwd.focus();
			return false;
		}
		re = /[0-9]/;
		if (!re.test(form.uiPwd.value)) {
			alert("Error: 암호는 하나 이상의 숫자를 포함해야 합니다!");
			form.uiPwd.focus();
			return false;
		}
		re = /[a-z]/;
		if (!re.test(form.uiPwd.value)) {
			alert("Error: 암호는 하나 이상의 소문자를 포함해야 합니다!");
			form.uiPwd.focus();
			return false;
		}
		re = /[A-Z]/;
		if (!re.test(form.uiPwd.value)) {
			alert("Error:암호에는 하나 이상의 대문자가 포함되어야 합니다!");
			form.uiPwd.focus();
			return false;
		}
		re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
		if (!re.test(form.uiPwd.value)) {
			alert("Error:암호에는 하나 이상의 특수문자가 포함되어야 합니다!");
			form.uiPwd.focus();
			return false;
		}
	} else {
		alert("Error: 입력하신 비밀번호가 일치하지 않습니다");
		form.uiPwd.focus();
		return false;
	}
	updateFindUser();
	return true;
}
function updateFindUser(){
	var params = "uiId,uiPwd";
	var au = new AjaxUtil("${root}/user/updateFindUser", params, "POST");
	au.send(callback);
}
function callback(res){
	alert(res.msg);
	if(res.biz){
		location.href="${root}/path/user/login"
	}
}


</script>
<body>
	<section class="section">
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">아이디와비밀번호를 입력해주세요</div>
				</div>
				<div class="panel-body">
					<form  id="login-form" onsubmit="return checkForm(this)">
						<div>
							아이디<input type="text" class="form-control" name="uiId"
								placeholder="ID">
						</div>
						<div>
							비밀번호<input type="password" class="form-control" name="uiPwd"
								placeholder="Password">
						</div>
						<div>
							비밀번호확인<input type="password" class="form-control" name="uiPwd2"
								placeholder="CheckPassword">
								<a style="color:red">*password는 6자 이상으로 한다 특수문자,대소문자,숫자 1개이상</a>
						</div>
						<div>
							<button type="button" onclick="checkForm(form)"
								class="form-control btn btn-primary">변경</button>
						</div>
					</form>
					</div>
					</div>
					</div>
					</div>
					</section>
</body>
</html>