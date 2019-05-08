   /**
    *
    * This function displays on a Google Map the location of all upcoming 
    * events. 
    * Events are fetch for the current user and check if their datetime. If
    * available the pin icon is set to red, if not to blue.
    *
    * @author: Diego Capre 
    * @version: 1.0
    * @date: 2019-05-07
    *
    **/
      var map;
      function initMap() {
          
        // Global variable scope
        var form  = "";
        var user_email = "";
        var day = "";
        var mon = "";
        var year = "";
        
        // Default coordinates to center map, currently set to center of Puerto Rico
        var center = {lat: 18.231251, lng: -66.450928};
        map = new google.maps.Map(document.getElementById('map'), {center: center,zoom: 8,});
 
        // Fetch User in order to know which Employee information to extract 
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };  
        axios.get(endPointUrl).then(response => {
                    
            user_email = response.data.Email; 

            // Fetch schedule Events for user
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= email eq '"+ user_email +"'&$select=event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
            axios.get(endPointUrl).then(response => {
                       form = response.data.value; // all available events for user

                       var i;
                       for (i=0; ;i++){
                           // Check if looping through schedule Events has finished
                           if(typeof form[i] === 'undefined'){break}
                           // Check if event's status, If not in AGENDA don't display
                           if( (form[i].Event_Status != "FINISHED") && (form[i].Event_Status != "Canceled")){
                               
                               // Establish event's datet
                               date  = (form[i].event_date).split("T");
                               var date2 = date[0].split("-")
                               let day = date2[2];
                               let mo = date2[1];
                               let year = date2[0];
                               
                               // Today's date
                               var currentDate = new Date();
                               var d = ""+currentDate.getDate();       // day
                               var m = currentDate.getMonth();         // month (Be careful! January is 0 not 1)
                               var mu = ""+(m+1);                      // month, adjusted
                               var y = ""+currentDate.getFullYear();   // year
                               
                               // Adjust month and day format (Ex. 9 -> 09)
                               if( mu.length <= 1){ mu = "0"+mu;}
                               if( d.length <= 1){ d = "0"+d;}
                               
                            //Check if demo hasn't passed       
                            if((Number(year) >= Number(y))&&(Number(mo) >= Number(mu))&&(Number(day) >= Number(d)) ){
                                 
                              // Get Coordinates for locations if available
                              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=Title eq'"+form[i].event_client +"' &$select=Title,lat,lon";
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
                                    // Link to Google Map
                                    var link = "http://www.google.com/maps/place/" +lat+","+lon;
                                    // Display information above marker
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
                                   
                                    // If Event today change marker color to red
                                    if((year === y)&&(mo === mu)&&(day === d)){
                                       var marker = new google.maps.Marker({
                                            position: dic,map: map,title: '',   
                                            icon: {                             
                                                url: "https://maps.google.com/mapfiles/ms/icons/red-dot.png"    
                                            },
                                        });
                                        marker.addListener('click', function() {infowindow.open(map, marker);});
                                    }
                                    else{
                                        var marker = new google.maps.Marker({
                                            position: dic,map: map,title: '',   
                                            icon: {                             
                                                url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png"    
                                            },
                                        });
                                        marker.addListener('click', function() {infowindow.open(map, marker);});
                                    }
                                    
                                });
                              } // yet to happen
                       } //Not valid
                 }
          });
      });
      
      }
