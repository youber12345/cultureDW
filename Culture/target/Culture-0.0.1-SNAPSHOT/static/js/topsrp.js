function navigateToEvent(eventPage) {
    window.location.href = eventPage;
}

function updateDetailsClass() {
    const eventItems = document.querySelectorAll('.event-item');
    eventItems.forEach((item, index) => {
        const details = item.querySelector('.event-details, .event-details2');
        if (index === 1) {
            // 중앙에 있는 포스터에 event-details2 적용
            if (!details.classList.contains('event-details2')) {
                details.classList.remove('event-details');
                details.classList.add('event-details2');
            }
        } else {
            // 좌우에 있는 포스터에 event-details 적용
            if (!details.classList.contains('event-details')) {
                details.classList.remove('event-details2');
                details.classList.add('event-details');
            }
        }
    });
}


document.addEventListener('DOMContentLoaded', function() {
    const rightButton = document.getElementById('right-button');
    const leftButton = document.getElementById('left-button');
    
 if (rightButton) {
    rightButton.addEventListener('click', function() {
        const eventList = document.querySelector('.event-list');
        if (eventList.children.length > 1) {
            eventList.insertBefore(eventList.lastElementChild, eventList.firstElementChild);
            updateDetailsClass();
        }
    });
}

if (leftButton) {
    leftButton.addEventListener('click', function() {
        const eventList = document.querySelector('.event-list');
        if (eventList.children.length > 1) {
            eventList.appendChild(eventList.firstElementChild);
            updateDetailsClass();
        }
    });
}


    // 페이지 로드 시 처음 실행하여 클래스 설정
    updateDetailsClass();
});
