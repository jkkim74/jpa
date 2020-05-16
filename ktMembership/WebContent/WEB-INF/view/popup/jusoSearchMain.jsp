<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://www.juso.go.kr/juso_support_center/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="http://www.juso.go.kr/juso_support_center/js/rnic-search.js"></script>
<script type="text/javascript" src="http://www.juso.go.kr/juso_support_center/js/rnic-common.js"></script> 

<link rel="stylesheet" type="text/css" href="http://www.juso.go.kr/juso_support_center/css/addrlink/mobilePopup.css"></link>



<title>주소정보연계 | 도로명주소 안내시스템</title>
<meta name="title" content="">
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script language="javascript">
	//특수문자, 특정문자열(sql예약어) 제거
	function checkSearchedWord(obj){
		obj.value = obj.value+" ";
		//특수문자 제거
		if(obj.value.length >0){
			var expText = /[%=><]/ ;
			if(expText.test(obj.value) == true){
				obj.value = obj.value.split(expText).join(""); 
			}
			//체크 문자열
			var sqlArray = new Array( //sql 예약어
				"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC", "UNION",  "FETCH", "DECLARE", "TRUNCATE"
			);
			
			var regex;
			var regex_plus ;
			for(var i=0; i<sqlArray.length; i++){
				regex = new RegExp("\\s" + sqlArray[i] + "\\s","gi") ;
				if (regex.test(obj.value)) {
					obj.value =obj.value.replace(regex, "");
					alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				}
				regex_plus = new RegExp( "\\+" + sqlArray[i] + "\\+","gi") ;
				if (regex_plus.test(obj.value)) {
					obj.value =obj.value.replace(regex_plus, "");
					alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				}
			}
		}
		return obj.value = obj.value;
	}
	
	function searchUrlJuso(){
		$("#address_detail").hide();
		var frm = document.AKCFrm;
		frm.keyword.value = $("#keyword").val();
		
		if (!checkSearchedWord(frm.keyword)) {
			return ;
		}
		
		//frm.keyword.value = checkSearchedWord(frm.keyword);
		frm.keyword.value = validateJuso( frm.keyword.value );
		if(!checkValidate1(frm.keyword, "검색어")) return;
		else if(!checkValidate2(frm.keyword.value)) return;
		frm.keyword.value = regExpCheckJuso( frm.keyword.value );
		$("#AKCFrm").attr("action","http://www.juso.go.kr/addrlink/addrMobileLinkUrlSearch.do").submit(); 
	}
	
	function setParent(){
		var encodingType = "";
		if(encodingType=="EUC-KR"){
			document.charset ="EUC-KR";
			$("#rtForm").attr("accept-charset","EUC-KR");
		}
		var returnUrl = "http://localhost:9080/membership/popup/jusoPopup";
		var rtRoadAddr = $.trim($("#rtRoadAddr").val());
		var rtAddrPart1 = $.trim($("#rtAddrPart1").val());
		var rtAddrPart2 = $.trim($("#rtAddrPart2").val());
		var rtEngAddr = $.trim($("#rtEngAddr").val());
		var rtJibunAddr = $.trim($("#rtJibunAddr").val());
		var rtAddrDetail = $.trim($("#rtAddrDetail").val());
		var rtZipNo = $.trim($("#rtZipNo").val());
		var rtAdmCd = $.trim($("#rtAdmCd").val());
		var rtRnMgtSn = $.trim($("#rtRnMgtSn").val());
		var rtBdMgtSn = $.trim($("#rtBdMgtSn").val());
		var rtDetBdNmList = $.trim($("#rtDetBdNmList").val());
		var rtBdNm = $.trim($("#rtBdNm").val());
		var rtBdKdcd = $.trim($("#rtBdKdcd").val());
		var rtSiNm = $.trim($("#rtSiNm").val());
		var rtSggNm = $.trim($("#rtSggNm").val());
		var rtEmdNm = $.trim($("#rtEmdNm").val());
		var rtLiNm = $.trim($("#rtLiNm").val());
		var rtRn = $.trim($("#rtRn").val());
		var rtUdrtYn = $.trim($("#rtUdrtYn").val());
		var rtBuldMnnm = $.trim($("#rtBuldMnnm").val());
		var rtBuldSlno = $.trim($("#rtBuldSlno").val());
		var rtMtYn = $.trim($("#rtMtYn").val());
		var rtLnbrMnnm = $.trim($("#rtLnbrMnnm").val());
		var rtLnbrSlno = $.trim($("#rtLnbrSlno").val());
		var rtEmdNo = $.trim($("#rtEmdNo").val());
		
		var rtRoadFullAddr = rtAddrPart1;
		if(rtAddrDetail != "" && rtAddrDetail != null){
			rtRoadFullAddr += ", " + rtAddrDetail;
		}
		if(rtAddrPart2 != "" && rtAddrPart2 != null){
			rtRoadFullAddr += " " + rtAddrPart2;
		}
		
		$("#roadFullAddr").val(rtRoadFullAddr);
		$("#roadAddrPart1").val(rtAddrPart1);
		$("#roadAddrPart2").val(rtAddrPart2);
		$("#engAddr").val(rtEngAddr);
		$("#jibunAddr").val(rtJibunAddr);
		$("#addrDetail").val(rtAddrDetail);
		$("#zipNo").val(rtZipNo);
		$("#admCd").val(rtAdmCd);
		$("#rnMgtSn").val(rtRnMgtSn);
		$("#bdMgtSn").val(rtBdMgtSn);
		$("#detBdNmList").val(rtDetBdNmList);
		$("#bdNm").val(rtBdNm);
		$("#bdKdcd").val(rtBdKdcd);
		$("#siNm").val(rtSiNm);
		$("#sggNm").val(rtSggNm);
		$("#emdNm").val(rtEmdNm);
		$("#liNm").val(rtLiNm);
		$("#rn").val(rtRn);
		$("#udrtYn").val(rtUdrtYn);
		$("#buldMnnm").val(rtBuldMnnm);
		$("#buldSlno").val(rtBuldSlno);
		$("#mtYn").val(rtMtYn);
		$("#lnbrMnnm").val(rtLnbrMnnm);
		$("#lnbrSlno").val(rtLnbrSlno);
		$("#emdNo").val(rtEmdNo);
		
		$("#rtForm").attr("action",returnUrl).submit();
	}
	
	function setMaping(idx){
		
		var roadAddr = $("#roadAddrDiv"+idx).text()
		var addrPart1 = $("#roadAddrPart1Div"+idx).text();
		var addrPart2 = $("#roadAddrPart2Div"+idx).text();
		var engAddr = $("#engAddrDiv"+idx).text();
		var jibunAddr = $("#jibunAddrDiv"+idx).text();
		var zipNo = $("#zipNoDiv"+idx).text();
		var admCd = $("#admCdHid"+idx).val();
		var rnMgtSn = $("#rnMgtSnHid"+idx).val();
		var bdMgtSn = $("#bdMgtSnHid"+idx).val();
		var detBdNmList = $("#detBdNmListHid"+idx).val();
		var bdNm = $("#bdNmHid"+idx).val();
		var bdKdcd = $("#bdKdcdHid"+idx).val();
		var siNm = $("#siNmHid"+idx).val();
		var sggNm = $("#sggNmHid"+idx).val();
		var emdNm = $("#emdNmHid"+idx).val();
		var liNm = $("#liNmHid"+idx).val();
		var rn = $("#rnHid"+idx).val();
		var udrtYn = $("#udrtYnHid"+idx).val();
		var buldMnnm = $("#buldMnnmHid"+idx).val();
		var buldSlno = $("#buldSlnoHid"+idx).val();
		var mtYn = $("#mtYnHid"+idx).val();
		var lnbrMnnm = $("#lnbrMnnmHid"+idx).val();
		var lnbrSlno = $("#lnbrSlnoHid"+idx).val();
		var emdNo = $("#emdNoHid"+idx).val();
		
		$("#rtRoadAddr").val(roadAddr);
		$("#rtAddrPart1").val(addrPart1);
		$("#rtAddrPart2").val(addrPart2);
		$("#rtEngAddr").val(engAddr);
		$("#rtJibunAddr").val(jibunAddr);
		$("#rtZipNo").val(zipNo);
		$("#rtAdmCd").val(admCd);
		$("#rtRnMgtSn").val(rnMgtSn);
		$("#rtBdMgtSn").val(bdMgtSn);
		$("#rtDetBdNmList").val(detBdNmList);
		$("#rtBdNm").val(bdNm);
		$("#rtBdKdcd").val(bdKdcd);
		$("#rtSiNm").val(siNm);
		$("#rtSggNm").val(sggNm);
		$("#rtEmdNm").val(emdNm);
		$("#rtLiNm").val(liNm);
		$("#rtRn").val(rn);
		$("#rtUdrtYn").val(udrtYn);
		$("#rtBuldMnnm").val(buldMnnm);
		$("#rtBuldSlno").val(buldSlno);
		$("#rtMtYn").val(mtYn);
		$("#rtLnbrMnnm").val(lnbrMnnm);
		$("#rtLnbrSlno").val(lnbrSlno);
		$("#rtEmdNo").val(emdNo);

		$("#resultList").hide();
		$("#address_detail").show();
		
		$("#addrPart1").html(addrPart1);
		$("#addrPart2").html(addrPart2);
		$("#rtAddrDetail").focus();
		
	}
	
 	
	function init(){
		/* if("" =="P0001" && "" == "1"){
			alert("검색 결과가 너무 많습니다(1,000건 이상)\n검색어 예를 참조하여 검색하시기 바랍니다.");
		}
		
		if("" =="E0005"){
			alert("");
		} */
	}
	
	function isNumChk(){
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if((evtCode < 48 || evtCode > 57) && evtCode!=8){ 
			event.preventDefault(); 
		}
	}
	
	function addrDetailChk(){
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if(evtCode == 63 || evtCode == 35 || evtCode == 38 || evtCode == 43 || evtCode == 92 || evtCode == 34){ // # & + \ " 문자제한
			alert('특수문자 ? # & + \\ " 를 입력 할 수 없습니다.');
			if(event.preventDefault){
				event.preventDefault();
			}else{
				event.returnValue=false;
			}
		}
	}
	
	function addrDetailChk1(obj){
		if(obj.value.length > 0){
			var expText = /^[^?#&+\"\\]+$/;
			if(expText.test(obj.value) != true){
				alert('특수문자 ? # & + \\ " 를 입력 할 수 없습니다.');
				obj.value="";
			}
		}
	}
	
	function popClose(){
		window.close();
	}
	
	function addrJuminRenew(idx){
		$("#detDivX"+idx).show();
		$("#detListDivX"+idx).show();
		$("#detDiv"+idx).hide();
	}
	
	function addrJuminRenewX(idx){
		$("#detDivX"+idx).hide();
		$("#detListDivX"+idx).hide();
		$("#detDiv"+idx).show();
	}
	
	$(function(){
	    $("#keyword").focus();
	    $("#keyword").on("keydown", function(event){
	    		if (event.which == 13) {    
				event.keyCode = 0;  
				searchUrlJuso(); 
			}
	    });
	});
</script>

</head>
<body onload="init();"> 
	<form name="rtForm" id="rtForm" method="post">
		<input type="hidden" name="inputYn" id="inputYn" value="Y"/>  
		<input type="hidden" name="roadFullAddr" id="roadFullAddr"/>  
		<input type="hidden" name="roadAddrPart1" id="roadAddrPart1"/>
		<input type="hidden" name="roadAddrPart2" id="roadAddrPart2"/>
		<input type="hidden" name="engAddr" id="engAddr"/>            
		<input type="hidden" name="jibunAddr" id="jibunAddr"/>        
		<input type="hidden" name="zipNo" id="zipNo"/>                
		<input type="hidden" name="addrDetail" id="addrDetail"/>
		<input type="hidden" name="admCd" id="admCd" />
		<input type="hidden" name="rnMgtSn" id="rnMgtSn" />
		<input type="hidden" name="bdMgtSn" id="bdMgtSn" />
		<input type="hidden" name="detBdNmList" id="detBdNmList" /> 
		<input type="hidden" name="bdNm" id="bdNm" /> 
		<input type="hidden" name="bdKdcd" id="bdKdcd" /> 
		<input type="hidden" name="siNm" id="siNm" /> 
		<input type="hidden" name="sggNm" id="sggNm" /> 
		<input type="hidden" name="emdNm" id="emdNm" /> 
		<input type="hidden" name="liNm" id="liNm" /> 
		<input type="hidden" name="rn" id="rn" /> 
		<input type="hidden" name="udrtYn" id="udrtYn" /> 
		<input type="hidden" name="buldMnnm" id="buldMnnm" /> 
		<input type="hidden" name="buldSlno" id="buldSlno" /> 
		<input type="hidden" name="mtYn" id="mtYn" /> 
		<input type="hidden" name="lnbrMnnm" id="lnbrMnnm" /> 
		<input type="hidden" name="lnbrSlno" id="lnbrSlno" /> 
		<input type="hidden" name="emdNo" id="emdNo" /> 
	</form>
	
	<!-- Accessibility -->
	<div id="accessibility">
		<ul>
			<li><a href="#keyword">검색 바로가기</a></li>
			<li><a href="#container">본문 바로가기(skip to content)</a></li>
		</ul>
	</div>
	<div id="wrap">
		<!-- header -->
		<section id="header">
			<h1 class="hiddenArea">도로명 주소</h1>	
			<!-- 검색 -->
			<div id="search">
				<h2 class="hiddenArea">간편주소검색</h2>
				<form name="AKCFrm" id="AKCFrm" method="post" class="search_form"> 
					<input type="hidden" name="rtRoadAddr"  id="rtRoadAddr"  />
					<input type="hidden" name="rtAddrPart1" id="rtAddrPart1" />
					<input type="hidden" name="rtAddrPart2" id="rtAddrPart2" />
					<input type="hidden" name="rtEngAddr"   id="rtEngAddr"   />
					<input type="hidden" name="rtJibunAddr" id="rtJibunAddr" />
					<input type="hidden" name="rtZipNo" id="rtZipNo" />
					<input type="hidden" name="rtAdmCd" id="rtAdmCd" />
					<input type="hidden" name="rtRnMgtSn" id="rtRnMgtSn" />
					<input type="hidden" name="rtBdMgtSn" id="rtBdMgtSn" />
					<input type="hidden" name="rtDetBdNmList" id="rtDetBdNmList" />
					<input type="hidden" name="rtBdNm" id="rtBdNm" />
					<input type="hidden" name="rtBdKdcd" id="rtBdKdcd" />
					<input type="hidden" name="rtSiNm" id="rtSiNm" />
					<input type="hidden" name="rtSggNm" id="rtSggNm" />
					<input type="hidden" name="rtEmdNm" id="rtEmdNm" />
					<input type="hidden" name="rtLiNm" id="rtLiNm" />
					<input type="hidden" name="rtRn" id="rtRn" />
					<input type="hidden" name="rtUdrtYn" id="rtUdrtYn" />
					<input type="hidden" name="rtBuldMnnm" id="rtBuldMnnm" />
					<input type="hidden" name="rtBuldSlno" id="rtBuldSlno" />
					<input type="hidden" name="rtMtYn" id="rtMtYn" />
					<input type="hidden" name="rtLnbrMnnm" id="rtLnbrMnnm" />
					<input type="hidden" name="rtLnbrSlno" id="rtLnbrSlno" />
					<input type="hidden" name="rtEmdNo" id="rtEmdNo" />
					<input type="hidden" name ="searchType" id="searchType" />
					<input type="hidden" name ="keyword" />
				</form>
				
				<fieldset class="search_set">	
					<legend>검색</legend>
					<label class="hiddenArea">검색</label>
					<input type="text" title="검색어를 입력하세요" id="keyword" style="ime-mode:active;" placeholder="도로명주소, 건물명 또는 지번입력" value="" />
					<input type="button" value="검색" onclick="javascript:searchUrlJuso();" style="cursor: pointer;" />
				</fieldset>
				<p class="search_keyword">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)</p>
			</div>
		</section>
		
		<!-- container -->
		<section id="container">
			
			<div class="guide_search" >
				<h2 class="hiddenArea">도로명주소 검색</h2>
				<p>보다 정확한 검색을 위하여 다음 권장사항을 확인하여 주시기 바랍니다. </p>
				<ul>
					<li>시·도/시·군·구 + 도로명주소 <span>예) 종로구 사직로 161</span></li>
					<li>시·도/시·군·구/읍·면·동 + 지번 <span>예) 종로구 관훈동 198-1</span></li>
					<li>시·도/시·군·구 + 건물명 <span>예) 역삼동 737</span></li>
				</ul>
			</div>
			
			
			<!-- nodata -->
			<!-- 검색 결과 없습니다. -->
			
			   <div class="search_none">
					
				</div>
			
			
			<!-- //nodata -->

			<!-- 리스트 -->
			
			
			<!-- 주소상세검색 입력 -->
			<div id="address_detail" style="display:none;">
				<h2>상세주소 입력</h2>	
				<legend class="hiddenArea">상세주소 입력</legend>
				<span class="address_title">도로명주소</span>
				<div class="address_road" id="addrPart1"></div>
				<label class="address_title">상세주소입력</label>
				<div class="address_form">
					<div class="row">
						<div class="cell1">
							<input type="text" name="rtAddrDetail" id="rtAddrDetail" onkeypress="addrDetailChk();" onkeyup="addrDetailChk1(this);" title="상세주소"/>
						</div>
						<div class="cell2"">
							<p class="address_text" id="addrPart2"></p>
						</div>
					</div>
				</div>
				<div class="btn_address">
					<input type="button" value="주소 입력" onclick="javascript:setParent();" style="cursor: pointer;">
				</div>
			</div>
		</section>
		
		<section id="footer">
			<p id="logo"><span>도로명주소</span></p>
			<div id="return"><a href="javascript:popClose();" title="창닫기">돌아가기</a></div>
		</section>
	</div>
</body>
</html>
