import { useState } from 'react';
import CooModal from './CooModal';
import Button from 'react-bootstrap/Button';
import ButtonGroup from 'react-bootstrap/ButtonGroup';
import DropdownButton from 'react-bootstrap/DropdownButton';
import { useNavigate } from 'react-router-dom';
import DropdownItem from 'react-bootstrap/esm/DropdownItem';

const MenuDetail = (props) => {

    // 원산지 모달
    const [modalShow, setModalShow] = useState(false);

    // 나가기 버튼
    const navigate = useNavigate();
    const exit = () => {
        navigate(-1);
    }

    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-detailmenu">
                    <div className="page-head">
                        <div className="page-head-title">
                            <p className="main-content-detail-category">상세정보</p>
                        </div>
                        <div className="page-head-button">
                            <Button id="button-coo" variant="secondary" onClick={() => setModalShow(true)}> 원산지 </Button>
                            <CooModal show={modalShow} onHide={() => setModalShow(false)} />
                            <Button id="button-prev" variant="secondary" onClick={exit}> 나가기 </Button>
                        </div>
                    </div>
                    <div className="detailmenu-content">
                        <div className="detailmenu-content-left">
                            <img src={require('../resources/image/물강아지.jpg')} />
                            <ul>
                                <li>
                                    맛있는거ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ
                                </li>
                            </ul>
                        </div>
                        <div className="detailmenu-content-right">
                            <div className="detailmenu-menuname">
                                <ul>
                                    <li>메뉴명</li>
                                    <li>1150,000원</li>
                                </ul>
                            </div>
                            <div className="detailmenu-option">
                                <div className="detailmenu-option-list">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th colSpan="2">옵션선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={"옵션명"} variant='secondary'>
                                                        <DropdownItem>1단계</DropdownItem>
                                                        <DropdownItem>2단계</DropdownItem>
                                                        <DropdownItem>3단계</DropdownItem>
                                                        {/* 드롭다운아이템이 눌려지면 온클릭 -> 드롭다운버튼에 해당값이 들어가게 */}
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={"옵션명ssss"} variant='secondary'>
                                                        <DropdownItem>1단계</DropdownItem>
                                                        <DropdownItem>2단계</DropdownItem>
                                                        <DropdownItem>3단계</DropdownItem>
                                                        {/* 드롭다운아이템이 눌려지면 온클릭 -> 드롭다운버튼에 해당값이 들어가게 */}
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={"옵션명"} variant='secondary'>
                                                        <DropdownItem>1단계</DropdownItem>
                                                        <DropdownItem>2단계</DropdownItem>
                                                        <DropdownItem>3단계</DropdownItem>
                                                        {/* 드롭다운아이템이 눌려지면 온클릭 -> 드롭다운버튼에 해당값이 들어가게 */}
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={"옵션명"} variant='secondary'>
                                                        <DropdownItem>1단계</DropdownItem>
                                                        <DropdownItem>2단계</DropdownItem>
                                                        <DropdownItem>3단계</DropdownItem>
                                                        {/* 드롭다운아이템이 눌려지면 온클릭 -> 드롭다운버튼에 해당값이 들어가게 */}
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div className="detailmenu-option-button">
                                    <Button id="button-prev" variant="secondary"> 담기 </Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default MenuDetail;