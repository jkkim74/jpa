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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        var json = JSON.parse('${bioResult}');
        var json_today = JSON.parse('${bioResult_today}');
        var json_next = JSON.parse('${bioResult_next}');
        var json_prev = JSON.parse('${bioResult_prev}');
        $(document).ready(function() {
        	curMondth();
        });
        var curMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(drawChart);
        }
        var preMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(drawChart_prev);
        }
        var nextMondth = function(){
        	google.charts.load('current', {'packages':['corechart']});
        	google.charts.setOnLoadCallback(drawChart_next);
        }
        function drawChart() {
            var arrData = [['day', '감성', '지성', '육체']]
            $(json).each(function(index){
            	//console.log(index + " ::: " , json[index]); 
            	var dt1 = json[index]['Date'].substring(6,7);
            	var dt;
            	if(dt1 == "0"){
            		dt = json[index]['Date'].substring(7,8);
            	}else{ dt = json[index]['Date'].substring(6,8);}
            	console.log(dt);
            	arrData.push([dt,json[index]['emotional'],json[index]['intellectual'],json[index]['physical']]);
            });
            var data = google.visualization.arrayToDataTable(arrData);

            var options = {
                title: '바이오리듬',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
        
        function drawChart_next() {
            var arrData = [['day', '감성', '지성', '육체']]
            $(json_next).each(function(index){
            	//console.log(index + " ::: " , json[index]); 
            	var dt1 = json_next[index]['Date'].substring(6,7);
            	var dt;
            	if(dt1 == "0"){
            		dt = json_next[index]['Date'].substring(7,8);
            	}else{ dt = json_next[index]['Date'].substring(6,8);}
            	console.log(dt);
            	arrData.push([dt,json_next[index]['emotional'],json_next[index]['intellectual'],json_next[index]['physical']]);
            });
            var data = google.visualization.arrayToDataTable(arrData);

            var options = {
                title: '바이오리듬',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
        function drawChart_prev() {
            var arrData = [['day', '감성', '지성', '육체']]
            $(json_prev).each(function(index){
            	//console.log(index + " ::: " , json[index]); 
            	var dt1 = json_prev[index]['Date'].substring(6,7);
            	var dt;
            	if(dt1 == "0"){
            		dt = json_prev[index]['Date'].substring(7,8);
            	}else{ dt = json_prev[index]['Date'].substring(6,8);}
            	console.log(dt);
            	arrData.push([dt,json_prev[index]['emotional'],json_prev[index]['intellectual'],json_prev[index]['physical']]);
            });
            var data = google.visualization.arrayToDataTable(arrData);

            var options = {
                title: '바이오리듬',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
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
