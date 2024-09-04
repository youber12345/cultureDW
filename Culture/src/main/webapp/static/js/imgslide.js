let slideIndex = 0;
let hcount = 0;
// 세션에서 가져온 사용자 이름
const username = document.getElementById('username').value;

// 세션에서 사용자의 로그인 여부를 확인
const isLoggedIn = Boolean(document.getElementById('sessionUserId').value);

// 로그인 여부 확인 함수
// 좋아요 상태를 확인하고 하트를 초기화하는 함수
function loadHeartStatus(eventNum) {
    const heartIcon = document.querySelector('.icons img:first-child');
    const userNumElement = document.getElementById('userNum');

    if (!userNumElement || !userNumElement.value) {
       	alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
        window.location.href = "/login";  // 로그인 페이지로 이동
        return false; // 로그인 안되어있으면 false 반환
    }

    const userNum = userNumElement.value;

    // 서버에서 좋아요 상태를 확인
    const xhr = new XMLHttpRequest();
    xhr.open("GET", `/checkLikeStatus?userNum=${encodeURIComponent(userNum)}&eventNum=${encodeURIComponent(eventNum)}`, true);
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.liked) {
                    heartIcon.src = "static/icon/heart.png";  // 좋아요가 되어있다면 채워진 하트
                } else {
                    heartIcon.src = "static/icon/blackfav.png";  // 좋아요가 안되어있다면 빈 하트
                }
            } else {
                console.error("Error checking like status: " + xhr.status);
            }
        }
    };

    xhr.send();
}

// 좋아요 토글 함수
function toggleHeart(eventNum) {
    const heartIcon = document.querySelector('.icons img:first-child');
    const userNumElement = document.getElementById('userNum');

    if (!userNumElement || !userNumElement.value) {
        alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
        window.location.href = "/login";  // 로그인 페이지로 이동
        return false; // 로그인 안되어있으면 false 반환
    }

    const userNum = userNumElement.value;

    console.log("User Num: " + userNum + ", Event Num: " + eventNum);

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/likeEvent", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.success) {
                    console.log("Like action successful.");
                    // 좋아요 상태에 맞게 하트 아이콘 변경
                    if (heartIcon.src.includes("blackfav.png")) {
                        heartIcon.src = "static/icon/heart.png";  // 빈 하트 -> 채워진 하트
                    } else {
                        heartIcon.src = "static/icon/blackfav.png";  // 채워진 하트 -> 빈 하트
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

// 페이지 로드 시 좋아요 상태를 확인하고 하트를 업데이트
document.addEventListener('DOMContentLoaded', function() {
    const eventNum = getEventNumFromURL();  // URL 또는 HTML에서 eventNum을 가져오는 함수
    if (eventNum) {
        loadHeartStatus(eventNum);  // 좋아요 상태 동기화
    }
});



function openCommentSection() {
    if (!checkLogin('comment')) return;  // 로그인 체크
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    darkOverlay.style.display = 'block';
    darkOverlay.classList.add('active');
    
    commentSection.style.display = 'block';
    // 애니메이션 효과를 위한 약간의 지연
    setTimeout(() => {
        commentSection.classList.add('active');
    }, 10); // 10ms 후에 클래스 추가
}




function closeCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    // 애니메이션 종료 후 요소 숨기기
    darkOverlay.classList.remove('active');
    commentSection.classList.remove('active');

    setTimeout(() => {
        darkOverlay.style.display = 'none';
        commentSection.style.display = 'none';
    }, 500); // 500ms 후에 요소 숨기기 (애니메이션 시간과 일치시킴)
}

function addComment() {
    if (!checkLogin('comment')) return;  // 로그인 체크
    const commentInput = document.getElementById('commentInput');
    const commentList = document.getElementById('commentList');
    if (commentInput.value.trim() !== "") {
        const newComment = document.createElement('div');
        newComment.classList.add('comment-item'); // 새롭게 추가된 클래스

        newComment.innerHTML = `
            <span class="comment-author">${username}</span>
            <span class="comment-content">${commentInput.value}</span>
        `;
        commentList.appendChild(newComment);
        commentInput.value = "";
    }
}

document.getElementById('commentInput').addEventListener('keydown', function(event) {
    if (event.key === "Enter") {
        event.preventDefault();
        addComment();
    }
});

function share() {
    if (!checkLogin('share')) return;  // 로그인 체크
    const url = window.location.href;  // 현재 페이지의 URL
    const text = "Check out this event: 강릉 문화유산 야행!";  // 공유할 텍스트

    if (navigator.share) {
        // Web Share API를 사용하여 공유 (모바일 브라우저에서 주로 사용 가능)
        navigator.share({
            title: document.title,
            text: text,
            url: url,
        }).then(() => {
            console.log('Successful share');
        }).catch((error) => {
            console.error('Error sharing:', error);
        });
    } else {
        // Web Share API를 지원하지 않는 브라우저에서는 소셜 미디어 링크로 공유
        const shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}&quote=${encodeURIComponent(text)}`;
        window.open(shareUrl, '_blank', 'width=600,height=400');
    }
}
function more(button) {
    const moreContent = button.closest('.container').querySelector('.more-content');

    if (moreContent.style.display === 'none' || moreContent.style.display === '') {
        moreContent.style.display = 'block';
        button.textContent = '접기';
    } else {
        moreContent.style.display = 'none';
        button.textContent = '더보기';
    }
}

// 슬라이더 초기화
document.addEventListener('DOMContentLoaded', () => {
    showSlides();
});
