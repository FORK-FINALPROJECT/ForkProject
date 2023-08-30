import CloseButton from 'react-bootstrap/CloseButton';
import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';

const DutchpayByPrice = (props) => {

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
                            <tr>
                                <th>총 금액 : </th>
                                <td>2,000원</td>
                            </tr>
                        </div>
                        <div className="pay-list">
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>

                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
                                </li>
                                <li>
                                    <Button variant="secondary">카드결제</Button>{' '}
                                    <Button variant="secondary">현금결제</Button>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table>
                                        <tr>
                                            <th>금액</th>
                                            <td><CloseButton variant="white" /></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <input type="text" value={"2000원"} />
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

export default DutchpayByPrice;