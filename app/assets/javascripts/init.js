$(document).ready(function() {
  var mapLocation;
  getLocation();

  function getLocation() {
    var location = $('#location').text()
    getLatLong(location).done(function(response) {
      mapLocation = makeLocationObject(response);
      var mapDiv = document.getElementById('map');
      var mapOptions = {
        center: mapLocation,
        zoom: 16
      }
      var map = new google.maps.Map(mapDiv, mapOptions)
    });
  }

  function getLatLong(location) {
    var result;
    return $.ajax({
      url: '/addresses',
      data: {address: location},
      method: "POST"
    });
  }

  function makeLocationObject(response) {
    var lat = response.results[0].geometry.location.lat;
    var lng = response.results[0].geometry.location.lng;
    var latLngObject = new google.maps.LatLng(lat, lng);
    console.log(latLngObject)
    return latLngObject
  }

});
