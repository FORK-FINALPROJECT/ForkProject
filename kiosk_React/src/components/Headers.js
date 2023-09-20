import React, { useState,useEffect } from 'react'
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';
import axios from 'axios';
import {useReceiptStore} from '../store/receiptViewStore';
import { useNavigate } from 'react-router-dom';

const Headers = () => {
  const kioskNo = useReceiptStore((state) => state.kioskNo);
  const {setReceiptItems} = useReceiptStore();

  const navigate = useNavigate();
  const subCategorys = useCategoryStore((state) => state.subCategorys);
  const { scrollToSubCategory } = useScrollToSubCategoryStore();

  const handleCallReceipt = async () => {
    await axios?.post(`/kiosk/receipt/${kioskNo}`)?.then((response) => {
        setReceiptItems(response.data);
    }).catch((error) => {
        console.error('오오오류류류류', error);
    });
  }

  const toHome = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    navigate("/");
  }

  return (
    <div className="header-wrap">
      <div className="header-content">
        <div className="header-logo-wrap">
          
          <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`} alt='로고' onClick={toHome}></img>
          
        </div>
        <div id='flag'>
          No.{kioskNo}
        </div>
        <div className="header category-wrap">

          {subCategorys && subCategorys.map(subCategory => {
             return <div className="detail-category" key={subCategory.categoryName}><Link to="/" onClick={() => scrollToSubCategory(subCategory.categoryName)}>{subCategory.categoryName}</Link></div>
          })}
         
        
        </div>
        <div className="header-utils" id="header-utils">
          <div className="receipt-header-wrap">
            <div className="receipt-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/bill.png`} alt='영수증로고' onClick={handleCallReceipt}></img></a>
            </div>
          </div>
          <div className="cart-header-wrap">
            <div className="cart-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/add-cart.png`} alt='장바구니로고'></img></a>
            </div>
          </div>
        </div>
      </div>
    </div>













  );
}

export default Headers