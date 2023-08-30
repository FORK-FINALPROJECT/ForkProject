<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 관리</title>
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
}

.content_title {
	width: 900px;
	font-size: 40px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bolder;
	margin-left: 6%;
	margin-top: 20px;
}

.btn1 {
	width: 150px;
	height: 56px;
	display: flex;
	margin-top: 20px;
}

button {
	width: 80%;
	height: 40px;
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
}

table * {
	border: 1px solid lightgray;
}

.menuTable {
	width: 1500px;
	height: 50px;
	margin: 0 auto;
	text-align: left;
}

.menuTable td.menu_img:hover {
	cursor: pointer;
}

th {
	height: 50px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bolder;
	font-size: 20px;
	padding-left: 10px;
	background-color: rgb(50, 50, 50);
	color: white;
}

td {
	height: 300px;
	width: 20%;
}

.footer-text {
	height: 20px;
	text-align: center;
	max-width: 300px;
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
	margin: 7% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 450px;
	height: 730px;
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

.close-button:hover, .close-button:focus {
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

.modal_content div {
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
	font-size: 15px;
}

textarea {
	resize: none;
	width: 100%;
	height: 100px;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 5px;
}

.closeModal {
	position: absolute;
	right: 40.5%;
	color: #FF8B3D;
}

.closeModal2 {
	position: absolute;
	right: 33%;
	color: #FF8B3D;
}

.closeModal:hover, .closeModal2:hover {
	cursor: pointer;
}

.modal-content-detail {
	background-color: white;
	margin: 13% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 710px;
	height: 400px;
	border-radius: 5px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.updatebutton, .deletebutton {
	width: 150px;
	margin-right: 30px;
	margin-top: 20px;
}

.menu-detail {
	margin-bottom: 40px;
}

.menu-detail>* {
	float: left;
}

.menu_detail_table {
	width: 300px;
	margin-left: 30px;
}

.menu_detail_table * {
	border: none;
}

.menu_detail_table th {
	text-align: left;
	font-size: 24px;
	padding-left: 0;
	background-color: white;
	color: black;
}

.menu_detail_table td {
	height: 40px;
	font-size: 13px;
	text-align: left;
	font-weight: normal;
}

.menu_detail_img {
	width: 300px;
	height: 300px;
}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- content 시작 -->
	<div class="content_outer">
		<div class="content_nav">
			<div class="content_title">메뉴 관리</div>
			<div class="btn1">
				<button onClick="location.href='${contextPath}/license'">결제</button>
			</div>
			<div class="btn1">
				<button onClick="location.href='${contextPath}/coo'">원산지 관리</button>
			</div>
			<div class="btn1">
				<button onClick="location.href='${contextPath}/category'">카테고리
					관리</button>
			</div>
			<div class="btn1">
				<button onClick="location.href='${contextPath}/option'">옵션
					관리</button>
			</div>
			<div class="btn1">
				<button onclick="insertMenu1()" class="insertMenu">메뉴 등록</button>
			</div>
		</div>
		<hr>
		<div class="content">
			<div class="table_outer">
				<c:forEach var="category" items="${clist }">
					<c:if test="${category.prCategoryNo ne 0 }">
					<c:forEach var="m" items="${list }">
						<c:if test="${category.categoryNo eq m.categoryNo }">
							<c:set var="count" value="${count+1 }"/>
						</c:if>					
					</c:forEach>
					<table class="menuTable">
                    <thead>
                        <tr>
                        <c:if test="${category.prCategoryNo ne 0 }">
                            <th colspan="5">${category.categoryName}</th>
                        </c:if>
                        </tr>
                    </thead>
                    <tbody>
					<%-- <tr>
						<c:if test="${count eq 5 }">
							<c:forEach var="menu" items="${list }">
								<c:if test="${category.categoryNo eq menu.categoryNo }">
									<td class="menu_img">${menu.menuNo }<br> <span class="footer-text">${menu.menuName }</span></td>
								</c:if>	
							</c:forEach>
						</c:if>
						<c:if test="${count > 5 }">
							<c:forEach var="menu" items="${list }" end="${count}">
								<c:if test="${category.categoryNo eq menu.categoryNo }">
									<td class="menu_img">${menu.menuNo }<br> <span class="footer-text">${menu.menuName }</span></td>
								</c:if>	
							</c:forEach>
							<c:forEach var="empty" begin="1" end="${5 - count}">
								<td class="menu_img">X<br> <span class="footer-text">-</span></td>
							</c:forEach>
						</c:if>
						</tr> --%>
					</tbody>
                </table>
                </c:if>
				</c:forEach>
				
				
			
				<!-- <table class="menuTable">
                    <thead>
                        <tr>
                            <th colspan="5">카테고리 1</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                        </tr>
                        <tr>
                            <td class="footer-text">상품1</td>
                            <td class="footer-text">상품2</td>
                            <td class="footer-text">상품3</td>
                            <td class="footer-text">상품4</td>
                            <td class="footer-text">상품5</td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <table class="menuTable">
                    <thead>
                        <tr>
                            <th colspan="5">카테고리 1</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                        </tr>
                        <tr>
                            <td class="footer-text">상품1</td>
                            <td class="footer-text">상품2</td>
                            <td class="footer-text">상품3</td>
                            <td class="footer-text">상품4</td>
                            <td class="footer-text">상품5</td>
                        </tr>
                        <tr>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                            <td class="menu_img"></td>
                        </tr>
                        <tr>
                            <td class="footer-text">상품1</td>
                            <td class="footer-text">상품2</td>
                            <td class="footer-text">상품3</td>
                            <td class="footer-text">상품4</td>
                            <td class="footer-text">상품5</td>
                        </tr>
                    </tbody>
                </table> -->
				<br> 
				<br>
				<br>
				<br>
			</div>
		</div>
	</div>

	<!-- 메뉴 등록 모달 -->
	<div id="insertMenuModal" class="modal" style="display: none">
		<div class="modal-content">
			<form action="${contextPath }/insertMenu" method="post"
				enctype="multipart/form-data">
				<div class="modal_header">
					메뉴 등록 <span class="closeModal" onclick="closeModal();">X</span>
				</div>
				<hr>
				<div class="modal_content">
					<div class="menu_name">메뉴 이름</div>
					<div>
						<input type="text" name="menuName" placeholder="메뉴 이름을 입력하세요">
					</div>
					<div>가격</div>
					<div>
						<input type="text" name="price" placeholder="가격을 입력하세요">
					</div>
					<div>옵션</div>
					<div>
						<select name="menuOption" id="menuOption">
						</select>
					</div>
					<div>카테고리</div>
					<div>
						<select name="categoryNo" id="categoryNo">
						</select>
					</div>
					<div>메뉴 이미지</div>
					<div>
						<label>파일 선택<input type="file" name="file"
							style="display: none;"></label>
					</div>
					<div>메뉴 상세정보</div>
					<div>
						<textarea name="menuDetail" placeholder="메뉴 상세정보를 입력하세요"></textarea>
					</div>
				</div>
				<button class="checkbutton" onclick="closeModal()">등록</button>
			</form>
		</div>
	</div>

	<!-- 메뉴 수정 모달 -->
	<div id="updateMenuModal" class="modal" style="display: none">
		<form action="${contextPath }/updateMenu" method="post">
			<div class="modal-content">
				<div class="modal_header">
					메뉴 수정<span class="closeModal" onclick="closeModal2();">X</span>
				</div>
				<hr>
				<div class="modal_content">
					<div class="menu_name">메뉴 이름</div>
					<div>
						<input type="text" placeholder="메뉴 이름을 입력하세요">
					</div>
					<div>가격</div>
					<div>
						<input type="text" placeholder="가격을 입력하세요">
					</div>
					<div>옵션</div>
					<div>
						<select name="menuOption" id="menuOption2">
						</select>
					</div>
					<div>카테고리</div>
					<div>
						<select name="categoryNo" id="categoryNo2">
						</select>
					</div>
					<div>메뉴 이미지</div>
					<div>
						<label>파일 선택<input type="file" style="display: none;"></label>
					</div>
					<div>메뉴 상세정보</div>
					<div>
						<textarea placeholder="메뉴 상세정보를 입력하세요"></textarea>
					</div>
				</div>
				<button class="checkbutton" onclick="closeModal3()">확인</button>
			</div>
		</form>
	</div>

	<!-- 메뉴 상세정보 모달 -->
	<div id="menuDetailModal" class="modal" style="display: none">
		<div class="modal-content-detail">
			<div class="modal_content menu-detail">
				<div>
					<img class="menu_detail_img">
				</div>
				<table class="menu_detail_table">
					<thead>
						<tr>
							<th colspan="2">메뉴 이름</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-weight: bolder; width: 100px;">가격</td>
							<td>10,000원</td>
						</tr>
						<tr>
							<td style="font-weight: bolder;">카테고리</td>
							<td>카테고리</td>
						</tr>
						<tr>
							<td style="font-weight: bolder;">옵션</td>
							<td>옵션1, 옵션2, 옵션3</td>
						</tr>
						<tr>
							<td colspan="2" style="font-weight: bolder;">상세정보</td>
						</tr>
						<tr>
							<td colspan="2">상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보상세정보
							</td>
						</tr>
					</tbody>
				</table>
				<div class="closeModal2" onclick="closeModal3();">X</div>
			</div>
			<button class="updatebutton" onclick="openModal2()">수정</button>
			<button class="deletebutton" onclick="closeModal3()">삭제</button>
		</div>
	</div>

	<script>
    	// 메뉴 등록
    	function insertMenu1() {
    		
    		$.ajax({
    			url : "${contextPath}/selectCategoryList",
    			method : "GET",
    			success : function(result) {
    				let str = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < result.length; i++) {
    					str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
    				}	
    				$("#categoryNo").html(str);
    			}
    		});
    		
    		$.ajax({
    			url : "${contextPath}/selectOptionList",
    			method : "GET",
    			success : function(data) {
    				let str1 = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < data.length; i++) {
    					if(data[i].prOptionNo != 0) {
	    					str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
    					}
    				}
    				$("#menuOption").html(str1);
    			}
    		})
    	};
    
        const insertMenu = document.querySelector('.insertMenu');
        const insertMenuModal = document.getElementById('insertMenuModal');

        const updatebutton = document.querySelector('.updatebutton');
        const updateMenuModal = document.getElementById('updateMenuModal');

        const menu_img_elements = document.querySelectorAll('.menu_img');
        const menuDetailModal = document.getElementById('menuDetailModal');

        // 메뉴 등록 모달창
        function openModal() {
            insertMenuModal.style.display = 'block';
        }

        function closeModal() {
            insertMenuModal.style.display = 'none';
        }

        insertMenu.addEventListener('click', openModal);

        // 메뉴 수정 모달창
        function openModal2() {
            updateMenuModal.style.display = 'block';
            menuDetailModal.style.display = 'none';
            
            $.ajax({
    			url : "${contextPath}/selectCategoryList",
    			method : "GET",
    			success : function(result) {
    				let str = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < result.length; i++) {
    					str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
    				}	
    				$("#categoryNo2").html(str);
    			}
    		});
    		
    		$.ajax({
    			url : "${contextPath}/selectOptionList",
    			method : "GET",
    			success : function(data) {
    				let str1 = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < data.length; i++) {
    					if(data[i].prOptionNo != 0) {
	    					str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
    					}
    				}
    				$("#menuOption2").html(str1);
    			}
    		})
            
        }

        function closeModal2() {
            updateMenuModal.style.display = 'none';
        }

        updatebutton.addEventListener('click', openModal2);

        // 메뉴 상세정보 모달창
        function openModal3() {
            menuDetailModal.style.display = 'block';
            
            /* $.ajax({
            	url : "${contextPath}/selectMenu",
            	method : 'GET',
            	data : {menuNo : ${menuNo}},
            	success : function(data) {
            		
            	}
            }); */
        }

        function closeModal3() {
            menuDetailModal.style.display = 'none';
        }

        menu_img_elements.forEach((menu_img_element) => {
            menu_img_element.addEventListener('click', openModal3);
        });

        window.addEventListener('click', (event) => {
            if (event.target === insertMenuModal) {
                closeModal();
            }

            if (event.target === updateMenuModal) {
                closeModal2();
            }

            if (event.target === menuDetailModal) {
                closeModal3();
            }
        });
    </script>

</body>

</html>