
let calendarDates = document.getElementById("dates"); // 날짜
let currentMonthElement = document.getElementById("YearMonth"); // 년, 월

let today = new Date(); 
let currentMonth = today.getMonth(); // 월 (0~11월)
let currentYear = today.getFullYear(); // 년
let date = today.getDate(); // 일

let joong = document.querySelector("#joong");
let ssang = document.querySelector("#ssang");
let du = document.querySelector("#du");
let sin = document.querySelector("#sin");
let cheong = document.querySelector("#cheong");

function renderCalendar() {
  let firstDayOfMonth = new Date(currentYear, currentMonth, 1); // 해당 년월의 1일에 대한 정보를 가져옴
  let daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate(); // 해당 월이 몇 일까지 있는지 알 수 있음
  let startDayOfWeek = firstDayOfMonth.getDay(); // 해당 월의 첫번째 날짜가 무슨 요일인지

  currentMonthElement.textContent = `${currentMonth + 1}월 일정 안내`;
  // 월과 일을 텍스트로 바꿔 넣어줌

  calendarDates.innerHTML = ""; // 일을 표시하는 부분을 지워줌

  // 1일이 제대로 된 요일에 들어가게 하는 for문
  for (let i = 0; i < startDayOfWeek; i++) {
    let emptyDate = document.createElement("div");
    emptyDate.classList.add("date");
    calendarDates.appendChild(emptyDate);
  }

// 현재 달의 날짜
  for (let i = 1; i <= daysInMonth; i++) {
    let dateElement = document.createElement("div"); // 태그 추가
    dateElement.classList.add("date"); // 클래스 추가
    dateElement.textContent = i;
    calendarDates.appendChild(dateElement); // 캘린더 그리드에 위의 요소 추가
    
    // 당일 표시
    if(i == date){
      dateElement.classList.add("toDay");
    }


    // 휴관일 표시
    function hu1(){
      if(i == 12 || i == 26){
        dateElement.classList.add("hu_2");
      }
      if(i == 1 || i == 15){
        dateElement.classList.remove("hu_1");
      }
    }
      
    function hu2(){
      if(i == 1 || i == 15){
        dateElement.classList.add("hu_1");
      }
      if(i == 8 || i == 22){
        dateElement.classList.remove("hu_2");
      }
    }
    // 도서 입고일
    function hu3(){
      if(i == 2){
        dateElement.classList.add("hu_3");
      }
    }
	hu1();
	hu3();
    
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

