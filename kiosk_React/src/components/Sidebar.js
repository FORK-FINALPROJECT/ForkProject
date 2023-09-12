import React, { useReducer, useRef, useState } from 'react'
import Button from 'react-bootstrap/Button';
import Dingdong from './DingdongModal';
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';

const Sidebar = () => {
    
    // 직원호출 모달
    const [modalShow, setModalShow] = useState(false);
    const categorys = useCategoryStore((state) => state.categorys);
    const setSubCategory = useCategoryStore((state) => state.setSubCategory);
    
    const { scrollToSubCategory } = useScrollToSubCategoryStore();
    //const getCategory = useCategoryStore((state) => state.getCategory());
    const [count, setCount] = useState(0);

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
                <div className="category" onClick={() => {setSubCategory(category.categoryNo); scrollToSubCategory(); } }><Link to="/" >{category.categoryName}</Link></div>
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