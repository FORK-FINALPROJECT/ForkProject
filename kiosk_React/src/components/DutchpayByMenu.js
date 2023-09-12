import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import { useState } from 'react';
import useCartStore from '../store/cartStore';

const DutchpayByMenu = (props) => {

    const springUrl = 'http://localhost:8083/kiosk';

    // 장바구니에 있는 값 가져오기
    const {cartItems, cartId, cartTotalPrice} = useCartStore();
    // console.log('cartItems : ' + cartItems.menu);
    // console.log('cartId : ' + cartId);
    // console.log('cartTotalPrice : ' + cartTotalPrice);

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
                                    <ul>
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
                                            <Button variant="secondary" onClick={handleCardPaymentClick}>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={handleCashPaymentClick}>현금결제</Button>
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