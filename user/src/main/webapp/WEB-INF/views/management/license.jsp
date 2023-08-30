<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옵션 관리</title>
    <link rel="stylesheet" href="css/header.css">
    <style>
        * {
            /* border: 1px solid red; */
            box-sizing: border-box;
        }

        .content_outer {
            width: 100%;
            height: 100px;
            margin-top: 80px;
        }

        .content_nav>div {
            float: left;
            margin-top: -30px;
        }

        .content_title {
            width: 1100px;
            font-size: 40px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bolder;
            margin-left: 5%;
            margin-top : 20px;
            margin-bottom: 40px;
        }

        .btn1 {
            width: 150px;
            height: 56px;
            display: flex;
            margin-top: 20px;
        }

        button {
            width: 80%;
            height: 70%;
            border-radius: 5px;
            margin: auto auto;
            cursor: pointer;
            background-color: #FF8B3D;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bolder;
            border: none;
        }

        button:hover {
            background-color: wheat;
        }

        .content {
            width: 100%;
            margin-top: 130px;
            height: 650px;
        }

        .license_table {
            width: 1700px;
            margin: 0 auto;
            border-spacing: 0px;
        }

        th {
            text-align: left;
            padding-left: 15px;
            height: 100px;
            font-size: 40px;
            border-bottom: 1px solid lightgray;
        }

        .license_table tbody tr td:first-child {
            padding-left: 40px;
            width: 700px;
            color: #FF8B3D;
        }

        td {
            font-size: 20px;
            height: 70px;
            border-bottom: 1px solid lightgray;
        }

        input[type=button] {
            margin: auto auto;
            width: 150px;
            height: 40px;
            border-radius: 5px;
            background-color: #FF8B3D;
            color: white;
            font-weight: bold;
            border: none;
        }

        input[type=button]:hover {
            cursor: pointer;
            background-color: wheat;
        }
        
        .pay {
        	width: 150px;
        	font-size: 16px;
        	height: 40px;
        }

    </style>
</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- content 시작 -->
    <div class="content_outer">
        <div class="content_nav">
            <div class="content_title">이용권 결제</div>
            <div class="btn1"><button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/option'">옵션 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
        </div>
        <div class="content">
            <table class="license_table">
                <thead>
                    <tr>
                        <th colspan="3">연간 이용권</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2년 이용권</td>
                        <td>900,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay()">결제<div id="amount" style="display:none;">900000</div></button></td>
                    </tr>
                    <tr>
                        <td>1년 이용권</td>
                        <td>550,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay()">결제<div id="amount" style="display:none;">550000</div></button></td>
                    </tr>
                </tbody>
            </table>
            <br><br><br>
            <table class="license_table">
                <thead>
                    <tr>
                        <th colspan="3">월간 이용권</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>9개월 이용권</td>
                        <td>450,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay()">결제<div id="amount" style="display:none;">450000</div></button></td>
                    </tr>
                    <tr>
                        <td>6개월 이용권</td>
                        <td>300,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay()">결제<div id="amount" style="display:none;">300000</div></button></td>
                    </tr>
                    <tr>
                        <td>3개월 이용권</td>
                        <td>150,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay()">결제<div id="amount" style="display:none;">150000</div></button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <br><br><br><br>
    
     <!-- 결제API -->
    <!-- <script src="payAPI.js"></script> -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script>
    var IMP = window.IMP; 
    IMP.init("imp06580330"); 
  
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds() * 3;
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function requestPay() {   
        IMP.request_pay({
            pg : "html5_inicis",
            pay_method : 'card',
            merchant_uid: "IMP"+hours+minutes+seconds+makeMerchantUid+makeMerchantUid*2+makeMerchantUid*3, 
            name : '이용', // 상품명
            amount : document.getElementById("amount").innerHTML,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456',
            custom_data: today,
            display: {
                card_quota: [3]  // 할부개월 3개월까지 활성화
            }
        }, function (rsp) { // callback
            if (rsp.success) {
                
			console.log("야호");       	
              
        };
    })}
</script>

</body>

</html>