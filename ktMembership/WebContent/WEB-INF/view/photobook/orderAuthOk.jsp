<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>주문내역2</title>
<script type="text/javascript">
$(document).ready(function(){
	var addrHtml = "";
	addrHtml += "<span id='dvlName'>TEST Photobook</span><br />";
	addrHtml += "<span id='dvlTel'>010 8330 4136</span><br />";
	addrHtml += "<span id='postNo'>123-456</span><br />";
	addrHtml += "<span id='addr1'>경기도 성남시 분당구</span><br />";
	addrHtml += "<span id='addr2'>청솔주공 9단지</span>";
	$("#fullAddrList").html(addrHtml);
});

$(window).load(function(){
	alert("올렌TV에서 포토복을 보시겠습니까?");
});
</script>
</head>
<body>
<div id="fullAddrList"></div>
</body>
</html>