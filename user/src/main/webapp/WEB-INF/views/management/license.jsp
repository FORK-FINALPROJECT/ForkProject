<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옵션 관리</title>
    <style>
        * {
            /* border: 1px solid red; */
            box-sizing: border-box;
        }

        .content_outer {
            width: 100%;
            height: 100px;
            margin-top: 6%;
        }

        .content_nav>div {
            float: left;
        }

        .content_title {
            width: 1100px;
            font-size: 40px;
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
            background-color: lightgray;
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
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay(900000)">결제</button></td>
                    </tr>
                    <tr>
                        <td>1년 이용권</td>
                        <td>550,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay(550000)">결제</button></td>
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
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay(450000)">결제</button></td>
                    </tr>
                    <tr>
                        <td>6개월 이용권</td>
                        <td>300,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay(300000)">결제</button></td>
                    </tr>
                    <tr>
                        <td>3개월 이용권</td>
                        <td>150,000 원</td>
                        <td style="width:300px"><button value="결제" class="pay" onclick="requestPay(100)">결제</button></td>
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <script>
    	$("#header-license").addClass("header_btn_on").removeClass("header_btn");
   	  
   	    var today = new Date();   
		    
		function requestPay(amount) {
			IMP.init("imp52171157"); 
	    	IMP.request_pay({
	    		pg : 'html5_inicis', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '이용권'/*상품명*/,
			    amount : amount/*상품 가격*/, 
			    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
			    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
			    buyer_postcode : '123-456'/*구매자 우편번호*/
		    }, function (rsp) { // callback
		        if (rsp.success) {
		        	$.ajax({
		        		url : "${contextPath}/insertLicense",
		        		method : "post",
		        		data : {
		        			memberNo : ${loginUser.getMemberNo()},
		        			licensePrice : amount
		        		},
		        		success : function(data) {
		        			console.log("결제 성공");
		        		}
		        	})
		        } else {
		            console.log("결제 실패: " + rsp.error_msg);
		        }
		    });
		}
</script>

</body>

</html>