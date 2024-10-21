window.onload = function () {
    const searchInput = document.getElementById('searchInput');
    const table = document.querySelector('#main_page_1 #main_library tbody');
    const rows = table.querySelectorAll('tr');

    // 검색 기능
    searchInput.addEventListener('input', function () {
        const query = searchInput.value.toLowerCase();

        rows.forEach(row => {
            const bookTitle = row.querySelector('td').textContent.toLowerCase();
            if (bookTitle.includes(query)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });

    
   
   
   
    document.querySelector('.sortable').addEventListener('click', function () {
        // 클릭된 열의 인덱스 가져오기
        const header = this;
        const index = Array.from(header.parentNode.children).indexOf(header);

        // 각 페이지의 테이블을 정렬합니다
        ['main_page_1', 'main_page_2', 'main_page_3'].forEach(pageId => {
            // 현재 페이지의 테이블 가져오기
            const table = document.querySelector(`#${pageId} #main_library`);
            if (table) {
                sortByTitle(table, index);
            }
        });
    });

    // 도서명으로 정렬하는 함수
    function sortByTitle(table, index) {
        const tbody = table.querySelector('tbody');
        const rows = Array.from(tbody.querySelectorAll('tr'));

        // 정렬
        rows.sort((a, b) => {
            const aText = a.cells[index].innerText.trim();
            const bText = b.cells[index].innerText.trim();
            return aText.localeCompare(bText);
        });

        // 정렬된 행을 테이블에 다시 추가
        rows.forEach(row => tbody.appendChild(row));
    }
    //완료 버튼으로 일단 삭제
    document.querySelector('#comp_btn').addEventListener('click', function () {
        const list = document.querySelectorAll('.page #main_library_2 .p2_main_chack:checked');

        if (list.length === 0) {
            alert("삭제할 항목을 선택해주세요.");
            return;
        }

        const confirmDelete = confirm("선택한 항목을 삭제하시겠습니까?");

        if (confirmDelete) {
            list.forEach(checkbox => {
                const row = checkbox.closest('tr');
                if (row) {
                    row.remove();
                }
            });
        }
    });
    // page4
    // pi4.addEventListener('click', function () {
    //     document.querySelector('#main_page_4').style.display = 'inline-block';
    //     document.querySelector('#main_page_1').style.display = 'none';
    //     document.querySelector('#main_page_2').style.display = 'none';
    //     document.querySelector('#main_page_3').style.display = 'none';
    // });
}

