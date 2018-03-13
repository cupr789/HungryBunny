<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lLWN_ojJYVj9L7235_lg&submodules=geocoder"></script>
</head>
<script>
	function category() {
		var aufl = new AjaxUtilForList(".container-fluid>.row","${root}/shop/category", null, "GET");
		aufl.send();  
	}
	
	function goShopList(shopCaNo){
		var au = new AjaxUtil2("${root}/shop/shopList/"+shopCaNo, null, "POST");
		au.send(shopListCB); 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function shopListCB(res){
		$("#tagID").css("display","none");
		var htmlStr = '';
		htmlStr += '<div class="container">';
		htmlStr += '<h1>가게리스트</h1>';
		htmlStr += '<table class="table table-bordered">';
		htmlStr += '<thead>';
		htmlStr += '<tr>'; 
		htmlStr += '<th>가게이름</th>';
		htmlStr += '<th>주소</th>';
		htmlStr += '<th>전화번호</th>';
		htmlStr += '<th>운영시간</th>';
		htmlStr += '<th>남은자리</th>';
		htmlStr += '<th>메뉴보기</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var key in res){
			var shop = res[key];
			htmlStr += '<tr>';
			htmlStr += '<td>'+shop.shopName+'</td>';
			htmlStr += '<td>'+shop.shopAddress+'</td>';
			htmlStr += '<td>'+shop.shopHP+'</td>';
			htmlStr += '<td>'+shop.shopTime+'</td>';
			htmlStr += '<td></td>';
			htmlStr += '<td><button type="button" onclick="menuList('+shop.shopNo+')">Click Me!</button></td>';
			htmlStr += '</tr>';
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '</div>';
		htmlStr += '<button type="button" onclick="backToCa()">카테고리로 돌아가기!</button>';
		console.log(htmlStr);
		$("#chToSTable").html(htmlStr)
	}
	
	function backToCa(){
		$("#chToSTable").css("display","none");
		$("#tagID").css("display","block");
	}
	
	function menuList(shopNo){
		var au = new AjaxUtil2("${root}/menu/menuList/"+shopNo,null,"POST");
		au.send(menuListCB);
	}
	function menuListCB(res){
		$("#chToSTable").css("display","none");
		var htmlStr = '';
		htmlStr += '<div class="container">';
		htmlStr += '<h1>메뉴리스트</h1>';
		htmlStr += '<table class="table table-bordered">';
		htmlStr += '<thead>';
		htmlStr += '<tr>'; 
		htmlStr += '<th>메뉴이름</th>';
		htmlStr += '<th>메뉴가격</th>';
		htmlStr += '<th>예약하기</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var key in res){
			var menu = res[key];
			htmlStr += '<tr>';
			htmlStr += '<td>'+menu.menuName+'</td>';
			htmlStr += '<td>'+menu.menuPrice+'</td>';
			htmlStr += '<td><form action="${root}/shop/reservation" method="get"><button name="shopNo" value="'+menu.shopNo+'">예약하기</button></form></td>';
			htmlStr += '</tr>';
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '</div>';
		htmlStr += '<button type="button" onclick="backToShop()">가게리스트로 돌아가기!</button>';
		$("#chToMTable").html(htmlStr);
	}
	
	function backToShop(){
		$("#chToMTable").css("display","none");
		alert("박혜진");
	}
</script>

<body onload="category()">
	<!-- portfolio grid section -->
	<section id="portfolio" class="section portfolio">
	<div id="map" style="width:80%;height:400px;"></div>
	<div id="chToMTable">
	<div id="chToSTable">
		<div id="tagID" class="container-fluid">
			<div class="row">
				
			</div>
		</div>
	</div>
	</div>
	</section>
	<!-- portfolio grid section -->
</body>
<script>
var map = new naver.maps.Map("map", {
        center: new naver.maps.LatLng(37.3595316, 127.1052133),
        zoom: 10,
        mapTypeControl: true
    });

    var infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    map.setCursor('pointer');
    
    
    ////////////////////////////////////////////////////////////////////////// 마커 부분 시작
    
    
    var HOME_PATH = window.HOME_PATH || '.';
    
    var latlngs = [
        new naver.maps.LatLng(37.4957695, 127.0293933),
        new naver.maps.LatLng(37.4948495, 127.0309517),
        new naver.maps.LatLng(37.4945086, 127.0302185)
       
    ];
    

    var markerList = [];

    for (var i=0, ii=latlngs.length; i<ii; i++) {
        var icon = {
                url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
                size: new naver.maps.Size(24, 37),
                anchor: new naver.maps.Point(12, 37),
                origin: new naver.maps.Point(i * 29, 0)
            },
            marker = new naver.maps.Marker({
                position: latlngs[i],
                map: map,
                icon: icon
            });

        marker.set('seq', i);

        markerList.push(marker);

        marker.addListener('mouseover', onMouseOver);
        marker.addListener('mouseout', onMouseOut);

        icon = null;
        marker = null;
    }
    
    function onMouseOver(e) {
        var marker = e.overlay,
            seq = marker.get('seq');
		//alert("마우스오버!");
    /*     marker.setIcon({
            url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(seq * 29, 50)
        }); */
		 infoWindow.setContent(["<a href='/index_1.jsp'>카카식당</a>" ].join('\n'));
	        infoWindow.open(map,marker);
    }

    function onMouseOut(e) {
        var marker = e.overlay,
            seq = marker.get('seq');
        //alert("마우스아웃!");
/*         marker.setIcon({
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(seq * 29, 0)
        }); */
        
        infoWindow.setContent(["<a href='/index_1.jsp'>다다식당</a>" ].join('\n'));
        infoWindow.open(map,marker);
    }
    
    ////////////////////////////////////////////////////////////////////////// 마커 부분 끝
    
    
    
    
    
    
   

    // search by tm128 coordinate
    function searchCoordinateToAddress(latlng) {
        var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
		alert(latlng+"  ??");
        infoWindow.close();

        naver.maps.Service.reverseGeocode({
            location: tm128,
            coordType: naver.maps.Service.CoordType.TM128
        }, function(status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }

            console.log(latlng);
            var items = response.result.items,
                htmlAddresses = [];

            for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
                item = items[i];
                addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

                htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
                htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ latlng.x +','+ latlng.y);
            }

            infoWindow.setContent([
                    '<div style="padding:10px;min-width:200px;line-height:150%;">',
                    '<h4 style="margin-top:5px;">검색 좌표 : '+ response.result.userquery +'</h4><br />',
                    htmlAddresses.join('<br />'),
                    '</div>'
                ].join('\n'));

            infoWindow.open(map, latlng);
        });
    }

    // result by latlng coordinate
    function searchAddressToCoordinate(address) {
        naver.maps.Service.geocode({
            address: address
        }, function(status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }

            var item = response.result.items[0],
                addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
                point = new naver.maps.Point(item.point.x, item.point.y);

            infoWindow.setContent([
                    '<div style="padding:10px;min-width:200px;line-height:150%;">',
                    '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
                    addrType +' '+ item.address +'<br />',
                    '&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y,
                    '</div>'
                ].join('\n'));


            map.setCenter(point);
            infoWindow.open(map, point);
        });
    }
    
    //19:00 쓰리팝 (칼바람,첫조건 20:00전에 끝날시 한판더하고 끝 ), 19:40-19:50 할리스 도착(내일제출 문서작업,프로젝트) 22:00-22:30 귀가

    function initGeocoder() {
        map.addListener('click', function(e) {
            searchCoordinateToAddress(e.coord);
        });

        $('#address').on('keydown', function(e) {
            var keyCode = e.which;

            if (keyCode === 13) { // Enter Key
                searchAddressToCoordinate($('#address').val());
            }
        });

        $('#submit').on('click', function(e) {
            e.preventDefault();

            searchAddressToCoordinate($('#address').val());
        });
		
        searchAddressToCoordinate("${address}");
    }

    naver.maps.onJSContentLoaded = initGeocoder;
      </script>
</html>