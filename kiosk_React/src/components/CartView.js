import React, { useEffect, useRef, useState } from "react";
import SelectPayModal from './SelectPayModal';
import Button from 'react-bootstrap/Button';
import useCartStore from '../store/cartStore';

const CartView = () => {

    const springUrl = 'http://localhost:8083/kiosk';

    // 결제 모달
    const [modalShow, setModalShow] = useState(false);
    const {cartItems, setCartItems , cartTotalPrice, setCartTotalPrice } = useCartStore();
    // {
    //얻어온 데이터를 바탕으로 메뉴정보 보여주기 
    // 메뉴정보 : 메뉴 이미지, 메뉴이름, total가격 , 옵션리슽, 개수
    //동일한 메뉴, 옵션들 인 경우 개수 증가
  
    const min = 1;
    const max = 10;
    const [count, setCount] = useState(1);
    // const [cartItems, setCartItems] = useState([

    const removeCartItem = (itemId) => {
        const cartItemsresult = cartItems.filter(item => item.id !== itemId)
        setCartItems(cartItemsresult);
    };

    const decreaseCount = (itemId) => {
        const cartItemsresult = cartItems.map(item => {
            if (item.id === itemId) {
                const newTotalPrice = item.totalPrice - item.addPrice;
                setCartTotalPrice(cartTotalPrice - item.addPrice);
                return item.count > min ? { ...item, count: item.count - 1, totalPrice : newTotalPrice } : null;
            } else {
                return item;
            }
        }).filter(item => item !== null);
        setCartItems(cartItemsresult);
    }

    const increaseCount = (itemId) => {
        const cartItemsresult =  cartItems.map(item => {
                if (item.id === itemId && item.count < max) {
                    const newTotalPrice = item.totalPrice + item.addPrice;
                    setCartTotalPrice(cartTotalPrice + item.addPrice);
                    return { ...item, count: item.count + 1, totalPrice : newTotalPrice };
                }
                return item;
            })
        setCartItems(cartItemsresult);
    }

    return (
        <>
            <div className="cart-wrap">
                <form className="cart-form scrollable">
                    <div className="cart-view ">
                        {cartItems.length === 0 ? (
                            <div className="empty-cart-message">
                                장바구니가 비어있습니다.
                            </div>
                        ) : (
                            <div className="">
                                {cartItems.map(item => (
                                    <div key={item.id} className="cart-order-wrap">
                                        <div className="cart-menu-pic">
                                            <img src={springUrl + item.filePath + item.originName} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                        </div>
                                        <div className="cart-menu-details">
                                            <div className="cart-menu-name">
                                                <span className="cart-menu-name-1">{item.menuName}</span>
                                                <span className="cart-menu-name-2"> {item.totalPrice.toLocaleString('ko-KR')}원 </span>
                                                <span onClick={() => removeCartItem(item.id)}>
                                                    <img className="close int" src={require('../resources/image/closeLogo6.png')} alt="닫기"/>
                                                </span>
                                            </div>
                                            <div className="cart-menu-option">
                                                {item.selectedOption.map((option) => (
                                                    <p>
                                                    {`${option.prOptionName} ${option.optionName} ${option.price.toLocaleString('ko-KR')}원`}
                                                    </p>
                                                ))}
                                            </div>
                                            <div className="count-wrap _count">
                                                <button type="button" className="minus int" onClick={() => decreaseCount(item.id)}>-</button>
                                                {item.count > 10 ? alert("ddddd") :
                                                    <input type="text" className="inp" value={item.count} readOnly />}
                                                <button type="button" className="plus int" onClick={() => increaseCount(item.id)}>+</button>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                        총합 : {cartTotalPrice.toLocaleString('ko-KR')}원
                    </div>
                    <div className="cart-order">
                        <Button id="button-coo" variant="light" onClick={() => setModalShow(true)}> 결제하기 </Button>
                        <SelectPayModal show={modalShow} onHide={() => setModalShow(false)} />
                    </div>
                </form>
            </div>
        </>
    );
}

export default CartView;