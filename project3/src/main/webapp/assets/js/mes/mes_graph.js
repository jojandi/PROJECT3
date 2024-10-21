document.addEventListener('DOMContentLoaded', function() {
    // 초기 선택 값 설정 (페이지 로드 시 선택된 값)
    const yearSelect = document.getElementById('yearSelect');
    const monthSelect = document.getElementById('monthSelect');
    
    // 페이지 로드 시 기본 선택된 값을 가져옴
    let selectedYear = yearSelect.value || 2023;  // 기본값: 2023년
    let selectedMonth = monthSelect.value || 1;   // 기본값: 1월

    // 페이지 로드 시 처음 데이터를 가져옴
    loadBookStatistics(selectedYear, selectedMonth);

    // 연도 선택이 변경될 때 이벤트 처리
    yearSelect.addEventListener('change', function() {
        selectedYear = this.value;
        console.log(`Selected Year: ${selectedYear}`);
        loadBookStatistics(selectedYear, selectedMonth);
    });

    // 월 선택이 변경될 때 이벤트 처리
    monthSelect.addEventListener('change', function() {
        selectedMonth = this.value;
        console.log(`Selected Month: ${selectedMonth}`);
        loadBookStatistics(selectedYear, selectedMonth);
    });
});

// 도서 출고 통계 데이터를 가져와서 그래프와 테이블을 업데이트하는 함수
function loadBookStatistics(year, month) {
    console.log(`Fetching statistics for year: ${year}, month: ${month}`);

    // 서버로부터 데이터를 가져옴
    fetch(`/gamja/mes/mes_graph_data?year=${encodeURIComponent(year)}&month=${encodeURIComponent(month)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();  // JSON 형태로 응답을 받음
        })
        .then(data => {
            console.log('Received book statistics:', data);

            // 데이터가 없을 경우 경고 출력
            if (!data || data.length === 0) {
                console.warn('No data available for the selected year and month.');
                return;
            }

            // 데이터를 처리하여 그래프와 테이블을 업데이트
            updateChart(data);
            updateTable(data);
        })
        .catch(error => {
            console.error('Error fetching the book statistics:', error);
            alert('Error fetching book statistics. Please try again later.');
        });
}

// 데이터를 기반으로 차트를 업데이트하는 함수
function updateChart(data) {
    const labels = data.map(item => item.genre);  // JSON에서 'genre' 필드를 가져와 x축 라벨로 사용
    const totals = data.map(item => item.total);  // JSON에서 'total' 필드를 가져와 y축 데이터로 사용

    const ctx = document.getElementById('bookStatisticsChart').getContext('2d');

    // 기존 차트가 있으면 삭제 후 새로 생성
    if (window.bookChart) {
        window.bookChart.destroy();
    }

    // 새로운 차트를 생성
    window.bookChart = new Chart(ctx, {
        type: 'bar',  // 바 그래프
        data: {
            labels: labels,  // x축: 장르
            datasets: [{
                label: '장르별 도서 출고 수량',
                data: totals,  // y축: 출고량
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: '#7C83FD',
                borderWidth: 1
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
            }
        }
    });

    console.log("Chart updated successfully");
}

// 데이터를 기반으로 테이블을 업데이트하는 함수
function updateTable(data) {
    const tableBody = document.querySelector('#bookStatisticsTable tbody');

    // 기존 테이블 내용을 지움
    tableBody.innerHTML = '';

    // 새로운 데이터로 테이블 업데이트
    data.forEach(item => {
        const row = document.createElement('tr');
        const genreCell = document.createElement('td');
        genreCell.textContent = item.genre;  // 장르
        const totalCell = document.createElement('td');
        totalCell.textContent = item.total;  // 출고량

        row.appendChild(genreCell);
        row.appendChild(totalCell);
        tableBody.appendChild(row);
    });

    console.log('Table updated successfully');
}
