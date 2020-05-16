<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.pagin a{
	font-size: 1.500rem;
}

.paging a.on{
    text-decoration:none;
    color:#FF0000;
    font-weight:bold;
}
</style>

<script language="javascript">
var common = {
		totalCount : 1,
		countPerPage: 10,
		navPage : 5
}

/*$(document).ready(function(){
		//페이지정보 초기화
		setPageInfo(common.countPerPage,common.navPage,1);
		
		//데이타 조회
		selectDataList();
});*/

function selectDataList(){
	
	var pageInfo = getPageInfo();
	paging($(".page_num"), common.totalCount, pageInfo.countPerPage, pageInfo.navPage, pageInfo.currentPage,true);
}

function paging(appendEle, totalCount, countPerPage, navPage, currentPage, sellBoolean){
	
	var totalPage = Math.ceil(totalCount / countPerPage); // 총 페이지수
	var pageGroup = Math.ceil(currentPage / navPage);     // 총 페이지그룹
	let last = pageGroup * navPage; // 화면에 보여질 마지막 페이지 번호
	if(last > totalPage){
		last = totalPage;
	}
	var first = last - (navPage - 1); // 화면에 보여질 첫번째 페이지 번호
	
	var forFront = 1;
	var prev = first - 1;
	var next = last + 1;
	var rearMost = totalPage;
	
	let innerHtml = '';
	
	if(prev > 0){
		sellBoolean ? innerHtml += '<a href=# onclick="movePage('+forFront+')"> << </a>' : innerHtml +='';
		innerHtml += '<a href=# onclick="movePage('+prev+')"> < </a>';
	}
	//if(first > 0){
	if(first < 0){
		first = 1;
	}
	for(let i=first; i <= last;i++){
		if(currentPage === i){
			innerHtml += '<a href=# class="on" onclick="movePage('+i+')">' +i+ '</a> | ';
		}else{
			innerHtml += '<a href=# onclick="movePage('+i+')">' +i+ '</a> | ';
		}
	}
	//}
	
	// 다음 맨뒤 Set
	if(last < totalPage){
		innerHtml += '<a href=# onclick="movePage('+next+')"> > </a>';
		sellBoolean ? innerHtml += '<a href=# onclick="movePage('+rearMost+')"> >> </a>' : innerHtml +='';
	}
	
	appendEle.empty();
	appendEle.append(innerHtml);
}

function movePage(currentPage){
	var pageInfo = getPageInfo();
	$("#currentPage").val(currentPage);
	getAddr();
	setPageInfo(pageInfo.countPerPage, pageInfo.navPage, currentPage);
	selectDataList();
}

//Page 정보 Set
function setPageInfo(countPerPage, navPage, currentPage){
	
	var pageInfo = {
			countPerPage : countPerPage,
			navPage:navPage,
			currentPage: currentPage
	}
	
	sessionStorage.setItem("pageInfo",JSON.stringify(pageInfo));
}

//Page 정보 get
function getPageInfo(){
	//alert(sessionStorage.getItem("pageInfo"));
	return JSON.parse(sessionStorage.getItem("pageInfo"));
}

function goSearch(){
	$("#currentPage").val(1);
	 getAddr();
}
function getAddr(){
	// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}
	

	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			console.log(jsonStr);
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
			
			setPagInfoAfterAjax(jsonStr);
		
			
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function setPagInfoAfterAjax(jsonStr){
	var countPerPage = jsonStr.results.common.countPerPage;
	var currentPage = jsonStr.results.common.currentPage;
	common.totalCount = jsonStr.results.common.totalCount;
	console.log("countPerPage : "+countPerPage);
	console.log("currentPage : "+currentPage);
	console.log("totalCount : "+common.totalCount);
	//페이지정보 초기화
	
	$("#countPerPage").val(countPerPage);
	$("#currentPage").val(currentPage);
	if(currentPage == 1){
		setPageInfo(countPerPage,common.navPage,1);
		//데이타 조회
		selectDataList();
	}
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		//htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		//htmlStr += "<td>"+this.admCd+"</td>";
		//htmlStr += "<td>"+this.rnMgtSn+"</td>";
		//htmlStr += "<td>"+this.bdMgtSn+"</td>";
		//htmlStr += "<td>"+this.detBdNmList+"</td>";
		/** API 서비스 제공항목 확대 (2017.02) **/
		//htmlStr += "<td>"+this.bdNm+"</td>";
		//htmlStr += "<td>"+this.bdKdcd+"</td>";
		//htmlStr += "<td>"+this.siNm+"</td>";
		//htmlStr += "<td>"+this.sggNm+"</td>";
		//htmlStr += "<td>"+this.emdNm+"</td>";
		//htmlStr += "<td>"+this.liNm+"</td>";
		//htmlStr += "<td>"+this.rn+"</td>";
		//htmlStr += "<td>"+this.udrtYn+"</td>";
		//htmlStr += "<td>"+this.buldMnnm+"</td>";
		//htmlStr += "<td>"+this.buldSlno+"</td>";
		//htmlStr += "<td>"+this.mtYn+"</td>";
		//htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		//htmlStr += "<td>"+this.lnbrSlno+"</td>";
		//htmlStr += "<td>"+this.emdNo+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
	
	
	/*$(jsonStr.results.juso).each(function(){
		
        <strong>1</strong>
        <a href="?currentPage=2&countPerPage=5&searchType=TOTAL&searchKeyword=%EB%AF%B8%EA%B8%88%EB%A1%9C&lang=&sortType=acc">2</a>
        <a href="?currentPage=3&countPerPage=5&searchType=TOTAL&searchKeyword=%EB%AF%B8%EA%B8%88%EB%A1%9C&lang=&sortType=acc">3</a>
        <a href="?currentPage=4&countPerPage=5&searchType=TOTAL&searchKeyword=%EB%AF%B8%EA%B8%88%EB%A1%9C&lang=&sortType=acc">4</a>
        <a href="?currentPage=5&countPerPage=5&searchType=TOTAL&searchKeyword=%EB%AF%B8%EA%B8%88%EB%A1%9C&lang=&sortType=acc">5</a>
        <a class='skip next' href="?currentPage=6&countPerPage=5&searchType=TOTAL&searchKeyword=%EB%AF%B8%EA%B8%88%EB%A1%9C&lang=&sortType=acc">다음으로</a>
 
	}*/
	
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); //jsonp사용시 enter검색 
	} 
}


</script>
<title>Insert title here</title>
</head>
<body>
<form name="form" id="form" method="post">
	<input type="text" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
	<input type="text" name="countPerPage" value="10"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
	<input type="text" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
	<input type="text" name="confmKey" value="	devU01TX0FVVEgyMDIwMDUxNjA3NDQxODEwOTc2MzI="/><!-- 요청 변수 설정 (승인키) -->
	<input type="text" name="keyword" value="" onkeydown="enterSearch();"/><!-- 요청 변수 설정 (키워드) -->
	<input type="button" onClick="goSearch();" value="주소검색하기"/>
	<div id="list" ></div><!-- 검색 결과 리스트 출력 영역 -->
	<div class="page_num">
	</div>
</form>
</body>
</html>
						