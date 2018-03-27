<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload File Request Page</title>
</head>
<body>
<section class="section">
	<form method="POST" action="${root}/uploadMultipleFile" enctype="multipart/form-data">
		File1 to upload: <input type="file" name="file">
 
		Name1: <input type="text" name="name">
 
 
		File2 to upload: <input type="file" name="file">
 
		Name2: <input type="text" name="name">
 

		<input type="submit" value="Upload"> Press here to upload the file!
	</form>
</section>
</body>
</html>