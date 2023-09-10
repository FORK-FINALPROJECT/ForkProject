import { create } from "zustand";

const useCartStore = create((set, get) => ({
    cartItems : [],
    cartId : 0,
    cartTotalPrice : 0, 
    setCartItems : (cartItems) => set({cartItems}),
    // setSelectedPaymentMethod: (method) => set({ selectedPaymentMethod: method }),
    addToCart : (menuItem) => {
        // menuItem.id = await get().cartId;
        // set((state) => ({...state , cartId : state.cartId +1}))
        set((state) => {
            let cartTotalPrice = state.cartItems.reduce((prev , curr) => prev + curr.totalPrice , 0);
            const newItem = {...menuItem, id: state.cartId};
            cartTotalPrice = cartTotalPrice + newItem.totalPrice;
            return {cartItems: [...state.cartItems, newItem], cartId: state.cartId+1 , cartTotalPrice};
        })
    }
}));

export default useCartStore;