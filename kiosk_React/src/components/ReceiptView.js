import React, { useEffect, useRef, useState } from "react";
import ReceiptDetailViewl from "./ReceiptDetailViewl";
import { useReceiptStore } from "../store/receiptViewStore";



const transformData = (receiptItems) => {
    const updatedItems = receiptItems.map(receiptItem => {
        //debugger;
        const updateMenuItems = receiptItem.rmList.map(menu => 
        {
            const menuPrice = menu.menu?.price || 0;
            const menuCnt = menu.cnt || 0;
           return {
                ...menu,
                menuAddPrice: menuPrice * menuCnt,
            }
        });
        const totalPrice = (updateMenuItems.reduce((total, menu) => {
            const menuTotal = menu.menuAddPrice + menu.roList.reduce((optionTotal, opt) => optionTotal + ( !(opt?.opt?.price) ? 0 : opt?.opt?.price * menu.cnt), 0); 
            return total + menuTotal;
            
          }, 0) ) || receiptItem?.pay?.price;
          
        return {
            ...receiptItem, menuItems: updateMenuItems, totalPrice: parseInt(totalPrice),
            supplyValue: Math.floor(totalPrice / 1.1), addedTax: totalPrice - Math.floor(totalPrice / 1.1),
        }
    })
    return updatedItems;
    
}

const ReceiptView = () => {

    // 데이터 확인 확인용
    const { kioskNo, receiptItems, setReceiptItems, setSelectedReceipt } = useReceiptStore();
    
    const groupedReceipts = transformData(receiptItems?.rlist);
    // console.log(typeof receiptItems.menuTotal);
    // console.log("야 이게 맞냐....", receiptItems);

    // 수정수정수정

    // 인덱스 번호로 영수증별 상세영수증 조회 필요함

    const handleReceiptClick = (receiptNo) => {
        const selectedReceipt = groupedReceipts.find(receiptItem => receiptItem.receiptNo === receiptNo);
        setSelectedReceipt(selectedReceipt);
    };
    // console.log("이거이거 확인 확인",groupedReceipts)
    return (
        <div>
            <div className="receipt-wrap scrollable">
                {groupedReceipts && groupedReceipts?.map((receiptItem, index) => (
                    <div key={index} className="receipt-view">
                        <div className="receipt-view-head">
                            <div className="receipt-view-head-controll">
                                <div>영수증</div>
                                <button className="int receipt-detail-btn"
                                    onClick={() => handleReceiptClick(receiptItem?.receiptNo)}>상세보기</button>
                            </div>
                        </div>
                        <div className="receipt-view-body">
                            <div>
                                <span>결제정보 : </span>
                                <span>{receiptItem?.payNo}</span>
                            </div>
                            <div>
                                <span>결제금액 : </span>
                                <span>{receiptItem?.pay?.price?.toLocaleString()}</span>
                            </div>
                        </div>
                    </div>
                ))}
                <ReceiptDetailViewl />
            </div>
        </div>
    );

}

export default ReceiptView;