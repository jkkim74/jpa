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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var json = JSON.parse('${bioResult}');

    console.log(json);

        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var arrData = [
                ['day', '감성', '지성', '육체'],
                ['1',-13, 90, 99],
                ['2',-39, 78, 95],
                ['3',-63, 63, 87],
                ['4',-81, 44, 76],
                ['5',-94, 23, 62],
                ['6',-100, 0, 46],
                ['7',-98, -22, 28],
                ['8',-89, -43, 10],
                ['9',-73, -62, -9],
                ['10',-52, -78, -28],
                ['11',-27, -90, -46],
                ['12',0, -97, -62],
                ['13',27, -100, -75],
                ['14',52, -98, -86],
                ['15',73, -90, -94],
                ['16',89, -78, -99],
                ['17',98, -63, -100],
                ['18',100, -44, -97],
                ['19',94, -23, -91],
                ['20',82, 0, -82],
                ['21',63, 22, -69],
                ['22',40, 43, -54],
                ['23',14, 62, -37],
                ['24',-13, 78, -19],
                ['25',-39, 90, 0],
                ['26',-63, 97, 19],
                ['27',-81, 100, 37],
                ['28',-94, 98, 54],
                ['29',-100, 90, 69],
                ['30',-98, 78, 81],
                ['31',-89, 63, 91]
            ]
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
<span> BioRhithm : </span><span>${bioResult[0]}</span>
</body>
</html>
