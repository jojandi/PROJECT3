// 페이지 로드 후 실행
document.addEventListener('DOMContentLoaded', function() {
    // JSP에서 전달된 데이터를 숨겨진 HTML 요소에서 가져오기
    var dataContainer = document.getElementById('dataContainer');
    var orderCount = parseInt(dataContainer.getAttribute('data-order-count'), 10);  // 주문 수량
    var deliveryCount = parseInt(dataContainer.getAttribute('data-delivery-count'), 10);  // 출고 수량

    // 그래프를 생성할 캔버스 선택
    var ctx = document.getElementById('orderDeliveryChart').getContext('2d');

    // Chart.js를 사용하여 도넛 그래프 생성
    var myDoughnutChart = new Chart(ctx, {
        type: 'doughnut',  // 도넛 그래프 유형
        data: {
            labels: ['주문 수량', '출고 수량'],  // 라벨 설정
            datasets: [{
                data: [orderCount, deliveryCount],  // 데이터 값 설정 (주문 수량, 출고 수량)
                backgroundColor: ['#A7EB5A', '#EEF18D'],  // 각 데이터의 색상
                hoverBackgroundColor: ['#A7EB5A', '#EEF18D']
            }]
        },
        options: {
            responsive: false,  // 반응형 설정
            plugins: {
                legend: {
                    position: 'top',  // 범례의 위치 설정
                },
                tooltip: {
                    enabled: true  // 툴팁 활성화
                }
            }
        }
    });
});
