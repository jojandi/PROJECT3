window.onload = function () {
	document.querySelector('.sb').addEventListener('click', function(event) {
    event.preventDefault(); // 폼의 기본 제출을 막음
    let filter = document.querySelector('.sch').value.toUpperCase(); // 검색창에서 입력한 값을 가져옴
    let table = document.querySelector('table');
    let tr = table.getElementsByTagName('tr');

    // 테이블의 모든 행을 반복하여 검색어와 일치하는지 확인
    for (let i = 1; i < tr.length; i++) { // 첫 번째 행(헤더)은 제외
        let tdTitle = tr[i].getElementsByTagName('td')[1]; // 두 번째 열(제목)
        let tdAuthor = tr[i].getElementsByTagName('td')[2]; // 세 번째 열(작성자)
        let isMatch = false;

        // 제목 또는 작성자에서 검색어와 일치하는 항목이 있는지 확인
        if (tdTitle || tdAuthor) {
            let titleValue = tdTitle.textContent || tdTitle.innerText;
            let authorValue = tdAuthor.textContent || tdAuthor.innerText;
            if (titleValue.toUpperCase().indexOf(filter) > -1 || authorValue.toUpperCase().indexOf(filter) > -1) {
                isMatch = true;
            }
        }

        // 검색어와 일치하는 항목이 있으면 해당 행을 표시, 그렇지 않으면 숨김
	        if (isMatch) {
	            tr[i].style.display = "";
	        } else {
	            tr[i].style.display = "none";
	        }
	   	}
	});
   
   
}
    