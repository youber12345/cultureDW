function navigateToEvent(eventPage) {
    window.location.href = eventPage;
}

function updateDetailsClass() {
    const eventItems = document.querySelectorAll('.event-item');
    eventItems.forEach((item, index) => {
        const details = item.querySelector('.event-details, .event-details2');
        if (index === 1) {
            // 중앙에 있는 포스터에 event-details2 적용
            details.classList.remove('event-details');
            details.classList.add('event-details2');
        } else {
            // 좌우에 있는 포스터에 event-details 적용
            details.classList.remove('event-details2');
            details.classList.add('event-details');
        }
    });
}

document.getElementById('right-button').addEventListener('click', function() {
    const eventList = document.querySelector('.event-list');
    eventList.appendChild(eventList.firstElementChild);
    updateDetailsClass();
});

document.getElementById('left-button').addEventListener('click', function() {
    const eventList = document.querySelector('.event-list');
    eventList.insertBefore(eventList.lastElementChild, eventList.firstElementChild);
    updateDetailsClass();
});

// 페이지 로드 시 처음 실행하여 클래스 설정
updateDetailsClass();
