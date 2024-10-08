window.onload = function () {

    // 모달1 관련 로직
    const modal1 = document.getElementById('formModal1');
    const openFormButton1 = document.getElementById('openForm1');
    const closeButton1 = document.querySelector('.close1');

    // 버튼 클릭 시 모달 열기
    openFormButton1.addEventListener('click', function () {
        modal1.style.display = 'block';
        console.log("모달1 열림");
    });

    // 모달 닫기
    closeButton1.addEventListener('click', function () {
        modal1.style.display = 'none';
    });

    // 창 외부 클릭 시 모달 닫기
    window.addEventListener('click', function (event) {
        if (event.target === modal1) {
            modal1.style.display = 'none';
        }
    });

    // 페이지 이동 로직
    const items = document.querySelectorAll('.item');
    
    items.forEach(item => {
        item.addEventListener('click', function() {
            console.log('페이지 이동 클릭');
            items.forEach(i => {
                const icon = i.querySelector('.material-symbols-outlined');
                if (icon) {
                    icon.classList.remove('active');
                }
            });

            const clickedIcon = this.querySelector('.material-symbols-outlined');
            if (clickedIcon) {
                clickedIcon.classList.add('active');
            }


        });
    });

    // 도서 정렬 로직
    const bookTable = document.getElementById('main_library2');
    if (bookTable) {
        const bookHeaders = bookTable.getElementsByTagName('th');
        const bookTbody = bookTable.getElementsByTagName('tbody')[0];

        // 도서명 헤더를 클릭했을 때 정렬
        bookHeaders[1].addEventListener('click', function() {
            let rows = Array.from(bookTbody.getElementsByTagName('tr'));
            let ascending = this.getAttribute('data-asc') === 'true';

            rows.sort(function(rowA, rowB) {
                let cellA = rowA.getElementsByTagName('td')[1].innerText.toUpperCase();
                let cellB = rowB.getElementsByTagName('td')[1].innerText.toUpperCase();

                if (cellA < cellB) {
                    return ascending ? -1 : 1;
                }
                if (cellA > cellB) {
                    return ascending ? 1 : -1;
                }
                return 0;
            });

            rows.forEach(row => bookTbody.appendChild(row));
            this.setAttribute('data-asc', !ascending);
        });
    }

    // 세트도서 정렬 로직
    const productTable = document.getElementById('main_library');
    if (productTable) {
        const productHeaders = productTable.getElementsByTagName('th');
        const productTbody = productTable.getElementsByTagName('tbody')[0];

        // 제품명 헤더를 클릭했을 때 정렬
        productHeaders[1].addEventListener('click', function() {
            let rows = Array.from(productTbody.getElementsByTagName('tr'));
            let ascending = this.getAttribute('data-asc') === 'true';

            rows.sort(function(rowA, rowB) {
                let cellA = rowA.getElementsByTagName('td')[1].innerText.toUpperCase();
                let cellB = rowB.getElementsByTagName('td')[1].innerText.toUpperCase();

                if (cellA < cellB) {
                    return ascending ? -1 : 1;
                }
                if (cellA > cellB) {
                    return ascending ? 1 : -1;
                }
                return 0;
            });

            rows.forEach(row => productTbody.appendChild(row));
            this.setAttribute('data-asc', !ascending);
        });
    }
    const orderTable = document.getElementById('main_library_1');
	if (orderTable) {
	    const orderHeaders = orderTable.getElementsByTagName('th');
	    const orderTbody = orderTable.getElementsByTagName('tbody')[0];
	
	    // 부품코드 헤더를 클릭했을 때 정렬
	    orderHeaders[0].addEventListener('click', function() {
	        let rows = Array.from(orderTbody.getElementsByTagName('tr'));
	        let ascending = this.getAttribute('data-asc') === 'true';
	
	        rows.sort(function(rowA, rowB) {
	            let cellA = rowA.getElementsByTagName('td')[0].innerText.toUpperCase();
	            let cellB = rowB.getElementsByTagName('td')[0].innerText.toUpperCase();
	
	            if (cellA < cellB) {
	                return ascending ? -1 : 1;
	            }
	            if (cellA > cellB) {
	                return ascending ? 1 : -1;
	            }
	            return 0;
	        });
	
	        rows.forEach(row => orderTbody.appendChild(row));
	        this.setAttribute('data-asc', !ascending);
	    });
	}
	// 현재 URL의 파라미터 값을 읽습니다.
    const urlParams = new URLSearchParams(window.location.search);
    const mainPage = urlParams.get('mainPage') || 1; // mainPage 값이 없으면 기본값 1



    // 선택한 페이지 번호에 맞는 페이지를 보여줍니다.
    document.getElementById('main_page_' + mainPage).style.display = 'block';
};
