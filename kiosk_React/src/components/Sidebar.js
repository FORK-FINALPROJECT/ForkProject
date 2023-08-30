import React, { useState } from 'react'
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Dingdong from './DingdongModal';

const Sidebar = () => {

    // 직원호출 모달
    const [modalShow, setModalShow] = useState(false);

    return (

        <div className="left-nav-wrap">
            <div className="category"><Link to="/">일단보기</Link></div>
            <div className="category"><Link to="/dutchpayByMenu">나중에바꾸기</Link></div>
            <div className="category"><Link to="/dutchpayByPrice">나중에바꿔</Link></div>
            <div className="ding-dong">
                {/* <button className="int">직원호출</button> */}
                <Button className='int' id="button-dingdong" variant="secondary" onClick={() => setModalShow(true)}> 직원호출 </Button>
                <Dingdong show={modalShow} onHide={() => setModalShow(false)} />
            </div>
        </div>

    );
}

export default Sidebar;