<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!doctype html>
<html lang="kr">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<title>코로나 마스크</title>
</head>
<body>
	<div id="map" style="width:100%;height:1000px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=deb29166063dd3a5932b1ed81dd90233&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		
		// 주소-좌표 변환객체를 생성
        var geocoder = new daum.maps.services.Geocoder();
        
		var maskInfoJson = JSON.parse('${maskInfo}');
        // 주소-좌표를 생성
        //geocoder.addressSearch('경기도 성남시 분당구 미금로 216 청솔주공9단지',function(result,status){
        	//정상적으로 검색이 완료되면
        	//if(status == daum.maps.services.Status.OK){
        var cnt = maskInfoJson["count"];
        var idx = 0;
        while(idx < cnt){
	        var lat = maskInfoJson["stores"][idx]["lat"];
	        var lng = maskInfoJson["stores"][idx]["lng"];
	        var name = maskInfoJson["stores"][idx]["name"];
	        var status = maskInfoJson["stores"][idx]["remain_stat"];
	        drawMaskInfo(lat,lng,name,status);
            idx++;
        }
        
        function drawMaskInfo(lat, lng, name, status){
        		var coords = new daum.maps.LatLng(lat,lng);
        		//결과 값으로 받은 값을 마커로 표시한다.
        		var marker = new daum.maps.Marker({
        			map:map,
        			position:coords
        		});
        		var info = "품절";
        		if(status == "some"){
        			info = "100개";
        		}else if(status == "few"){
        			info = "30개이하";
        		}
        			
        		// 인포윈도우로 장소에 대한 설명을 표기한다.
        		var infowindow = new daum.maps.InfoWindow({
        			content:'<div style="width:150px;text-align:center;padding:6px 0;">'+name+'('+info+')</div>'
        		});
        		infowindow.open(map,marker);
        		
        		//지도의 중심을 결과값으로 받은 위치로 이동한다.
        		map.setCenter(coords);
         }
        	//}
       // });
	</script>
</body>
</html>