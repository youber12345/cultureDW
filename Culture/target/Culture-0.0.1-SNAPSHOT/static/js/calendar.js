
        let currentYear = 2024;
        let currentMonth = 8; // 시작 월 (8월)
        const today = new Date(); // 오늘 날짜
        let selectedDateElement = null; // 현재 선택된 날짜 셀을 저장

        const holidays = {
            1: {1: "신정"},
            3: {1: "삼일절"},
            5: {5: "어린이날"},
            6: {6: "현충일"},
            8: {15: "광복절"},
            9: {16: "추석", 17: "추석", 18: "추석"},
            10: {3: "개천절", 9: "한글날"},
            12: {25: "성탄절"}
        };

        // 달력을 렌더링하는 함수
        function renderCalendar(year, month) {
            const calendarBody = document.getElementById('calendarBody');
            calendarBody.innerHTML = ''; // 기존 달력 초기화

            const firstDay = new Date(year, month - 1, 1).getDay(); // 해당 월의 첫 번째 날 요일
            const lastDate = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날짜

            // 현재 연도와 월을 화면에 표시
            const currentMonthElement = document.getElementById('currentMonth');
            if (currentMonthElement) {
                currentMonthElement.textContent = `${year}.${month.toString().padStart(2, '0')}`;
            }

            let date = 1;
            for (let i = 0; i < 6; i++) { // 최대 6주 (행)
                const row = document.createElement('tr');

                for (let j = 0; j < 7; j++) { // 7일 (열)
                    const cell = document.createElement('td');

                    if (i === 0 && j < firstDay) {
                        cell.innerHTML = ''; // 첫 주의 이전 빈 칸 처리
                    } else if (date > lastDate) {
                        break; // 월 마지막 날짜 이후 처리 종료
                    } else {
                        cell.innerHTML = date;
                        cell.onclick = () => selectDate(date, cell); // 날짜 선택 시 셀과 날짜 전달

                        // 일요일, 토요일 클래스 적용
                        if (j === 0) {
                            cell.className = 'sunday';
                        } else if (j === 6) {
                            cell.className = 'saturday';
                        }

                        // 공휴일 표시
                        if (holidays[month] && holidays[month][date]) {
                            const holidayName = document.createElement('span');
                            holidayName.className = 'holiday-name';
                            holidayName.textContent = holidays[month][date];
                            cell.appendChild(holidayName);
                            cell.classList.add('holiday');
                        }

                        // 오늘 날짜 강조
                        if (year === today.getFullYear() && month === today.getMonth() + 1 && date === today.getDate()) {
                            cell.classList.add('current-day');
                        }

                        date++;
                    }

                    row.appendChild(cell);
                }

                calendarBody.appendChild(row);
            }
        }

        // 이전 달로 이동
        function prevMonth() {
            if (currentMonth === 1) {
                currentMonth = 12;
                currentYear--;
            } else {
                currentMonth--;
            }
            renderCalendar(currentYear, currentMonth);
        }

        // 다음 달로 이동
        function nextMonth() {
            if (currentMonth === 12) {
                currentMonth = 1;
                currentYear++;
            } else {
                currentMonth++;
            }
            renderCalendar(currentYear, currentMonth);
        }

        // 날짜를 선택하는 함수
        function selectDate(day, cell) {
            const lastDate = new Date(currentYear, currentMonth, 0).getDate();
            if (day > 0 && day <= lastDate) {
                // 이전에 선택된 날짜의 강조 제거
                if (selectedDateElement) {
                    selectedDateElement.classList.remove('selected-date');
                }

                // 현재 선택된 날짜에 파란색 테두리 추가
                selectedDateElement = cell;
                selectedDateElement.classList.add('selected-date');

                // 선택한 날짜를 TO DO LIST 영역에 표시
                const selectedDateElementDisplay = document.getElementById('selectedDate');
                const formattedDate = `${currentYear}.${currentMonth.toString().padStart(2, '0')}.${day.toString().padStart(2, '0')}`;
                selectedDateElementDisplay.innerHTML = `<h1>${formattedDate}</h1>`;
                
                // TO DO LIST 폼에 날짜 반영
                renderTodoList(formattedDate);
            }
        }

        // TO DO LIST를 렌더링하는 함수
        function renderTodoList(dateString) {
            const todoContent = document.getElementById('todoContent');
            todoContent.innerHTML = `
                <h3>${dateString}의 TO DO LIST</h3>
                <form onsubmit="return addTodoItem(event)">
                    <label for="todo">할 일:</label>
                    <input type="text" id="todo" name="todo" required>
                    <button type="submit">추가</button>
                </form>
                <ul id="todoList"></ul>
            `;
        }

        // TO DO LIST 항목을 추가하는 함수
        function addTodoItem(event) {
            event.preventDefault();
            const todoInput = document.getElementById('todo');
            const todoList = document.getElementById('todoList');

            if (todoInput.value.trim() !== '') {
                const listItem = document.createElement('li');
                listItem.textContent = todoInput.value;
                todoList.appendChild(listItem);
                todoInput.value = ''; // 입력 필드 초기화
            }
        }

        // 페이지가 로드되면 달력 렌더링
        document.addEventListener('DOMContentLoaded', function() {
            console.log("DOMContentLoaded 이벤트가 실행되었습니다."); // 확인 로그 추가
            renderCalendar(currentYear, currentMonth);
        });