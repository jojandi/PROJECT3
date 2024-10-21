document.addEventListener('DOMContentLoaded', function() {
    const items = document.querySelectorAll('.item');
    
    items.forEach(item => {
        item.addEventListener('click', function() {
            console.log('클릭');
            // 모든 항목의 색상 초기화
            items.forEach(i => {
                const icon = i.querySelector('.material-symbols-outlined');
                if (icon) {
                    icon.classList.remove('active');
                }
            });

            // 클릭된 항목에 색상 적용
            const clickedIcon = this.querySelector('.material-symbols-outlined');
            if (clickedIcon) {
                clickedIcon.classList.add('active');
            }

            // 페이지 전환 로직 추가
            const itemId = this.id;
            if (itemId === 'i1') {
                document.querySelector('#main_page_1').style.display = 'inline-block';
                document.querySelector('#main_page_2').style.display = 'none';
                document.querySelector('#main_page_3').style.display = 'none';
                document.querySelector('#main_page_4').style.display = 'none';
            } else if (itemId === 'i2') {
                document.querySelector('#main_page_2').style.display = 'inline-block';
                document.querySelector('#main_page_1').style.display = 'none';
                document.querySelector('#main_page_3').style.display = 'none';
                document.querySelector('#main_page_4').style.display = 'none';
            } else if (itemId === 'i3') {
                document.querySelector('#main_page_3').style.display = 'inline-block';
                document.querySelector('#main_page_1').style.display = 'none';
                document.querySelector('#main_page_2').style.display = 'none';
                document.querySelector('#main_page_4').style.display = 'none';
            } else if (itemId === 'i4'){
                document.querySelector('#main_page_4').style.display = 'inline-block';
                document.querySelector('#main_page_1').style.display = 'none';
                document.querySelector('#main_page_2').style.display = 'none';
                document.querySelector('#main_page_3').style.display = 'none';
            }
        });
    });
});