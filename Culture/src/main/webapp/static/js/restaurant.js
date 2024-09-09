kakao.maps.load(function() {
    // 지도를 표시할 div
    var mapContainer = document.getElementById('map'); 
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 기본 중심 좌표를 서울시청으로 설정
        level: 3 // 지도의 확대 레벨
    };

    // 지도를 생성합니다.
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // Kakao Local API로 음식점 검색
    var places = new kakao.maps.services.Places(); 

    // '서울 맛집' 키워드로 장소 검색
    places.keywordSearch('서울 맛집', function(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            for (var i=0; i<data.length; i++) {
                var restaurant = data[i];
                addMarker(restaurant.y, restaurant.x, restaurant.place_name);
            }
        } else {
            console.log("맛집 데이터를 불러오지 못했습니다. 상태 코드: " + status);
        }
    });

    // 마커를 추가하는 함수
    function addMarker(latitude, longitude, name) {
        var markerPosition = new kakao.maps.LatLng(latitude, longitude);
        var placeMarkerImage = new kakao.maps.MarkerImage(
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 맛집 마커 이미지 경로
                    new kakao.maps.Size(30, 35) // 마커 크기
                );
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: placeMarkerImage // 맛집 마커 이미지 설정
        });

        // 마커에 표시될 인포윈도우 생성
        var infowindow = new kakao.maps.InfoWindow({
            content: `<div style="padding:5px;">${name}</div>`
        });

        // 마커에 마우스를 올리면 인포윈도우 표시
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에서 마우스를 내리면 인포윈도우 닫기
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });

        marker.setMap(map);
    }
});
