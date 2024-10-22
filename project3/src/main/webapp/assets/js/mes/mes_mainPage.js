document.addEventListener('DOMContentLoaded', function() {
    // JSP에서 전달된 데이터를 숨겨진 HTML 요소에서 가져오기
    var dataContainer = document.getElementById('dataContainer');
    
    // dataContainer가 제대로 선택되었는지 확인
    if (!dataContainer) {
        console.error("dataContainer 요소를 찾을 수 없습니다.");
        return;
    }

    var orderCount = parseInt(dataContainer.getAttribute('data-order-count'), 10);  // 주문 수량
    var deliveryCount = parseInt(dataContainer.getAttribute('data-delivery-count'), 10);  // 출고 수량

    // 데이터가 제대로 읽혀졌는지 확인
    console.log("주문 수량:", orderCount, "출고 수량:", deliveryCount);

    // 테이블에 데이터를 삽입
    var orderCountCell = document.getElementById('orderCountCell');
    var deliveryCountCell = document.getElementById('deliveryCountCell');

    if (orderCountCell && deliveryCountCell) {
        orderCountCell.textContent = orderCount;
        deliveryCountCell.textContent = deliveryCount;
    } else {
        console.error("테이블 셀이 존재하지 않습니다.");
    }

    // 그래프를 생성할 캔버스 선택
    var ctx = document.getElementById('orderDeliveryChart').getContext('2d');

    // 도넛 그래프 생성
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
                    display: true, // 범례 활성화 (기본값 true)
				  	position: 'top', // 범례를 상단에 위치
				    align: 'end' // 오른쪽으로 정렬
                },
                tooltip: {
                    enabled: true  // 툴팁 활성화
                }
            }
        }
    });

    // 도넛 그래프 생성 완료 로그
    console.log("도넛 그래프 생성 완료.");
});
