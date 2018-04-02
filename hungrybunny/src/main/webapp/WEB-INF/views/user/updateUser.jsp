<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function info(){
		var au = new AjaxUtil("${root}/user/userinfo",null,"GET");
		au.send(callback);  
	}
	function callback(res){
		
		$("#userinfo").html("<h2>유저수정</h2>"+
			 	"<table class='table table-bordered'>"+
				"<thead>"+
				"<tr><th>이름</th><th>"+res.userList.uiName+"</th><th><input name='uiName' value='"+res.userList.uiName+"' type='text'></th></tr>"+
				"<tr><th>아이디</th><th>"+res.userList.uiId+"</th><th><input name='uiId' value='"+res.userList.uiId+"' type='text'></th></tr>"+
				"<tr><th>비밀전호</th><th></th><th><input name='uiPwd' type='password' value='"+res.userList.uiPwd+"' ></th></tr>"+
				"<tr><th>전화번호</th><th>"+res.userList.uiHP+"</th><th><input name='uiHP' value='"+res.userList.uiHP+"' type='text'></th></tr>"+
				"<tr><th>Email</th><th>"+res.userList.uiEmail+"</th><th><input name='uiEmail' value='"+res.userList.uiEmail+"' type='text'></th></tr>"+
				"<tr><th>현재비밀번호를 입력해주세요</th><th><input name='check' type='password'><input name='admin' value='"+res.userList.admin+"' type='hidden'><input name='uiNo' value='"+res.userList.uiNo+"' type='hidden'></th>"+					
				"<th><button type='button' onclick='check()'><span class='glyphicon glyphicon-refresh' aria-hidden='true'></span></button>"+
				"<button type='button' onclick='deleteUser()'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button></th></tr>"+  
			    "</thead>"+  
			    "<tbody class='tbody'>"+
			    "</tbody>"+ 
				"</table>"
				); 
				
			}
	function check() {
		 var uiId = $("input[name='uiId']").val();
		 var uiName = $("input[name='uiName']").val();
		 var uiPwd = $("input[name='uiPwd']").val();
		 var uiHP = $("input[name='uiHP']").val();
		 alert(uiId);
		 alert(uiName);
		 alert(uiPwd);
		 alert(uiHP);
		

		if (uiName == "") {
			alert("Error: 사용자이름을 비워둘수없습니다.");
			
			return false;
		}
		 re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
		if (re.test(uiName)) {
			alert("Error:사용자 이름에는 영문,한글만 포함해야 합니다.");
		
			return false;
		} 
		
		if (uiId == "") {
			alert("Error: 사용자아이디를 비워둘수없습니다.");
			
			return false;
		}
		re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
		if (re.test(uiId)) {
			alert("Error:사용자 아이디에는 영문, 숫자 만 포함해야 합니다.");
			
			return false;
		}
			
		if (uiHP.length != 11) {
			alert("Error: 전화번호가 일치하지 않습니다.");
			
			return false;
		}
	
			if (uiPwd.length < 6) {
				alert("Error: 비밀 번호는 최소 6개의 문자를 포함해야 합니다!");
				
				return false;
			}
			if (uiPwd == uiId) {
				alert("Error: 비밀 번호는 사용자 이름과 달라야 합니다!");
				
				return false;
			}
			re = /[0-9]/;
			if (!re.test(uiPwd)) {
				alert("Error: 암호는 하나 이상의 숫자를 포함해야 합니다!");
			
				return false;
			}
			re = /[a-z]/;
			if (!re.test(uiPwd)) {
				alert("Error: 암호는 하나 이상의 소문자를 포함해야 합니다!");
				
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(uiPwd)) {
				alert("Error:암호에는 하나 이상의 대문자가 포함되어야 합니다!");
				
				return false;
			}
			re = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
			if (!re.test(uiPwd)) {
				alert("Error:암호에는 하나 이상의 특수문자가 포함되어야 합니다!");
				
				return false;
			}
	
		updateUser();
		return true;
	}
	
	function updateUser(){
		 if (confirm("정말 수정하시겠습니까??") == true){
				var params = "uiName,uiId,uiPwd,uiHP,check,admin,uiNo";
				var au = new AjaxUtil("${root}/user/updateUser",params,"POST");
				au.send(callback2);  
		}else{
			return;
		}
	}
	function callback2(res){
		
		alert(res.msg);
		if(res.biz){
			location.href="${root}/path/user/login";
		}
	}
	function deleteUser(){
		 if (confirm("회원탈퇴하시겠습니까?") == true){
				var params = "uiNo,check";
				var au = new AjaxUtil("${root}/user/deleteUser",params,"POST");
				au.send(callback3);  
		}else{
			return;
		}
	}
	function callback3(res){
		alert(res.msg);
		if(res.biz){
			location.href="${root}/path/user/login";
		}
	}
	

</script>
<body onload="info()">
<section class="section">
<div ></div>

<div id="userinfo"></div>
</section>

</body>
</html>