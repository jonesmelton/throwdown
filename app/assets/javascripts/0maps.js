
function placeMap() {
  console.log("all sys go");
  var location = $('#location').text();
  getLatLong(location);
}

function getLatLong(location) {
  $.ajax({
    url: '/addresses',
    data: {address: location},
    method: "POST"
  });
}
