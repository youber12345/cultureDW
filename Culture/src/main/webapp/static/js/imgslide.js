let slideIndex = 0;
let hcount = 0;

// 세션에서 가져온 사용자 이름
const username = document.getElementById('username').value;

// 세션에서 사용자의 로그인 여부를 확인
const isLoggedIn = Boolean(document.getElementById('sessionUserId').value);

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



function reply(commentId) {
    const commentInput = document.getElementById('commentInput');
    commentInput.setAttribute('data-parent-id', commentId);  // Store parent comment ID
    commentInput.focus();
}
// 댓글 추가 함수
function addComment(eventNum) {
    const commentInput = document.getElementById('commentInput');
    const userNum = document.getElementById('userNum').value; 
    const parentCommentId = commentInput.getAttribute('data-parent-id') || null;  // Get parent ID

    if (commentInput.value.trim() === "") {
        alert('댓글을 입력해주세요.');
        return;
    }

    fetch('/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            comm: commentInput.value,
            eventNum: eventNum,
            userNum: userNum,
            parentCommentId: parentCommentId  // Include parent ID
        })
    })
    .then(response => response.json())
    .then(data => {
        const newComment = createCommentElement(data);
        document.getElementById('commentList').appendChild(newComment);
        commentInput.value = "";
        commentInput.removeAttribute('data-parent-id');  // Reset parent ID after comment is added
    })
    .catch(error => console.error('Error adding comment:', error));
}



// 댓글 수정 함수
function editComment(commentId) {
    const commentItem = document.getElementById(`comment-${commentId}`);
    const currentContent = commentItem.querySelector('p').textContent;
    const newContent = prompt('댓글을 수정하세요:', currentContent);

    if (newContent === null || newContent.trim() === "") {
        return;
    }

    fetch(`/editComment?commentId=${commentId}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            newContent: newContent
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            commentItem.querySelector('p').textContent = newContent;
        } else {
            alert('댓글 수정에 실패했습니다.');
        }
    })
    .catch(error => console.error('Error editing comment:', error));
}

// 댓글 삭제 함수
function deleteComment(commentId) {
    if (!confirm('정말로 댓글을 삭제하시겠습니까?')) {
        return;
    }

    fetch(`/deleteComment?commentId=${commentId}`, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.getElementById(`comment-${commentId}`).remove();
        } else {
            alert('댓글 삭제에 실패했습니다.');
        }
    })
    .catch(error => console.error('Error deleting comment:', error));
}

// 댓글 섹션 열기
function openCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    darkOverlay.style.display = 'block';
    commentSection.style.display = 'block';

    setTimeout(() => {
        darkOverlay.classList.toggle('active', true);
        commentSection.classList.toggle('active', true);
    }, 10);

    loadComments();  // 댓글 목록을 불러오는 함수
}

// 댓글 섹션 닫기
function closeCommentSection() {
    const darkOverlay = document.getElementById('darkOverlay');
    const commentSection = document.getElementById('commentSection');

    darkOverlay.classList.toggle('active', false);
    commentSection.classList.toggle('active', false);

    setTimeout(() => {
        darkOverlay.style.display = 'none';
        commentSection.style.display = 'none';
    }, 500);
}

// 댓글 목록 불러오기

function loadComments() {
    const eventNum = getEventNumFromURL();
    fetch(`/event/${eventNum}`)
        .then(response => response.json())
        .then(data => {
            const commentList = document.getElementById('commentList');
            commentList.innerHTML = '';  // 기존 댓글 삭제

            data.forEach(comment => {
                const commentElement = createCommentElement(comment);
                commentList.appendChild(commentElement);
            });
        })
        .catch(error => console.error('Error loading comments:', error));
}


// 댓글 요소 생성 함수
function createCommentElement(comment) {
    const commentItem = document.createElement('div');
    commentItem.className = 'comment-item';

    // 작성자를 username으로 표시하고 순서를 바꿔서 추가
    const usernameElement = document.createElement('span');
    usernameElement.className = 'comment-username';  // Add a class for styling
    usernameElement.textContent = comment.username;
    commentItem.appendChild(usernameElement);

    // Add a space between username and timestamp
    const spaceElement = document.createElement('span');
    spaceElement.textContent = ' ';  // This adds a space
    commentItem.appendChild(spaceElement);

    const createdAtElement = document.createElement('span');
    createdAtElement.className = 'comment-timestamp';  // Add a class for styling
    if (comment.createdAt) {
        createdAtElement.textContent = new Date(comment.createdAt).toLocaleString();
        commentItem.appendChild(createdAtElement);
    }

    const contentElement = document.createElement('p');
    contentElement.className = 'comment-content';  // Add a class for styling
    contentElement.textContent = comment.comm;
    commentItem.appendChild(contentElement);

    return commentItem;
}




// URL에서 이벤트 번호 추출 함수
function getEventNumFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('eventNum');
}

// 팝업 열기 시 오버레이 표시
function share(event) {
    document.getElementById('sharePopup').style.display = 'block';
    document.getElementById('shareOverlay').style.display = 'block';
}

// 팝업 닫기 시 오버레이 숨기기
function closeShare() {
    document.getElementById('sharePopup').style.display = 'none';
    document.getElementById('shareOverlay').style.display = 'none';
}

// 팝업 외부를 클릭하면 팝업 닫기
document.getElementById('shareOverlay').addEventListener('click', function() {
    closeShare();
});


// 링크 복사 기능
function copyLink() {
    const link = window.location.href;
    navigator.clipboard.writeText(link)
        .then(() => {
            alert('링크가 복사되었습니다.');
        })
        .catch(err => {
            console.error('링크 복사 실패:', err);
        });
}

// 각 소셜 미디어 공유 링크 생성
function shareToPlatform(platform) {
    const url = encodeURIComponent(window.location.href); // 현재 페이지의 URL
    const title = encodeURIComponent(document.querySelector('h2.h2').textContent); // 이벤트 이름
    let shareUrl = '';

    switch(platform) {
        case 'facebook':
            shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
            break;
        case 'twitter':
            shareUrl = `https://twitter.com/intent/tweet?url=${url}&text=${title}`;
            break;
        case 'kakao':
            shareUrl = `https://kakao.com/share?url=${url}`;
            break;
        case 'naver':
            shareUrl = `https://share.naver.com/web/shareView.nhn?url=${url}&title=${title}`;
            break;
        case 'band':
            shareUrl = `https://band.us/plugin/share?url=${url}&title=${title}`;
            break;
        default:
            return;
    }

    window.open(shareUrl, '_blank');
}
