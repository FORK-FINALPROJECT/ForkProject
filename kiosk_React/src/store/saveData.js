import { create } from 'zustand';
import axios from 'axios';

const useSaveData = create((set, get) => ({
    basicPay: async (kioskNo, cartItems, cartTotalPrice) => {
        axios.post("http://localhost:3000/kiosk/payment/"+kioskNo , {cartItems , cartTotalPrice} )
        .then( (response) => {
            console.log(response.data);
        }).catch( (error) => {
            console.log(error);
        });
    },
}));

export default useSaveData;