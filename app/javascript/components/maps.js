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

export { showMap };
