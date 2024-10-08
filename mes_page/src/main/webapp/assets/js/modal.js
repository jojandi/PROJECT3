document.addEventListener("DOMContentLoaded", function() {
    // 모달 엘리먼트 가져오기
    var modal = document.getElementById("taskModal");
    var span = document.getElementsByClassName("close")[0];

    // 테이블 row 클릭 이벤트 설정
    var rows = document.querySelectorAll("#main_library tbody tr");
    rows.forEach(function(row) {
        row.addEventListener("click", function() {
            var taskName = row.cells[0].innerText;
            var taskAssignee = row.cells[1].innerText;
            var taskStatus = row.cells[2].innerText;
            var taskDate = row.cells[3].innerText;
            var taskLocation = row.cells[4].innerText;

            document.getElementById("taskName").innerText = taskName;
            document.getElementById("taskAssignee").innerText = taskAssignee;
            document.getElementById("taskStatus").innerText = taskStatus;
            document.getElementById("taskDate").innerText = taskDate;
            document.getElementById("taskLocation").innerText = taskLocation;

            // 여기서 작업 세부사항을 추가할 수 있습니다.
            document.getElementById("taskDetails").innerText = "우리는 말하는 감자야";

            modal.style.display = "block";
        });
    });

    // 모달 닫기 이벤트
    span.onclick = function() {
        modal.style.display = "none";
    }

    // 모달 외부 클릭시 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
});