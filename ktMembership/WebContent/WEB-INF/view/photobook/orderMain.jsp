<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/membership/js/util.js"></script>
<title>주문메인</title>
<script>


	$(document).ready(function(){
		/*$("input[name=addrChg]").click(function(){
			   var idx = $(this).index();  
			//$(this).each(function(idx){
				alert(idx);
				var url = "/membership/webview/photobook/order/addressPop";
				var addressPop = window.open(url, 'addressPop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');
			//});
		});
		*/
		
		$("#confirm").click(function(){
			var url = "/membership/webview/photobook/order/view";
			
			//var result = "";
			
			/* var list = new Array();
			$("input[name=fullAddr]").each(function(idx,item){
				//result += $(this).val()+"$";
				list.push($(item).val());
			})
			alert(list);
			$("#fullAddrList").val(list);*/
			 //var params = $("#photoForm").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
			// var params = getParamInfo("photoForm");
			// submitAjax(url,"post",true,params);
			 
			 //submitForm("photoForm");
			 
	
			
			/*var aJsonArray = new Array();
			$("input[name=fullAddr]").each(function(idx,item){
				//result += $(this).val()+"$";
				//list.push($(item).val());
				var arrAddr = $(item).val().split(";");
				var aJson = new Object();
				aJson.seq = arrAddr[0];
				aJson.dvlName = arrAddr[1];
				aJson.dvlTel = arrAddr[2];
				aJson.postNo = arrAddr[3];
				aJson.addr1 = arrAddr[4];
				aJson.addr2 = arrAddr[5];
				
				aJsonArray.push(aJson);
			})
			var sJson = JSON.stringify(aJsonArray);*/
			//var paramData = JSON.parse(sJson);
            //alert(paramData);
            
    		var param1 = $("#fullAddrForm").serializeObject();//Array();//getParamInfo("fullAddrForm");//$.param(getParamInfo("fullAddrForm"));
			var formData1 = JSON.stringify(param1);
			alert(formData1);
			$("#fullAddrList").val(formData1);
			submitForm("photoForm");
			 
			/* aJson.seq = "01";
			aJson.dvlName = "김재기";
			aJson.dvlTel = "01083304136";
			aJson.postNo = "304136";
			aJson.addr1 = "경기도 성남시 분당구";
			aJson.addr2 = "금곡동 905동 603호";
			 
			aJsonArray.push(aJson);
			 
			aJson.seq = "02";
			aJson.dvlName = "김재기";
			aJson.dvlTel = "01083304136";
			aJson.postNo = "304136";
			aJson.addr1 = "경기도 성남시 분당구";
			aJson.addr2 = "금곡동 905동 603호";
			 
			aJsonArray.push(aJson);
			
			aJson.seq = "03";
			aJson.dvlName = "김재기";
			aJson.dvlTel = "01083304136";
			aJson.postNo = "304136";
			aJson.addr1 = "경기도 성남시 분당구";
			aJson.addr2 = "금곡동 905동 603호";
			 
			aJsonArray.push(aJson);
			
			aJson.seq = "04";
			aJson.dvlName = "김재기";
			aJson.dvlTel = "01083304136";
			aJson.postNo = "304136";
			aJson.addr1 = "경기도 성남시 분당구";
			aJson.addr2 = "금곡동 905동 603호";
			 
			aJsonArray.push(aJson);
			
			aJson.seq = "05";
			aJson.dvlName = "김재기";
			aJson.dvlTel = "01083304136";
			aJson.postNo = "304136";
			aJson.addr1 = "경기도 성남시 분당구";
			aJson.addr2 = "금곡동 905동 603호";
			 
			aJsonArray.push(aJson);*/
			 
			
			/*function to_ajax(){
				 
			    $.ajax({
			        type : 'get',
			        url : '/test.jsp,
			        dataType : 'xml',
			        beforeSend : function(xhr){
			            xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
			            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			        },
			        error: function(xhr, status, error){
			            alert(error);
			        }
			        success : function(xml){
			            alert(xml)
			        },
			    });
			 
			 
			}*/

		});
	});
	function openAddrPop(idx,seq){
		var url = "/membership/webview/photobook/order/addressPop";//?idx="+idx+"&seq="+seq;
		var addressPop = window.open(url, 'addressPop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');
		$("#frmPop").attr("action",url);
		$("#frmPop").attr("method","POST");
		$("#frmPop").attr("target","addressPop");
		$("#frmPop").children("#idx").val(idx);
		$("#frmPop").children("#seq").val(seq);
		$("#frmPop").submit();
		
	}
	
	function setParentInfo(targIdx,seq,dvlName,dvlTel,postNo,addr1,addr2){
		$("#spUserInfo"+targIdx).text(dvlName+" "+dvlTel);
		$("#spAddrInfo"+targIdx).text("["+postNo+"]"+addr1+" "+addr2);
		
		$("input[name=fullAddr"+targIdx+"]").each(function(idx,item){
			//result += $(this).val()+"$";
			//list.push($(item).val());
			if(idx == 0){
				$(item).val(seq);
			}else if(idx == 1){
				$(item).val(dvlName);
			}else if(idx == 2){
				$(item).val(dvlTel);
			}else if(idx == 3){
				$(item).val(postNo);
			}else if(idx == 4){
				$(item).val(addr1);
			}else{
				$(item).val(addr2);
			}
		});
		
	}

</script>
</head>
<body>

포토북명 : <span>${photoBookName}</span><br />
<form name="fullAddrForm" id="fullAddrForm">
<ul>
<c:forEach var="dvlInfo" items="${dvlInfoList}" varStatus="status">
	<li>
		<span id="spUserInfo${status.index}">${dvlInfo.dvlName} ${dvlInfo.dvlTel}</span><br />
		<span id="spAddrInfo${status.index}">[${dvlInfo.postNo}] ${dvlInfo.addr1} ${dvlInfo.addr1}</span> <input type="button" name="addrChg" id="addrChg" onclick="javascript:openAddrPop(${status.index},${dvlInfo.seq})" value="변경" /> <input type="button" name="addrDel" id="addrDel" onclick="javascript:delAddr(${status.index},${dvlInfo.seq})" value="삭제" /> <br />
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.seq}"/>
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.dvlName}"/>
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.dvlTel}"/>
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.postNo}"/>
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.addr1}"/>
		<input type="hidden" name="fullAddr${status.index}" value="${dvlInfo.addr2}"/>
	</li>
</c:forEach>
</ul>
</form>
사용건수 : <span>5</span><br />
추가지급금액 : <span>10000</span>
<form name="photoForm" id="photoForm" method="post" action="/membership/webview/photobook/order/view" accept-charset="utf-8">
<input type="hidden" name="photoBookName" value="${photoBookName}"/>
<input type="hidden" name="useCnt" value="5"/>
<input type="hidden" name="addMoney" value="10000"/>
<input type="hidden" id="fullAddrList" name="fullAddrList" value=""/>
</form>
<form name="frmPop" id="frmPop">
	<input type="hidden" name="idx" id="idx" />
	<input type="hidden" name="seq" id="seq" />
</form>

<input type="button" name="confirm" id="confirm" value="확인" />
</body>
</html>