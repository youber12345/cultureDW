document.addEventListener("DOMContentLoaded", function() {
    var x = parseFloat(document.getElementById("map").getAttribute("data-lng"));
    var y = parseFloat(document.getElementById("map").getAttribute("data-lat"));

    const script = document.createElement("script");
    script.src = "https://dapi.kakao.com/v2/maps/sdk.js?appkey=dee41a720006637a3ef43799720ec190&autoload=false&libraries=clusterer,services";
    document.head.appendChild(script);

    script.onload = () => {
        kakao.maps.load(() => {
            var mapContainer = document.getElementById('map');
            var mapOption = {
                center: new kakao.maps.LatLng(y, x),
                level: 3
            };

            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 행사 위치 마커 이미지 설정
            var eventMarkerImage = new kakao.maps.MarkerImage(
                'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 행사 마커 이미지 경로
                new kakao.maps.Size(24, 35) // 마커 크기
            );

            var eventMarkerPosition = new kakao.maps.LatLng(y, x);

            // 행사 위치 마커 생성
            var eventMarker = new kakao.maps.Marker({
                position: eventMarkerPosition,
                image: eventMarkerImage // 행사 마커 이미지 설정
            });

            eventMarker.setMap(map);

            var ps = new kakao.maps.services.Places();

            ps.keywordSearch('맛집', placesSearchCB, { location: new kakao.maps.LatLng(y, x), radius: 4000 });

            function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i = 0; i < data.length; i++) {
            // 예를 들어 별점이 4.0 이상인 맛집만 표시
            if (data[i].rating && data[i].rating >= 4.0) {
                displayMarker(data[i]);
            }
        }
    } else {
        alert('음식점 정보를 불러오는데 실패했습니다.');
    }
}

            function displayMarker(place) {
                // 맛집 마커 이미지 설정
                var placeMarkerImage = new kakao.maps.MarkerImage(
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 맛집 마커 이미지 경로
                    new kakao.maps.Size(24, 35) // 마커 크기
                );

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x),
                    image: placeMarkerImage // 맛집 마커 이미지 설정
                });

                kakao.maps.event.addListener(marker, 'click', function() {
                    var infowindow = new kakao.maps.InfoWindow({
                        content: `<div style="padding:5px;font-size:12px;">${place.place_name}</div>`
                    });
                    infowindow.open(map, marker);
                    console.log(`${place.place_name}`);

                });
            }
            
        });
    };
});
