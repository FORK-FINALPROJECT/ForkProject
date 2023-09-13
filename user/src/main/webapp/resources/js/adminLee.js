
$('.struc_table').click(function(e){
    $('#struc_detail').modal("show");
});

$(document).ready(function() {
	socketst();
	
	/*
	$('#btnSend').on('click', function(evt) {
		evt.preventDefault();
		if(!isStomp && socket.readyState !== 1) return;
			let msg = 1;
			console.log("mmmmmmmmm>>", msg);
			if(isStomp){
				socket.send('/TTT', {}, msg);
			} else {
				socket.send(msg);
			}
	
	});*/
});

var socket = null;
var isStomp = false;


function socketst() {
	var sock = new SockJS("http://192.168.130.18:8083/kiosk/user");
	var client = Stomp.over(sock);
	isStomp = true;
	socket = client;
	
	
	
	client.connect({}, function() {
		console.log("Connected stompTest!");
		
		client.send('/user/send/1', {}, 1);
		
		client.subscribe('/kiosk/3', function(event){
			console.log(event);
			
			try {
			    const data = JSON.parse(event.body); // JSON 형식의 문자열을 파싱하여 객체로 변환
			    console.log(data.kioskNo); // kioskNo 값을 출력
			    
			    
				if(data.price == null){
					
					$.ajax({
						url : "selectDetailMenu",
						data : {kioskNo : 3},
						success : function(result) {
							var html = "";
							var tprice = 0;
							for(let i = 0; i < result.length; i++) {
								html += `<div class="menu">
	                                        <div class="menu_title">${result[i].menuName}</div>
	                                        <div class="menu_cnt">${result[i].cnt}</div>
	                                    </div>`;
	                           	tprice += result[i].price;
							}
							
							html += `<div class="menu_price">
	                                	${tprice}원
	                            	 </div>`;
	                        
	                        console.log(html);
	                        
	                        $("#kiosk3>.struc_title").after(html); 
	                        $("#kiosk3").addClass("in_menu");
						} 
					});
				} else {
					alert(data.kioskNo + "번 테이블 현금결제 요망");
				}
			    
			  } catch (error) {
			    console.error('JSON 파싱 오류:', error);
			  }
			
			// console.log($("#kiosk"+3).val()); // 수정요망
			
		});
		
		// client.subscribe('/kiosk/2', function(event){
		// 	 console.log("glgl>>", event)
		// });
	
	});
}


function detail_order(title, no){
    $.ajax({
        url : 'detailOrder',
        data : { kioskNo : no },
        success(order){
        	console.log(order);
            if ( order.length > 0 ) {
                let menu = "";
                for( i in order ) {
                    menu += `
                    <div class="detail_menu">
                   	    <div class="menu detail_menu_title">${order[i].menuName}</div>
                   	    <div class="menu detail_menu_option">${order[i].optionName == null ? ' ' : order[i].optionName}</div>
                        <div class="menu detail_menu_cnt">${order[i].cnt}</div>
                        <div class="menu detail_menu_price">${order[i].price.toLocaleString()}</div>
                    </div>`;
                }
                $("#kiosk-no").val(no);
                $("#struc-title").html(title);
                $("#total-price").html($(order.totalPrice));
                $(".modal-body").html(menu);
                $("#struc_detail").modal("show");
            }
        }
    })
}

function saveStructure(){
    $.ajax({
        url : 'deleteStructure',
        success(result){
            if ( result > 0 ) {
                insertStructure();
                alert("수정되었습니다");
                location.href='salesReady';
            }
        }
    })
    
    
}
    
function insertStructure(){
    const structure = document.querySelectorAll(".struc");
    let strucList = [];
    
    structure.forEach((struc) => {
        strucTitle = $(struc).find("#struc_name").val();
        kioskNo = $(struc).find("#kiosk_no").val();
        strucType = $(struc).find("#struc_type").val();
        
        const position = struc.style.transform;
    
        let positionX = position.substr(12);
        const xend = positionX.indexOf('px');
        positionX = positionX.substr(0, xend);
        
        let ystart = position.indexOf('px, ');
        let positionY = position.substr(ystart+4);
        const yend = positionY.indexOf('px');
        positionY = positionY.substr(0, yend);
        
        strucList.push({strucTitle, kioskNo, strucType, positionX, positionY});
    })
    
    $.ajax({
        url : "saveStructure",
        type : "POST",
        data : JSON.stringify(strucList),
        dataType: "json",
        contentType : 'application/json; charset=UTF-8'
    })
}

$("#clear-table").click(function (){
    
    $.ajax({
        url : 'clearTable',
        data : { kioskNo : $(this).prev().val() }, 
        success(result){
            if ( result > 0 ) {
                document.location.reload();
            }
        }
    })
})
