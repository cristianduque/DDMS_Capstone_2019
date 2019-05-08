/**
*
* This functions checks for an invalid user and upcoming events.
* Checks if current user accessing the page is "Active", if not he/she
* is routed to 403 page.
* Also, check for any upcoming events by checking today's date.
*
* @author: Diego Capre 
* @version: 1.0
* @
*
**/
var alert= new Vue({
          el: '#alerts',
          data: {},
          methods: {
             
             alert() {}, // Current day demo message
            
            },
          mounted(){
        
        // Global variables used for managing data
        var form  = "";
        var date  = "";
        var title = "";
        var user_email = "";
        var day = "";
        var month = "";
              
              
/**************************************************************************************************************************
                                    GET UPCOMING EVENTS FOR USER
**************************************************************************************************************************/
       
        // Get current user , returns email account
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        axios.get(endPointUrl).then(response => {
      
            user_email = response.data.Email; // current user email
            
            // Fetch current user upcoming Events, searching by user email.
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= email eq '"+ user_email +"'&$select=*";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
            axios.get(endPointUrl).then(response => {
                
                       form = response.data.value; // All available events for current user
                       
                       // No upcoming demos    
                       if(typeof form[0] === 'undefined'){ 
                            var dic = {headline: "NINGUNA DEMOSTRACION PAUTADA" , title: "", subtitle: "" ,};
                            }
                       // Get all upcoming demos
                       var i;
                       for (i=0; ;i++){
                           
                           // Check if looping through schedule Events is finished
                           if(typeof form[i] === 'undefined'){break}
                           
                           // Check Event status, if Event is has finished or was canceled don't display
                           if( (form[i].Event_Status !== 'FINISHED') && (form[i].Event_Status !== 'Canceled') ){
                               
                               title = form[i].event_client;
                               
                               date  = form[i].event_date;      // get shedule datetime
                               date  = date.substr(0,10);       // event's date
                               day = date.substr(8,10);         // event's day
                               var mo = date.substring(5,7);    // event's month
                               var year = date.substring(0,4);  // event's year
                              
                               var currentDate = new Date();    // get today's date

                                var d = ""+currentDate.getDate();     // today's day
                                var m = currentDate.getMonth();       // today's month (Be careful! January is 0 not 1)
                                var mu = ""+(m+1);                    // today's month adjusted (month + 1)
                                var y = ""+currentDate.getFullYear(); // today's year
                                
                                // Check month's & day's number and adjust to standard (Ex. 8 -> 08)                      
                                if( mu.length <= 1){ mu = "0"+mu;}
                                if( d.length <= 1){ d = "0"+d;}
                                
                               // Check if event is today and alert
                                if((year === y)&&(mo === mu)&&(day === d)){
                                   this.$swal("Demo hoy!", title, "info", {button: "Entiendo", closeOnClickOutside: false,});
                                  }
                              }
                       }
          });
      });
              
/**************************************************************************************************************************
                                            CHECK IF USER IS ACTIVE
**************************************************************************************************************************/
              
        // Detect if user is Active
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        axios.get(endPointUrl).then(response => {
      
            // returns user email
             user_email = response.data.Email; 
            
            // Fetch user by email from Employee list to check status
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter= OData__x0077_v79 eq '"+ user_email +"'&$select=*";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
            axios.get(endPointUrl).then(response => {
                
                       form = response.data.value;  // Get user 
                       console.log(form[0].status); // user's status
                
                       // Check if Active
                       if(form[0].status != 'Active'){
                        // If not active, send unactive user to 403 page
                        window.location.href ="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/403.aspx"
                            
                      }    
          });
      });
             
    },
      // Run functions @ page-load
      beforeMount(){
      
        this.alert();
 },
})
 

 