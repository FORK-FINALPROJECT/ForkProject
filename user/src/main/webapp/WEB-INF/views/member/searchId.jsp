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
                        <td><input type="text" class="userName" placeholder=" 사업자명을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th><h3>전화번호</h3></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="phone" placeholder=" 전화번호를 입력해주세요"></td>
                    </tr>
                </tbody>
            </table>
            <div class="nextpage">
                <button type="submit">아이디 찾기</button>
            </div>
        </form>
    </div>
</body>

</html>