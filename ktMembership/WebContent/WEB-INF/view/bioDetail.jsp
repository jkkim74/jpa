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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/membership/js/loader.js"></script>
    <script type="text/javascript">
       
        var json_today = JSON.parse('${bioResult_today}');
        var json = JSON.parse('${bioResult}');
        var seDate = '${seDate}'.replace(';',' ~ ');
        var json_next = JSON.parse('${bioResult_next}');
    	var seDate_next = '${seDate_next}'.replace(';',' ~ ');
     	var json_prev = JSON.parse('${bioResult_prev}');
    	var seDate_prev = '${seDate_prev}'.replace(';',' ~ ');
       
        $(document).ready(function() {
        	curMondth();
        });
        var curMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(function() { drawChart(json,seDate); });
        }
        var preMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(function() { drawChart(json_prev, seDate_prev); });
        }
        var nextMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(function() { drawChart(json_next, seDate_next); });
        }
        function drawChart(json, seDate) {
        	
            var arrData = [['day', '감성', '지성', '육체']]
            $(json).each(function(index){
            	//console.log(index + " ::: " , json[index]); 
            	var dt1 = json[index]['Date'].substring(6,7);
            	var dt;
            	if(dt1 == "0"){
            		dt = json[index]['Date'].substring(7,8);
            	}else{ dt = json[index]['Date'].substring(6,8);}
            	//console.log(dt);
            	var nDt = parseInt(dt);
            	arrData.push([nDt,json[index]['emotional'],json[index]['intellectual'],json[index]['physical']]);
            });
            var data = google.visualization.arrayToDataTable(arrData);
            var options = getOptions(seDate,data);
            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
            chart.draw(data, options);
        }
        
        function getOptions(seDate,data){
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
                legend: { position: 'bottom' },
           	 	hAxis: { 
           	     ticks: hTicks 
           	    }
            };
            
            return options;
        }
    </script>
</head>
<body>
<div id="curve_chart" style="width: 1000px; height: 800px"></div>
<input type="button" onclick="javascript:curMondth();" value="현재달" /><br />
<input type="button" onclick="javascript:preMondth();" value="이전달" /><br />
<input type="button" onclick="javascript:nextMondth();" value="다음달" />
<span>${bioResult_today[0]['emotional']},${bioResult_today[0]['intellectual']},${bioResult_today[0]['physical']}</span>
</body>
</html>
