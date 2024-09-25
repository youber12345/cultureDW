function navigateToEvent(eventPage) {
    window.location.href = eventPage;
}

document.addEventListener('DOMContentLoaded', function () {
    const rightButton = document.getElementById('right-button');
    const leftButton = document.getElementById('left-button');
    const eventList = document.querySelector('.event-list');
    const eventItems = Array.from(document.querySelectorAll('.event-item'));
    let currentIndex = 1; // 중앙에 표시될 아이템 인덱스

    function updateSlider() {
        eventItems.forEach((item, index) => {
            item.classList.remove('left', 'right', 'active');
            if (index === currentIndex) {
                item.classList.add('active'); // 중앙 아이템
            } else if (index === (currentIndex - 1 + eventItems.length) % eventItems.length) {
                item.classList.add('left'); // 왼쪽 아이템
            } else if (index === (currentIndex + 1) % eventItems.length) {
                item.classList.add('right'); // 오른쪽 아이템
            }
        });
    }

    rightButton.addEventListener('click', function () {
        currentIndex = (currentIndex + 1) % eventItems.length;
        updateSlider();
    });

    leftButton.addEventListener('click', function () {
        currentIndex = (currentIndex - 1 + eventItems.length) % eventItems.length;
        updateSlider();
    });

    updateSlider(); // 초기 로드 시 첫 번째 슬라이더 업데이트
});
