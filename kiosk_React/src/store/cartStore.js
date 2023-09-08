import { create } from "zustand";

const useCartStore = create((set) => ({
    cartItems : [],
    addToCart : (menuItem) => {
        set((state) => ({
            cartItems : [...state.cartItems, menuItem]
        }));
        console.log(menuItem);
        // 담기버튼을 안눌러도 왜 콘솔에 뜰까,,,
    }
}));

export default useCartStore;