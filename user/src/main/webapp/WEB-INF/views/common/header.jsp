<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="header.css">
</head>
<body>
    <div class="header_outer">
        <div class="header">
            <div class="header_btn">HOME</div>
            <div class="header_btn">영업준비</div>
            <div class="header_btn">판매집계</div>
            <div class="header_btn">메뉴</div>
            <div class="header_btn">관리</div>
            <div class="header_btn">문의</div>
            <div id="time"></div>
            <div class="forklogo">
                <img src="resources/img/fork2.png" width="100px" />
            </div>
        </div>
    </div>
    <script>
    setInterval("getTime()", 1000);

    function getTime(){
        const time = document.getElementById("time");

        const today = new Date();
        const year = today.getFullYear();
        const month = today.getMonth()+1 < 10 ? '0' + (today.getMonth()+1) : today.getMonth()+1;
        const date = today.getDate() < 10 ? '0' + today.getDate() : today.getDate();
        
        const week = ['일','월','화','수','목','금','토'];
        let day = week[today.getDay()];

        let hours = today.getHours();
        hours = hours > 13 ? hours-12 : hours;
        hours = hours < 10 ? '0'+hours : hours;

        const ampm = hours > 12 ? 'AM' : 'PM' ;
        const minutes = today.getMinutes() < 10 ? '0' + today.getMinutes() : today.getMinutes();
        const second = today.getSeconds() < 10 ? '0' + today.getSeconds() : today.getSeconds();

        const livetime = year + '-' + month + '-' + date + ' (' + day + ') ' + ampm + ' ' + hours + ':' + minutes + ':' + second;

        time.innerHTML = livetime;
    }
    </script>
</body>
</html>