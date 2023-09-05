let chart;
let chartDataLabels = [];
let chartDataDatasets = [];

const startDay = document.getElementById("start-day");
const endDay = document.getElementById("end-day");
const today = new Date();
const oneWeekBefore = new Date(new Date().setDate(today.getDate() - 7));
const chartArea = document.getElementById('chart-area').getContext('2d');

startDay.value = daySetting(oneWeekBefore);
endDay.value = daySetting(today);


drawChart(); // 페이지 로딩과 동시에 차트 불러오기

startDay.addEventListener('change', changeDate); // 시작일 변경시 차트 재로드
endDay.addEventListener('change', changeDate); // 종료일 변경시 차트 재로드




function daySetting(day){ // 날짜 세팅 함수
	const year = day.getFullYear();
	const month = day.getMonth()+1;
	const date = day.getDate();
	
	return year+"-"+zeroSetting(month)+"-"+zeroSetting(date);
}

function changeDate(key){
    let changeStartDay;

    if ( key == 'yesterday' ) {
        changeStartDay = new Date(new Date().setDate(today.getDate() - 1));
    } else if ( key == 'curretnMonth' ) {
        changeStartDay = new Date(new Date().setDate(1));        
    } else if ( key == 'previousMonth' ) {
        changeStartDay = new Date(new Date().setMonth(today.getMonth() - 1))
    } else {
    	changeStartDay = new Date(startDay.value);
    };
    
    startDay.value = daySetting(changeStartDay);
    
    chartDataLabels = [];
	chartDataDatasets = [];
	chart.update();
	chart.destroy();
    
    drawChart();
}

function zeroSetting(num){
    return num < 10 ? '0' + (num) : num;
}

function changeType(key){
    const area = document.querySelector(".choice-type-title");
    area.innerText = key+"통계";
}

function drawChart(){
	$.ajax({
		url: 'chart',
		data: {startDay: startDay.value, endDay: endDay.value},
		success(list){
			for(l of list){
				chartDataLabels.push(l.payDate);
				chartDataDatasets.push(l.price);
			}
			loadChart();
		}
	})
}
   
function loadChart(){
	const chartData = {
		labels: chartDataLabels,
	        datasets: [
	            { //데이터
	                label: '매출통계', //차트 제목
	                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                data: chartDataDatasets,
	                backgroundColor: 'orange', // 차트색상
	                borderColor: 'orange',
	                borderWidth: 1 //경계선 굵기
	            }/* ,
	            {
	                label: 'test2',
	                fill: false,
	                data: [
	                    8, 34, 12, 24
	                ],
	                backgroundColor: 'rgb(157, 109, 12)',
	                borderColor: 'rgb(157, 109, 12)'
	            } */
	        ]
	}
	
	chart = new Chart(chartArea, {
		type: 'bar', // 차트의 형태
		data: chartData,
	    options: {
	        scales: {
	            yAxes: [
	                {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                }
	            ]
	        }
	    }
	});
	
}

