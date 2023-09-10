import { create } from "zustand";

export const paymentModalStore = create((set) => ({
    selectedPaymentMethod: null,
    setSelectedPaymentMethod: (method) => set({ selectedPaymentMethod: method }),
    resetSelectedPaymentMethod: () => set({ selectedPaymentMethod: null }),
}));