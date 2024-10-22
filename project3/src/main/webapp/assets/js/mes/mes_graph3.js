document.addEventListener('DOMContentLoaded', function() {
    const yearSelect = document.getElementById('yearSelectForecast');
    const monthSelect = document.getElementById('monthSelectForecast');
    
    let selectedYear = yearSelect.value || 2024;
    let selectedMonth = monthSelect.value || 1;

    // 페이지 로드 시 처음 데이터를 가져옴
    loadForecastStatistics(selectedYear, selectedMonth);

    // 연도 선택이 변경될 때 이벤트 처리
    yearSelect.addEventListener('change', function() {
        selectedYear = this.value;
        loadForecastStatistics(selectedYear, selectedMonth);
    });

    // 월 선택이 변경될 때 이벤트 처리
    monthSelect.addEventListener('change', function() {
        selectedMonth = this.value;
        loadForecastStatistics(selectedYear, selectedMonth);
    });
});

// 데이터를 가져와 차트와 테이블을 동시에 업데이트하는 함수
function loadForecastStatistics(year, month) {
    console.log(`Fetching forecast statistics for year: ${year}, month: ${month}`);

    fetch(`/gamja/mes/mes_graph_data_3?year=${encodeURIComponent(year)}&month=${encodeURIComponent(month)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();  // JSON 형태로 응답을 받음
        })
        .then(data => {
            console.log('Received forecast statistics:', data);

            if (!data || data.length === 0) {
                console.warn('No forecast statistics available for the selected period.');
                return;
            }

            // 차트 업데이트
            updateChart(data);

            // 테이블 업데이트
            updateForecastTable(data);
        })
        .catch(error => {
            console.error('Error fetching forecast statistics:', error);
            alert('Error fetching forecast statistics. Please try again later.');
        });
}

// 데이터를 기반으로 차트를 업데이트하는 함수
function updateChart(data) {
    const labels = data.map(item => item.genre);
    const expectedDemands = data.map(item => item.expectedDemand);

    const ctx = document.getElementById('forecastStatisticsChart').getContext('2d');

    if (window.forecastChart) {
        window.forecastChart.destroy();
    }

    window.forecastChart = new Chart(ctx, {
        type: 'line',  // 선 그래프
        data: {
            labels: labels,  // x축: 장르
            datasets: [{
                label: '예측 수요량',
                data: expectedDemands,  // y축: 예측 수요량
                backgroundColor: 'rgba(124, 131, 253, 0.2)',  // 파스텔 블루
                borderColor: '#7C83FD',  // 진한 파란색
                pointBackgroundColor: 'rgba(255, 0, 0, 1)',  // 포인트 색상 (빨간색)
                pointBorderColor: '#7C83FD',
                borderWidth: 3,
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        font: {
                            family: 'Arial',
                            weight: 'bold',
                            size: 14
                        }
                    }
                },
                x: {
                    ticks: {
                        font: {
                            family: 'Arial',
                            weight: 'bold',
                            size: 12
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
}

// 데이터를 기반으로 테이블을 업데이트하는 함수
function updateForecastTable(data) {
    const tableBody = document.getElementById('forecastStatisticsTable').getElementsByTagName('tbody')[0];

    // 테이블 초기화
    tableBody.innerHTML = '';

    // 데이터를 테이블에 추가
    data.forEach(item => {
        const row = document.createElement('tr');

        const genreCell = document.createElement('td');
        genreCell.textContent = item.genre;
        row.appendChild(genreCell);

        const demandCell = document.createElement('td');
        demandCell.textContent = item.expectedDemand.toFixed(2);
        row.appendChild(demandCell);

        tableBody.appendChild(row);
    });
}
