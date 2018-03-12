<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>


function join(){

	var params = "uiName,uiId,uiPwd,uiHP,admin";
	var au = new AjaxUtil("${root}/user/join",params,"POST");
	au.send(callback);  
 
}
function callback(res){
	alert(res.msg);
	if(res.biz){
		location.href="${root}/path/user/login";
	}
	
}
function check(){
	var params = "uiId";
	var au = new AjaxUtil("${root}/user/check",params,"POST");
	au.send(callback2);  
	
}
function callback2(res){
	alert(res.msg);
}
function back(){
	location.href="${root}/path/user/login";
}


</script>
<body>
<section class="section">
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">회원가입!</div>
            </div>
            <div class="panel-body">
                <form id="login-form">
                    <div>
                        <input type="text" class="form-control" name="uiName" placeholder="Username" autofocus>
                    </div>
                      <div>
                        <input type="text" class="form-control" name="uiId" placeholder="ID" >
                    </div>
                    <div>
                        <input type="password" class="form-control" name="uiPwd" placeholder="Password">
                    </div>
                      <div>
                        <input type="text" class="form-control" name="uiHP" placeholder="Phone" >
                    </div>
                      <div>
                       <input type="radio" id="admin1" name="admin" value="0" checked="checked">일반사용자
    					<input type="radio" id="admin2" name="admin" value="1" >사장님
                    </div>
                    <div>
                        <button type="button" onclick="check()" class="form-control btn btn-primary">ID중복체크</button>
                    </div>
                    <div>
                        <button type="button" onclick="join()" class="form-control btn btn-primary">회원가입</button>
                    </div>
                    <div>
                        <button type="button" onclick="back()" class="form-control btn btn-primary">돌아가기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</section>
</body>
</html>