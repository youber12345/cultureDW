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

function toggleHeart() {
    const heartIcon = document.querySelector('.icons img:first-child');
    if (hcount === 0) {
        heartIcon.src = 'static/icon/heart.png';
        hcount = 1;
    } else {
        heartIcon.src = 'static/icon/blackfav.png';
        hcount = 0;
    }
}

function openCommentSection() {
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
    const commentInput = document.getElementById('commentInput');
    const commentList = document.getElementById('commentList');

    if (commentInput.value.trim() !== "") {
        const newComment = document.createElement('div');
        newComment.textContent = commentInput.value;
        commentList.appendChild(newComment);
        commentInput.value = "";
    }
}

function share() {
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
