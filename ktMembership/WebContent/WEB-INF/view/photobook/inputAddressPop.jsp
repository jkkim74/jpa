<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>주소 입력 팝업</title>
<script>
$(document).ready(function(){
	$("#address").click(function(){
		var url = "/membership/popup/jusoApiPopup"; //jusoPopup";
		var addressApi = window.open(url, 'addressApi', 'titlebar=1, resizable=1, scrollbars=yes, width=400, height=700');
	});
	
	$("#confirm").click(function(){
		var seq = "${seq}";
		var dvlName = $("#recName").val();
		var dvlTel = $("#tel1 option:selected").val() + $("#tel2").val();
		var postNo = $("#zipNo").val();
		var addr1 = $("#roadAddrPart1").val();
		var addr2 = $("#addrDetail").val();
		var targIdx = "${targIdx}";
		console.log(targIdx+","+seq+","+dvlName+","+dvlTel+","+postNo+","+addr1+","+addr2);
		window.opener.opener.setParentInfo(targIdx,seq,dvlName,dvlTel,postNo,addr1,addr2);
		window.close();
		window.opener.close();
	});
	
});

/* function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}*/

function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
</head>
<body>
<form name="form" id="form" method="post">
이름 : <input type="text" name="recName" id="recName" value=""/> <br />
전화번호 : <select name="tel1" id="tel1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
        </select>
        <input type="text" name="tel2" id="tel2" value=""/> <br />
 주소 : <input type="text" name="zipNo" id="zipNo" value=""/> <input type="text" name="roadAddrPart1" id="roadAddrPart1" value=""/> <input type="button" name="address" id="address" value="주소입력"/><br />
      <input type="text" name="addrDetail" id="addrDetail" value=""/>
</form>
<input type="button" name="confirm" id="confirm" value="확인" />
</body>
</html>