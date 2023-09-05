import { Link } from 'react-router-dom';
import { useCategoryStore } from '../store/mainViewStore';
import React from 'react';



const MenuList = () => {

    const subCategorys = useCategoryStore((state) => state.subCategorys);
    const springUrl = 'http://localhost:8083/kiosk';

    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-menu">
                    {subCategorys && subCategorys.map(subCategory => {
                            return(
                                <>
                                    <div className="page-head">
                                        <p className="main-content-detail-category">{subCategory.categoryName}</p>
                                    </div>
                                    <div className="menu-list">
                                        {
                                            subCategory.menuList && subCategory.menuList.map( menu => {
                                                return (
                                                    <ul>
                                                        <Link to="menuDetail" state={menu}>
                                                            <li><img src={ springUrl + menu.filePath + menu.originName } alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                                            <li>{menu.menuName}</li>
                                                            <li>{menu.price.toLocaleString('ko-KR')} 원</li>
                                                        </Link>
                                                    </ul>
                                                )
                                            })
                                        }
                                    </div>
                                </>
                            )
                        })
                    }
                </div>
            </div>
        </div>
    );
}

export default MenuList;