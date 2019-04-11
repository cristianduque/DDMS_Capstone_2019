      var map;
      function initMap() {
          
        // Global variable scope

        var form  = "";
        var user_email = "";

        var center = {lat: 18.231251, lng: -66.450928};
        map = new google.maps.Map(document.getElementById('map'), {center: center,zoom: 9});
        //var marker = new google.maps.Marker({position: colegio, map: map});
          
        // Fetch User in order to know which Employee information to extract (｡◕‿‿◕｡)
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        this.status = "getting data..."; 
        axios.get(endPointUrl).then(response => {
                    
                    // returns user email
                    user_email = response.data.Email; 
                    //console.log(user_email);
            // Fetch schedule Events
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= event_demonstrator eq '"+ user_email +"'&$select=event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
            this.status = "getting data..."; 
            axios.get(endPointUrl).then(response => {
                       form = response.data.value;
                       
                       //if(typeof form[0] === 'undefined'){return}
                       var i;
                       for (i=0; ;i++){
                           // Check if finish looping schedule Events
                           if(typeof form[i] === 'undefined'){break}
                           // Check if event is schedule or in progress
                           if(form[i].Event_Status != 'FINISH'){
                              // Get Coordinates
                              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=client_name eq'"+form[i].event_name +"' &$select=wu4k,x3w5";
                              var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
                              this.status = "getting data..."; 
                              axios.get(endPointUrl).then(response => {
                               
                                    var lat = Number(response.data.value[0].wu4k);
                                    var lon = Number(response.data.value[0].x3w5);
                                    
                                    var dic = {lat: lat, lng: lon};
                                    //console.log(dic);
                                    //Markers of next demos
                                    var marker = new google.maps.Marker({position: dic, map: map});
                               
                                });
                              
                              
                              }
                       }
          });
      });
          

          
          
          
      }
