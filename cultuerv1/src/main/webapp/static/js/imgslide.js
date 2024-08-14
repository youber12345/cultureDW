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
        heartIcon.src = 'icon/heart.png';
        hcount = 1;
    } else {
        heartIcon.src = 'icon/favorite.png';
        hcount = 0;
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
