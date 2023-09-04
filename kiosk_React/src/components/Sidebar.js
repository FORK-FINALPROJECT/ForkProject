import React, { useState } from 'react'
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Dingdong from './DingdongModal';
import { useCategoryStore } from '../store/mainViewStore';


const Sidebar = () => {
    
    // 직원호출 모달
    const [modalShow, setModalShow] = useState(false);
    const categorys = useCategoryStore((state) => state.categorys);
    const setSubCategory = useCategoryStore((state) => state.setSubCategory);

    //const getCategory = useCategoryStore((state) => state.getCategory());

    
    return (

        // <div className="left-nav-wrap">
        //     <div className="category"><Link to="/">일단보기</Link></div>
        //     <div className="category"><Link to="/dutchpayByMenu">나중에바꾸기</Link></div>
        //     <div className="category"><Link to="/dutchpayByPrice">나중에바꿔</Link></div>
        //     <div className="ding-dong">
        //         {/* <button className="int">직원호출</button> */}
        //         <Button className='int' id="button-dingdong" variant="secondary" onClick={() => setModalShow(true)}> 직원호출 </Button>
        //         <Dingdong show={modalShow} onHide={() => setModalShow(false)} />
        //     </div>
        // </div>


        <div className="left-nav-wrap">

            {/* 여기만 반복 */}
            {/* {console.log(categorys)}  5초마다 실행됨 수정 필요 */}
            {categorys && categorys.map((category) => (
                <div className="category" onClick={() => setSubCategory(category.categoryNo) }><a>{category.categoryName}</a></div>
            ))}


            <div className="ding-dong">
                {/* <button className="int">직원호출</button> */}
                <Button className='int' id="button-dingdong" variant="secondary" onClick={() => setModalShow(true)}> 직원호출 </Button>
                <Dingdong show={modalShow} onHide={() => setModalShow(false)} />
            </div>
        </div>

    );
}

export default Sidebar;