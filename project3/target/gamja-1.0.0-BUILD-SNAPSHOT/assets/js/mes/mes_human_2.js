window.onload = function () {
     const modal2 = document.getElementById('formModal2');
    const openFormButton2 = document.getElementById('openForm2');
    const closeButton = document.querySelector('.close');
    const form = document.getElementById('workForm2');

    // 버튼 클릭 시 모달 열기
    openFormButton2.addEventListener('click', function () {
        modal2.style.display = 'block';
        console.log("클릭");
    });

    // 모달 닫기
    closeButton.addEventListener('click', function () {
        modal2.style.display = 'none';
    });

    // 창 외부 클릭 시 모달 닫기
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal2.style.display = 'none';
        }
    });
    
   
   
}
    