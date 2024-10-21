
const calendarDates = document.getElementById("dates"); // 날짜
const currentMonthElement = document.getElementById("YearMonth"); // 년, 월

const today = new Date(); 
const currentMonth = today.getMonth(); // 월 (0~11월)
const currentYear = today.getFullYear(); // 년
const date = today.getDate(); // 일

const joong = document.querySelector("#joong");
const ssang = document.querySelector("#ssang");
const du = document.querySelector("#du");
const sin = document.querySelector("#sin");
const cheng = document.querySelector("#cheng");


function renderCalendar() {
  const firstDayOfMonth = new Date(currentYear, currentMonth, 1); // 해당 년월의 1일에 대한 정보를 가져옴
  const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate(); // 해당 월이 몇 일까지 있는지 알 수 있음
  const startDayOfWeek = firstDayOfMonth.getDay(); // 해당 월의 첫번째 날짜가 무슨 요일인지

  currentMonthElement.textContent = `${currentMonth + 1}월 휴관일 안내`;
  // 월과 일을 텍스트로 바꿔 넣어줌

  calendarDates.innerHTML = ""; // 일을 표시하는 부분을 지워줌

  // 1일이 제대로 된 요일에 들어가게 하는 for문
  for (let i = 0; i < startDayOfWeek; i++) {
    const emptyDate = document.createElement("div");
    emptyDate.classList.add("date");
    calendarDates.appendChild(emptyDate);
  }

  // 현재 달의 날짜
  for (let i = 1; i <= daysInMonth; i++) {
    const dateElement = document.createElement("div"); // 태그 추가
    dateElement.classList.add("date"); // 클래스 추가
    dateElement.textContent = i;
    calendarDates.appendChild(dateElement); // 캘린더 그리드에 위의 요소 추가
    
    // 당일 표시
    if(i == date){
      dateElement.classList.add("toDay");
    }

    // 요일 계산
    const dayOfWeek = new Date(currentYear, currentMonth, i).getDay(); 
    // 0: 일요일, 1: 월요일, ..., 6: 토요일

    if(dayOfWeek == 0){
      dateElement.classList.add("red");
    }

    function isOddWeek(date) {
	  const firstDayOfYear = new Date(currentYear, 0, 1);
	  const weekNumber = Math.floor(((date - firstDayOfYear) / (1000 * 60 * 60 * 24) + firstDayOfYear.getDay() + 1) / 7);
	  return weekNumber % 2 !== 0; // 홀수 주인지 확인
	}
	
	function hu1(){
	  if (isOddWeek(new Date(currentYear, currentMonth, i)) && dayOfWeek == 1) { // 홀수 주의 월요일
	    dateElement.classList.add("hu_1");
	    dateElement.classList.remove("hu_2");
	  } else {
	    dateElement.classList.remove("hu_2");
	    dateElement.classList.remove("hu_1");
	  }
	}
	
	function hu2(){
	  if (!isOddWeek(new Date(currentYear, currentMonth, i)) && dayOfWeek == 2) { // 짝수 주의 화요일
	    dateElement.classList.add("hu_2");
	    dateElement.classList.remove("hu_1");
	  } else {
	    dateElement.classList.remove("hu_2");
	    dateElement.classList.remove("hu_1");
	  }
	}

    joong.addEventListener('click', function(){
      console.log("joong")
      joong.classList.add("back")

      ssang.classList.remove("back")
      du.classList.remove("back")
      sin.classList.remove("back")
      cheng.classList.remove("back")
      hu1();
    })

    ssang.addEventListener('click', function(){
      console.log("ssang")
      ssang.classList.add("back")

      joong.classList.remove("back")
      du.classList.remove("back")
      sin.classList.remove("back")
      cheng.classList.remove("back")
      hu2();
    })

    du.addEventListener('click', function(){
      console.log("du")
      du.classList.add("back")

      joong.classList.remove("back")
      ssang.classList.remove("back")
      sin.classList.remove("back")
      cheng.classList.remove("back")
      hu1();
    })

    sin.addEventListener('click', function(){
      console.log("sin")
      sin.classList.add("back")

      joong.classList.remove("back")
      du.classList.remove("back")
      ssang.classList.remove("back")
      cheng.classList.remove("back")
      hu2();
    })

    cheng.addEventListener('click', function(){
      console.log("cheng")
      cheng.classList.add("back")

      joong.classList.remove("back")
      du.classList.remove("back")
      ssang.classList.remove("back")
      sin.classList.remove("back")
      hu2();
    })

}
/* 
1. for 문을 이용하여 현재 월의 총 일 수만큼 반복하여 월의 날짜를 순서대로 표시한다.
  2. const dateElement = document.createElement("div");를 통해 날짜를 나타내는 div 요소를 생성한다.
  3. dateElement.classList.add("date");를 통해 생성한 div 요소에 "date" 클래스를 추가한다.
  4. dateElement.textContent = i;를 통해 해당 날짜 값을 div 요소의 텍스트로 설정한다.
  5. calendarDates.appendChild(dateElement);를 통해 생성한 날짜 요소를 캘린더 그리드에 추가한다.
  */

}

renderCalendar();
// 페이지가 로드되면 renderCalendar 함수를 실행하여 초기 캘린더를 표시한다.

