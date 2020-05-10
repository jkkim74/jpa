<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>주문 미리 보기</title>
<script>
$(document).ready(function(){
	var json_fullAddr = JSON.parse('${paramMap.fullAddrList}');
	//alert(json_fullAddr["fullAddr0"][1]);
	var objKeys = Object.keys(json_fullAddr);
	var row = 0;
	var addrHtml = "";
	while(row < objKeys.length){
		addrHtml +="<span>"+json_fullAddr[objKeys[row]][1]+" "+json_fullAddr[objKeys[row]][2]+"</span> <br /><span>["+json_fullAddr[objKeys[row]][3]+"] "+json_fullAddr[objKeys[row]][4]+json_fullAddr[objKeys[row]][5]+"</span><br />"
		row++;
	}
	$("#divAddressList").html(addrHtml);
});

</script>
</head>
<body>
주문 미리 보기 <br />
포토북명 : <span>${paramMap.photoBookName}</span><br />
<div id="divAddressList"></div>
사용건수 : <span>${paramMap.useCnt}</span><br />
추가지급금액 : <span>${paramMap.addMoney}</span>
<form name="photoForm" id="photoForm" method="post" action="/membership/webview/photobook/order/view" accept-charset="utf-8">
<input type="hidden" name="photoBookName" value="${paramMap.photoBookName}"/>
<input type="hidden" name="useCnt" value="${paramMap.useCnt}"/>
<input type="hidden" name="addMoney" value="${paramMap.addMoney}"/>
<input type="hidden" id="fullAddrList" name="fullAddrList" value="${paramMap.fullAddrList}"/>
</form>

<input type="button" name="confirm" id="confirm" value="확인" />
</body>
</html>