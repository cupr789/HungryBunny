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
		var params = "uiPwd";
		var au = new AjaxUtil("${root}/user/checkPwd", params, "POST");
		au.send(callback);
	}
	function callback(res) {

		if (res.biz) {
			location.href = "${root}/path/user/updateUser";
		} else {
			alert(res.msg);
		}
	}
</script>
<body>
<section class="section">

<!-- 	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">비밀번호를 입력해주세요</div>
				</div>
				<div class="panel-body">
					<a id="login-form">
						<div>
							<input type="password" class="form-control" name="uiPwd" placeholder="Password">
						</div>

						<div>
							<button type="button" onclick="check()" class="form-control btn btn-primary">비밀번호확인</button>
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
		<div style="text-align: center">비밀번호를 입력해주세요</div>
		<input type="password" name="uiPwd" placeholder="Password">
		<button type="button" onclick="check()">비밀번호확인</button>
	</div>	
</section>
</body>
</html>