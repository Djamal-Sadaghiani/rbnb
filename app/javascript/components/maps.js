import GMaps from 'gmaps';

const showMap = function (){
    const mapElement = document.getElementById('map_show');
    if (mapElement) {
    const map = new GMaps({ el: '#map_show', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    map.addMarkers([markers]);
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14);
  }
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
  }
}

export { showMap };
export { searchMap };
export { shownoresultMap };
