function autocomplete(field) {
  document.addEventListener("DOMContentLoaded", function() {
    const spaceAddress = document.getElementById(field);

    if (spaceAddress) {
      const autocomplete = new google.maps.places.Autocomplete(spaceAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(spaceAddress, 'keydown', function(e) {
      });
    }
  });
}

export { autocomplete };

function autocomplete_city(field) {
  document.addEventListener("DOMContentLoaded", function() {
    const city = document.getElementById(field);

    if (city) {
      const autocomplete = new google.maps.places.Autocomplete(city, { types: [ '(cities)' ] });
      google.maps.event.addDomListener(city, 'keydown', function(e) {
      });
    }
  });
}

export { autocomplete_city };

