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
