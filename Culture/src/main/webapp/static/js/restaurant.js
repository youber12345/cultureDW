function initializeMaps() {
    var mapObjects = {}; // 각 지도 객체를 저장할 객체

    // 카카오 맵이 로드된 후 처리
    kakao.maps.load(function () {
        // 모든 지도 요소를 가져와서 처리
        var maps = document.querySelectorAll('.map');
        maps.forEach(function (mapElement) {
            var eventNum = mapElement.getAttribute('data-event-num');
            var eventLat = parseFloat(mapElement.getAttribute('data-event-lot'));  // 위도
            var eventLot = parseFloat(mapElement.getAttribute('data-event-lat'));  // 경도 (순서 바뀜)

            // 지도 옵션 설정
            var mapOption = {
                center: new kakao.maps.LatLng(eventLat, eventLot),  // 순서: 위도, 경도
                level: 3 // 지도의 확대 레벨
            };

            // 지도를 생성하고 mapObjects에 저장합니다.
            var map = new kakao.maps.Map(mapElement, mapOption);
            mapObjects[eventNum] = map;

            // 음식점 검색 (categorySearch로 음식점 카테고리 검색)
            var places = new kakao.maps.services.Places();
            places.categorySearch('FD6', function (data, status) {
                if (status === kakao.maps.services.Status.OK) {
                    for (var i = 0; i < data.length; i++) {
                        var restaurant = data[i];
                        addMarker(restaurant.y, restaurant.x, restaurant.place_name, map);
                    }
                } else {
                    console.error("음식점 데이터를 불러오지 못했습니다. 상태 코드: " + status);
                }
            }, {
                location: new kakao.maps.LatLng(eventLat, eventLot),
                radius: 1000 // 검색 반경 1km
            });

            // 마커를 추가하는 함수
            function addMarker(latitude, longitude, name, map) {
                var markerPosition = new kakao.maps.LatLng(latitude, longitude);
                var marker = new kakao.maps.Marker({ position: markerPosition });

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="padding:5px;">' + name + '</div>'
                });

                kakao.maps.event.addListener(marker, 'mouseover', function () {
                    infowindow.open(map, marker);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                marker.setMap(map);
            }
        });
    });

    // 카드가 더블클릭될 때 지도를 다시 렌더링
    document.querySelectorAll('.map-item').forEach(function(mapItem) {
        // 더블클릭 이벤트 추가
        mapItem.addEventListener('dblclick', function() {
            // 클릭한 카드에 'expanded' 클래스를 토글
            mapItem.classList.toggle('expanded');

            // 지도 ID를 가져옵니다.
            var mapId = mapItem.querySelector('.map').getAttribute('id').split('-')[1];

            // 카드가 커진 후에 relayout을 호출하기 위해 약간의 지연을 줍니다.
            setTimeout(function() {
                // 해당 지도 객체의 레이아웃을 다시 설정
                if (mapObjects[mapId]) {
                    mapObjects[mapId].relayout();  // 지도가 부모 요소의 크기에 맞게 다시 렌더링됩니다.

                    // 지도의 중심을 다시 설정해서 확대된 상태에서도 중심이 유지되도록 합니다.
                    var center = mapObjects[mapId].getCenter();
                    mapObjects[mapId].setCenter(center);
                }
            }, 300);  // 300ms 정도 지연을 준 후 relayout 호출
        });
    });
}

// DOMContentLoaded 이벤트 후 지도 초기화 및 카드 확장 기능 추가
document.addEventListener("DOMContentLoaded", function() {
    initializeMaps();
});
