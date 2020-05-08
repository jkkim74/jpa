<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>주문메인</title>
<script>
	$(document).ready(function(){
		$("#confirm").click(function(){
			alert("111111111111");
			var url = "/membership/webview/photobook/order/view";
			
			//var result = "";
			var list = new Array();
			$("input[name=fullAddr]").each(function(idx,item){
				//result += $(this).val()+"$";
				list.push($(item).val());
			})
			alert(list);
			$("#fullAddrList").val(list);
			 //var params = $("#photoForm").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
			// var params = getParamInfo("photoForm");
			// submitAjax(url,"post",true,params);
			 
			 submitForm("photoForm");

		});
	});
	function submitForm(elementId)
	{
		$("#" + elementId).submit();
	}
	function submitAjax( url, type, async, param)
	{
		return $.ajax({
			url      : url
	      , type   : type
	      , async : async
	      , data	 : $.param(param)
	      //, data	 : VestAjax(typeof(param)=='object'?$.param(param):param)
	      , error	 :function( data)
	      {
	    	  alert("시스템 오류가 발생했습니다.");
	      }
		});
	}

	function getParamInfo(formId){
		var formData = $("#"+formId).serializeArray();
		var formData1 = JSON.stringify(formData);
		var paramData = JSON.parse(formData1);
		return paramData;
	}
</script>
</head>
<body>

포토북명 : <span>${photoBookName}</span><br />
<c:forEach var="dvlInfo" items="${dvlInfoList}">
	<span>${dvlInfo.dvlName}</span>
	<span>${dvlInfo.dvlTel}</span><br />
	<span>[${dvlInfo.postNo}]</span>
	<span>${dvlInfo.addr1}</span>
	<span>${dvlInfo.addr2}</span><br />
	<input type="hidden" name="fullAddr" value="${dvlInfo.seq};${dvlInfo.dvlName};${dvlInfo.dvlTel};${dvlInfo.postNo};${dvlInfo.addr1};${dvlInfo.addr2}"/>
</c:forEach>
사용건수 : <span>5</span><br />
추가지급금액 : <span>10000</span>
<form name="photoForm" id="photoForm" method="post" action="/membership/webview/photobook/order/view" accept-charset="utf-8">
<input type="hidden" name="photoBookName" value="${photoBookName}"/>
<input type="hidden" name="useCnt" value="5"/>
<input type="hidden" name="addMoney" value="10000"/>
<input type="hidden" id="fullAddrList" name="fullAddrList" value=""/>
</form>

<input type="button" name="confirm" id="confirm" value="확인" />
</body>
</html>