<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>�ֹ� �̸� ����</title>
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
�ֹ� �̸� ���� <br />
����ϸ� : <span>${paramMap.photoBookName}</span><br />
<div id="divAddressList"></div>
���Ǽ� : <span>${paramMap.useCnt}</span><br />
�߰����ޱݾ� : <span>${paramMap.addMoney}</span>
<form name="photoForm" id="photoForm" method="post" action="/membership/webview/photobook/order/view" accept-charset="utf-8">
<input type="hidden" name="photoBookName" value="${paramMap.photoBookName}"/>
<input type="hidden" name="useCnt" value="${paramMap.useCnt}"/>
<input type="hidden" name="addMoney" value="${paramMap.addMoney}"/>
<input type="hidden" id="fullAddrList" name="fullAddrList" value="${paramMap.fullAddrList}"/>
</form>

<input type="button" name="confirm" id="confirm" value="Ȯ��" />
</body>
</html>