<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${rPath}/css/button.css">
<script>
	function insertcheck(){
		 var menuName = $("input[name='menuName']").val();
		 var menuPrice = $("input[name='menuPrice']").val();
		 if (menuName.trim() == "") {
				alert("Error: 메뉴이름을 비워둘수없습니다.");
				return false;
			}	
		 if (menuPrice.trim() == "") {
				alert("Error: 메뉴가격을 비워둘수없습니다.");
				return false;
			}
			
			re =  /[^0-9]/g;
			if (re.test(menuPrice)) {
				alert("Error:메뉴가격에는 숫자 만 포함해야 합니다.");
				return false;
			}
			insertMenu();
			return true;
		
	}

	function insertMenu(){
		
		if ($("#menuName").val().trim().length == 0){
			alert("메뉴이름을 적어주세요");
			return false;
		}
		
		if ($("#menuPrice").val().trim().length == 0){
			alert("메뉴가격을 적어주세요");
			return false;
		}
		
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
		 if (menuName.trim() == "") {
				alert("Error: 메뉴이름을 비워둘수없습니다.");
				return false;
			}	
		 if (menuPrice.trim() == "") {
				alert("Error: 메뉴가격을 비워둘수없습니다.");
				return false;
			}
			
			re =  /[^0-9]/g;
			if (re.test(menuPrice)) {
				alert("Error:메뉴가격에는 숫자 만 포함해야 합니다.");
				return false;
			}
		 var param = {menuNo:menuNo,menuName:menuName,menuPrice:menuPrice};
		 console.log(param)
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
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4"> 
						<h2>ShopInfo</h2>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover" style="width: 100%">
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
		</div>
			<!-- 위는 식당정보 테이블 -->

			<h4 style="font: bold;">MenuList</h4>
			<br>

			<!-- 해당식당 메뉴 테이블 -->
		<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-4">
							<h2>ShopInfo</h2>
						</div>
					</div>
				</div>	
			<table class="table table-striped table-hover" style="width: 100%">
				<thead>
					<tr>
						<th></th>
						<th>메뉴이름</th>
						<th></th>
						<th>메뉴가격</th>
						<th>설정</th>
					</tr>
				</thead>
				<tbody class='tbody'>
					<c:forEach items="${mlist}" var="mlist" varStatus="idx">
						<tr>
							<td>${mlist.menuName}<input name="menuNo" type="hidden" value="${mlist.menuNo}"></td>
							<td><div class="wrap"><input name="updateName" type="text" value="${mlist.menuName}" style="margin-left:-130px; width: 200px"></div></td>
							<td>${mlist.menuPrice}</td>
							<td><div class="wrap"><input name="updatePrice" type="text" value="${mlist.menuPrice}" style="margin-left:-130px; width: 200px"></div></td>
							<td><button type="button" onclick="deleteMenu(${mlist.menuNo})">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
								<button type="button" onclick="updateMenu(${mlist.menuNo},${idx.index})">
									<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
								</button></td>
						</tr>
					</c:forEach>


					<tr>
						<td>메뉴이름<input name="shopNo" type="hidden" value="${slist[0].shopNo}"></td>
						<td><div class="wrap"><input name="menuName" type="text" id="menuName" style="margin-left:-130px; width: 200px"></div></td> 
						<td>메뉴가격</td>
						<td><div class="wrap"><input name="menuPrice" type="text" id="menuPrice" style="margin-left:-130px; width: 200px"></div></td>
						<td><button type="button" onclick="insertcheck()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</button></td>
					</tr>
				</tbody>
			</table>


			<div id="menuList"></div>
		</div>
	</div>
</section>
</body>
</html>