import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import { useState } from 'react';
import useCartStore from '../store/cartStore';
import useSaveData from '../store/saveData';
import { useReceiptStore } from '../store/receiptViewStore';

const DutchpayByMenu = (props) => {

    const springUrl = 'http://localhost:8083/kiosk';

    const [receiptNo , setReceiptNo] = useState([]);

    // 받아온 영수증 번호 담아주기
    const addReceiptNo = (newReceiptNo) => {
        setReceiptNo([...receiptNo, newReceiptNo]);
        return [...receiptNo, newReceiptNo];
    }
    // 소켓통신이 완료되면 영수증 번호 지워주기
    const resetReceiptNo = () => {
        setReceiptNo([]);
    }

    // 장바구니에 있는 값 가져오기
    const {cartItems, setNewCartAfterDutchByMenu } = useCartStore();
    // 키오스크 번호
    const kioskNo = useReceiptStore((state) => state.kioskNo);

    // 결제 방법별 모달
    const [modalShow, setModalShow] = useState(false);
    const { selectedPaymentMethod, setSelectedPaymentMethod } = paymentModalStore();

    // 카드결제 버튼 클릭 시 모달 열기
    const handleCardPaymentClick = () => {
        setSelectedPaymentMethod('카드결제');
        setModalShow(true);
    };

    // 현금결제 버튼 클릭 시 모달 열기
    const handleCashPaymentClick = () => {
        setSelectedPaymentMethod('현금결제');
        setModalShow(true);
    };

    // 결제한 메뉴 스토어에서 지우기
    const handleSetNewCartAfterDutchByMenu = (menu, menuTotalPrice) => {      
        return setNewCartAfterDutchByMenu(menu, menuTotalPrice);
    }

    // 결제
    const { dutchPay } = useSaveData();
    const handleDutchPay = async (menu) => {
        let result = await dutchPay(kioskNo, menu, menu.totalPrice);
        if(result > 0){
            // 결제 성공
            // 영수증번호 배열에 담아주기
            let receiptNoList = addReceiptNo(result); // 저장된 영수증 번호(이걸 소켓에서 보내주심 됩니다. 배열형태에요)
            console.log('****receiptNoList : ', receiptNoList);

            if(!handleSetNewCartAfterDutchByMenu(menu, menu.totalPrice).length){ // 모두 결제된 경우
                // 소켓 보내주는곳
                // 1. 소켓이 정상적으로 보내졌을 경우
                resetReceiptNo(); // 영수증번호 리스트 비워주기

                // 2. 아니면 소켓 다시 진행 반복
                // 소켓 반복
            }
        } else {
            // 결제 실패
            // 영수증번호 리스트 비워주기
            resetReceiptNo();
        }
    }

    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-dutchpay">
                    <div className="page-head">
                        <div className="dutchpay-head-title">
                            <p className="main-content-detail-category">메뉴별 분할결제</p>
                        </div>
                        <div className="dutchpay-button">
                            <Button variant="secondary" id="button-dutchpayByMenu"><Link to="/dutchpayByMenu">메뉴별</Link></Button>
                            <Button variant="secondary" id="button-dutchpayByPrice"><Link to="/dutchpayByPrice">금액별</Link></Button>
                        </div>
                    </div>

                    <div className="dutchpayByMenu-content">
                        <div className="pay-list">
                            {
                                cartItems.map(menu => (
                                    <ul id={menu.menuNo+menu.menuName+menu.totalPrice}>
                                        <li>
                                            <img src={springUrl + menu.filePath + menu.originName} alt="메뉴사진" onError={(e) => { e.target.src = require('../resources/image/defaultimg.jpg') }} />
                                        </li>
                                        <li>
                                            {menu.menuName}
                                        </li>
                                        <li>
                                            수량 : {menu.count}
                                        </li>
                                        <li>
                                            {menu.totalPrice.toLocaleString('ko-KR')}원
                                        </li>
                                        <li>
                                            <Button variant="secondary" onClick={() => {handleCardPaymentClick(); handleDutchPay(menu);} }>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={() => {handleCardPaymentClick(); handleDutchPay(menu);} }>현금결제</Button>
                                        </li>
                                    </ul>
                                ))
                            }
                        </div>
                        <DutchpaySelectPayModal show={modalShow} onHide={() => setModalShow(false)} selectedPaymentMethod={selectedPaymentMethod}/>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByMenu;