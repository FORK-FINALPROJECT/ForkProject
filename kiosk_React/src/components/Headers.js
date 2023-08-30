import React, { useState } from 'react'

const Headers = () => {
  const [content, setContent] = useState();

  return (
    <div className="header-wrap">
      <div className="header-content">
        <div className="header-logo-wrap">
          <img id='header-logo' src={`${process.env.PUBLIC_URL}/포크로고 ver2`} />
        </div>
        <div className="header category-wrap">
          <div className="detail-category"><a>상세카테고리1</a></div>
          <div className="detail-category"><a>상세카테고리2</a></div>
          <div className="detail-category"><a>상세카테고리3</a></div>
        </div>
        <div className="header-utils" id="header-utils">
          <div className="receipt-header-wrap">
            <div className="receipt-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/file-invoice-dollar.svg`}></img></a>
            </div>
          </div>
          <div className="cart-header-wrap">
            <div className="cart-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/shopping-cart.svg`}></img></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Headers