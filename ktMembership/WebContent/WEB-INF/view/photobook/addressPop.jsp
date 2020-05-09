<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>최근배송주소팝업</title>
<script>
$(document).ready(function(){
	$("#confirm").click(function(){
		var selVal = $(":input:radio[name=selAddr]:checked").val();
		var seq = $("#seq"+selVal).val();
		var dvlName = $("#dvlName"+selVal).val();
		var dvlTel = $("#dvlTel"+selVal).val();
		var postNo = $("#postNo"+selVal).val();
		var addr1 = $("#addr1"+selVal).val();
		var addr2 = $("#addr2"+selVal).val();
		var targIdx = "${targIdx}";
		console.log(targIdx+","+seq+","+dvlName+","+dvlTel+","+postNo+","+addr1+","+addr2);
		window.opener.setParentInfo(targIdx,seq,dvlName,dvlTel,postNo,addr1,addr2);
		window.close();
	});
	
});
</script>
</head>
<body>
<form name="fullAddrForm" id="fullAddrForm">
*최근 배송 주소 <input type="button" name="inputDvlAddr" value="배송주소 입력" /> <br />
<c:forEach var="dvlInfo" items="${dvlInfoList}" varStatus="status">
<input type="radio" name="selAddr" value="${status.index}" />
	<span>${dvlInfo.dvlName}</span>
	<span>${dvlInfo.dvlTel}</span><br />
	<span>[${dvlInfo.postNo}]</span>
	<span>${dvlInfo.addr1}</span>
	<span>${dvlInfo.addr1}</span>  <br />
	<input type="hidden" name="fullAddr[${status.index}]" id="seq${status.index}" value="${dvlInfo.seq}"/>
	<input type="hidden" name="fullAddr[${status.index}]" id="dvlName${status.index}" value="${dvlInfo.dvlName}"/>
	<input type="hidden" name="fullAddr[${status.index}]" id="dvlTel${status.index}" value="${dvlInfo.dvlTel}"/>
	<input type="hidden" name="fullAddr[${status.index}]" id="postNo${status.index}" value="${dvlInfo.postNo}"/>
	<input type="hidden" name="fullAddr[${status.index}]" id="addr1${status.index}" value="${dvlInfo.addr1}"/>
	<input type="hidden" name="fullAddr[${status.index}]" id="addr2${status.index}" value="${dvlInfo.addr2}"/>
	
</c:forEach>
</form>
<input type="button" name="confirm" id="confirm" value="확인" />
<input type="button" name="cancel"  id="cancel" value="취소" />
</body>
</html>