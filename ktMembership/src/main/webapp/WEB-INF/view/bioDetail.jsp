<%--
  Created by IntelliJ IDEA.
  User: jack6
  Date: 2020-01-24
  Time: 오전 8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!doctype html>
<html lang="kr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<style type="text/css">
.swiper-container {
	width:640px;
	height:420px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script type="text/javascript" src="/membership/js/loader.js"></script>
    <script type="text/javascript">
       
        var json_today = JSON.parse('${bioResult_today}');
        var json = JSON.parse('${bioResult}');
        var seDate = '${seDate}'.replace(';',' ~ ');
        var json_next = JSON.parse('${bioResult_next}');
    	var seDate_next = '${seDate_next}'.replace(';',' ~ ');
     	var json_prev = JSON.parse('${bioResult_prev}');
    	var seDate_prev = '${seDate_prev}'.replace(';',' ~ ');
    	google.charts.load('current', {'packages':['corechart']});
       
        $(document).ready(function() {
        	curMondth();
        	preMondth();
        	nextMondth();
        });
        var curMondth = function(){
        	google.charts.setOnLoadCallback(function() { drawChart(json,seDate,'curve_chart2'); });
        }
        var preMondth = function(){
        	google.charts.setOnLoadCallback(function() { drawChart(json_prev, seDate_prev,'curve_chart1'); });
        }
        var nextMondth = function(){
        	google.charts.setOnLoadCallback(function() { drawChart(json_next, seDate_next,'curve_chart3'); });
        }
        function drawChart(json, seDate, divId) {
        	
            //var arrData = [['day', '감성', '지성', '육체']]
                var data = new google.visualization.DataTable();
				data.addColumn('number', 'day');
				data.addColumn({type: 'string', role: 'annotation'});
				data.addColumn({type: 'string', role: 'annotationText'});
				data.addColumn('number', '감성');
				data.addColumn('number', '지성');
				data.addColumn('number', '육체');
            $(json).each(function(index){
            	//console.log(index + " ::: " , json[index]); 
            	var dt1 = json[index]['Date'].substring(6,7);
            	var dt;
            	if(dt1 == "0"){
            		dt = json[index]['Date'].substring(7,8);
            	}else{ dt = json[index]['Date'].substring(6,8);}
            	//console.log(dt);
            	var nDt = parseInt(dt);
            	var today = parseInt('${day}');
            	if(nDt == today){
            		data.addRow([nDt, '', '', json[index]['emotional'], json[index]['intellectual'], json[index]['physical']]);
                	
            	}else{
            		data.addRow([nDt, null, null, json[index]['emotional'], json[index]['intellectual'], json[index]['physical']]);
            	}
            	//arrData.push([nDt,json[index]['emotional'],json[index]['intellectual'],json[index]['physical']]);
            });
            //var data = google.visualization.arrayToDataTable(arrData);
            //var options = getOptions(seDate,data);
            //var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
            //chart.draw(data, options);
            
            
            
            
            var chartDiv = document.getElementById(divId);
            var chart = new google.visualization.LineChart(chartDiv);
    		/**
    		*      case '#922b21':
              case '#1e8449':
              case '#007fff':
    		*/
    		var annotationColor = '#007fff';
    		google.visualization.events.addListener(chart, 'ready', function () {
    			Array.prototype.forEach.call(chartDiv.getElementsByTagName('rect'), function(rect) {
    			  if (rect.getAttribute('fill') === annotationColor) {
    				rect.setAttribute('width', '5');
    			  }
    			});
    		});
    		var options = getOptions(seDate,data,annotationColor);
    		/*var options = {
    			title: '바이오리듬',
    			curveType: 'function',
    			annotations: {
    			  stem: {
    				color: annotationColor
    			  },
    			  style: 'line'
    			},
    			legend: { position: 'bottom' }
    		}*/

            

            chart.draw(data, options);
        }
        
        function getOptions(seDate,data,annotationColor){
        	var h_interval = 5; 
            var h_dataRange = data.getColumnRange(0); 
            var hTicks = []; 
            for (var i = h_dataRange.min; i <= h_dataRange.max; i = i + h_interval) { 
             hTicks.push(i); 
            } 
        	var strTitle = '바이오리듬( '+seDate+' ) ';
            var options = {
                title: strTitle,
                curveType: 'function',
                lineWidth: 7,
    			annotations: {
    			  stem: {
    				color: annotationColor
    			  },
    			  style: 'line'
    			},
                legend: { position: 'none' },
                vAxis:{
                  ticks: []
                },
           	 	hAxis: { 
           	      ticks: hTicks 
           	    }
            };
            
            return options;
        }
    </script>
</head>
<body>
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div id="curve_chart1" style="width: 600px; height: 400px"></div>
		</div>
		<div class="swiper-slide">
			<div id="curve_chart2" style="width: 600px; height: 400px"></div>
		</div>
		<div class="swiper-slide">
			<div id="curve_chart3" style="width: 600px; height: 400px"></div>
		</div>
	</div>
		<!-- 네비게이션 버튼 -->
	<!--<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<!--<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
<input type="button" onclick="javascript:curMondth();" value="현재달" /><br />
<input type="button" onclick="javascript:preMondth();" value="이전달" /><br />
<input type="button" onclick="javascript:nextMondth();" value="다음달" />
<span>${bioResult_today[0]['emotional']},${bioResult_today[0]['intellectual']},${bioResult_today[0]['physical']}</span>

<script>
var mySwipe = new Swiper('.swiper-container',{
	initialSlide: 1,
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	/*navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},*/
});

</script>
</body>
</html>
