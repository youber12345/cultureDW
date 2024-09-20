let slideIndex = 0;
let hcount = 0;

// 세션에서 가져온 사용자 이름
const username = document.getElementById('username').value;

// 세션에서 사용자의 로그인 여부를 확인
const isLoggedIn = Boolean(document.getElementById('sessionUserId').value);

// 좋아요 상태를 확인하고 하트를 초기화하는 함수
function loadHeartStatus(eventNum) {
    const heartIcon = document.querySelector(`.icons img[onclick="toggleHeart(${eventNum})"]`);

    if (!isLoggedIn) {
        alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
        window.location.href = "/login";
        return;
    }

    // Optional chaining 대신 기본적인 null 체크로 변경
    const userNum = document.getElementById('userNum');
    if (!userNum) {
        console.error('User number not found.');
        return;
    }

    fetch(`/checkLikeStatus?userNum=${userNum.value}&eventNum=${eventNum}`)
        .then(response => response.json())
        .then(data => {
            if (data.liked) {
                heartIcon.src = "static/icon/heart.png";  // 좋아요가 되어있다면 채워진 하트
            } else {
                heartIcon.src = "static/icon/heart.png";  // 좋아요가 안되어있다면 빈 하트
            }
        })
        .catch(error => console.error("Error checking like status:", error));
}

// 좋아요 토글 함수
function toggleHeart(eventNum) {
    const heartIcon = document.querySelector(`.icons img[onclick="toggleHeart(${eventNum})"]`);
    const userNum = document.getElementById('userNum');
    
   

    fetch('/toggleLike', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            userNum: userNum.value,
            eventNum: eventNum
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // 좋아요 개수 업데이트
            const likeCountElem = heartIcon.nextSibling;
            if (likeCountElem) {
                likeCountElem.textContent = ` ${data.likeCount}`;
            }
            // 버튼 스타일 변경 (좋아요 상태 반영)
            heartIcon.src = data.isLiked ? "static/icon/heart.png" : "static/icon/heart.png";
        } else {
            alert("로그인이 필요합니다.");
	        window.location.href = "/login";
	        return;
        }
    })
    .catch(error => console.error('Error:', error));
}

// 페이지 로드 시 좋아요 상태를 확인하고 하트를 업데이트
document.addEventListener('DOMContentLoaded', function() {
    const eventNum = getEventNumFromURL();  // URL 또는 HTML에서 eventNum을 가져오는 함수
    if (eventNum) {
        loadHeartStatus(eventNum);  // 좋아요 상태 동기화
    }
});

function openCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    // 어두운 배경 레이어 활성화
    darkOverlay.style.display = 'block';
    darkOverlay.classList.add('active');  // 배경을 활성화

    // 댓글 섹션 활성화
    commentSection.style.display = 'block';
    
    // 애니메이션을 적용하여 댓글 섹션을 위로 올림
    setTimeout(() => {
        commentSection.classList.add('active');
    }, 10);  // 10ms의 딜레이 후에 active 클래스를 추가
}


function closeCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    // 어두운 배경 레이어 비활성화
    darkOverlay.classList.remove('active');
    setTimeout(() => {
        darkOverlay.style.display = 'none';
    }, 500);  // 애니메이션이 끝난 후 배경을 숨김

    // 댓글 섹션 비활성화
    commentSection.classList.remove('active');
    setTimeout(() => {
        commentSection.style.display = 'none';
    }, 500);  // 500ms 후에 댓글 섹션을 숨김 (애니메이션 시간과 일치)
}


function addComment() {
    const commentInput = document.getElementById('commentInput');
    const commentList = document.getElementById('commentList');

    if (commentInput.value.trim() !== "") {
        const newComment = document.createElement('div');
        newComment.classList.add('comment-item');  // 새롭게 추가된 클래스

        newComment.innerHTML = `
            <span class="comment-author">${username}</span>
            <span class="comment-content">${commentInput.value}</span>
        `;
        commentList.appendChild(newComment);
        commentInput.value = "";  // 입력 필드 초기화
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
        const shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}&quote=${text}`;
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
