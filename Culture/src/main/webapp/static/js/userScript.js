// 세션에서 가져온 사용자 이름
const username = document.getElementById('username').value;

// 세션에서 사용자의 로그인 여부를 확인
const isLoggedIn = Boolean(document.getElementById('sessionUserId').value);

// 하트 아이콘 클릭 시 이벤트 처리
function toggleHeart(eventNum) {
    const heartIcon = document.querySelector('.icons img:first-child');
    const userNumElement = document.getElementById('userNum');

    if (!userNumElement || !userNumElement.value) {
        alert("User is not logged in or userNum is missing.");
        return;
    }

    const userNum = userNumElement.value;

    console.log("User Num: " + userNum + ", Event Num: " + eventNum);

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/likeEvent", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.success) {
                    if (heartIcon.src.includes("blackfav.png")) {
                        heartIcon.src = "static/icon/heart.png";
                    } else {
                        heartIcon.src = "static/icon/blackfav.png";
                    }
                } else {
                    console.error("Failed to toggle like:", response.error);
                }
            } else {
                console.error("Error: " + xhr.status);
            }
        }
    };

    xhr.send("userNum=" + encodeURIComponent(userNum) + "&eventNum=" + encodeURIComponent(eventNum));
}
