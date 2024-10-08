window.onload = function () {
     const modal = document.getElementById('formModal');
    const openFormButton = document.getElementById('openForm');
    const closeButton = document.querySelector('.close');
    const form = document.getElementById('workForm');
	// 검색 기능
	document.getElementById('searchInput').addEventListener('keyup', function() {
    let filter = this.value.toUpperCase();
    let table = document.getElementById('main_library');
    let tr = table.getElementsByTagName('tr');

    // 테이블의 모든 행을 반복하여 검색어와 일치하는지 확인
    for (let i = 1; i < tr.length; i++) { // 첫 번째 행(헤더)은 제외
        let td = tr[i].getElementsByTagName('td')[2]; // 세 번째 열(작성자)에서 검색
        
	        if (td) {
	            let txtValue = td.textContent || td.innerText;
	            
	            // 검색어와 일치하면 해당 행을 표시, 그렇지 않으면 숨김
	            if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                tr[i].style.display = "";
	            } else {
	                tr[i].style.display = "none";
	            }
	        }
	    }
	});
    
}

// BOM 행 더블클릭시 모달 화면 추가 스크립트
    function showModal() {
        document.getElementById('modal_4').style.display = 'block';
    }
    
    function hideModal() {
        document.getElementById('modal_4').style.display = 'none';
    }
    
    // 더블클릭시 모달창 
    document.addEventListener('DOMContentLoaded', () => {
        const rows = document.querySelectorAll('#main_library tbody tr');
        rows.forEach(row => {
            row.addEventListener('click', showModal);
        });
    
        // 클로즈버튼 이벤트
        const closeButton = document.querySelector('#modal_4 .close_4');
        closeButton.addEventListener('click', hideModal);
    
        // 모달창 외부 클릭시 닫히는 이벤트
        window.addEventListener('click', (event) => {
            if (event.target === document.getElementById('modal_4')) {
                hideModal();
            }
        });
    });
    
document.addEventListener('DOMContentLoaded', function() {
            const dataTable = document.getElementById('main_library');
            const modal = document.getElementById('modal_4');
            const modalTable = document.getElementById('modalTable');
            
            // 데이터 행 클릭 이벤트 추가
            dataTable.addEventListener('click', function(event) {
                const targetRow = event.target.closest('.data-row');
                
                if (targetRow) {
                    const itemId = targetRow.getAttribute('data-id');
                    const title = targetRow.cells[1].innerText;
                    const userId = targetRow.cells[2].innerText;
                    const date = targetRow.cells[3].innerText;
                    const score = targetRow.cells[4].innerText;
                    const contents = targetRow.cells[5].innerText;
                    

                    
                    modalTable.innerHTML = `
                        <tr>
                            <td><span class="modal-item">제목</span></td>
                            <td>${title}</td>
                        </tr>
                        <tr>
                            <td><span class="modal-item">회원 ID</span></td>
                            <td>${userId}</td>
                        </tr>
                        <tr>
                            <td><span class="modal-item">평점</span></td>
                            <td>${score}</td>
                        </tr>
                        <tr>
                            <td><span class="modal-item">내용</span></td>
                            <td>${contents}</td>
                        </tr>
                        <tr>
                            <td><span class="modal-item">작성일</span></td>
                            <td>${date}</td>
                        </tr>
                    `;
                }
            });
        });