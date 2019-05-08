/**
*
* Check if a user is Active and allows access to page. If
* not valid, sends user to 403 page.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
var validation = new Vue({
          el: '#validation',
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

              
            // Get current user     
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
            axios.get(endPointUrl).then(response => {
      
                 user_email = response.data.Email;   // returns user email
               
                // Fetch user's status
                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter= OData__x0077_v79 eq '"+ user_email +"'&$select=*";
                var headers = {
                            "async": false,
                            "accept": "application/json;odata=verbose",
                            "content-type": "application/json;odata=verbose"
                        }; 
                axios.get(endPointUrl).then(response => {
                    
                           form = response.data.value; 
                           if(form[0].status != 'Active'){
                               // Simulate a mouse click:
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
 

 