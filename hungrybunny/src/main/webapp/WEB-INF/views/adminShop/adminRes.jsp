<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>

	function resInfo(){
		var str="";
		var str2="";
		var listSize=${reslist}.length;
		var hallSize=${hallList}.length;
		for(var i=0;i<listSize;i++){
			str+="<tr>"+
			"<td>"+${reslist}[i]["resMenuCnt"]+"</td>"+
			"<td>"+${reslist}[i]["payPrice"]+"</td>"+
			"<td>"+${reslist}[i]["seatCnt"]+"</td>"+
			"<td>"+${reslist}[i]["menuName"]+"</td>"+
			"<td>"+${reslist}[i]["resDate"]+"</td>"+
			"<td>"+${reslist}[i]["uiHP"]+"</td>"+
			"<td>"+${reslist}[i]["PayType"]+"</td>"+
			"<td>"+${reslist}[i]["uiName"]+"</td>"+
			"<td>"+${reslist}[i]["hallNo"]+"</td>"+
			"<td></td>"+
			 "</tr>"
		}
/* 		for(var i=0;i<hallSize;i++){
			var use="";
			if(${hallList}[i]["hallStatus"]==1){
				use="사용중";
			}else{
				use="빈자리";
			}
			
			str2+="<tr>"+
			"<td>"+${hallList}[i]["seatCnt"]+"</td>"+
			"<td>"+${hallList}[i]["hallNo"]+"</td>"+
			"<td>"+use+"</td>"+
			"<td><input type='radio' id='hallStatus' name='hallStatus' value='0'>빈자리"+
			"<input type='radio'  name='hallStatus' value='1'>사용중"+
			"<input  name='hallNo' value='"+${hallList}[i]["hallNo"]+"'>"+
			"<button type='button' onclick='hallUpdate()'>수정</button></td>"+
			"</tr>"
		} */
		
	$("#adminRes").html( 	
	"<table class='table table-bordered'>"+
	"<thead>"+
	"<tr>"+
	"<th>개수</th>"+
	"<th>총합</th>"+
	"<th>예약인수</th>"+
	"<th>메뉴</th>"+
	"<th>예약시간</th>"+
	"<th>핸드폰</th>"+
	"<th>결제방법</th>"+
	"<th>예약자명</th>"+
	"<th>예약테이블</th>"+
	"<th>확인/취소</th>"+
	"</tr>"  +
    "</thead>"+
    "<tbody class='tbody'>"+
    str+
   	"</tbody>"+
	"</table>"
	); 
	}
</script>

<body onload="resInfo()" >
<section class="section">

<div id="adminRes"></div>

			<h3>홀현황</h3>
			<table class='table table-bordered'>
			<thead>
			<tr>
			<th>좌석수</th>
			<th>번호</th>
			<th>사용현황</th>
			<th>수정</th>
			</tr>
		    </thead>
		    <tbody class='tbody'>
		    </tbody>
			</table>

</section>
</body>
</html>