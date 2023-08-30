import React, { useEffect, useRef, useState } from "react";
import ReceiptDetailViewl from "./ReceiptDetailViewl";

const ReceiptView = () => {
    // 영수증 목록들
    /*
    필요 연결 테이블 옵션OPT, 메뉴MENU, 결제PAY, 영수증RECEIPT. 영수증+메뉴(영수증별 메뉴 상세)RECEIPT_MENU
    영수증 메뉴+옵션(메뉴별 옵션 상세)RECEIPT_OPTION
    */
    const [receiptItems, setReceiptItems] = useState([
        {
            receiptNo: 1,
            payNo: "*******123", // 결제번호
            storeName: "동현포차",
            fileNo: "111-11-11111",
            memberName: "정동현",
            payDate: "23/09/12 22:33",
            menuItems: [
                {
                    menuName: "메뉴뉴뉼뉼",
                    cnt: 3, // 메뉴 수량
                    price: 10000,
                    optionItems: [
                        {
                            optionName: "옵옵옵션션",
                            optCnt: 2,
                            optPrice: 2000
                        },
                        {
                            optionName: "옵션22",
                            optCnt: 1,
                            optPrice: 0
                        }
                    ]
                },
                {
                    menuName: "메뉴222",
                    cnt: 1, // 메뉴 수량
                    price: 20000,
                    optionItems: [
                        {
                            optionName: "",
                            optCnt: "",
                            optPrice: ""
                        }
                    ]
                },
                {
                    menuName: "메뉴뉴뉼뉼",
                    cnt: 3, // 메뉴 수량
                    price: 10000,
                    optionItems: [
                        {
                            optionName: "옵옵옵션션",
                            optCnt: 2,
                            optPrice: 2000
                        },
                        {
                            optionName: "옵션22",
                            optCnt: 1,
                            optPrice: 0
                        },
                        {
                            optionName: "옵옵옵션션",
                            optCnt: 2,
                            optPrice: 2000
                        },
                    ]
                },
            ],
        },
        {
            receiptNo: 2,
            payNo: "*******123", // 결제번호
            storeName: "동현포차",
            fileNo: "111-11-11111",
            memberName: "정동현",
            payDate: "23/09/12 22:33",
            menuItems: [
                {
                    menuName: "메뉴뉴뉼뉼",
                    cnt: 3, // 메뉴 수량
                    price: 10000,
                    optionItems: [
                        {
                            optionName: "옵옵옵션션",
                            optCnt: 2,
                            optPrice: 2000
                        },
                    ]
                },
            ],
        }
    ]);
    // 인덱스 번호로 영수증별 상세영수증 조회 필요함
    const [selectedReceipt, setSelectedReceipt] = useState(null);

    const handleReceiptClick = (receiptNo) => {
        const selectedReceipt = receiptItems.find(receiptItem => receiptItem.receiptNo === receiptNo);
        setSelectedReceipt(selectedReceipt);
    };

    useEffect(() => {
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
            )
            return {
                ...receiptItem, menuItems: updateMenuItems, totalPrice: totalPrice,
                supplyValue: Math.floor(totalPrice / 1.1), addedTax: totalPrice - Math.floor(totalPrice / 1.1),
            }
        })
        setReceiptItems(updatedItems);
    }, [])

    return (
        <div>
            <div className="receipt-wrap scrollable">

                {receiptItems.map((receiptItem, index) => (
                    <div key={index} className="receipt-view">
                        <div className="receipt-view-head">
                            <div className="receipt-view-head-controll">
                                <div>영수증</div>
                                <button className="int receipt-detail-btn"
                                    onClick={() => handleReceiptClick(receiptItem.receiptNo)}>상세보기</button>
                            </div>
                        </div>
                        <div className="receipt-view-body">
                            <div>
                                <span>결제정보 : </span>
                                <span>{receiptItem.payNo}</span>
                            </div>
                            <div>
                                <span>결제금액 : </span>
                                <span>{receiptItem?.totalPrice?.toLocaleString()}</span>
                            </div>
                        </div>
                    </div>
                ))}
                <ReceiptDetailViewl receiptItem={selectedReceipt} />
                {/* receipeDetailView로 옮겨주기 */}
            </div>
        </div>
    );

}

export default ReceiptView;