import GMaps from 'gmaps';


const styles = [ {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#7c93a3"
            },
            {
                "lightness": "-10"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#a0a4a5"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#62838e"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#dde3e3"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#3f4a51"
            },
            {
                "weight": "0.30"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "poi.attraction",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.government",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": "-100"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#bbcacf"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "lightness": "0"
            },
            {
                "color": "#bbcacf"
            },
            {
                "weight": "0.50"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway.controlled_access",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "road.highway.controlled_access",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#a9b4b8"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "invert_lightness": true
            },
            {
                "saturation": "-7"
            },
            {
                "lightness": "3"
            },
            {
                "gamma": "1.80"
            },
            {
                "weight": "0.01"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#a3c7df"
            }
        ]
    } ];


const showMap = function (){
    const mapElement = document.getElementById('map_show');
    if (mapElement) {
    const map = new GMaps({ el: '#map_show', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    map.addMarkers([markers]);
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14);
    map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    }
}

const showStreet = function () {
  const streetElement = document.getElementById("street-view");
  const markers = JSON.parse(streetElement.dataset.markers);
  const panorama = new google.maps.StreetViewPanorama(
            streetElement, {
              position: markers,
              pov: {
                heading: 34,
                pitch: 10
              }
            });
  streetMap.setStreetView(panorama);
}


const shownoresultMap = function (){
    const mapElement = document.getElementById('map_noresult');
    if (mapElement) {
    const map = new GMaps({ el: '#map_noresult', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    map.addMarkers([markers]);
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14);
    map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    }
}


const searchMap = function () {
  const mapElement = document.getElementById('map_search');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map_search', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }
    map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    const cards = document.querySelectorAll('.card');
    console.log(cards);
    console.log(map);
    cards.forEach((card, index) => {
      const marker = map.markers[index];
      card.addEventListener('mouseover', () => {
        map.setCenter(markers[index]);
        marker.infoWindow.open(map, marker);
        marker.setIcon('https://raw.githubusercontent.com/Concept211/Google-Maps-Markers/master/images/marker_red.png');
      });
      card.addEventListener('mouseout', () => {
        map.fitLatLngBounds(markers);
        marker.infoWindow.close(map, marker);
        marker.setIcon('https://image.ibb.co/hdk2gK/map_marker_black.png');
      });
    })
    }
}

const bookingMap = function (){
  const bookingMaps = document.querySelectorAll('.booking-map');
  for (let i = 0, len = bookingMaps.length; i < len; i++) {

    console.log(bookingMaps[i] + " ---- " + i);
    if (bookingMaps[i]) {
    const map = new GMaps({ el: '#booking-map-' + i, lat: 0, lng: 0 });
    const markers = JSON.parse(bookingMaps[i].dataset.markers);
    console.log(markers);
    map.addMarkers([markers]);
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14);
    map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    }
  };
}

const parkingMap = function (){
  const parkingMaps = document.querySelectorAll('.parking-map');
  for (let i = 0, len = parkingMaps.length; i < len; i++) {

    console.log(parkingMaps[i] + " ---- " + i);
    if (parkingMaps[i]) {
    const map = new GMaps({ el: '#parking-map-' + i, lat: 0, lng: 0 });
    const markers = JSON.parse(parkingMaps[i].dataset.markers);
    console.log(markers);
    map.addMarkers([markers]);
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14);
    map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    }
  };
}

export { parkingMap };
export { bookingMap};
export { showMap };
export { showStreet };
export { searchMap };
export { shownoresultMap };
