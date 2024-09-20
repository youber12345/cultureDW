let currentYear = new Date().getFullYear();
let currentMonth = new Date().getMonth() + 1; // 현재 월 (1부터 시작)
let today = new Date(); // 오늘 날짜
let todayDate = today.getDate(); // 오늘의 날짜만 추출

// 날짜 형식 변환 함수
function parseDate(dateString) {
    const [date, time] = dateString.split(' ');
    const [year, month, day] = date.split('-').map(Number);
    return new Date(year, month - 1, day); // 월은 0부터 시작
}

// 달력 렌더링 함수
function renderCalendar(year, month) {
    const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
    document.getElementById('currentMonth').innerText = `${year}년 ${monthNames[month - 1]}`;

    const calendarBody = document.getElementById('calendarBody');
    calendarBody.innerHTML = ''; // 기존 달력 초기화

    const firstDay = new Date(year, month - 1, 1).getDay(); // 해당 월의 첫 번째 날 요일
    const lastDate = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날짜

    let date = 1;
    let todayCell = null; // 오늘 날짜 셀을 추적할 변수

    for (let i = 0; i < 6; i++) { // 최대 6주 (행)
        const row = document.createElement('tr');

        for (let j = 0; j < 7; j++) { // 7일 (열)
            const cell = document.createElement('td');

            if (i === 0 && j < firstDay) {
                cell.innerHTML = ''; // 첫 주의 이전 빈 칸 처리
            } else if (date > lastDate) {
                cell.innerHTML = ''; // 유효하지 않은 날짜는 빈칸 처리
            } else {
                // 날짜 셀에 데이터 속성으로 날짜 저장
                cell.innerHTML = date;
                cell.setAttribute("data-date", `${year}-${month}-${date}`);

                // 오늘 날짜와 일치하는 셀을 찾으면 todayCell에 저장
                if (year === today.getFullYear() && month === today.getMonth() + 1 && date === todayDate) {
                    todayCell = cell;
                    cell.classList.add('current-day'); // 오늘 날짜에 강조 표시 추가
                }

                // 좋아요한 이벤트가 있으면 추가
                const event = likedEvents.find(event => {
                    const eventDate = parseDate(event.eventSdate);
                    return eventDate.getFullYear() === year && eventDate.getMonth() + 1 === month && eventDate.getDate() === date;
                });

                if (event) {
                    const eventElement = document.createElement('div');
                    eventElement.classList.add('event-item');
                    eventElement.innerText = event.eventName; // 이벤트 이름 표시
                    cell.appendChild(eventElement);

                    // 이벤트 이름을 셀에 저장하여 클릭 시 TO-DO 리스트에 표시
                    cell.setAttribute("data-event-name", event.eventName);
                }

                // 날짜 클릭 이벤트: 셀에 있는 날짜를 참조하여 TO-DO 리스트에 이벤트 이름 표시
                cell.addEventListener('click', function() {
                    const clickedDate = this.getAttribute('data-date'); // 셀의 실제 날짜 가져오기
                    const eventName = this.getAttribute('data-event-name'); // 해당 날짜의 이벤트 이름 가져오기

                    document.getElementById('selectedDate').innerHTML = `<h1>${clickedDate}</h1>`;
                    document.getElementById('todoContent').innerHTML = `
                        <h2>${eventName ? "행사 이름: " + eventName : "이 날짜에 등록된 행사가 없습니다."}</h2>
                    `;
                });

                date++; // 날짜 증가
            }

            row.appendChild(cell);
        }

        calendarBody.appendChild(row);

        if (date > lastDate) {
            break; // 모든 유효한 날짜를 채운 후 중지
        }
    }

    // 오늘 날짜 셀이 있으면 클릭 이벤트를 트리거하여 포커스 적용
    if (todayCell) {
        todayCell.click();
    }
}

// 이전 달로 이동
function prevMonth() {
    currentMonth--;
    if (currentMonth < 1) {
        currentMonth = 12;
        currentYear--;
    }
    renderCalendar(currentYear, currentMonth);
}

// 다음 달로 이동
function nextMonth() {
    currentMonth++;
    if (currentMonth > 12) {
        currentMonth = 1;
        currentYear++;
    }
    renderCalendar(currentYear, currentMonth);
}

// 페이지가 로드되면 달력 렌더링
document.addEventListener('DOMContentLoaded', function() {
    renderCalendar(currentYear, currentMonth); // 현재 연도와 월로 렌더링
});
