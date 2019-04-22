 var alert= new Vue({
          el: '#alerts',
          data: {},
          methods: {
             // Current day demo message
             alert() {},
            
            },
            mounted(){
        
        // Global variables
        var form  = "";
        var date  = "";
        var title = "";
        var user_email = "";
        var day = "";
        var month = "";

        
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
            
            // Fetch schedule Events
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= email eq '"+ user_email +"'&$select=event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
            axios.get(endPointUrl).then(response => {
                       form = response.data.value;
                       
                       // No upcoming demos    
                       if(typeof form[0] === 'undefined'){ 
                            var dic = {headline: "NINGUNA DEMOSTRACION PAUTADA" , title: "", subtitle: "" ,};
                            this.items.push(dic);}
                       var i;
                       for (i=0; ;i++){
                           // Check if finish looping schedule Events
                           if(typeof form[i] === 'undefined'){break}
                           // Check if event is schedule or in progress
                           if(form[i].Event_Status !== 'FINISH'){
                               title = form[i].event_client;
                               //title = title.substr(0,title.length-6);
                               date  = form[i].event_date;
                               date  = date.substr(0,10);
                               day = date.substr(8,10);
                               var mo = date.substring(5,7);
                               var year = date.substring(0,4);
                              
                                var currentDate = new Date();

                                var d = ""+currentDate.getDate();
                                var m = currentDate.getMonth(); //Be careful! January is 0 not 1
                                var y = ""+currentDate.getFullYear();
                                var mu = ""+(m+1);
                                if( mu.length <= 1){ mu = "0"+mu;}
                                if( d.length <= 1){ d = "0"+d;}
                                
                                if((year === y)&&(mo === mu)&&(day === d)){
                                   this.$swal("Demo hoy!", title, "info", {button: "Entiendo", closeOnClickOutside: false,});
                                  }

                              }
                       }
          });
      });
             
    },
      
      // Run functions @ page-load
      beforeMount(){
      
        this.alert();
    
 },
})
 

 