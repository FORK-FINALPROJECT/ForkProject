
import { create } from 'zustand';

// 수정 영역
export const transformData = (receiptItems => {

    const updatedItems = receiptItems.map(receiptItem => {
        const updateMenuItems = receiptItem.menuItems.map(menu => ({
            ...menu,
            menuAddPrice: menu.price * menu.cnt,
            optionItems: menu.optionItems.map(option => ({
                ...option,
                optionAddPrice: option.optCnt * option.optPrice,
            })),
        }));

        const totalPrice = updateMenuItems.reduce(
            (total, menu) => total + menu.menuAddPrice + menu.optionItems.reduce(
                (optionTotal, option) => optionTotal + option.optionAddPrice, 0
            ), 0
        );
        return {
            ...receiptItem, menuItems: updateMenuItems, totalPrice: totalPrice,
            supplyValue: Math.floor(totalPrice / 1.1), addedTax: totalPrice - Math.floor(totalPrice / 1.1),
        }
    })
    return updatedItems;
}, [])


//수정 끝! 

export const useReceiptStore = create( (set ,get) => ({
    kioskNo : sessionStorage.getItem('kioskNo') == null ? null : sessionStorage.getItem('kioskNo'),
    receiptItems : sessionStorage.getItem('receiptList') == [] || sessionStorage.getItem('receiptList') == null ? [] :  JSON.parse(sessionStorage.getItem('receiptList')),
    setKioskNo : (kioskNo) => set({kioskNo}),
    setReceiptItems : (receiptItems) => set({receiptItems}),





    // //수정 수정
    // // receiptItems: [],
    // setReceiptItems: (newReceiptItems) =>
    //     // const updatedItems = transformData(receiptItems);
    //     set({receiptItems: newReceiptItems}),
        
    // // receiptNo로 묶어줄꺼임
    // getGroupedReceipts : () => {
    //     const groupedReceipts = get().receiptItems.reduce((groupedReceipts , receiptItem) => {
    //         const receiptNo = receiptItem.receiptNo;
    //         const payNo = receiptItem.payNo;
    //         const existingGroup = groupedReceipts.find((group) => group.receiptNo === receiptNo);

    //         if (existingGroup) {
    //             // 이미 해당 receiptNo로 그룹이 만들어진 경우
    //             // existingGroup.price += receiptItem.price;
    //         } else {
    //             // 해당 receiptNo로 그룹이 없는 경우
    //             groupedReceipts.push({ payNo, receiptNo, totalPrice: receiptItem.totalPrice });
    //         }
            
    //         return groupedReceipts;
    //     } , [])
    // return groupedReceipts
    // }, 
    // selectedReceiptNo : null, 
    // // setGroupedReceipts: (groupedReceipts) => set({groupedReceipts}),
    // // setSelectedReceipt : (selectedReceiptNo) => set({selectedReceiptNo}),
    selectedReceipt: [],
    setSelectedReceipt : (selectedReceipt) => set({selectedReceipt}),

    // //수정 끝

}));