<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!doctype html>
<html lang="kr">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>코로나 마스크</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        // opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
        document.domain = "localhost";

        function goPopup() {
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("/membership/corona/popup/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
        }

        /** API 서비스 제공항목 확대 (2017.02) **/
        function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
            , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.form.roadAddrPart1.value = roadAddrPart1;
            document.form.roadAddrPart2.value = roadAddrPart2;
            document.form.addrDetail.value = addrDetail;
            document.form.zipNo.value = zipNo;
        }

        var maskSearch = function () {
            $("#form").attr("action", "/membership/corona/mask").submit();
        }


    </script>
</head>
<body>
<!--<form name="form" id="form" method="post">
<table >
        <colgroup>
            <col style="width:20%"><col>
        </colgroup>
        <tbody>
            <tr>
                <th>우편번호</th>
                <td>
                    <input type="hidden" id="confmKey" name="confmKey" value=""  >
                    <input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
                    <input type="button"  value="주소검색" onclick="goPopup();">
                </td>
            </tr>
            <tr>
                <th>도로명주소</th>
                <td><input type="text" name="roadAddrPart1" id="roadAddrPart1" style="width:85%"></td>
            </tr>
            <tr>
                <th>상세주소</th>
                <td>
                    <input type="text" name="addrDetail" id="addrDetail" style="width:40%" value="">
                    <input type="text" name="roadAddrPart2" id="roadAddrPart2"  style="width:40%" value="">
                </td>
            </tr>
        </tbody>
    </table>

</form> -->
<form name="form" id="form" method="post">
    주소 : <input type="text" name="roadAddrPart1" id="roadAddrPart1" style="width:250px">
    <select id="maksStatus">
        <option value="">선택</option>
        <option value="plenty">충분(100개이상)</option>
        <option value="some">보통(30~99개)</option>
        <option value="few">부족(30개미만)</option>
    </select>
    <input type="button" value="마스크검색" onclick="javascript:maskSearch();"><br/><br/>
</form>
<div id="map" style="width:100%;height:1000px;"></div>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=deb29166063dd3a5932b1ed81dd90233&libraries=services"></script>
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
    while (idx < cnt) {
        var lat = maskInfoJson["stores"][idx]["lat"];
        var lng = maskInfoJson["stores"][idx]["lng"];
        var name = maskInfoJson["stores"][idx]["name"];
        var status = maskInfoJson["stores"][idx]["remain_stat"];
        drawMaskInfo(lat, lng, name, status);
        idx++;
    }


    function drawMaskInfo(lat, lng, name, status) {
        var coords = new daum.maps.LatLng(lat, lng);
        //결과 값으로 받은 값을 마커로 표시한다.
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        var info = "품절";
        var color = "white";
        var zIndex = 0;
        if (status == "plenty") {
            info = "충분";
            color = "green";
            zIndex = 5;
        } else if (status == "some") {
            info = "보통";
            color = "blue";
            zIndex = 4;
        } else if (status == "few") {
            info = "부족";
            color = "gray";
            zIndex = 3;
        }

        // 인포윈도우로 장소에 대한 설명을 표기한다.
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;background-color:' + color + '">' + name + '(' + info + ')</div>'
        });
        infowindow.setZIndex(zIndex);
        infowindow.open(map, marker);

        //지도의 중심을 결과값으로 받은 위치로 이동한다.
        map.setCenter(coords);
    }

    //}
    // });
</script>
</body>
</html>