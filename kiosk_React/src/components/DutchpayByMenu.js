import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import { useState } from 'react';
import useCartStore from '../store/cartStore';
import useSaveData from '../store/saveData';
import { useReceiptStore } from '../store/receiptViewStore';
import useSocketStore from '../store/socketStore';

const DutchpayByMenu = (props) => {

    const springUrl = 'http://localhost:8083/kiosk';

    // 장바구니에 있는 값 가져오기
    const {cartItems, setNewCartAfterDutchByMenu } = useCartStore();
    const {totalCashPrice, setTotalCashPrice , getTotalCashPrice} = paymentModalStore();
    // 키오스크 번호
    const kioskNo = useReceiptStore((state) => state.kioskNo);

    // 결제 방법별 모달
    const [modalShow, setModalShow] = useState(false);
    const { selectedPaymentMethod, setSelectedPaymentMethod,updatedTotalCashPrice } = paymentModalStore();

    // 카드결제 버튼 클릭 시 모달 열기
    const handleCardPaymentClick = () => {
        setSelectedPaymentMethod('카드결제');
        setModalShow(true);
    };

    
    // 현금합계 소켓 연결 설정
    const {stompClient , setStompClient} = useSocketStore();


    // 현금합계 기본값
    let cashPrice = 0;

    // 현금결제 버튼 클릭 시 모달 열기
    const handleCashPaymentClick = (menu) => {
        setSelectedPaymentMethod('현금결제');
        cashPrice = totalCashPrice+menu.totalPrice;
        setTotalCashPrice(cashPrice);
        setModalShow(true);
    };

    // 결제한 메뉴 스토어에서 지우기
    const handleSetNewCartAfterDutchByMenu = (menu, menuTotalPrice) => {      
        return setNewCartAfterDutchByMenu(menu, menuTotalPrice);
    }

    // 결제
    const { dutchByMenu } = useSaveData();
    const handleDutchByMenu = async (menu) => {
        let result = await dutchByMenu(kioskNo, menu, menu.totalPrice);
        if(result > 0){
            // 결제 성공
            // 리턴값을 set[] 이걸 소켓보낼때 보낸다
                
            let message = {
                kioskNo : kioskNo,
                price : getTotalCashPrice(),
            };

            if(!handleSetNewCartAfterDutchByMenu(menu, menu.totalPrice).length){ // 모두 결제된 경우
                // 여기서 소켓보내기 , 메뉴리스트 랜더되게 하기
                stompClient?.send(`/user/send/${kioskNo}`,{} , JSON.stringify(message));
                console.log(message);
                //setTotalCashPrice(0);
            }
        } else {
            // 결제 실패
            // 리턴값 set[] 비워주기
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
                                            <Button variant="secondary" onClick={() => {handleCardPaymentClick(); handleDutchByMenu(menu);} }>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={() => {handleCashPaymentClick(menu); handleDutchByMenu(menu);} }>현금결제</Button>
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