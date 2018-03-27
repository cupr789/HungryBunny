<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script >
function checkUiNo(){
	var params = "uiNo";
	var au = new AjaxUtil("${root}/user/checkUiNo", params, "POST");
	au.send(callback);
	
}
function callback(res){
	alert(res.msg);
	if(res.biz){
		location.href="${root}/path/user/updateFindUser"
	}
}
</script>
<body >
<section class="section">

<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">메일로받은 번호를 입력해주세요</div>
            </div>
            <div class="panel-body">
                <a id="login-form">
                    <div>
                        <input type="text" class="form-control" name="uiNo" placeholder="Number">
                    </div>
             
                    <div>
                        <button type="button" onclick="checkUiNo()" class="form-control btn btn-primary">확인</button>
                    </div>
                  
                    </a>

</section>
</body>
</html>