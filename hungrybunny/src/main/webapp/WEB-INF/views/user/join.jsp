<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${rPath}/css/login/radioInput.css" media="screen" type="text/css" />
</head>
<script>
	function callback(res) {
		alert(res.msg);
		if(res.biz){
			location.href="${root}/path/user/login"
		}
	}
	function check() {
		var params = "uiId";
		var au = new AjaxUtil("${root}/user/check", params, "POST");
		au.send(callback2);

	}
	function callback2(res) {
		alert(res.msg);
	}
	function back() {
		location.href = "${root}/path/user/login";
	}
	function checkForm2(form) {
		if (form.uiId.value == "") {
			alert("Error: 사용자아이디를 비워둘수없습니다.");
			form.username.focus();
			return false;
		}
		re = /^\w+$/;
		if (!re.test(form.uiId.value)) {
			alert("Error:사용자 아이디에는 영문, 숫자 만 포함해야 합니다.");
			form.uiId.focus();
			return false;
			
		}else{
			check();
		}
		}

	function checkForm(form) {
		
		
		if (form.uiName.value.trim() == "") {
			alert("Error: 사용자이름을 비워둘수없습니다.");
			form.uiName.focus();
			return false;
		}
		re = /[0-9]/;
		if (re.test(form.uiName.value)) {
			alert("Error: 이름에는 숫자가 들어갈수없습니다.");
			form.uiName.focus();
			return false;
		}

		 re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
		if (re.test(form.uiName.value)) {
				alert("Error:사용자 이름에는 영문,한글만 포함해야 합니다.");
				form.uiName.focus();
				return false;
		}
		if (form.uiId.value.length < 6) {
				alert("Error: 아이디에는 최소 6개의 문자를 포함해야 합니다!");
				form.uiId.focus();
				return false;
		}
		if (form.uiId.value.trim() == "") {
				alert("Error: 사용자아이디를 비워둘수없습니다.");
				form.uiId.focus();
				return false;
		}
		re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/6?]/gi;
		if (re.test(form.uiId.value)) {
			alert("Error:사용자 아이디에는 영문, 숫자 만 포함해야 합니다.");
			form.uiId.focus();
			return false;
		}
	
		re =  /[^0-9]/g;
		if (re.test(form.uiHP.value)) {
			alert("Error:사용자 전화에는 숫자 만 포함해야 합니다.");
			form.uiHP.focus();
			return false;
		}

		if (form.uiHP.value.length != 11) {
			alert("Error: 전화번호를 확인 해주세요.");
			form.uiHP.focus();
			return false;
		}
		if (form.uiEmail.value.trim() == "") {
			alert("Error: 사용자Email을 비워둘수없습니다.");
			form.uiEmail.focus();
			return false;
	}
		re = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		if (!re.test(form.uiEmail.value)) {
			alert("Error:사용자 Email전체를 입력해주세요.");
			form.uiEmail.focus();
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
		join();
		return true;
	}
	function join() {
		var params = "uiName,uiId,uiPwd,uiHP,admin,uiEmail";
		var au = new AjaxUtil("${root}/user/join", params, "POST");
		au.send(callback);
	}
</script>
<body>
<section class="section">
	<div class="wrap">
		<div class="avatar">
			<img src="${rPath}/images/logo.png">
		</div>
		<form id="login-form" onsubmit="return checkForm(this)">
			이름<input type="text" name="uiName" placeholder="ex)홍길동" autofocus>
			아이디<input type="text" name="uiId" placeholder="ID">
			Email<input type="text" name="uiEmail" placeholder="Email.@nvaer.com">
			비밀번호<input type="password" name="uiPwd" placeholder="Password">
			비밀번호확인<input type="password" name="uiPwd2" placeholder="CheckPassword">
				<a style="color:red">*password는 6자 이상으로 한다 특수문자,대소문자,숫자 1개이상</a>
			핸드폰<input type="text" class="form-control" name="uiHP" placeholder="-없이숫자만 입력해주세요">
			<!-- <input type="radio" id="admin1" name="admin" value="0" checked="checked">일반사용자 
			<input type="radio" id="admin2" name="admin" value="1">사장님 -->
			
			<input type="radio" name="admin" id="admin1" value="0"><label for="admin1">일반사용자</label>
			<input type="radio" name="admin" id="admin2" value="1"><label for="admin2">사장님</label>
			
			<button type="button" onclick="checkForm2(form)">ID중복체크</button>
			<button type="button" onclick="checkForm(form)">회원가입</button>
			<button type="button" onclick="back()">돌아가기</button>
			
		</form>
	</div>
</section>
</body>
</html>