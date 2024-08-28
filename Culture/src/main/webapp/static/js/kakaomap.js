document.addEventListener("DOMContentLoaded", function() {
    // 지도 중심 좌표를 얻기 위해 data 속성에서 값을 가져옵니다.
    var x = parseFloat(document.getElementById("map").getAttribute("data-lng"));
    var y = parseFloat(document.getElementById("map").getAttribute("data-lat"));

    // Kakao Maps API를 동적으로 로드
    const script = document.createElement("script");
    script.src = "https://dapi.kakao.com/v2/maps/sdk.js?appkey=dee41a720006637a3ef43799720ec190&autoload=false&libraries=clusterer,services";
    document.head.appendChild(script);

    // 스크립트 로드 완료 후 지도 초기화
    script.onload = () => {
        kakao.maps.load(() => {
            // 지도 옵션 설정
            var mapContainer = document.getElementById('map'); // 지도를 표시할 div
            var mapOption = {
                center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표 (위도, 경도 순서)
                level: 3 // 지도의 확대 레벨
            };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(y, x);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
        });
    };
});