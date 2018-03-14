<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function insertMenu(){
		var params = "menuName,menuPrice,shopNo";
		var au = new AjaxUtil("${root}/menu/insert",params,"POST");
		au.send(callback); 
	}
	
	function callback(res){
		alert(res.msg);
		if(res.biz){
			 location.reload()
		}
	}
	function deleteMenu(menuNo){
		var params = "menuNo=" + menuNo;
		var au = new AjaxUtil("${root}/menu/delete",params,"POST");
		au.send(callback2); 
	}
	function callback2(res){
		alert(res.msg);
		if(res.biz){
			 location.reload()
		}
	}
	function updateMenu(menuNo,idx){

		 var menuName = $("[name=updateName]").eq(idx).val();
		var menuPrice = $("[name=updatePrice]").eq(idx).val();
		 var param = {menuNo:menuNo,menuName:menuName,menuPrice:menuPrice};
		$.ajax({
	           type:"POST",
	           url:"${root}/menu/update",
	           data:param,
	           success :callback3,
	           error :callback3
	     });  
	}
	function callback3(res){
		alert(res.msg);
		if(res.biz){
			 location.reload()
		}
	}
	
</script>
<body>
<section class="section">

	<h4 style="font: bold;">ShopInfo</h4>
	<br>
	
 	<table class='table table-bordered'>
	<thead>
	<tr>
	<th>가게이름</th>
	<th>가게주소</th>
	<th>가게전화번호</th>
	<th>영업시간</th>
	</tr>
	</thead>  
    <tbody class='tbody'>
   <tr>
   <td>${slist[0].shopName}</td>
   <td>${slist[0].shopAddress}</td>
   <td>${slist[0].shopHP}</td>
   <td>${slist[0].shopTime}</td>
   </tr>
    </tbody> 
	</table>
	<!-- 위는 식당정보 테이블 -->
	
	<h4 style="font: bold;">MenuList</h4>
	<br>
	
	<!-- 해당식당 메뉴 테이블 -->
	<table class='table table-bordered'>
	<thead>
	<tr>
	<th></th>
	<th>메뉴이름</th>
	<th></th>
	<th>메뉴가격</th>
	<th></th>
	<th>설정</th>
	</tr>
	</thead>  
    <tbody class='tbody'>
    
   	<c:forEach items="${mlist}" var="mlist" varStatus="idx" >
   	<tr>
   		<td>${mlist.menuName}<input name="menuNo" type="hidden" value="${mlist.menuNo}"></td>
   		<td><input name="updateName" type="text" value="${mlist.menuName}"></td>
   		<td>${mlist.menuPrice}</td>
   		<td><input name="updatePrice" type="text" value="${mlist.menuPrice}" placeholder="${mlist.menuPrice}" ></td>
   		<td><button type="button" onclick="deleteMenu(${mlist.menuNo})"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
   		<button type="button" onclick="updateMenu(${mlist.menuNo},${idx.index})"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
   		</td>
   	</tr>
   </c:forEach>
   
   
   <tr>
   <td>메뉴이름<input name="shopNo" type="hidden" value="${slist[0].shopNo}"></td>
   <td><input  name="menuName" type="text"></td>
   <td>메뉴가격</td>
   <td><input  name="menuPrice" type="text"></td>
   <td><button type="button" onclick="insertMenu()"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td>
   </tr>
       </tbody> 
	</table>
	
	
	 <div id="menuList">
	</div> 
</section>
</body>
</html>