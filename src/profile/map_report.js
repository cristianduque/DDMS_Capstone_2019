   /**
    *
    * This function displays on a Google Map the location of
    * an event's establishment.
    *
    * @author: Diego Capre 
    * @version: 1.0
    * @date: 2019-05-07
    *
    **/
var map;
function initMap() {
    
   // event_id from page's URL
   var id = window.location.href.split('=').pop();
    
    // Fetch report form of specified event
    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
    var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
     axios.get(endPointUrl).then(response => {
           
        form = response.data.value; // report form
         
        // Get Coordinates of the establishment 
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=Title eq'"+ form[0].Tienda +"' &$select=Title,lat,lon";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
        };
        axios.get(endPointUrl).then(response => {

              var title =response.data.value[0].Title;
              var lat = Number(response.data.value[0].lat);
              var lon = Number(response.data.value[0].lon);
                                    
              var dic = {lat: lat, lng: lon};
            
              // Check if coordinates available from table
              if(lat){ 
                      map = new google.maps.Map(document.getElementById('map'), {center: dic,zoom: 12,});
                      // Google Map link
                      var link = "http://www.google.com/maps/place/" +lat+","+lon;
                      var contentString = '<div id="content">'+
                                                        '<div id="siteNotice">'+
                                                        '</div>'+
                                                        '<h2 id="firstHeading" class="firstHeading">'+title+'</h2>'+
                                                        '<div id="bodyContent">'+
                                                        '<p><a style="text-decoration:none; background-color: transparent; color:blue;" href='+link+'>'
                                                        +lat+','+lon+'</a> </p>'+
                                                        '</div>'+
                                                        '</div>';

                    var infowindow = new google.maps.InfoWindow({content: contentString});
                    var marker = new google.maps.Marker({
                        position: dic,
                        map: map,
                        title: '',
                        icon: {                             
                                 url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png"    
                        },
                    });
                    marker.addListener('click', function() {infowindow.open(map, marker);});
              }
              else{
                      var center = {lat: 18.231251, lng: -66.450928};
                      map = new google.maps.Map(document.getElementById('map'), {center: center,zoom: 9});
              }
                
                });             
          });  
}
