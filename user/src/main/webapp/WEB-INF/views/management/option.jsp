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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

        .content_nav > div {
            float: left;
        }

        .content_title {
            width: 900px;
            font-size: 40px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bolder;
            margin-left: 6%;
            margin-top : 20px;
        }

        .btn1 {
            width: 150px;
            height: 56px;
            display: flex;
            margin-top : 20px;
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
            font-size: 13px;
        }

        button:hover {
            background-color: wheat;
        }

        .content {
            width: 100%;
            margin-top: 130px;
            height: 650px;
        }

        .option_table {
            width: 1700px;
            margin: 0 auto;
            border-bottom: 1px solid lightgray;
            border-spacing: 0px;
        }

        td {
            text-align: center;
            height: 45px;
            border-bottom: 1px solid lightgray;
        }

        th {
            height: 50px;
            background-color: lightgrey;
            font-size: 20px;
            text-align: center;
        }

         /* 모달 스타일 */
         .modal {
            display: block;
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
            margin: 14% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            height: 460px;
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

        .modal_header {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .modal_content {
            margin-top: 10px;
        }

        .modal_content div{
            text-align: left;
            margin-bottom: 10px;
        }

        .modal_content input[type=text], select {
            height: 30px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid lightgray;
            padding-left: 5px;
        }

        .closeModal {
            position: absolute;
            right: 10%;
            color:#FF8B3D
        }

        .closeModal:hover {
            cursor: pointer;
        }

        .insertbtn, .updatebtn {
            width: 350px;
            height: 40px;
            margin-top: 20px;
        }

        select {
            height: 30px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid lightgray;
            padding-left: 5px;
        }
        
        .delete-btn {
        	height: 30px;
        	background-color: gray;
        }
        
        .delete-btn:hover {
        	background-color: lightgray;
        }

		.pagination{
			justify-content: center;
		}

    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- content 시작 -->
    <div class="content_outer">
        <div class="content_nav">
            <div class="content_title">옵션 관리</div>
            <div class="btn1"><button onClick="location.href='${contextPath}/license'">결제</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
            <div class="btn1"><button onclick="" class="insertOption">옵션 등록</button></div>
        </div>
        <hr>
        <div class="content">
            <div class="table_outer">
                <table class="option_table">
                    <thead>
                        <tr>
                            <th style="width:8%;">옵션 번호</th>
                            <th style="width:20%;">옵션 이름</th>
                            <th style="width:10%;">가격</th>
                            <th style="width:10%;">상위 옵션 번호</th>
                            <th style="width:10%;">수정</th>
                            <th style="width:10%;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty list}">
                    		<td colspan="6">옵션 리스트가 없습니다.</td>
                    	</c:if>
                    	<c:forEach var="option" items="${list }">
						<tr>
							<td>${option.optionNo }</td>
							<td>${option.optionName }</td>
							<td>${option.price }원</td>
							<td>${option.prOptionNo }</td>
							<td><button class="update-btn updateOption" type="button" onClick="openModal2(${option.optionNo})">수정</button></td>
							<td>
								<form method="post" action="${contextPath}/deleteOption/${option.optionNo}">
                					<button class="delete-btn" type="submit">삭제</button>
            					</form>
            				</td>
						</tr>
						</c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
        
        <c:set var="url" value="option?currentPage="/>
        
        <c:if test="${not empty param.condition }">
			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
		</c:if>
        
		<div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage - 1}${sUrl}">Previous</a></li>
					</c:otherwise>
				</c:choose>
	
				<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
					<li class="page-item"><a class="page-link" href="${url}${item}${sUrl}">${item}</a></li>
				</c:forEach>
	
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="page-link" href="#">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage + 1}${sUrl}">next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
        
    </div>

    <br><br><br><br>

    <!-- 옵션 수정 모달 -->
    <div id="updateOptionModal" class="modal" style="display: none;">
        <div class="modal-content">
            <div class="modal_header">옵션 수정 <span class="closeModal" onclick="closeModal2();">X</span></div>
            <hr>
            <div class="modal_content">
                <div class="coo_name">옵션 이름</div>
                <div><input type="text" name="optionName" id="optionName" placeholder="옵션 이름을 입력하세요"></div>
                <div>가격</div>
                <div><input type="text" name="price" id="price" placeholder="가격을 입력하세요"></div>
                <div>상위 옵션</div>
                <div>
                    <select name="prOptionNo" id="prOptionNo">
                    </select>
                </div>
            </div>
            <button class="updatebtn" onclick="closeModal()">수정</button>
        </div>
    </div>

    <!-- 옵션 등록 모달 -->
    <div id="insertOptionModal" class="modal" style="display: none;">
    	<form action="${contextPath }/insertOption" method="get">
        <div class="modal-content">
            <div class="modal_header">옵션 등록 <span class="closeModal" onclick="closeModal();">X</span></div>
            <hr>
            <div class="modal_content">
                <div class="coo_name">옵션 이름</div>
                <div><input type="text" name="optionName" placeholder="옵션 이름을 입력하세요"></div>
                <div>가격</div>
                <div><input type="text" name="price" placeholder="가격을 입력하세요"></div>
                <div>상위 옵션</div>
                <div>
                    <select name="prOptionNo" id="menuOption">
                    </select>
                </div>
            </div>
            <button type="submit" class="insertbtn" onclick="closeModal()">등록</button>
        </div>
        </form>
    </div>

    <script>
        const updateOption = document.querySelector('.updateOption');
        const insertOption = document.querySelector('.insertOption');
        const insertOptionModal = document.getElementById('insertOptionModal');
        const updateOptionModal = document.getElementById('updateOptionModal');

        function openModal() {
            insertOptionModal.style.display = 'block';
            
            $.ajax({
    			url : "${contextPath}/selectOptionList",
    			method : "GET",
    			success : function(data) {
    				let str1 = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < data.length; i++) {
    					if(data[i].prOptionNo == 0) {
	    					str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
    					}
    				}
    				$("#menuOption").html(str1);
    			}
    		})
        }

        function closeModal() {
            insertOptionModal.style.display = 'none';
        }

        function openModal2(optionNo) {
            updateOptionModal.style.display = 'block';
            
            $.ajax({
                url: "${contextPath}/selectOptionList",
                method: "GET",
                success: function(data) {
                    let str1 = "<option value=" + 0 + ">없음</option>";
                    for (let i = 0; i < data.length; i++) {
                        if (data[i].prOptionNo == 0) {
                            str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
                        }
                    }
                    $("#prOptionNo").html(str1);
                    
                    $.ajax({
                        url: "${contextPath}/selectOption",
                        method: "post",
                        data: { optionNo: optionNo },
                        success: function(result) {
                            $("#optionName").val(result.optionName);
                            $("#price").val(result.price);
                            
                            // 옵션 select 요소 설정
                            let prOptionNo = parseInt(result.prOptionNo); // 문자열을 숫자로 변환
                            $("#prOptionNo option").each(function() {
                                if (parseInt($(this).val()) === prOptionNo) {
                                    $(this).prop("selected", true);
                                } else {
                                    $(this).prop("selected", false);
                                }
                            });
                        }
                    });
                }
            });

            
        }

        function closeModal2() {
            updateOptionModal.style.display = 'none';
        }

        insertOption.addEventListener('click', openModal);
        updateOption.addEventListener('click', openModal2);

        window.addEventListener('click', (event) => {
            if (event.target === insertOptionModal || event.target === updateOptionModal) {
                closeModal();
            }
        });
    </script>

</body>
</html>