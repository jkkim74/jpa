<%--
  Created by IntelliJ IDEA.
  User: jack6
  Date: 2020-01-24
  Time: 오전 8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!doctype html>
<html lang="kr">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <style type="text/css">
        .swiper-container {
            width: 640px;
            height: 420px;
            border: 5px solid silver;
            border-radius: 7px;
            box-shadow: 0 0 20px #ccc inset;
        }

        .swiper-slide {
            text-align: center;
            display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
            align-items: center; /* 위아래 기준 중앙정렬 */
            justify-content: center; /* 좌우 기준 중앙정렬 */
        }

        .swiper-slide img {
            box-shadow: 0 0 5px #555;
        }

        div.custom-tooltip {
            position: absolute;
            top: 70px;
            right: 20px;
        }

    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script type="text/javascript" src="/membership/js/loader.js"></script>
    <script type="text/javascript">

        var json_today = JSON.parse('${bioResult_today}');
        var json = JSON.parse('${bioResult}');
        var seDate = '${seDate}'.replace(';', ' ~ ');
        var json_next = JSON.parse('${bioResult_next}');
        var seDate_next = '${seDate_next}'.replace(';', ' ~ ');
        var json_prev = JSON.parse('${bioResult_prev}');
        var seDate_prev = '${seDate_prev}'.replace(';', ' ~ ');
        google.charts.load('current', {'packages': ['corechart']});

        $(document).ready(function () {
            curMondth();
            preMondth();
            nextMondth();
        });
        var curMondth = function () {
            google.charts.setOnLoadCallback(function () {
                drawChart(json, seDate, 'curve_chart2');
            });
        }
        var preMondth = function () {
            google.charts.setOnLoadCallback(function () {
                drawChart(json_prev, seDate_prev, 'curve_chart1');
            });
        }
        var nextMondth = function () {
            google.charts.setOnLoadCallback(function () {
                drawChart(json_next, seDate_next, 'curve_chart3');
            });
        }

        function createCustomHTMLContent(number) {
            return '<div style="padding:5px 5px 5px 5px;background-color:"+ color + ";"><span>' + number + "</span></div>"
        }

        function drawChart(json, seDate, divId) {

            //var arrData = [['day', '감성', '지성', '육체']]
            var data = new google.visualization.DataTable();
            data.addColumn('date', 'day');
            data.addColumn({type: 'string', role: 'annotation'});
            data.addColumn({type: 'string', role: 'annotationText'});
            data.addColumn('number', '감성');
            data.addColumn('number', '지성');
            data.addColumn('number', '신체');
            //data.addColumn({'type': 'number', 'role': 'tooltip', 'p': {'html': true}});
            $(json).each(function (index) {
                //console.log(index + " ::: " , json[index]);
                var dt1 = json[index]['Date'].substring(6, 7);
                var month1 = json[index]['Date'].substring(4, 6);
                var dt;
                if (dt1 == "0") {
                    dt = json[index]['Date'].substring(7, 8);
                } else {
                    dt = json[index]['Date'].substring(6, 8);
                }

                //if(month1 == "0"){
                //	month = json[index]['Date'].substring(5,6);
                //}else{ month = json[index]['Date'].substring(4,6);}
                //console.log(dt);
                var nDt = parseInt(dt);
                var today = parseInt('${day}');
                //var monthDay = month+"월"+dt+"일";
                var month = parseInt(month1) - 1;
                console.log(month)
                var date = new Date(2020, month, nDt);
                //console.log(date);
                if (nDt == today) {
                    //data.addRow([monthDay, '', '', json[index]['emotional'], json[index]['intellectual'], json[index]['physical'],json[index]['physical']]);
                    data.addRow([date, '', '', json[index]['emotional'], json[index]['intellectual'], json[index]['physical']]);

                } else {
                    //data.addRow([monthDay, null, null, json[index]['emotional'], json[index]['intellectual'], json[index]['physical'],json[index]['physical']]);
                    data.addRow([date, null, null, json[index]['emotional'], json[index]['intellectual'], json[index]['physical']]);
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
            var annotationColor = '#daa520';
            google.visualization.events.addListener(chart, 'ready', function () {
                Array.prototype.forEach.call(chartDiv.getElementsByTagName('rect'), function (rect) {
                    if (rect.getAttribute('fill') === annotationColor) {
                        rect.setAttribute('width', '5');
                        // 선추가
                        objCopy = rect.cloneNode(true);
                        objCopy.setAttribute('fill', '#ff0000');
                        objCopy.setAttribute('width', 3);
                        objCopy.setAttribute('display', 'none');
                        rect.parentNode.appendChild(objCopy);
                    }
                });
            });

            google.visualization.events.addListener(chart, 'select', function () {

                if (chart.getSelection()[0] == undefined) return;
                var row = chart.getSelection()[0].row;
                //var col = chart.getSelection()[0].column;
                var xValue = chartDiv.querySelector('circle').getAttribute('cx');
                deRect = chartDiv.querySelector('rect[fill="#daa520"]').getAttribute('x');
                if (deRect != xValue) {
                    chartDiv.querySelector('rect[fill="#ff0000"]').setAttribute('display', 'block');
                    chartDiv.querySelector('rect[fill="#ff0000"]').setAttribute('x', xValue - 2);
                } else {
                    chartDiv.querySelector('rect[fill="#ff0000"]').setAttribute('display', 'none');
                }
            });
            var options = getOptions(seDate, data, annotationColor);
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

            // Add our over/out handlers.
            /* google.visualization.events.addListener(chart, 'onmouseover', onMouseOver); 
            google.visualization.events.addListener(chart, 'onmouseout', onMouseOut); 
            
            var $customTooltip = $("div.custom-tooltip"); 
            function onMouseOver(e) { 
               var row = e.row; 
               if(row != null){ 
                $("#row0").text(data.getValue(row, 0)); 
                $("#row1").text(data.getValue(row, 3)); 
                $("#row2").text(data.getValue(row, 4)); 
                $("#row3").text(data.getValue(row, 5))
                  
                 chart.setSelection([e]); 
             } 
           } 
           function onMouseOut(e) { 
             // 
           } */
        }

        function getOptions(seDate, data, annotationColor) {
            // x축 string으로 지정하면 안나와서 주석 처리
            /*var h_interval = 5;
            var h_dataRange = data.getColumnRange(0); 
            var hTicks = []; 
            console.log(h_dataRange);
            for (var i = 0; i <= 29; i = i + h_interval) { 
             hTicks.push(i); 
            }*/
            var strTitle = '바이오리듬( ' + seDate + ' ) ';
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
                legend: {position: 'none'},
                vAxis: {
                    ticks: []
                },
                /* hAxis: {
                      ticks: hTicks
                 },*/
                hAxis: {
                    format: 'MM/dd'
                },

                // This line makes the entire category's tooltip active. 전체카테고리 정보가 다 나옴..
                focusTarget: 'category'
                // Group selections
                // by x-value.
                //  aggregationTarget: 'category',
                //tooltip: { trigger: 'selection'} 선택시 tooltip 나옴.
                // Use an HTML tooltip.
                //tooltip: { isHtml: true} //trigger: 'selection' ,trigger: 'none'// 안나옴.
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
<input type="button" onclick="javascript:curMondth();" value="현재달"/><br/>
<input type="button" onclick="javascript:preMondth();" value="이전달"/><br/>
<input type="button" onclick="javascript:nextMondth();" value="다음달"/>
<span>${bioResult_today[0]['emotional']},${bioResult_today[0]['intellectual']},${bioResult_today[0]['physical']}</span>

<script>
    var mySwipe = new Swiper('.swiper-container', {
        initialSlide: 1,
        pagination: { // 페이징 설정
            el: '.swiper-pagination',
            clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        /*navigation : { // 네비게이션 설정
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
        },*/
    });

</script>
<!-- 별도로 tooltip을 만들때 사용 함..<div id="curve_chart" style="height: 500px;"></div> 
<div class="custom-tooltip"> 
날짜: <span id="row0"></span><br/> 
감정: <span id="row1"></span><br/>  
지성: <span id="row2"></span><br/>  
신체: <span id="row3"></span>
</div> -->
</body>
</html>
