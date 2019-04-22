      var map;
      function initMap() {
          
        // Global variable scope

        var form  = "";
        var user_email = "";

        var center = {lat: 18.231251, lng: -66.450928};
        map = new google.maps.Map(document.getElementById('map'), {center: center,zoom: 8,gestureHandling: 'greedy'});
          
        
          
 
          
        // Fetch User in order to know which Employee information to extract 
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        
        axios.get(endPointUrl).then(response => {
                    
                    // returns user email
                    user_email = response.data.Email; 
                    //console.log(user_email);
            // Fetch schedule Events
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= email eq '"+ user_email +"'&$select=event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
           
            axios.get(endPointUrl).then(response => {
                       form = response.data.value;
                       
                       //if(typeof form[0] === 'undefined'){return}
                       var i;
                       for (i=0; ;i++){
                           // Check if finish looping schedule Events
                           if(typeof form[i] === 'undefined'){break}
                           // Check if event is schedule or in progress
                           //console.log(form[i].Event_Status);
                           //console.log( (form[i].Event_Status !== "FINISH")  );
                           //console.log( (form[i].Event_Status !== "CANCELED")  );
                           if( (form[i].Event_Status != "FINISH") && (form[i].Event_Status != "CANCELED")){
                              // Get Coordinates
                              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=Title eq'"+form[i].event_client +"' &$select=Title,lat,lon";
                              var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
                              this.status = "getting data..."; 
                              axios.get(endPointUrl).then(response => {
                                    var title =response.data.value[0].Title;
                                    var lat = Number(response.data.value[0].lat);
                                    var lon = Number(response.data.value[0].lon);
                                    
                                    var dic = {lat: lat, lng: lon};
                                    //console.log(dic);
                                    //Markers of next demos
                                    //var marker = new google.maps.Marker({position: dic, map: map});
                                    var link = "http://www.google.com/maps/place/" +lat+","+lon;
                                  
                                    var contentString = '<div id="content">'+
                                                        '<div id="siteNotice">'+
                                                        '</div>'+
                                                        '<h2 id="firstHeading" class="firstHeading">'+title+'</h2>'+
                                                        '<div id="bodyContent">'+
                                                        '<p><a style="text-decorations:none; background-color: transparent; color:blue;" href='+link+'>'
                                                        +lat+','+lon+'</a> </p>'+
                                                        '</div>'+
                                                        '</div>';
                            

                                    var infowindow = new google.maps.InfoWindow({content: contentString});
                                    var marker = new google.maps.Marker({position: dic,map: map,title: ''});
                                    marker.addListener('click', function() {infowindow.open(map, marker);});
                               
                                });
                              
                              
                              }
                       }
          });
      });
          
         
      
          
          
          
      }
