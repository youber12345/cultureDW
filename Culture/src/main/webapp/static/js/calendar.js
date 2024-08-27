let currentYear = 2024;
let currentMonth = 8; // 시작 월 (8월)
const today = new Date(); // 오늘 날짜

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

function renderCalendar(year, month) {
    const calendarBody = document.getElementById('calendarBody');
    calendarBody.innerHTML = '';

    const firstDay = new Date(year, month - 1, 1).getDay();
    const lastDate = new Date(year, month, 0).getDate();

    const currentMonthElement = document.getElementById('currentMonth');
    if (currentMonthElement) {
        currentMonthElement.textContent = `${year}.${month.toString().padStart(2, '0')}`;
    }

    let date = 1;
    for (let i = 0; i < 6; i++) {
        const row = document.createElement('tr');

        for (let j = 0; j < 7; j++) {
            const cell = document.createElement('td');

            if (i === 0 && j < firstDay) {
                cell.innerHTML = '';
            } else if (date > lastDate) {
                break;
            } else {
                cell.innerHTML = date;
                cell.onclick = () => selectDate(date);

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
                    cell.className = 'holiday';
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

function prevMonth() {
    if (currentMonth === 1) {
        currentMonth = 12;
        currentYear--;
    } else {
        currentMonth--;
    }
    renderCalendar(currentYear, currentMonth);
}

function nextMonth() {
    if (currentMonth === 12) {
        currentMonth = 1;
        currentYear++;
    } else {
        currentMonth++;
    }
    renderCalendar(currentYear, currentMonth);
}

function selectDate(day) {
    const lastDate = new Date(currentYear, currentMonth, 0).getDate();
    if (day > 0 && day <= lastDate) {
        // 선택된 날짜를 가져와 TO DO LIST 위에 표시
        const selectedDateElement = document.getElementById('selectedDate');
        const formattedDate = `${currentYear}.${currentMonth.toString().padStart(2, '0')}.${day.toString().padStart(2, '0')}`;
        selectedDateElement.innerHTML = `<h1>${formattedDate}</h1>`;
        
        // TO DO LIST 폼에 날짜를 반영
        renderTodoList(formattedDate);
    }
}

function renderTodoList(dateString) {
    const todoContent = document.getElementById('todoContent');
    todoContent.innerHTML = `
        <h3>${dateString}의 TO DO LIST</h3>
        <form>
            <label for="todo">할 일:</label>
            <input type="text" id="todo" name="todo">
            <button type="submit">추가</button>
        </form>
    `;
}

document.addEventListener('DOMContentLoaded', function() {
    renderCalendar(currentYear, currentMonth);
});
