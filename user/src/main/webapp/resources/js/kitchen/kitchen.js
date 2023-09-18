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

function test(){

const kno = 2;
let rlist = [ 1, 2, 3 ];

}


function socketst() {
	var sock = new SockJS("http://192.168.30.14:8083/kiosk/user");
	var client = Stomp.over(sock);
	socket = client;
	
	client.connect({}, function() {
		console.log("Connected stompTest!");
		
		client.subscribe('/kiosk/${kno}', function(event){
			console.log(event);
			
			try {
			    const data = JSON.parse(event.body); // JSON 형식의 문자열을 파싱하여 객체로 변환
			    console.log(data.receiptNoList);
			    let rlist = data.receiptNoList;
			    
				$.ajax({
					url : "kitchen/newOrder/"+kno,
					data : { receiptNoList : rlist },
					type : "POST",
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