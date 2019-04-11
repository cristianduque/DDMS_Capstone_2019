var map;
function initMap() {
   var id = window.location.href.split('=').pop();
    
    // Fetch schedule Events
    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=Title eq '"+ id +"'&$select=*";
    var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
     axios.get(endPointUrl).then(response => {
           
        form = response.data.value;
        //console.log(form[0]);
     
        // Get Coordinates
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=t1q7 eq'"+ form[0].Tienda +"' &$select=wu4k,x3w5";
        var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response => {
                
           // console.log(response.data.value);
              var lat = Number(response.data.value[0].wu4k);
              var lon = Number(response.data.value[0].x3w5);
                                    
              var dic = {lat: lat, lng: lon};
            
              // Check if coordinates available
              if(lat){ 
                      map = new google.maps.Map(document.getElementById('map'), {center: dic,zoom: 12});
                      var marker = new google.maps.Marker({position: dic, map: map}); }
              else{
                      var center = {lat: 18.231251, lng: -66.450928};
                      map = new google.maps.Map(document.getElementById('map'), {center: center,zoom: 9});
              }
                
                });
                            
          });
      
}
