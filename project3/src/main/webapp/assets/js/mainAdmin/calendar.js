const calendarDates = document.getElementById("dates"); // 날짜가 들어갈 곳
const currentMonthElement = document.getElementById("YearMonth"); // 제목이 들어갈 곳

const today = new Date();
const currentMonth = today.getMonth(); // 월(0~11월)
const currentYear = today.getFullYear(); // 년
const date = today.getDate(); // 일

// json을 이용하여 각 도서관 지정
const buttons = {
    joong: document.querySelector("#joong"),
    ssang: document.querySelector("#ssang"),
    du: document.querySelector("#du"),
    sin: document.querySelector("#sin"),
    cheng: document.querySelector("#cheng")
};

// 달력을 그리고 휴관일을 지정하는 함수
function renderCalendar() {
    const firstDayOfMonth = new Date(currentYear, currentMonth, 1); // 해당 월의 1일에 대한 정보
    const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate(); // 해당 월이 몇 일까지 있는지
    const startDayOfWeek = firstDayOfMonth.getDay(); // 해당 월의 1일의 요일

    currentMonthElement.textContent = `${currentMonth + 1}월 휴관일 안내`; // 제목
    calendarDates.innerHTML = ""; 

    // 1일이 제대로 된 요일에 들어가게 하기 위해 1일 요일 전까지 빈 문자열 추가
    for (let i = 0; i < startDayOfWeek; i++) {
    	// createDateElement함수를 이용해 calendarDates 아래에 DOM 추가
        calendarDates.appendChild(createDateElement("")); 
    }

    // 빈 문자열 이후로 1부터 날짜 추가
    for (let i = 1; i <= daysInMonth; i++) {
        const dateElement = createDateElement(i);
        calendarDates.appendChild(dateElement);
        if (i === date) dateElement.classList.add("toDay");

        // 일요일에 마다 빨간색 표시를 위해 red 클래스 추가
        // new Date(currentYear, currentMonth, i).getDay() === 0 -> 일요일 선택
        if (new Date(currentYear, currentMonth, i).getDay() === 0) {
            dateElement.classList.add("red");
        }
    }
}

// div를 생성하여 date 클래스를 주고 그 안에 날짜 혹은 빈 문자열을 추가하기 위한 함수
function createDateElement(day) {
    const dateElement = document.createElement("div"); // div 태그 추가하여 날짜가 들어갈 공간 확보
    dateElement.classList.add("date"); // 해당 div에 클래스 추가
    dateElement.textContent = day; // 날짜 또는 빈 문자열 생성
    return dateElement;
}

// 해당 날짜 생성
function dateCreate(day) {
	const dc = new Date(currentYear, currentMonth, day);
	return dc;
}

// 해당 날짜가 홀수주인지 짝수주인지 확인하는 함수
function isOddWeek(date) {
    const firstDayOfYear = new Date(currentYear, 0, 1); // 주어진 연도의 1월 1일
    // 주 번호 계산
    const weekNumber =
    	 Math.floor(((date - firstDayOfYear) / (1000 * 60 * 60 * 24) + firstDayOfYear.getDay() + 1) / 7);
    return weekNumber % 2 !== 0; // 홀수주인지 확인
}

// dateElement : 도서관
// 홀수주 월요일마다 hu_1 클래스 생성, hu_2 클래스 삭제
// 날짜.getDay() : 일요일~토요일 (0~6)
function hu1(dateElement, day) {
    if (isOddWeek(dateCreate(day)) && dateCreate(day).getDay() === 1) {
        dateElement.classList.add("hu_1");
        dateElement.classList.remove("hu_2");
    } else {
        dateElement.classList.remove("hu_1");
        dateElement.classList.remove("hu_2");
    }
}

// 짝수주 화요일마다 hu_2 클래스 생성, hu_1 클래스 삭제
function hu2(dateElement, day) {
    if (!isOddWeek(dateCreate(day)) && dateCreate(day).getDay() === 2) {
        dateElement.classList.add("hu_2");
        dateElement.classList.remove("hu_1");
    } else {
        dateElement.classList.remove("hu_2");
        dateElement.classList.remove("hu_1");
    }
}


// 선택된 도서관에 그 도서관에 맞는 휴관일 보여줌
function updateHolidayClasses(isOdd) {
	// 모든 날짜를 선택
    document.querySelectorAll('.date').forEach(dateElement => {
        const dayIndex = parseInt(dateElement.textContent, 10); // 현재 날짜를 정수로 변환
        if (isOdd) {
            hu1(dateElement, dayIndex); // 홀수 주의 월요일
        } else {
            hu2(dateElement, dayIndex); // 짝수 주의 화요일
        }
    });
}

function handleButtonClick(selected) {
	// Object.values(buttons) 제이슨을 배열로 가져옴
	console.log("도서관 제이슨 -> 도서관 배열 :", Object.values(buttons));
	// 모든 도서관에 back 클래스 삭제 -> 이전에 선택되었던 도서관에도 삭제됨
    Object.values(buttons).forEach(button => button.classList.remove("back"));
    // 선택 된 도서관에 back 클래스 추가
    buttons[selected].classList.add("back");

	// 선태 된 도서관이 중앙이거나 두정인 경우 ture로 설정
    const isOdd = selected === 'joong' || selected === 'du';
    updateHolidayClasses(isOdd);
}

// 클릭된 것에 맞게 클릭이벤트
for (const key in buttons) {
    buttons[key].addEventListener('click', () => handleButtonClick(key));
}

renderCalendar();
