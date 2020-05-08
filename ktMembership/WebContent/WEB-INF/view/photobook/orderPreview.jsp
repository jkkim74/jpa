<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>�ֹ� �̸� ����</title>
</head>
<body>
�ֹ� �̸� ���� <br />
����ϸ� : <span>${photoBookName}</span><br />
<c:forEach var="dvlInfo" items="${dvlInfoList}">
	<span>${dvlInfo.dvlName}</span>
	<span>${dvlInfo.dvlTel}</span><br />
	<span>[${dvlInfo.postNo}]</span>
	<span>${dvlInfo.addr1}</span>
	<span>${dvlInfo.addr2}</span><br />
</c:forEach>
���Ǽ� : <span>${useCnt}</span><br />
�߰����ޱݾ� : <span>${addMoney}</span>
<form name="photoForm" id="photoForm" method="post" action="/membership/webview/photobook/order/view" accept-charset="utf-8">
<input type="hidden" name="photoBookName" value="${photoBookName}"/>
<input type="hidden" name="useCnt" value="${useCnt}"/>
<input type="hidden" name="addMoney" value="${addMoney}"/>
<input type="hidden" id="fullAddrList" name="fullAddrList" value="${fullAddrList}"/>
</form>

<input type="button" name="confirm" id="confirm" value="Ȯ��" />
</body>
</html>