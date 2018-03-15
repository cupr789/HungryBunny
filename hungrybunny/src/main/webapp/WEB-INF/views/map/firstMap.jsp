<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
      <meta charset="UTF-8">
      <title>네이버 지도 API - 주소로 지도 표시하기</title>
      <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lLWN_ojJYVj9L7235_lg&submodules=geocoder"></script>
  	  <!-- <script src="/resources/js/jquery-3.2.1.js" charset="utf-8"></script> -->
  </head>
  <body onload="conditionMap()">
  <section class="section">
<!--   <div>
  	<input id="address" type="text" placeholder="도로명주소 입력해주세요!">
  	<button id="submit" type="button">검색</button>
  </div> -->
    <div id="map" style="width:80%;height:400px;"></div>
 </section>
  </body>
 
 <script>
 
 var getParameters = function (paramName) {
	    // 리턴값을 위한 변수 선언
	    var returnValue;

	    // 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
	    }
	};  
      
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
    
    
    var latlngs=[];
    
    function conditionMap(){
    	var shopCaNo = getParameters("shopCaNo");
    	var address = getParameters("address");
    	
    	var param = {shopCaNo:shopCaNo,address:address};
    	
    	$.ajax({
    		url: "${root}/map/selectMap",
    		type: "POST",
    		data: param,
    		success:function(res){
    			console.log(res);
    			var shopList = res;
    			for(var listIdx in shopList){
    				latlngs.push(new naver.maps.LatLng(shopList[listIdx].shopLat, shopList[listIdx].shopLon));
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
    			}
    		},
    	})
    }
    
    
/*        var latlngs = [
        new naver.maps.LatLng(37.4957695, 127.0293933),
        new naver.maps.LatLng(37.4948495, 127.0309517),
        new naver.maps.LatLng(37.4945086, 127.0302185)
       
    ];    */

    var markerList = [];

    
    
    
    
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
		
        searchAddressToCoordinate(getParameters("address"));
    }

    naver.maps.onJSContentLoaded = initGeocoder;
      </script>
</html>
  
  
  
  
  
  
  
  
  