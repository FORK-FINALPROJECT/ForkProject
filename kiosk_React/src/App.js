// css
import './resources/css/nav, sidbar, receipt, cart.css';
import './resources/css/kiosk.css';
// components
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Headers from './components/Headers';
import Sidebar from './components/Sidebar';
import ReceiptView from './components/ReceiptView';
import CartView from './components/CartView';
import MenuList from './components/MenuList';
import MenuDetail from './components/MenuDetail';
import DutchpayByMenu from './components/DutchpayByMenu';
import DutchpayByPrice from './components/DutchpayByPrice';
import useFullscreen from './components/useFullscreen';
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import LoginView from './components/LoginView';

// 터치 / 터치스크롤로 수정하기
// 화면보호기 화면
const standByScreen1 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen1.png')} /></div>
const standByScreen2 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen2.png')} /></div>
const standByScreen3 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen3.png')} /></div>
const standByScreen4 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen4.png')} /></div>

function App() {
  // 동연 시작  

  // 풀스크린 기능 시작
  const { isFullscreen, enterFullscreen, exitFullscreen } = useFullscreen();

  const toggleFullscreen = () => {
    if (isFullscreen) {
      exitFullscreen();
    } else {
      enterFullscreen();
    }
  };
  // 풀스크린 끝
  // 화면보호기 기능 시작

  // 화면보호기 화면을 인덱스로 관리
  const [standByScreenIndex, setStandByScreenIndex] = useState(0);
  // 화면보호기 화면 리스트
  const standByScreenList = [
    standByScreen1,
    standByScreen2,
    standByScreen3,
    standByScreen4
  ];
  // 화면 변경
  const changeStandByScreen = () => {
    setStandByScreenIndex((prevIndex) => {
      return (prevIndex + 1) % standByScreenList.length
    });
  };
  // 5초마다 변경
  useEffect(() => {
    const intervalScreen = setInterval(changeStandByScreen, 5000);

    // 언마운트 될 때 인터벌 제거
    return () => {
      clearInterval(intervalScreen);
    }

  }, []);

  const [standByScreen, setStandByScreen] = useState(false);

  useEffect(() => {
    let standeByTimer;

    const resetStandByTimer = () => {
      // 해당 시간동안 동작이 없으면 실행
      standeByTimer = setTimeout(() => {
        setStandByScreen(true);
      }, 3 * 100 * 100); // 30초로 바꿔놓음
    };

    const handleUserUsing = () => {
      // 사용자가 사용시 타이머 재설정
      clearTimeout(standeByTimer);
      setStandByScreen(false);
      resetStandByTimer();
    };

    // 화면이 처음 로드될때 타이머 설정
    resetStandByTimer();

    // 사용자가 사용하고 타이머 재설정
    document.addEventListener('mousemove', () => {
      setTimeout(() => {
        handleUserUsing()
      }, 100)
    });
    document.addEventListener('keydown', handleUserUsing);

    // 언마운트될때 이벤트 제거
    return () => {
      document.removeEventListener('mousemove', handleUserUsing);
      document.removeEventListener('keydown', handleUserUsing);
      clearTimeout(standeByTimer);
    };
  }, [standByScreen]);

  // 화면보호기 끝

  // 동연 끝
  // 서뉴 시작

  useEffect(() => {

    // 장바구니 영수증 보여지게.
    function hideAndShow(wrapper, button, className) {
      button.addEventListener('click', function (e) {
        button.classList.add("btn-focus");
        button.children[0].classList.add("btn-focused");
        wrapper.style.display = "block";
        wrapper.classList.add(className);
        button.querySelector('a').style.color = 'black';
      });

      document.addEventListener('mouseup', function (e) {
        if (!wrapper.contains(e.target) && wrapper !== e.target) {
          wrapper.style.display = 'none';
          wrapper.classList.remove(className);
          button.classList.remove("btn-focus");
          button.children[0].classList.remove("btn-focused");
          button.querySelector('a').style.color = '';
        }
      });
    }

    const cart = document.querySelector(".cart-wrap");
    hideAndShow(cart, document.querySelector(".cart-header-wrap"), 'emphasized');

    const receipt = document.querySelector(".receipt-wrap");
    hideAndShow(receipt, document.querySelector(".receipt-header-wrap"), 'emphasized');

    const receiptDetailButtons = document.querySelectorAll(".receipt-detail-btn");
    const receiptDetailTop = document.querySelector(".receipt-detail-header-wrap");
    const receiptHeaderButton = document.querySelector(".receipt-header-wrap");

    hideAndShow(receipt, receiptHeaderButton, 'emphasized');

    // 수정================ 반복문 돌려돌려돌림판
    receiptDetailButtons.forEach(receiptDetailButton => {
      receiptDetailButton.addEventListener("click", function () {
        const receiptViews = document.querySelectorAll(".receipt-view");
        for (const view of receiptViews) {
          view.style.display = "none";
        }
        // 반복문 돌린 다음에 상세정보 보이게
        receiptDetailTop.style.display = "block";
      });
    })

    // 스크롤 기능. 원하는 div 상위 영역에 클래스명 추가시 모두 사용 가능
    const scrollableDivs = document.getElementsByClassName('scrollable');

    [].forEach.call(scrollableDivs, function (item) {
      let isMouseDown = false;
      let startY;
      let startScrollTop;

      item.addEventListener('mousedown', (e) => {
        isMouseDown = true;
        startY = e.pageY - item.offsetTop;
        startScrollTop = item.scrollTop;
      });

      item.addEventListener('mouseup', () => {
        isMouseDown = false;
      });

      item.addEventListener('mousemove', (e) => {
        if (!isMouseDown) return;
        e.preventDefault();

        const newY = e.pageY - item.offsetTop;
        const deltaY = newY - startY;

        item.scrollTop = startScrollTop - deltaY;
      });

      item.addEventListener('mouseleave', () => {
        isMouseDown = false;
      });
    });

    //스프링부트 연결
    axios.get("http://localhost:3000/kiosk/category").then((response) => {
      console.log(response, response.data);
    }).catch(console.log);

  }, []);

  // 선유 끝
  

  return (
    <>
      {standByScreen && (
        <div className='screenContainer'>
          {standByScreenList.map((Screen, index) => (
            <div
              key={index}
              className={`screen ${index === standByScreenIndex ? 'slide-in' : 'slide-out'}`}
            >
              <Screen />
            </div>
          ))}
        </div>
      )}

      <Router>
        {/* 전체화면 보기 버튼 */}
        {isFullscreen ? null : (
          <button onClick={toggleFullscreen}>
            전체화면으로 보기
          </button>
        )}
      
        <div className="main-wrap">
          <Headers />
          <div className="body-wrap">
            <Sidebar />
            <ReceiptView />
            <CartView />
            <Routes>
              <Route path='/' element={<MenuList />} />
              <Route path='/menuDetail' element={<MenuDetail />} />
              <Route path='/dutchpayByMenu' element={<DutchpayByMenu />} />
              <Route path='/dutchpayByPrice' element={<DutchpayByPrice />} />
            </Routes>
          </div>
        </div>
      </Router>

    </>
  );
}

export default App;
