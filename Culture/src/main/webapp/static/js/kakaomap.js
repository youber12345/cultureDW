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

            // 행사 위치 마커의 이미지 설정 (예: 기본 마커)
            var eventMarkerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; // 행사 위치 아이콘 이미지 URL
            var eventMarkerImageSize = new kakao.maps.Size(24, 35); // 아이콘 크기 설정
            var eventMarkerImageOption = { offset: new kakao.maps.Point(12, 35) }; // 마커 좌표와 이미지 좌표의 핀 포인트 설정
            var eventMarkerImage = new kakao.maps.MarkerImage(eventMarkerImageSrc, eventMarkerImageSize, eventMarkerImageOption);

            // 행사 위치 마커 생성
            var eventMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(y, x),
                image: eventMarkerImage // 행사 위치 아이콘 설정
            });

            // 행사 위치 마커가 지도에 표시되도록 설정합니다
            eventMarker.setMap(map);

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();

            // 키워드로 장소를 검색합니다 (예: 맛집)
            ps.keywordSearch('맛집', placesSearchCB, { location: new kakao.maps.LatLng(y, x), radius: 2000 });

            // 장소 검색이 완료됐을 때 호출되는 콜백 함수입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {
                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                    }
                } else {
                    alert('음식점 정보를 불러오는데 실패했습니다.');
                }
            }

            // 지도에 맛집 마커를 표시하는 함수입니다
            function displayMarker(place) {
                // 맛집 마커의 이미지 설정 (예: 다른 마커)
                var placeMarkerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 맛집 아이콘 이미지 URL
                var placeMarkerImageSize = new kakao.maps.Size(24, 35); // 아이콘 크기 설정
                var placeMarkerImageOption = { offset: new kakao.maps.Point(12, 35) }; // 마커 좌표와 이미지 좌표의 핀 포인트 설정
                var placeMarkerImage = new kakao.maps.MarkerImage(placeMarkerImageSrc, placeMarkerImageSize, placeMarkerImageOption);

                // 맛집 마커 생성
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x),
                    image: placeMarkerImage // 맛집 아이콘 설정
                });

                // 마커에 클릭 이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function() {
                    // 장소명과 장소 주소를 마커 인포윈도우에 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: `<div style="padding:5px;font-size:12px;">${place.place_name}</div>`
                    });
                    infowindow.open(map, marker);
                });
            }
        });
    };
});
