import GMaps from 'gmaps';

const showMap = function (){
    const mapElement = document.getElementById('map_show');
    if (mapElement) {
    const map = new GMaps({ el: '#map_show', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
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
