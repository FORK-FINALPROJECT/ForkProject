import { useState } from 'react';
import CooModal from './CooModal';
import Button from 'react-bootstrap/Button';
import ButtonGroup from 'react-bootstrap/ButtonGroup';
import DropdownButton from 'react-bootstrap/DropdownButton';
import { useLocation, useNavigate } from 'react-router-dom';
import DropdownItem from 'react-bootstrap/esm/DropdownItem';

const MenuDetail = (props) => {

    // 원산지 모달
    const [modalShow, setModalShow] = useState(false);

    // 나가기 버튼
    const navigate = useNavigate();
    const exit = () => {
        navigate(-1);
    }

    const location = useLocation();
    const menu = location.state;
    const springUrl = 'http://localhost:8083/kiosk';

    // console.log(menu);

    // 선택된 아이템 드롭다운 버튼에 보이게하기
    const [selectedOption, setSelectedOption] = useState({});

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
                            <img src={springUrl + menu.filePath + menu.originName} alt="메뉴사진" onError={(e) => { e.target.src = require('../resources/image/defaultimg.jpg') }} />
                            <ul>
                                <li>
                                    {menu.menuDetail}
                                </li>
                            </ul>
                        </div>
                        <div className="detailmenu-content-right">
                            <div className="detailmenu-menuname">
                                <ul>
                                    <li>{menu.menuName}</li>
                                    <li>{menu.price.toLocaleString('ko-KR')} 원</li>
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
                                            {menu.optList[0].optList.length>0 ? (menu.optList.map((options) => {
                                                return (
                                                    <tr>
                                                        <td>{options.optionName}</td>
                                                        <td id='dropdownbtn'>
                                                            <DropdownButton as={ButtonGroup} key={options.optionName} id={'dropdown-variants-' + options.optionName} title={selectedOption[options.optionName] || options.optionName} variant='secondary'>
                                                                {options && options.optList.map(opt => {
                                                                    return (
                                                                        <DropdownItem onClick={() => {
                                                                            setSelectedOption(prevSelectedOption => ({
                                                                                ...prevSelectedOption,
                                                                                [options.optionName]: opt.optionName,
                                                                            }));
                                                                        }}>
                                                                            {opt.optionName}
                                                                        </DropdownItem>
                                                                    );
                                                                })}
                                                            </DropdownButton>
                                                        </td>
                                                    </tr>
                                                )
                                            })) : (
                                                <tr>
                                                    <td colSpan="2">
                                                        해당 메뉴는 옵션이 없습니다.
                                                    </td>
                                                </tr>
                                            )
                                            }
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