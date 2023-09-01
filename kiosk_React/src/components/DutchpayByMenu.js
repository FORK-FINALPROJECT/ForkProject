import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';

const DutchpayByMenu = (props) => {
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
                            <ul>
                                <li>
                                    <img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                </li>
                                <li>
                                    메뉴이름
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                </li>
                                <li>
                                    메뉴이름
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                </li>
                                <li>
                                    메뉴이름
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                </li>
                                <li>
                                    메뉴이름
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                </li>
                                <li>
                                    메뉴이름
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByMenu;