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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	margin-top: 30px;
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
.top-menu{
	height: 50px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bolder;
	font-size: 20px;
	padding-left: 10px;
	background-color: rgb(50, 50, 50);
	color: white; 
	width: 1500px;
	margin: 0 auto; 
	line-height: 50px;
}
.menu_img>img{
	width: 100%;
	

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
		
	</div>

	<div class="content">
		<!-- 메뉴가 들어가는 곳 -->
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


	// 메뉴 리스트 불러오기
	const content = document.querySelector(".content");
	
		$.ajax({
			// 전체 카테고리 불러오기
			url : "${contextPath}/category",
			type : "POST",
			success(category){
				// 카테고리 로드 성공시 전체 메뉴 불러오기
				$.ajax({
					url : "${contextPath}/menu",
					type : "POST",
					async: false,
					success(menus){
						
						// 상위 카테고리 시작점  
						for (prCate of category){
							let topMenu = ""; // 상위 카테고리 이름이 들어갈 영역
							let table = ""; // 메뉴 리스트 들어갈 영역
							
							// 카테고리 번호가 0일 경우 상위 카테고리
							if ( prCate.prCategoryNo === 0 ) {
								
								// 제목에 상위 카테고리 이름 뿌려줌
								topMenu = `<div class="top-menu" onclick='topMenuClick(this);'>\${prCate.categoryName}</div>`;
								
								// 카테고리 메뉴 시작점
								table += `<div class="table_outer">`
								
								// 전체 카테고리 리스트 중 카테고리 번호와 상위 카테고리 번호가 일치할시 같은 카테고리로 분류
								for (c of category){
									if ( prCate.categoryNo === c.prCategoryNo) {
										
										table += `<table class="menuTable">`;
										
										table += `<thead>
										    <tr>
									            <th colspan="5" style="background-color: gray">\${c.categoryName}</th>
									        </tr>
									       </thead>`;
										
										table += `<tbody>`;
										
										// 전체 메뉴들 중 현재 카테고리 번호와 메뉴의 카테고리 번호가 일치하는 것들을 필터
										let menu = menus.filter( (menu) =>  {
											if ( c.categoryNo == menu.categoryNo) {
													return menu;
												}
											}
										)
										
										// 메뉴 순차적으로 반복 (1. 5의 배수)
										let index = 0; // 배열의 숫자를 담아줄 변수 index
										
			 							for ( i=0; i<(Math.floor(menu.length/5)); i++) {
			 								table += `<tr>`;
			 								for ( j=0; j<5; j++ ) {
			 									table += `<td class="footer-text menu_img" onclick="openModal3(\${menu[index].menuNo})"><img src='http://localhost:8083/kiosk\${menu[index].filePath}\${menu[index].changeName}' /><br>\${menu[index].menuName}</td>`;
			 									index++;
			 								}
											table += `</tr>`;
										}
										
										// 메뉴 순차적으로 반복 (2. 5의 배수 나머지 [0~4개])
			 							
			 							if ( (Math.round(menu.length%5)) > 0 ) {
			 								table += `<tr>`;
			 								for ( i=0; i<(Math.round(menu.length%5)); i++ ) {
			 									table += `<td class="footer-text menu_img" onclick="openModal3(\${menu[index].menuNo})	"><img src='http://localhost:8083/kiosk\${menu[index].filePath}\${menu[index].changeName}' /><br>\${menu[index].menuName}</td>`;
			 									index++;
			 								}
			 	 							for ( i=0; i<5-(Math.floor(menu.length%5)); i++ ) {
			 									table += `<td class="footer-text">-</td>`;
			 								} 
			 	 							table += `</tr>`;
			 							} 
									}
								}
								table += `</div>`
							}
							// 카테고리 메뉴 종료
							
							// content영역에 상위 카테고리 제목과 카테고리 리스트 넣어줌
							$(content).append(topMenu);
							$(content).append(table);
							
						}
						// 상위 카테고리 종료
					}
				})
			}
		})
		
		// 상위 카테고리 클릭시 하위 카테고리 슬라이드 토글
		function topMenuClick(title){
			$(title).next().slideToggle();	
		}
	
	
	
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
        function openModal3(menuNo) {
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
        
        $("#header-menu").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>

</html>
