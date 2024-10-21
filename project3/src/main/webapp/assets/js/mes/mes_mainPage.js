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

            const labels = data.map(item => item.genre);  // 장르 데이터
            const demands = data.map(item => item.demand);  // 수요량 데이터

            const ctx = document.getElementById('demandStatisticsChart').getContext('2d');

            // 기존 차트가 있으면 삭제
            if (demandChart) {
                demandChart.destroy();
            }

            // 새로운 수요 통계 차트 생성
            demandChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '장르별 도서 수요량',
                        data: demands,
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                              max: 100,
                              ticks: {
                                font: {
                                    family: 'Arial',  // 폰트 종류
                                    weight: 'bold',  // 폰트 두께 (두껍게)
                                    size: 14         // 글자 크기
                                }
                            }
                         },
                          x: {
                            ticks: {
                                font: {
                                    family: 'Arial',  // 폰트 종류
                                    weight: 'bold',  // 폰트 두께 (두껍게)
                                    size: 12        // 글자 크기
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching demand statistics:', error);
        });
       }
 // 페이지가 로드되면 실행
document.addEventListener('DOMContentLoaded', function() {
    // 수요 예측 통계 이벤트 리스너 추가
    document.getElementById('yearSelectForecast').addEventListener('change', loadForecastStatistics);
    document.getElementById('monthSelectForecast').addEventListener('change', loadForecastStatistics);

    // 페이지 로드 시 첫 데이터를 로드
    loadForecastStatistics();
});

function loadForecastStatistics() {
    const selectedYear = document.getElementById('yearSelectForecast').value;
    const selectedMonth = document.getElementById('monthSelectForecast').value;

    fetch(`/mmes_page/demandForecast?year=${selectedYear}&month=${selectedMonth}`)
        .then(response => response.json())
        .then(data => {
            console.log('Received forecast statistics:', data); 

            if (data.length === 0) {
                console.warn('No forecast statistics available for the selected period.');
                return;
            }

            const labels = data.map(item => item.genre);  // 장르 데이터
            const expectedDemands = data.map(item => item.expectedDemand);  // 예측 수요량 데이터

            const ctx = document.getElementById('forecastStatisticsChart').getContext('2d');

            // 기존 차트가 있으면 삭제
            if (forecastChart) {
                forecastChart.destroy();
            }

            // 새로운 수요 예측 차트 생성 (선 그래프)
            forecastChart = new Chart(ctx, {
                type: 'line',  // 선 그래프 타입
                data: {
                    labels: labels,  // 장르명
                    datasets: [{
                        label: '예측 수요량',
                        data: expectedDemands,
                        backgroundColor: '#7C83FD',  // 파스텔 빨간색
                        borderColor: '#7C83FD',  // 진한 파란색
                        pointBackgroundColor: 'rgba(255, 0, 0, 1)',  // 포인트 색상 (빨간색)
                        pointBorderColor: '#7C83FD',  // 포인트 테두리 색상 (파란색)
                        pointHoverBackgroundColor: 'rgba(0, 0, 255, 1)',  // 포인트 호버 색상 (파란색)
                        pointHoverBorderColor: 'rgba(255, 0, 0, 1)',  // 포인트 호버 테두리 색상 (빨간색)
                        borderWidth: 3,
                        fill: false  // 선 그래프의 하단 영역 채우기 옵션 (필요 시 true로 변경)
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                font: {
                                    family: 'Arial',  // 폰트 종류
                                    weight: 'bold',  // 폰트 두께 (두껍게)
                                    size: 14         // 글자 크기
                                }
                            }
                            
                         },
                          x: {
                            ticks: {
                                font: {
                                    family: 'Arial',  // 폰트 종류
                                    weight: 'bold',  // 폰트 두께 (두껍게)
                                    size: 12        // 글자 크기
                                }
                            }
                        }
                    },
                    elements: {
                        line: {
                            tension: 0.4  // 선의 곡률 (0: 직선, 1: 곡선)
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching forecast statistics:', error);
        });
}


		//------------모달창------------
	  document.addEventListener('DOMContentLoaded', function () {
            const modalButtons = document.querySelectorAll('.open-modal');
            const closeButtons = document.querySelectorAll('.close');
            const modals = document.querySelectorAll('.modal');

            // 모달 열기 이벤트
            modalButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const modalId = button.getAttribute('data-modal');
                    const modal = document.getElementById(modalId);

                    // 데이터를 불러오는 부분 (API 호출은 각 모달마다 다름)
                    if (modalId === 'bookStatisticsModal') {
                        fetchBookStatistics();
                    } else if (modalId === 'demandStatisticsModal') {
                        fetchDemandStatistics();
                    } else if (modalId === 'forecastStatisticsModal') {
                        fetchForecastStatistics();
                    }

                    // 모달을 보여줌
                    modal.style.display = 'block';
                });
            });

            // 모달 닫기 이벤트
            closeButtons.forEach(button => {
                button.addEventListener('click', function () {
                    modals.forEach(modal => modal.style.display = 'none');
                });
            });

            // 모달 외부 클릭 시 닫기
            window.addEventListener("click", function(event) {
            if (event.target.classList.contains('modal')) {
                    modals.forEach(modal => modal.style.display = 'none');
                }
            })
        });

        // 데이터 불러오기 함수
        function fetchBookStatistics() {
            fetch(`/mmes_page/getBookStatistics?year=2023&month=9`)
                .then(response => response.json())
                .then(data => {
                    const tbody = document.querySelector('#bookStatisticsTable tbody');
                    tbody.innerHTML = '';
                    data.forEach(item => {
                        const row = document.createElement('tr');
                        row.innerHTML = `<td>${item.genre}</td><td>${item.total}</td>`;
                        tbody.appendChild(row);
                    });
                })
                .catch(error => console.error('출고 통계 데이터 처리 중 오류 발생:', error));
        }
    });
});
