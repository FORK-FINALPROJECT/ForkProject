import React, { useEffect, useRef, useState } from "react";
import SelectPayModal from './SelectPayModal';
import Button from 'react-bootstrap/Button';

const CartView = () => {

    // 결제 모달
    const [modalShow, setModalShow] = useState(false);

    const min = 1;
    const max = 10;
    const [count, setCount] = useState(1);
    const [cartItems, setCartItems] = useState([

        {
            id: 1,
            imagePath: require('../resources/image/menuSample.png'),
            name: '메뉴이름 1',
            price: '가격 1',
            option: '옵션 어쩌구 저쩌구 메뉴랑 이것저것 많이 들어갈 예정이니까 일단 길게 써보자',
            count: 3
        },
        {
            id: 2,
            imagePath: require('../resources/image/menuTest.jpg'),
            name: '메뉴이름 2',
            price: '가격 2',
            option: '다른 옵션 내용...',
            count: 2
        },
        {
            id: 3,
            imagePath: require('../resources/image/menuTest.jpg'),
            name: '메뉴',
            price: '가격 2',
            option: '다른 옵션 내용.옵션션션션션션ㅅ..',
            count: 1
        },
        {
            id: 4,
            imagePath: require('../resources/image/menuTest.jpg'),
            name: '메뉴',
            price: '가격 2',
            option: '다른 옵션 내용.옵션션션션션션ㅅ..',
            count: 1
        }

    ]);

    const removeCartItem = (itemId) => {
        const cartItemsresult = cartItems.filter(item => item.id !== itemId)
        setCartItems(cartItemsresult);
    };

    const decreaseCount = (itemId) => {
        const cartItemsresult = cartItems.map(item => {
            if (item.id === itemId) {
                return item.count > min ? { ...item, count: item.count - 1 } : null;
            } else {
                return item;
            }
        }).filter(item => item !== null);

        setCartItems(cartItemsresult);
    }

    const increaseCount = (itemId) => {

        setCartItems(prevItems =>
            prevItems.map(item => {
                if (item.id === itemId && item.count < max) {
                    return { ...item, count: item.count + 1 };
                }
                return item;
            })
        );
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
                                            <img src={item.imagePath} />
                                        </div>
                                        <div className="cart-menu-details">
                                            <div className="cart-menu-name">
                                                <span className="cart-menu-name-1">{item.name}</span>
                                                <span className="cart-menu-name-2"> {item.price} </span>
                                                <span onClick={() => removeCartItem(item.id)}>
                                                    <img className="close int" src={require('../resources/image/closeLogo6.png')} />
                                                </span>
                                            </div>
                                            <div className="cart-menu-option">
                                                {item.option}
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