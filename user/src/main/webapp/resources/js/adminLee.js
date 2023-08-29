/*
$('.struc_table').click(function(e){
    $('#struc_detail').modal("show");
});
*/

function detail_order(title, no){
    $.ajax({
        url : 'detailOrder',
        data : { kioskNo : no },
        success(order){
            if ( order.length > 0 ) {
                let menu = "";
                let total_price = 0;
                for( i in order ) {
                    menu += `
                    <div class="detail_menu">
                        <div class="menu detail_menu_title">${order[i].menuName}</div>
                        <div class="menu detail_menu_cnt">${order[i].cnt}</div>
                        <div class="menu detail_menu_price">${order[i].price.toLocaleString()}</div>
                    </div>`;
                    total_price += order[i].price;
                }
                $("#kiosk-no").val(no);
                $("#struc-title").html(title);
                $("#total-price").html(total_price.toLocaleString());
                $(".modal-body").html(menu);
                $('#struc_detail').modal("show");
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
        
        $.ajax({
            url : 'saveStructure',
            data : { strucTitle, kioskNo, strucType, positionX, positionY }
        })
        
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