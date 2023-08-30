<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>회원가입 입력</title>
    <style>
        
        * {
            /* border: 1px solid red; */
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background-color: #eee;
            height: 800px;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to top, #fff 10%, #FF8B3D 60%) no-repeat;
        }

        .wrapper {
            max-width: 580px;
            border-radius: 10px;
            margin: 160px auto;
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

        table {
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        th {
            width: 200px;
            text-align: left;
        }

        td{
            width: 100px;
        }

        input[type="text"],  input[type="password"]{
            border: 1px solid black;
            border-radius: 4px;
            width: 310px;
            height: 30px;
        }
        
        input[type="button"] {
            width: 80px;
            border: none;
            border-radius: 4px;
            background-color: #FF8B3D;
            color: white;
            margin-left: 5px;
            height: 30px;
            cursor: pointer;
            font-size: 16px;
            line-height: 30px;
        }

        input[type="button"]:hover{
            background-color: wheat;
        }

        label {
            color: white;
            background-color: #FF8B3D;
            width: 80px;
            height: 30px;
            border: none;
            cursor: pointer;
            display: block;
            border-radius: 3px;
            text-align: center;
            line-height: 30px;
        }

        #file-upload-button {
            width: 1000px;
        }

        tr {
            height: 30px;
        }

        button {
            text-align: center;
            margin-top: 30px;
            width: 420px;
            height: 40px;
            border: none;
            border-radius: 4px;
            background-color: #FF8B3D;
            color: white;
            font-weight: bolder;
            font-size: medium;
            cursor: pointer;
            margin-left: 40px;
        }

        button:hover {
            background-color: wheat;
        }
        
        label:hover {
            background-color: wheat;
        }

         /* 모달 스타일 */
         .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            overflow: auto;
        }

        .modal-content {
            background-color: white;
            margin: 17% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            height: 120px;
            border-radius: 5px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .close-button {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-button:hover,
        .close-button:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .checkbutton {
            width: 350px;
            margin: 20px auto
        }

    </style>
</head>

<body class='snippet-body'>
    <div class="wrapper bg-white">
        <div class="h2 text-center"><h2>회원가입</h2></div>
        <form class="pt-3" action="${contextPath }/enroll" method="POST" enctype="multipart/form-data">
            <table>
                <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="memberId" class="userId" style="width: 220px;" placeholder=" 아이디를 입력하세요"></td>
                        <td><input type="button" value="중복확인" class="idCheckButton"></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td colspan="2"><input type="password" name="memberPwd" class="userPwd" placeholder=" 비밀번호를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td colspan="2"><input type="password" name="checkPwd" class="checkPwd" placeholder=" 비밀번호를 다시 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>사업자명</th>
                        <td colspan="2"><input type="text" name="memberName" class="businessName" placeholder=" 사업자명을 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>사업자등록증 번호</th>
                        <td colspan="2"><input type="text" name="fileNo" class="businessNo" placeholder=" 사업자등록증 번호를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>사업자등록증</th>
                        <td colspan="2"><label>파일등록<input type="file" name="file" class="businessFile" style="display:none" required></label></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="2"><input type="button" value="주소찾기" id="searchAddress" style="margin-left: 0px;"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2"><input type="text" name="addressOne" id="addressOne" placeholder=" 주소를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2"><input type="text" id="addressDetail" name="addressDetail" placeholder=" 상세주소를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td colspan="2"><input type="text" name="phone" class="phone" placeholder=" 전화번호를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2"><input type="text" name="email" class="email" placeholder=" 이메일을 입력하세요"></td>
                    </tr>
                </tbody>
            </table>
            <div class="nextpage">
                <button type="submit">회원가입</button>
            </div>
        </form>
    </div>

    <!-- 중복확인 모달 -->
    <div id="idCheckModal" class="modal" style="display: none;">
        <div class="modal-content">
            사용 가능한 아이디입니다.
            <button class="checkbutton" onclick="closeModal()">확인</button>
        </div>
    </div>

    <script>
        const idCheckButton = document.querySelector('.idCheckButton');
        const idCheckModal = document.getElementById('idCheckModal');

        function openModal() {
            idCheckModal.style.display = 'block';
        }

        function closeModal() {
            idCheckModal.style.display = 'none';
        }

        idCheckButton.addEventListener('click', openModal);

        window.addEventListener('click', (event) => {
            if (event.target === idCheckModal) {
                closeModal();
            }
        });
    </script>

    <!-- 주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = function(){
            document.getElementById("searchAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면 카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                        document.getElementById("addressOne").value = data.address; // 주소 넣기
                        document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
        </script>
</body>

</html>