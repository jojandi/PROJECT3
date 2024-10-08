window.onload = function () {
    const searchInput = document.getElementById('searchInput');
    const table = document.querySelector('#main_page_1 #main_library tbody');


    
    // 전체선택
    document.querySelector('#main_page_1 #p1_checkAll').addEventListener('click', function () {
        const isChecked = document.querySelector('#main_page_1 #p1_checkAll').checked;
        if (isChecked) {
            const checkboxes = document.querySelectorAll('#main_page_1 .p1_main_chack');

            for (const checkbox of checkboxes) {
                checkbox.checked = true;
            }
        }

        else {
            const checkboxes = document.querySelectorAll('.p1_main_chack');
            for (const checkbox of checkboxes) {
                checkbox.checked = false;
            }
        }


    })
    // page2
    
    // 전체선택
    document.querySelector('#main_page_2 #p1_checkAll').addEventListener('click', function () {
        const isChecked = document.querySelector('#main_page_2 #p1_checkAll').checked;
        if (isChecked) {
            const checkboxes = document.querySelectorAll('#main_page_2 .p1_main_chack');

            for (const checkbox of checkboxes) {
                checkbox.checked = true;
            }
        }

        else {
            const checkboxes = document.querySelectorAll('#main_page_2 .p1_main_chack');
            for (const checkbox of checkboxes) {
                checkbox.checked = false;
            }
        }
    })

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


    // 작업지시서 생성 버튼 누를 시 모달2 화면 추가 스크립트
    let addbtn = document.getElementById('addbtn');
    let span = document.getElementsByClassName('close_2')[0];
    let modal2 = document.getElementById('modal_2');

    addbtn.onclick = function () {
        modal2.style.display = 'block';
    }

    span.onclick = function () {
        modal2.style.display = 'none';
    }

    window.onclick = function (event) {
        if (event.target === modal2) {
            modal2.style.display = 'none';
        }
    }
    
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
            row.addEventListener('dblclick', showModal);
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

