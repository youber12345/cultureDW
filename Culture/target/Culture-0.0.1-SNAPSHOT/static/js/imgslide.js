let slideIndex = 0;
let hcount = 0;

function showSlides() {
    const slides = document.querySelectorAll('.slide');
    slides.forEach((slide, index) => {
        slide.style.display = 'none';
    });
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1 }
    slides[slideIndex - 1].style.display = 'block';
}

function prevSlide() {
    slideIndex -= 2;
    if (slideIndex < 0) { slideIndex = document.querySelectorAll('.slide').length - 1; }
    showSlides();
}

function nextSlide() {
    showSlides();
}

// 좋아요 버튼 클릭 시 서버에 좋아요 요청을 보내는 함수
function toggleHeart(eventNum) {
    const heartIcon = document.querySelector('.icons img:first-child');
    const userNumElement = document.getElementById('userNum');

    // userNum이 null인지 확인하고 경고 메시지를 출력
    if (!userNumElement) {
        alert("User is not logged in or userNum is missing.");
        return; // 함수 실행 중단
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
                        hcount = 1;
                    } else {
                        heartIcon.src = "static/icon/blackfav.png";
                        hcount = 0;
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

function openCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    darkOverlay.style.display = 'block';
    darkOverlay.classList.add('active');
    
    commentSection.style.display = 'block';
    setTimeout(() => {
        commentSection.classList.add('active');
    }, 10);
}

function closeCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    darkOverlay.classList.remove('active');
    commentSection.classList.remove('active');

    setTimeout(() => {
        darkOverlay.style.display = 'none';
        commentSection.style.display = 'none';
    }, 500);
}

function addComment() {
    const commentInput = document.getElementById('commentInput');
    const commentList = document.getElementById('commentList');

    if (commentInput.value.trim() !== "") {
        const newComment = document.createElement('div');
        newComment.classList.add('comment-item');

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
    const url = window.location.href;
    const text = "Check out this event: 강릉 문화유산 야행!";

    if (navigator.share) {
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
