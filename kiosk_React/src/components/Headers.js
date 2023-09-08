import React, { useState } from 'react'
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';

const Headers = () => {
  const [content, setContent] = useState();

  const subCategorys = useCategoryStore((state) => state.subCategorys);
  const setSubCategory = useCategoryStore((state) => state.setSubCategory);

  const { scrollToSubCategory } = useScrollToSubCategoryStore();

  return (
    // <div className="header-wrap">
    //   <div className="header-content">
    //     <div className="header-logo-wrap">
    //       <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`} alt='로고'></img>
    //     </div>
    //     <div className="header category-wrap">
    //       <div className="detail-category"><a>상세카테고리1</a></div>
    //       <div className="detail-category"><a>상세카테고리2</a></div>
    //       <div className="detail-category"><a>상세카테고리3</a></div>
    //     </div>
    //     <div className="header-utils" id="header-utils">
    //       <div className="receipt-header-wrap">
    //         <div className="receipt-header">
    //           <a><img className="int-header" src={`${process.env.PUBLIC_URL}/file-invoice-dollar.svg`} alt='영수증로고'></img></a>
    //         </div>
    //       </div>
    //       <div className="cart-header-wrap">
    //         <div className="cart-header">
    //           <a><img className="int-header" src={`${process.env.PUBLIC_URL}/shopping-cart.svg`} alt='장바구니로고'></img></a>
    //         </div>
    //       </div>
    //     </div>
    //   </div>
    // </div>


    <div className="header-wrap">
      <div className="header-content">
        <div className="header-logo-wrap">
          <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`} alt='로고'></img>
        </div>
        <div className="header category-wrap">



          {subCategorys && subCategorys.map(subCategory => {
             return <div className="detail-category" key={subCategory.categoryName}><Link to="/" onClick={() => scrollToSubCategory(subCategory.categoryName)}>{subCategory.categoryName}</Link></div>
          })}
         
        
        
        
        
        
        </div>
        <div className="header-utils" id="header-utils">
          <div className="receipt-header-wrap">
            <div className="receipt-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/file-invoice-dollar.svg`} alt='영수증로고'></img></a>
            </div>
          </div>
          <div className="cart-header-wrap">
            <div className="cart-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/shopping-cart.svg`} alt='장바구니로고'></img></a>
            </div>
          </div>
        </div>
      </div>
    </div>













  );
}

export default Headers