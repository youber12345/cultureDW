<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 캘린더</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
        }
        .calendar {
            width: 875px;
            margin: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f2f2f2;
            padding: 20px;
        }
        .header span {
            font-size: 60px;
            font-weight: bold;
        }
        .header button {
            background-color: transparent;
            border: none;
            font-size: 45px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 25px;
            text-align: center;
            cursor: pointer;
            vertical-align: top;
            font-size: 30px;
        }
        th {
            background-color: #333;
            color: white;
        }
        .sunday, .holiday {
            color: red;
        }
        .saturday {
            color: blue;
        }
        td {
            height: 120px;
            position: relative;
        }
        .holiday-name {
            font-size: 16px;
            color: red;
            display: block;
            margin-top: 10px;
        }
        .selected-date {
            font-size: 50px;
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="calendar">
        <div class="header">
            <button onclick="prevMonth()">&#9664;</button>
            <span id="currentMonth">2024.08</span>
            <button onclick="nextMonth()">&#9654;</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th class="sunday">일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th class="saturday">토</th>
                </tr>
            </thead>
            <tbody id="calendarBody">
                <!-- 날짜가 동적으로 생성됩니다 -->
            </tbody>
        </table>
    </div>

    <div class="selected-date" id="selectedDate"></div>

    <script>
        let currentYear = 2024;
        let currentMonth = 8;
        let today = new Date(currentYear, 7, 9); // 2024년 8월 9일

        const holidays = {
            1: {1: "신정"},
            3: {1: "삼일절"},
            5: {5: "어린이날"},
            6: {6: "현충일"},
            8: {15: "광복절"},
            10: {3: "개천절", 9: "한글날"},
            12: {25: "성탄절"}
        };

        function renderCalendar(year, month) {
            const calendarBody = document.getElementById('calendarBody');
            calendarBody.innerHTML = '';

            const firstDay = new Date(year, month - 1, 1).getDay();
            const lastDate = new Date(year, month, 0).getDate();

            document.getElementById('currentMonth').textContent = `${year}.${month.toString().padStart(2, '0')}`;

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

                        if (holidays[month] && holidays[month][date]) {
                            const holidayName = document.createElement('span');
                            holidayName.className = 'holiday-name';
                            holidayName.textContent = holidays[month][date];
                            cell.appendChild(holidayName);
                            cell.className = 'holiday';
                        }

                        if (year === today.getFullYear() && month === today.getMonth() + 1 && date === today.getDate()) {
                            cell.style.backgroundColor = '#e6f7ff';
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
                document.getElementById('selectedDate').innerHTML = `<h1>${currentYear}년 ${currentMonth}월 ${day}일</h1>`;
            }
        }

        renderCalendar(currentYear, currentMonth);
    </script>
</body>
</html>
