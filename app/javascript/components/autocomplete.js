function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var bikeLocation = document.getElementById('bike_location');

    if (bikeLocation) {
      var autocomplete = new google.maps.places.Autocomplete(bikeLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(bikeLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
