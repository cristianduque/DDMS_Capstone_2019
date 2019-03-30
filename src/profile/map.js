  var map;
      function initMap() {
          
          // Center of Map (should be upcoming demo)
          var colegio = {lat: 18.209527, lng: -67.139727};
          map = new google.maps.Map(document.getElementById('map'), {center: colegio,zoom: 15});
          //Markers of next demos
          var marker = new google.maps.Marker({position: colegio, map: map});
      }
