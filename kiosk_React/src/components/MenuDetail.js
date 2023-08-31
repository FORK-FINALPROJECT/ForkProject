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

    // 선택된 아이템 드롭다운 버튼에 보이게하기
    const [selectedOption1, setSelectedOption1] = useState(null); // 상위 드롭다운 버튼에 표시할 값
    const [selectedOption2, setSelectedOption2] = useState(null);
    const [selectedOption3, setSelectedOption3] = useState(null);

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
                            <img src={require('../resources/image/menuTest.jpg')} />
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
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={selectedOption1 || "옵션명"} variant='secondary'>
                                                        <DropdownItem onClick={() => setSelectedOption1("1단계")}>1단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption1("2단계")}>2단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption1("3단계")}>3단계</DropdownItem>
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={selectedOption2 || "옵션명"} variant='secondary'>
                                                        <DropdownItem onClick={() => setSelectedOption2("1단계")}>1단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption2("2단계")}>2단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption2("3단계")}>3단계</DropdownItem>
                                                    </DropdownButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>옵션123123</td>
                                                <td id='dropdownbtn'>
                                                    <DropdownButton as={ButtonGroup} key={"옵션명"} id={`dropdown-variants-"옵션명"`} title={selectedOption3 || "옵션명"} variant='secondary'>
                                                        <DropdownItem onClick={() => setSelectedOption3("1단계")}>1단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption3("2단계")}>2단계</DropdownItem>
                                                        <DropdownItem onClick={() => setSelectedOption3("3단계")}>3단계</DropdownItem>
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