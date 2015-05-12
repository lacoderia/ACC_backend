//= require underscore
//= require gmaps/google

$(document).ready(function(){

  var edit = false;
  if ($("#map").data("lat")) {
    var latlng = new google.maps.LatLng($("#map").data("lat"), $("#map").data("long"));
    var edit = true;
  } else {
    var latlng = new google.maps.LatLng(4.624335, -74.063644);
  }

  var mapDiv = $("#map")[0];
  var map = new google.maps.Map(mapDiv, {
              center: latlng,
              minZoom: 11,
              zoom: 15,
              maxZoom: 17,
              mapTypeId: google.maps.MapTypeId.ROADMAP              
  });
  
  DistanceWidget.prototype = new google.maps.MVCObject();
  var distanceWidget = new DistanceWidget(map);

  google.maps.event.addListener(distanceWidget, 'distance_changed', function() {
    displayInfo(distanceWidget);
  });

  google.maps.event.addListener(distanceWidget, 'position_changed', function() {
    displayInfo(distanceWidget);
  });

});

function displayInfo(widget) {
  $("#location_lat")[0].value = widget.get('position').lat();
  $("#location_long")[0].value = widget.get('position').lng();
}

function DistanceWidget(map) {
  this.set('map', map);
  this.set('position', map.getCenter());

  var marker = new google.maps.Marker({
    draggable: true,
    title: 'Mueve el centro'
  });

  this.set('minDistance', 0.05);
  this.set('maxDistance', 0.6);

  marker.bindTo('map', this);

  marker.bindTo('position', this);
}

