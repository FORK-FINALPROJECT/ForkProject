import React, { useState,useEffect } from 'react'
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';
import axios from 'axios';
import {useReceiptStore} from '../store/receiptViewStore';
import SockJS from 'sockjs-client';
import { Stomp } from '@stomp/stompjs';
import { useSaveData } from "../store/saveData";
import useSocketStore from "../store/socketStore";

const Headers = () => {
  const [content, setContent] = useState();
  const kioskNo = useReceiptStore((state) => state.kioskNo);
  const {setReceiptItems} = useReceiptStore();

  const subCategorys = useCategoryStore((state) => state.subCategorys);
  const setSubCategory = useCategoryStore((state) => state.setSubCategory);

  const {stompClient , setStompClient} = useSocketStore();

  const { scrollToSubCategory } = useScrollToSubCategoryStore();

  const [websocket, setWebSocket] = useState(null);

  useEffect(() => {
      // 스프링 부트 서버의 SockJS 엔드포인트 URL
      const createWebSocket = () => new SockJS('http://localhost:3000/kiosk/user'); // 스프링 부트 서버 주소로 변경
      const stompClient = Stomp.over(createWebSocket); // 최적화 1) 연결종료시 재연결할수있는 웹소켓 생성 팩토리 전달

      stompClient.connect({}, (frame) => {
          console.log("웹소켓 연결", frame);
         // 여기서 컨트롤러로 연결 여러개 추가 가능
          stompClient.subscribe( `/kiosk/clearTable/${kioskNo}` ,frame => {
            console.log(frame.body);
          });
          stompClient.subscribe( `/kiosk/end/${kioskNo}` ,frame => {
            console.log(frame.body);
          });

          // stompClient.send(`/user/send/${kioskNo}`,{} , '잘가니가니??');
      });
      setStompClient(stompClient);
      
      return () => {
          console.log('연결해제')
          stompClient.disconnect();
      }
  },[]);

  const handleCallReceipt = async () => {
    await axios?.post(`/kiosk/receipt/${kioskNo}`)?.then((response) => {
        // sessionStorage.setItem('receiptList',JSON.stringify(response.data));
        console.log("영수증 정보정보", response.data)
        setReceiptItems(response.data);
    }).catch((error) => {
        console.error('오오오류류류류', error);
    });
  }





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
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/file-invoice-dollar.svg`} alt='영수증로고' onClick={handleCallReceipt}></img></a>
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