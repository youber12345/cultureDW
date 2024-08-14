
function openLoginPopup() {
    var width = 400; // 팝업창의 너비
    var height = 600; // 팝업창의 높이
    var left = (window.screen.width / 2) - (width / 2);
    var top = (window.screen.height / 2) - (height / 2);
    
    // 팝업창 옵션 설정
    var popupOptions = `width=${width},height=${height},top=${top},left=${left},scrollbars=no,resizable=no`;
    
    // 팝업창 열기
    window.open('loginpage.html', '로그인', popupOptions);
    
}
