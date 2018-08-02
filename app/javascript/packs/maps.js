const map = new GMaps({ el: '#map_show', lat: 48.8648482, lng: 2.3798534, zoom: 14 });
const marker = { lat: 48.8648482, lng: 2.3798534 };
map.addMarkers([ marker ]);
console.log("HI")
