<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
    <meta charset="utf-8">  
    <title>Bootstrap Part5</title>  
    <meta name="viewport" content="width=device-width,initial-scale=1">  
    <link rel="stylesheet" type="text/css" href="${rPath}css/bootstrap.min.css">  
</head> 
<script>
function shopList(){
	var aufsl = new AjaxUtilForShopList(".tbody","${root}/shop/shopList/"+2,null,"POST"); 
	aufsl.send();
}
</script> 
<body onload="shopList()">
<section class="section">
    <div class="container">  
        <h2>가게리스트</h2>  
        <table class="table table-bordered">  
            <thead>  
                <tr>  
                    <th>가게이름</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>운영시간</th>
                    <th>예약하기</th> 
                </tr>  
            </thead>  
            <tbody class="tbody">
                
            </tbody> 
        </table>  
    </div>  
    
    <script src="${rPath}js/bootstrap.min.js"></script>  
</section>  
</body>  
</html>