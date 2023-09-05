<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="resources/css/chart/statistics.css">
<link rel="stylesheet" href="resources/css/adminLee.css">

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="outer">
        <div class="chart_content">
            <div class="statistics-bar">
            	<div class="aggregation-period">
	                <div class="gray-bar">
	                    <div class="choice-title-btn">집계기간</div>
	                    <div class="between-day">
	                        <input type="date" name="start-day" id="start-day" value="2022-08-21" /> 부터
	                        <input type="date" name="end-day" id="end-day" value="2023-08-22" /> 까지
	                    </div>
	                </div>
	                <div class="choice-btn" id="date-yesterday" onclick="changeDate('yesterday')">전일</div>
	                <div class="choice-btn" id="date-current-month" onclick="changeDate('curretnMonth')">당월</div>
	                <div class="choice-btn" id="date-previous-month" onclick="changeDate('previousMonth')">전월</div>
           		</div>

	            <div class="sales-statistics">
	                <div class="gray-bar">
	                    <div class="choice-title-btn">종류</div>
	                    <div class="choice-type-title">매출통계</div>
	                </div>
	                <div class="choice-btn" onclick="changeType('매출')">매출</div>
	                <div class="choice-btn" onclick="changeType('메뉴')">메뉴</div>
	            </div>
            </div>
        
        <div class="statistics-content">
         	<div id="chart-outer">
				<canvas id="chart-area" />
			</div>
        </div>
            
        </div>
        

    </div>

<script type="text/javascript" src="resources/js/chart/statistics.js"></script>

</body>
</html>