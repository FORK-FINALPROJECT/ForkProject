import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import { useState } from 'react';
import DutchpayByPriceModal from './DutchpayByPriceModal';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import useCartStore from '../store/cartStore';

const DutchpayByPrice = (props) => {

    // 최대개수 넘어가면 모달모달
    const [modalShow, setModalShow] = useState(false);

    // 결제 방법별 모달
    // const [selectedPaymentMethod, setSelectedPaymentMethod] = useState(null);
    const { selectedPaymentMethod, setSelectedPaymentMethod, resetSelectedPaymentMethod } = paymentModalStore();

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

  const {cartTotalPrice} = useCartStore();

    //최소하나 초기값 필요
    const [pricePerPerson, setPricePerPerson] = useState(cartTotalPrice); // 샘플 가격만들만들 이거 저장소에서 가져올 것
    const [items, setItems] = useState([ // 최초 1개 결제창 뜨게 기본값 셋ㅅ팅
        {
            id: 0,
            price: pricePerPerson,
        }
    ]); // 이거 zustand로 변경할거임
    const [count, setCount] = useState(1); // 이건 그냥 쓸 거임 삭제 xx

    // 나누기 해서 소수점은 다 버려 . 그리고 """나머지"""가 0 이상이면 나머지를 1로 나눠 그 개수만큼 아이템 + 1  
    // 
    const handleAddItem = () => {
        if (items.length < 10) { // 최대 개수 지정해주주주고
            setCount(count + 1);
            const newPrice = Math.floor(pricePerPerson / (items.length + 1));// 나눠나눠하고 소수점 버림
            const modPrice = pricePerPerson % (items.length + 1); // 나머지값 구한거

            const updatedItems = items.map((item, index) => ({
                ...item,
                price: newPrice + (index < modPrice ? 1 : 0),
            }));
            setItems([...updatedItems, { id: count, price: newPrice }]);
        } else { // 10개 이상이라면 모달창으로 안내
            setSelectedPaymentMethod("최대개수");
            setModalShow(true);
        }
    };

    const handleRemoveItem = (keyToRemove) => {
        console.log(items)
        const newItems = items.filter(item => item.id !== keyToRemove);
        const newPrice = Math.floor(pricePerPerson / (newItems.length));
        const modPrice = pricePerPerson % (newItems.length);
        const updatedItems = newItems.map((item, index) => ({
            ...item,
            price: newPrice + (index < modPrice ? 1 : 0),
        }))
        setItems(updatedItems);
    }

    const handlePriceChange = (itemId, newPrice) => {
        const updatedItems = items.map((item) => {
            if (item.id === itemId) {
                return { ...item, price: newPrice };
            }
            return item;
        })
        setItems(updatedItems);
    }

    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-dutchpay">
                    <div className="page-head">
                        <div className="dutchpay-head-title">
                            <p className="main-content-detail-category">금액별 분할결제</p>
                        </div>
                        <div className="dutchpay-button">
                            <Button variant="secondary" id="button-dutchpayByMenu"><Link to="/dutchpayByMenu">메뉴별</Link></Button>
                            <Button variant="secondary" id="button-dutchpayByPrice"><Link to="/dutchpayByPrice">금액별</Link></Button>
                        </div>
                    </div>
                    <div className="dutchpayByPrice-content">
                        <div className="totalPrice">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>총 금액 : </th>
                                        <td>{pricePerPerson}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div className="pay-list">
                            {items.map((item, index) => (
                                (
                                    <ul key={item.id}>
                                        <li>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th>금액</th>
                                                        {/* <td><CloseButton variant="white" onClick={() => handleRemoveItem(item.id)}/></td> */}
                                                        <td><img className='closeBtn' src={require('../resources/image/close-button.png')} onClick={() => handleRemoveItem(item.id)} /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <input type="text" value={item.price} onChange={(e) => handlePriceChange(item.id, parseInt(e.target.value))} />
                                        </li>
                                        <li>
                                            <Button variant="secondary" onClick={handleCardPaymentClick}>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={handleCashPaymentClick}>현금결제</Button>
                                        </li>
                                    </ul>
                                )
                            ))}
                            <ul>
                                <li className="userAddLi" onClick={handleAddItem}>
                                    <img className='userAddBtn' src={require('../resources/image/add (3).png')} alt='추가' />
                                </li>
                                <DutchpaySelectPayModal show={modalShow} onHide={() => setModalShow(false)} selectedPaymentMethod={selectedPaymentMethod}/>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByPrice;