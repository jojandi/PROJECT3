window.onload = function () {
    const searchInput = document.getElementById('searchInput');
    const table = document.querySelector('#main_page_1 #main_library tbody');


    
    
    // page2
    
    

    document.querySelector('.sortable').addEventListener('click', function () {
        // 클릭된 열의 인덱스 가져오기
        const header = this;
        const index = Array.from(header.parentNode.children).indexOf(header);

        // 각 페이지의 테이블을 정렬합니다
        ['main_page_1', 'main_page_2'].forEach(pageId => {
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
    //작업지시서 검색기능
	document.getElementById('searchInput').addEventListener('keyup', function() {
    let filter = this.value.toUpperCase();
    let table = document.getElementById('main_library1');
    let tr = table.getElementsByTagName('tr');

    for (let i = 1; i < tr.length; i++) {
        let td = tr[i].getElementsByTagName('td')[0];
        if (td) {
            let txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
});
// 통합검색
document.getElementById('searchAll').addEventListener('keyup', function() {
    let filter = this.value.toUpperCase();
    let table = document.getElementById('main_library');
    let tr = table.getElementsByTagName('tr');

    for (let i = 1; i < tr.length; i++) { // 첫 번째 행(헤더)은 제외
        let tdArray = tr[i].getElementsByTagName('td');
        let isMatch = false;

        // 각 열의 텍스트 값을 검색어와 비교
        for (let j = 0; j < tdArray.length; j++) {
            let td = tdArray[j];
            if (td) {
                let txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    isMatch = true;
                    break;
                }
            }
        }

        // 검색어와 일치하는 열이 있으면 행을 표시, 없으면 숨김
        if (isMatch) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }
    }
});


}

 