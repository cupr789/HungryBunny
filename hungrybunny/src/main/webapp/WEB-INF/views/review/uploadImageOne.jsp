<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 결과 페이지</title>
<style type="text/css">
.failed {
	color: red;
	font-style: bold;
	font-size: 18pt;
}
</style>
</head>
<body>
	<section class="section">
		<form method="POST" action="${root}/uploadFile" enctype="multipart/form-data">
			File to upload: <input type="file" name="file">
	 
			<input type="submit" value="Upload"> Press here to upload the file!
		</form>	
	</section>
</body>
</html>
