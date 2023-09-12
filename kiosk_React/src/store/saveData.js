import { create } from 'zustand';
import axios from 'axios';

const useSaveData = create((set, get) => ({
    basicPay: async (kioskNo, cartItems, cartTotalPrice) => {
        axios.post("http://localhost:3000/kiosk/basicPay/"+kioskNo , {cartItems , cartTotalPrice} )
        .then( (response) => {
            if(response.data > 0){
                console.log('결제 성공');
            } else {
                console.log('결제 실패');
            }
            return response;
        }).catch( (error) => {
            console.log(error);
        });
    },
}));

export default useSaveData;