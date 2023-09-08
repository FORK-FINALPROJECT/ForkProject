import CloseButton from 'react-bootstrap/CloseButton';
import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';
import { useState } from 'react';

const DutchpayByPrice = (props) => {

    //최소하나 초기값 필요
    const [items, setItems] = useState([]);
    const [count, setCount] = useState(0);
    const [pricePerPerson, setPricePerPerson] = useState(20000); // 샘플 가격만들만들


    // 나누기르 해서 소수점은 다 버려 . 그리고 나머지가 0 이상이면 나머지를 1로 나눠 그 개수만큼 아이템 + 1  
    // 
    const handleAddItem = () => {
        setCount(count + 1);
        const newPrice = Math.floor(pricePerPerson / (items.length+1));// 나눠나눠하고 소수점 버림
        const modPrice = pricePerPerson % (items.length+1); // 나머지값 구한거
        
        const updatedItems = items.map((item, index) => ({
            ...item,
            price: newPrice + (index < modPrice ? 1 : 0),
        }));
        
        setItems([...updatedItems, {id:count, price:newPrice}]);

    };

    const handleRemoveItem = (keyToRemove) => {
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
        const updatedItems = items.map((item)=> {
            if(item.id === itemId) {
                return {...item, price: newPrice};
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
                                                        <td><img className='closeBtn' src={require('../resources/image/close-button.png')} onClick={() => handleRemoveItem(item.id)}/></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <input type="text" value={item.price} onChange={(e) => handlePriceChange(item.id, parseInt(e.target.value))}/>
                                        </li>
                                        <li>
                                            <Button variant="secondary">카드결제</Button>{' '}
                                            <Button variant="secondary">현금결제</Button>
                                        </li>
                                    </ul>
                                )
                            ))}
                            <ul>
                                <li className="userAddLi" onClick={handleAddItem}>
                                    <img className='userAddBtn' src={require('../resources/image/add (3).png')} alt='추가'/>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByPrice;