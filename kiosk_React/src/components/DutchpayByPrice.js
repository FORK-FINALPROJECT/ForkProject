import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import { useState , useEffect } from 'react';
import DutchpayByPriceModal from './DutchpayByPriceModal';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import useCartStore from '../store/cartStore';
import Numpad from './numPadTest'; 
import numpadStore from '../store/numpadStore';
import Modal from 'react-bootstrap/Modal';
const DutchpayByPrice = (props) => {

    // 최대개수 넘어가면 모달모달
    const [modalShow, setModalShow] = useState(false);
    const [numpadModalShow , setNumpadModalShow] = useState(false);
    const {setInputId} = numpadStore();
    // 결제 방법별 모달
    // const [selectedPaymentMethod, setSelectedPaymentMethod] = useState(null);
    const { selectedPaymentMethod, setSelectedPaymentMethod, resetSelectedPaymentMethod } = paymentModalStore();
    const {cartTotalPrice} = useCartStore();


  const checkTotalInputPrice = () => {
    const totalInputPrice = items.reduce( (total , item) => {
        return total + item.price
    }, 0);
    console.log(totalInputPrice , cartTotalPrice)
    if(totalInputPrice != cartTotalPrice ){
        alert('입력하신 금액과 총결제 금액이 일치하지 않습니다.');
        return false;
    }
    return true;
  }

  const updatePaymentStatus = (itemId) => {
    const updateditems = items.map((item) =>{
        if(item.id == itemId){
            return {...item , paymentStatus: true }
        }
        return item;
    })
    setItems(updateditems);
  }
  // 카드결제 버튼 클릭 시 모달 열기
  const handleCardPaymentClick = (itemId) => {
    if(checkTotalInputPrice()){
        setSelectedPaymentMethod('카드결제');
        setModalShow(true);
        updatePaymentStatus(itemId);
    }
  };

  // 현금결제 버튼 클릭 시 모달 열기
  const handleCashPaymentClick = (itemId) => {
    if(checkTotalInputPrice()){
        setSelectedPaymentMethod('현금결제');
        setModalShow(true);
        updatePaymentStatus(itemId);
    }
  };

  const paymentStatusCheck = (item) =>{     
    return item.paymentStatus;
  }

    //최소하나 초기값 필요 
    const [pricePerPerson, setPricePerPerson] = useState(cartTotalPrice); // 샘플 가격만들만들 이거 저장소에서 가져올 것
    const {items, setItems} = numpadStore();
    useEffect(() =>{
        setItems([ {
            id: 0,
            price: pricePerPerson,
            maximumPrice : cartTotalPrice,
            paymentStatus : false
        }])
    },[])
    // const [items, setItems] = useState([ // 최초 1개 결제창 뜨게 기본값 셋ㅅ팅 =>이 때는 키패드가 뜨지 않게 해야함.
        // {
        //     id: 0,
        //     price: pricePerPerson,
        // }
    // ]); // 이거 zustand로 변경할거임
    const [count, setCount] = useState(1); // 이건 그냥 쓸 거임 삭제 xx

    // 나누기 해서 소수점은 다 버려 . 그리고 """나머지"""가 0 이상이면 나머지를 1로 나눠 그 개수만큼 아이템 + 1  
    const handleAddItem = () => {
        if (items.length < 10) { // 최대 개수 지정해주주주고
            setCount(count + 1);
            const unPaymentItems = items.filter( item => !item.paymentStatus); // 결제안함
            const paymentItems = items.filter( item => item.paymentStatus); // 결제함
            const leftPrice = pricePerPerson - paymentItems.reduce((total , item ) => {return total + item.price} , 0);

            const newPrice = Math.floor(leftPrice / (unPaymentItems.length + 1));// 나눠나눠하고 소수점 버림
            const modPrice = leftPrice % (unPaymentItems.length + 1); // 나머지값 구한거

            const updatedItems = unPaymentItems.map((item, index) => ({
                ...item,
                price: newPrice + (index < modPrice ? 1 : 0),
            }));
            setItems([...paymentItems,  ...updatedItems, { id: count, price: newPrice , maximumPrice : cartTotalPrice , paymentStatus : false }]);
        } else { // 10개 이상이라면 모달창으로 안내
            setSelectedPaymentMethod("최대개수");
            setModalShow(true);
        }
    };

    const handleRemoveItem = (keyToRemove) => {

        const newItems = items.filter(item => item.id !== keyToRemove);

        const unPaymentItems = newItems.filter( item => !item.paymentStatus); // 결제안함
        const paymentItems = newItems.filter( item => item.paymentStatus); // 결제함

        const leftPrice = pricePerPerson - paymentItems.reduce((total , item ) => {return total + item.price} , 0);

        const newPrice = Math.floor(leftPrice / (unPaymentItems.length));// 나눠나눠하고 소수점 버림
        const modPrice = leftPrice % (unPaymentItems.length); // 나머지값 구한거

        // const newPrice = Math.floor(pricePerPerson / (newItems.length));
        // const modPrice = pricePerPerson % (newItems.length);
        const updatedItems = unPaymentItems.map((item, index) => ({
            ...item,
            price: newPrice + (index < modPrice ? 1 : 0),
        }))
        setItems([...paymentItems , ...updatedItems]);
    }

    // 숫자패드패드
    const handleNumPad = (e) => {
        const next = e.target.nextElementSibling
        const id = e.target.id;
        setInputId(id);
        if(next){
            next.style.display = 'block';
        }
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
                                        <td colSpan="3" className='inputValueTotalPrice'>&nbsp;&nbsp;&nbsp;&nbsp;{items.reduce((total , item) => {return total+item.price},0)}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div className="pay-list">
                            {items.map((item, index) => (
                                (
                                    <ul key={item.id} >
                                        <li>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th>금액</th>
                                                        {/* <td><CloseButton variant="white" onClick={() => handleRemoveItem(item.id)}/></td> */}
                                                        <td><img className='closeBtn' src={require('../resources/image/close-button.png')} onClick={() => {if(!paymentStatusCheck(item)) handleRemoveItem(item.id)}} /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <input type="text" id={item.id} readOnly value={item.price} onClick={(e) => { if(!paymentStatusCheck(item)) {handleNumPad(e, this); setNumpadModalShow(items.length > 1);}}}/>
                                            {/* <Numpad items={items} setItems={setItems} /> */}
                                        </li>
                                        <li>
                                            <Button variant="secondary" onClick={() => {if(!paymentStatusCheck(item)) handleCardPaymentClick(item.id)}}>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={() => {if(!paymentStatusCheck(item))handleCashPaymentClick(item.id)}}>현금결제</Button>
                                        </li>
                                    </ul>
                                )
                            ))}
                            <ul>
                                <li className="userAddLi" onClick={handleAddItem}>
                                    <img className='userAddBtn' src={require('../resources/image/add (3).png')} alt='추가' />
                                </li>
                                <DutchpaySelectPayModal show={modalShow} onHide={() => setModalShow(false)} selectedPaymentMethod={selectedPaymentMethod}/>
                                <Numpad show={numpadModalShow} onHide={() => setNumpadModalShow(false)} />
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByPrice;