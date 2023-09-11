setInterval("getTime()", 1000);

function getTime(){
    const time = document.getElementById("time");

    const today = new Date();
    const year = today.getFullYear();
    const month = today.getMonth()+1 < 10 ? '0' + (today.getMonth()+1) : today.getMonth()+1;
    const date = today.getDate() < 10 ? '0' + today.getDate() : today.getDate();
    
    const week = ['일','월','화','수','목','금','토'];
    let day = week[today.getDay()];

    let hours = today.getHours();
    hours = hours > 13 ? hours-12 : hours;
    hours = hours < 10 ? '0'+hours : hours;

    const ampm = hours > 12 ? 'AM' : 'PM' ;
    const minutes = today.getMinutes() < 10 ? '0' + today.getMinutes() : today.getMinutes();
    const second = today.getSeconds() < 10 ? '0' + today.getSeconds() : today.getSeconds();

    const livetime = year + '-' + month + '-' + date + ' (' + day + ') ' + ampm + ' ' + hours + ':' + minutes + ':' + second;

    time.innerHTML = livetime;
}
