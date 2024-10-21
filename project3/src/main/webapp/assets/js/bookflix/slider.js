document.addEventListener('DOMContentLoaded', () => {
            const sliderContainer = document.querySelector('.slider-container');
            const books = document.querySelectorAll('.book');
            const numBooks = books.length;
            let currentIndex = 1; // 첫 번째 슬라이드 인덱스 (복제된 첫 번째 슬라이드)
            let slideWidth = books[0].offsetWidth + 20; // 슬라이드 너비 + 마진

            function updateSlider() {
                books.forEach((book, index) => {
                    book.classList.remove('active');
                    book.classList.add('inactive');
                    if (index === currentIndex) {
                        book.classList.add('active');
                        book.classList.remove('inactive');
                    }
                });

                const offset = -currentIndex * slideWidth;
                sliderContainer.style.transform = `translateX(${offset}px)`;
            }

            function autoSlide() {
                currentIndex++;
                if (currentIndex >= numBooks - 1) { // 마지막 복제 슬라이드 인덱스
                    sliderContainer.style.transition = 'none';
                    sliderContainer.style.transform = `translateX(0)`;
                    setTimeout(() => {
                        sliderContainer.style.transition = 'transform 1s ease-in-out';
                        currentIndex = 1; // 복제된 첫 번째 슬라이드로 이동
                        updateSlider();
                    }, 50);
                } else {
                    updateSlider();
                }
            }

            window.addEventListener('load', () => {
                slideWidth = books[0].offsetWidth + 20; // 슬라이드 너비를 업데이트
                updateSlider(); // 초기 상태 업데이트
                setInterval(autoSlide, 3000); // 3초마다 슬라이드 변경
            });
        });