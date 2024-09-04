function background() {
    	window.location.href = 'homepage';
}
function openLoginPopup() {
    var width = 400; // 팝업창의 너비
    var height = 600; // 팝업창의 높이
    var left = (window.screen.width / 2) - (width / 2);
    var top = (window.screen.height / 2) - (height / 2);
    
    // 현재 페이지의 컨텍스트 경로를 가져옴
    var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

    // 팝업창 옵션 설정
    var popupOptions = `width=${width},height=${height},top=${top},left=${left},scrollbars=no,resizable=no`;
    
    // 팝업창 열기
    window.open(contextPath + '/loginpage', '로그인', popupOptions);
}
