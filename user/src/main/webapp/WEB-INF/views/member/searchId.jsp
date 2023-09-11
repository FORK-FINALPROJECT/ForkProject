<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>아이디 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    <style>

        
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background-color: #eee;
            height: 700px;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to top, #fff 10%, #FF8B3D 60%) no-repeat;
            overflow: hidden;
        }

        .wrapper {
            max-width: 400px;
            border-radius: 10px;
            margin: 230px auto;
            padding: 30px 40px;
            background-color: white;
        }

        .h2 {
            font-style: normal;
            color: #FF8B3D;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bolder;
            text-align: center;
            margin-bottom: 20px;
        }

        h3 {
            font-style: normal;
            color: #FF8B3D;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bolder;
        }

        table {
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        th {
            width: 314px;
            text-align: center;
        }

        td{
            width: 100px;
        }
        
        tr {
            height: 50px;
        }

        input[type="text"] {
            border: 1px solid black;
            border-radius: 4px;
            width: 310px;
            height: 40px;
            font-size: 13px;
            padding-left: 10px;
        }

        button {
            text-align: center;
            margin-top: 30px;
            width: 314px;
            height: 40px;
            border: 1px solid #FF8B3D;
            border-radius: 4px;
            background-color: #FF8B3D;
            color: white;
            font-weight: bolder;
            font-size: medium;
            cursor: pointer;
        }
        
        	/* 모달 배경 */
        .modal-background {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        /* 모달 창 */
        .modal {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
        }

        /* 모달 내용 */
        .modal-content {
            margin-bottom: 20px;
        }

        /* 모달 확인 버튼 */
        .modal-button {
            background-color: #FF8B3D;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>

<body class='snippet-body'>
    <div class="wrapper bg-white">
        <div class="h2 text-center"><h2>아이디 찾기</h2></div>
        <hr>
        <form class="pt-3">
            <table>
                <tbody>
                    <tr>
                        <th><h3>사업자명</h3></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="memberName" name="memberName" placeholder="사업자명을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th><h3>전화번호</h3></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="phone" name="phone" placeholder="전화번호를 입력해주세요"></td>
                    </tr>
                </tbody>
            </table>
           <div class="nextpage">
               <button id="openModalButton" type="button">아이디 찾기</button>
           </div>
        </form>
    </div>
    
	 <!-- 모달 배경과 내용 -->
    <div class="modal-background" id="modalBackground">
        <div class="modal">
            <div class="modal-content"></div>
            <button class="modal-button" id="closeModalButton">확인</button>
        </div>
    </div>

    <script>
        // 모달 열기 버튼 클릭 이벤트
        document.getElementById('openModalButton').addEventListener('click', function() {
		    document.getElementById('modalBackground').style.display = 'flex';
		    
		    var memberName = document.querySelector('.memberName').value;
		    var phone = document.querySelector('.phone').value;
		    
		    $.ajax({
		        url: "${contextPath}/searchId",
		        method: "post",
		        data: {
		            memberName: memberName,
		            phone: phone
		        },
		        success: function(response) {
		        	if(response.memberName != undefined) {
			            var html = response.memberName + "님의 아이디는 " + response.memberId + "입니다.";
			            $(".modal-content").html(html);
			            
			            // '확인' 버튼 클릭 이벤트
	                    document.getElementById('closeModalButton').addEventListener('click', function() {
	                        location.href="${contextPath}/login.jsp";
	                    });
			            
		        	} else {
		        		var html1 = "사업자명 또는 전화번호를 잘못입력하셨습니다. <br> 다시 입력해주세요";
			            $(".modal-content").html(html1);
			            
			            document.getElementById('closeModalButton').addEventListener('click', function() {
			            	document.querySelector('.memberName').value = ""; // 입력 필드 비우기
	                        document.querySelector('.phone').value = ""; 
	                    });
		        	}
		        }
		    });
		});

        // 모달 닫기 버튼 클릭 이벤트
        document.getElementById('closeModalButton').addEventListener('click', function() {
            document.getElementById('modalBackground').style.display = 'none';
        });
    </script>
    
</body>

</html>