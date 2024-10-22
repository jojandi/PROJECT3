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

document.addEventListener('DOMContentLoaded', function() {
    const dataTable = document.getElementById('main_library');
    const modal = document.getElementById('modal_4');
    const modalTable = document.getElementById('modalTable');

    // 제목 셀 클릭 이벤트 추가 (title-cell 클래스가 있는 셀에만)
    dataTable.addEventListener('click', function(event) {
        const targetCell = event.target; // 클릭한 셀 확인

        // title-cell 클래스를 가진 셀인지 확인
        if (targetCell.classList.contains('title-cell')) {
            const targetRow = targetCell.closest('.data-row'); // 클릭한 셀이 속한 행

            if (targetRow) {
                const title = targetRow.cells[1].innerText;
                const userId = targetRow.cells[2].innerText;
                const date = targetRow.cells[3].innerText;
                const score = targetRow.cells[5].innerText;
                const contents = targetRow.cells[6].innerText;

                // 모달 테이블에 데이터 채우기
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

                // 모달 보이기
                modal.style.display = "block";
            }
        }
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = "none";  // 모달 창 닫기
        }
    });

    // 닫기 버튼으로 모달 닫기
    document.querySelector('.close_4').addEventListener('click', function() {
        modal.style.display = "none";
    });
});
