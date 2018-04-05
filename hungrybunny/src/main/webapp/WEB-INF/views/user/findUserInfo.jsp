<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function check() {
		var uiEmail = $("input[name='uiEmail']").val();
		if (uiEmail.trim() == "") {
			alert("Error: 사용자Email을 비워둘수없습니다.");
			return false;
		}
		re = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		if (!re.test(uiEmail)) {
			alert("Error:사용자 Email전체를 입력해주세요.");
			return false;
		}

		findUserInfo()
		return true;
	}

	function findUserInfo() {
		var params = "uiEmail";
		var au = new AjaxUtil("${root}/user/findUserInfo", params, "POST");
		au.send(callback);

	}
	function callback(res) {
		alert(res.msg);
		if (res.biz) {
			location.href = "${root}/path/user/checkUserNo"
		}
	}
</script>
<body>
	<section class="section">
<!-- 	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">가입하신 Email을 입력해주세요</div>
				</div>
				<div class="panel-body">
					<a id="login-form">
						<div>
							<input type="text" class="form-control" name="uiEmail" placeholder="oooo@naver.com">
						</div>

						<div>
							<button type="button" onclick=" check()" class="form-control btn btn-primary">메일보내기</button>
						</div>

					</a>
				</div>
			</div>
		</div>
	</div> -->

	<div class="wrap">
		<div class="avatar">
			<img src="${rPath}/images/logo.png">
		</div>
		<br>
		<div style="text-align: center">가입하신 Email을 입력해주세요</div>
		<input type="text" name="uiEmail" placeholder="oooo@naver.com" autofocus>
		<button type="button" onclick="check()">메일보내기</button>
	</div>
	</section>
</body>
</html>