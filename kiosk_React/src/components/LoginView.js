import React,{useState} from 'react'
import '../resources/css/login.css';

const LoginView = () => {
    const [kioskNo, setKioskNo] = useState('');
    const [loginSuccess, setLoginSuccess] = useState(false);

    const handleLogin = () => {
        setLoginSuccess(true);
        sessionStorage.setItem('isLoggedIn','true');
    }

    return (

        <body oncontextmenu='return false' class='snippet-body'>
            <div class="wrapper bg-white">
                <div class="h2 text-center">
                    <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`}></img>
                </div>
                <form class="pt-3">
                    <div class="form-group py-2">
                        <div class="input-field">
                            <span class="far fa-user p-2"></span>
                            <input type="text" placeholder='테이블 번호를 입력하세요' vlaue={kioskNo} onChange={(e) => setKioskNo(e.target.value)} required/>
                        </div>
                    </div>

                    <button class="btn btn-block text-center my-3" onClick={handleLogin}>로그인</button>
                </form>
            </div>
        </body>

    );

}

export default LoginView;