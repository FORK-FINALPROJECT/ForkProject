import { useEffect, useState } from 'react';
import CooModal from './CooModal';
import Button from 'react-bootstrap/Button';
import ButtonGroup from 'react-bootstrap/ButtonGroup';
import DropdownButton from 'react-bootstrap/DropdownButton';
import { useLocation, useNavigate } from 'react-router-dom';
import DropdownItem from 'react-bootstrap/esm/DropdownItem';
import useCartStore from '../store/cartStore';

const MenuDetail = (props) => {

    // 원산지 모달
    const [modalShow, setModalShow] = useState(false);

    // 나가기 버튼
    const navigate = useNavigate();
    const exit = () => {
        navigate(-1);
    }

    // 메뉴리스트에서 값을 받아옴
    const location = useLocation();
    const menu = location.state;
    const springUrl = 'http://localhost:8083/kiosk';
    
    // 선택된 옵션 담아주기
    const [selectedOption, setSelectedOption] = useState({});

    // 선택된 옵션 선택버튼에 넣어주기
    const [selectedOptionName, setSelectedOptionName] = useState([]);

    useEffect(() => {
        for (const optionKey in selectedOption){
            if(selectedOption.hasOwnProperty(optionKey)){
                const optionName = selectedOption[optionKey].optionName;
                console.log(`옵션 키: ${optionKey}, 옵션 이름: ${optionName}`);
                setSelectedOptionName((prevSelectedOptionName) => [...prevSelectedOptionName, optionName]);
                // console.log(selectedOptionName);
            }
        }
    }, [selectedOption]);
    
    // selectedOptionName 잘 담겼는지 테스트
    useEffect(() => {
        console.log(selectedOptionName);
    },[selectedOptionName]);


    // 담기하면 카트스토어에 담기
    const menuItem = {
        menu : menu,
        selectedOption : selectedOption
    };
    const addToCart = useCartStore((state) => state.addToCart);

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
                                                            {/* <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName} title={prOptionName[options.optList.optionName] || options.optionName} variant='secondary'> */}
                                                            {/* <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName} title={selectedOptionName[options.optList.optionName]?.optionName || options.optionName} variant='secondary'> */}
                                                            <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName} title={
                                                                (() => {
                                                                    // console.log('1'+options.optionaName);
                                                                    // console.log('optList : '+options.optList.optionName);
                                                                    let test = [];
                                                                    test = options.optList;
                                                                    // console.log(test);
                                                                    test.map(opt => {
                                                                        if(selectedOptionName[opt.optionName]){
                                                                            return opt.optionName;
                                                                            console.log('2'+opt.optionaName);
                                                                        }
                                                                    })
                                                                    return options.optionName;
                                                                    console.log('3'+options.optionaName);
                                                                })()
                                                            } variant='secondary'>

                                                                {options && options.optList.map(opt => {
                                                                    return (
                                                                        <DropdownItem onClick={() => {
                                                                            setSelectedOption(prevSelectedOption => ({
                                                                                ...prevSelectedOption,
                                                                                [options.optionName]: opt,
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
                                    <Button id="button-prev" variant="secondary" onClick={() => addToCart(menuItem)}> 담기 </Button>
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