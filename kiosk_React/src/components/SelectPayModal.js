import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { Link } from 'react-router-dom';
import { useState, useEffect } from 'react';
import useCartStore from '../store/cartStore';
import {useReceiptStore} from '../store/receiptViewStore';
import useSaveData from '../store/saveData';

function SelectPayModal(props) {

    const [payMethod, setPayMethod] = useState(null);
    const [modalTimer, setModalTimer] = useState(10); // 초 단위로 설정
    const [timer, setTimer] = useState(null);

    const {cartItems, cartTotalPrice, resetCartStore } = useCartStore();
    const kioskNo = useReceiptStore((state) => state.kioskNo);

    // 장바구니 비우기
    const handleResetCartStore = () => {
        resetCartStore();
    }

    // 값 저장
    const { basicPay } = useSaveData();
    const handleBasicPay = () => {
        let result = basicPay(kioskNo, cartItems, cartTotalPrice);

        if(result > 0){
            // 성공
            alert('결제성공');
        } else {
            // 실패
            handleResetCartStore();
        }
    }

    // 결제방법이 선택되면 다음화면으로
    const handlePaymentMethodClick = (method) => {
        setPayMethod(method);
        setModalTimer(10); // 타이머 리셋
    };

    // 모달이 닫힐 때 setPayMethod(null) 자동 실행
    const handleCloseModal = () => {
        // 타이머가 실행 중이면 클리어
        if (timer) {
            clearInterval(timer);
        }
        setPayMethod(null);
        if (props.onHide) {
            props.onHide();
        }
    };

    // 현금결제가 선택되었을 때 10초 후에 handleCloseModal 함수 실행
    useEffect(() => {
        if (payMethod === "현금결제") {
            const newTimer = setInterval(() => {
                setModalTimer((prevTime) => {
                    if (prevTime === 1) {
                        // 시간이 만료되면 모달을 닫음
                        clearInterval(newTimer);
                        handleCloseModal();
                        return 0;
                    }
                    return prevTime - 1;
                });
            }, 1000); // 1초마다 실행

            // 타이머 ID 저장
            setTimer(newTimer);

            return () => clearInterval(newTimer); // 컴포넌트가 언마운트되면 타이머 클리어
        }
    }, [payMethod]);

    return (
        <Modal
            {...props}
            size="lg"
            aria-labelledby="contained-modal-title-vcenter"
            centered
            // 모달이 닫힐 때 resetPayMethod 함수 호출
            onHide={handleCloseModal}
        >
            <Modal.Header>
                <Modal.Title id="contained-modal-title-vcenter">
                    결제
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div>
                    {payMethod ? (
                        <div className='selectPayModal2'>
                            {/* 카드결제 클릭시 */}
                            {payMethod === "카드결제" && 
                            <div className='cardPayWrap'>
                            <h3 className="cardPay">ic 카드를 리더기에 넣어주세요</h3>
                            <p className="cardPay">
                                <img src={require('../resources/image/insert-card2.png')} />
                            </p>
                            </div>
                            }

                            {/* 현금결제 클릭시 */}
                            {payMethod === "현금결제" && <>
                                <div>
                                    <h1>직원이 현금을 받으러 갑니다.</h1> <br />
                                    <h1>현금을 미리 준비해주세요.</h1> <br />
                                    <h1>{modalTimer}초 후에 자동으로 창이 닫힙니다.</h1>
                                </div>
                            </>}
                            {payMethod === "분할결제" && <>
                                <ul>
                                    <Link to="/dutchpayByMenu" onClick={handleCloseModal}>
                                        <li><img src={require('../resources/image/dutchMenuLogo.PNG')} alt='메뉴별로고'/></li>
                                        <li>메뉴별</li>
                                    </Link>
                                </ul>
                                <ul>
                                    <Link to="/dutchpayByPrice" onClick={handleCloseModal}>
                                        <li><img src={require('../resources/image/dutchPriceLogo.PNG')} alt='금액별로고'/></li>
                                        <li>금액별</li>
                                    </Link>
                                </ul>
                            </>}
                            {/* <button onClick={() => setPayMethod(null)}>돌아가기</button> */}
                        </div>
                    ) : (
                        <div className='selectPayModal'>
                            <ul onClick={() => handlePaymentMethodClick("카드결제")}>
                                <li><img src={require('../resources/image/payCardLogo.PNG')} alt='카드결제로고'/></li>
                                <li>카드결제</li>
                            </ul>
                            <ul onClick={() => {handlePaymentMethodClick("현금결제"); handleBasicPay();}}>
                                <li><img src={require('../resources/image/payCashLogo.PNG')} alt='현금결제로고'/></li>
                                <li>현금결제</li>
                            </ul>
                            <ul onClick={() => handlePaymentMethodClick("분할결제")}>
                                <li><img src={require('../resources/image/payDutchLogo.PNG')} alt='분할결제로고'/></li>
                                <li>분할결제</li>
                            </ul>
                        </div>
                    )}
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseModal}>Close</Button>
            </Modal.Footer>
        </Modal>
    );

}

export default SelectPayModal;