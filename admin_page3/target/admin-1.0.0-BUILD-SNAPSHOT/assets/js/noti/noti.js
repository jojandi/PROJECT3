
 // 공지사항을 저장할 배열
        let notices = [];
    
        // 공지사항을 추가하는 함수
        function addNotice() {
            // 사용자 입력 값을 가져옴
            const title = document.getElementById('new_notice_title').value;
            const date = document.getElementById('new_notice_date').value;
            const content = document.getElementById('new_notice_content').value;
    
            // 입력 값이 비어 있는지 확인
            if (title === '' || date === '' || content === '') {
                alert('모든 필드를 입력해 주세요.');
                return;
            }
    
            const notice = {
                title: title,
                date: date,
                content: content
            };

            notices.push(notice);
    
            // 입력 필드 초기화
            document.getElementById('new_notice_title').value = '';
            document.getElementById('new_notice_date').value = '';
            document.getElementById('new_notice_content').value = '';
    
            // 공지사항 목록을 업데이트
            updateNoticeList();
    
            alert('공지사항이 추가되었습니다.');
        }
    
        // 공지사항 목록을 업데이트하는 함수
        function updateNoticeList() {
            const section = document.getElementById('section');
            const noticesList = document.createElement('div');
            noticesList.id = 'notices_list';
    
            // 기존 목록 제거
            const existingList = document.getElementById('notices_list');
            if (existingList) {
                section.removeChild(existingList);
            }
    
            // 새 목록 생성
            notices.forEach(notice => {
                const noticeElement = document.createElement('div');
                noticeElement.innerHTML = `<h3>${notice.title}</h3><p>${notice.date}</p><p>${notice.content}</p>`;
                noticesList.appendChild(noticeElement);
            });
    
            section.appendChild(noticesList);
        }