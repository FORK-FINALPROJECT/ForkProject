$(document).ready(function() {

	let orderList = document.querySelectorAll('.order-page');
	
	orderList.forEach( (order) => {
	    const list = order.lastElementChild.children;
	    let cnt = 0;
	
	    for( let value of list ){
	        value.addEventListener('click',function(){
	            if ( this.style.textDecoration != 'line-through' ) cnt++;
	            this.style.textDecoration = 'line-through';
	
	            if (cnt==list.length) {
	                order.remove();
	            }
	        })
	    }
	})



// socket
// var socket = null;
// socketst();

});

function socketst() {
	var sock = new SockJS("http://192.168.130.18:8083/kiosk/user");
	var client = Stomp.over(sock);
	socket = client;
	
	client.connect({}, function() {
		console.log("Connected stompTest!");
		
		client.subscribe('/kiosk/3', function(event){
			console.log(event);
			
			try {
			    const data = JSON.parse(event.body); // JSON 형식의 문자열을 파싱하여 객체로 변환
			    console.log(data.receiptNo); // kioskNo 값을 출력
			    
				$.ajax({
					url : "kitchen/newOrder",
					data : {rno : data.receiptNo},
					success(newOrder) {
						let orderPage = "";
						let orderList = "";
						let optionName = "";
						
						for(menu of newOrder.menuOption) {
							if ( menu.optionName != null ) {
								optionName = "( " + menu.optionName + " )" 
							}
						
							orderList += `<li>${menu.cnt} x ${menu.menuName} ${optionName}</li>`
						}
						
						orderPage = `<div class="order-page">
										<div class="order-page-top">${newOrder.strucTitle} ${newOrder.payDate}</div>
										<div class="order-page-content">
											${orderList}
										</div>
									</div>`
						$(".outer").children().first().before(orderPage);
					} 
				});
			    
			  } catch (error) {
			    console.error('JSON 파싱 오류:', error);
			  }
			
		});
		
	});
}