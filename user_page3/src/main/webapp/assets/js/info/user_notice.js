function filterTable() {
    // 검색어 입력 필드 가져오기
    var input = document.getElementById("searchInput");
    var filter = input.value.toLowerCase();
    var table = document.getElementById("reportTable");
    var tr = table.getElementsByTagName("tr");

    // 테이블의 각 행을 반복하여 검색어와 비교
    for (var i = 1; i < tr.length; i++) {
        var tdTitle = tr[i].getElementsByTagName("td")[1]; // 제목 열 (두 번째 열)
        if (tdTitle) {
            var textValue = tdTitle.textContent || tdTitle.innerText;
            // 검색어가 제목에 포함되면 해당 행 표시, 아니면 숨김
            if (textValue.toLowerCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


