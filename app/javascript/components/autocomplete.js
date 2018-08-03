function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const spaceAddress = document.getElementById('search_query');

    if (spaceAddress) {
      const autocomplete = new google.maps.places.Autocomplete(spaceAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(spaceAddress, 'keydown', function(e) {
      });
    }
  });
}

export { autocomplete };
