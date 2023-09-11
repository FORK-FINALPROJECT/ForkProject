<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/common/header.css">
</head>
<body>


   <div class="header_outer">
        <div class="header">
            <div class="header_btn" onclick="location.href='main'">HOME</div>
            <div class="header_btn" onclick="location.href='salesReady'" id="sales-ready">영업준비</div>
            <div class="header_btn" onclick="location.href='statistics'" id="statistics">판매집계</div>
            <div class="header_btn" onclick="location.href='menu'" id="header-menu">메뉴</div>
            <div class="header_btn" onclick="location.href='license'" id="header-license">결제</div>
            <div class="header_btn">문의</div>
            <div id="time"></div>
            <div class="forklogo">
                <img src="resources/img/fork2.png" width="100px" />
            </div>
        </div>
    </div>
    <script type="text/javascript" src="resources/js/common/header.js"></script>
</body>
</html>