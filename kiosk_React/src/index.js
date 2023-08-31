import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import LoginView from './components/LoginView';

const root = ReactDOM.createRoot(document.getElementById('root'));
const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';

root.render(
    <React.StrictMode>
        {isLoggedIn ? <App /> : <LoginView />}
    </React.StrictMode>,
);


