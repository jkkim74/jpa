<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <title>Document</title>
    <script type="text/javascript">
       // callback sample
       /* function getData(callbackFunc){
            $.get('/membership/corona/maskMain',function(response){
                callbackFunc(response);
            });
        }
        getData(function(tableData){
            console.log(tableData);
        }); */
        
        
        // Promise Sample
        function getData(){
        	// new Promise Ãß°¡
            return new Promise(function(resolve,reject){
            	$.get('/membership/products/1',function(response){
                	//callbackFunc(response);
                	resolve(response);
                	reject(new Error("Request is failed"));
            	});
            });
        }
        getData().then(function(tableData){
            console.log(tableData);
        }).catch(function(err){
        	cosole.log(err);
        });
    </script>
</head>
<body>

</body>
</html>