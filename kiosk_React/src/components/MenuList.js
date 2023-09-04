import { Link } from 'react-router-dom';
import { useCategoryStore } from '../store/mainViewStore';

const MenuList = () => {

    const menus = useCategoryStore((state) => state.menus);
    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-menu">
                    <div className="page-head">
                        <p className="main-content-detail-category">세부카테고리</p>
                    </div>
                    <div className="menu-list">
                        {
                            menus && menus.map( menu => {

                                return (
                                    <ul>
                                    <Link to="menuDetail">
                                        <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                        <li>{menu.menuName}</li>
                                        <li>{menu.price}</li>
                                    </Link>
                                </ul>
                                )
                            })
                        }
                        {/* <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul> */}
                    </div>
                </div>
                <div className="main-content-menu">
                    <p className="main-content-detail-category">세부카테고리</p>
                    <div className="menu-list">
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                        <ul>
                            <Link to="menuDetail">
                                <li><img src={require('../resources/image/menuTest.jpg')} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/></li>
                                <li>메뉴이름</li>
                                <li>가격</li>
                            </Link>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default MenuList;