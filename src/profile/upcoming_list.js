var demos = new Vue({
      el: '#demos',
      data () {
        return {
          selected: [2],
          items: [
//            {
////              headline: 'Supermercado Pueblos',
////              title: 'Feb/24/2019',
////              subtitle: ""
//            },
          ]
        }
      },

      methods: {
        toggle (index) {
          const i = this.selected.indexOf(index)
          console.log("pressed");
          if (i > -1) {
            this.selected.splice(i, 1)
          } else {
            this.selected.push(index)
          }
        }
      },
    mounted(){
        
        var family ="";
        var form  = "";
        var form2 = "";
        var form3 ="";
        var date  = "";
        var title = "";
        var units   = 0;
        var units2 = 0;
        var product = "";
        var user_email = "";
        var day = "";
        var month = "";

        //var dic = {headline: "NINGUNA DEMOSTRACION PAUTADA" , title: "", subtitle: "" ,};
        //this.items.push(dic);
        
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
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= event_demonstrator eq '"+ user_email +"'&$select=event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
            axios.get(endPointUrl).then(response => {
                       form = response.data.value;
                       //console.log(form);
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
                               title = title.substr(0,title.length-6);
                               date  = form[i].event_date;
                               date  = date.substr(0,10);
                               day = date.substr(8,10);
                               var mo = date.substring(5,7);
                               var year = date.substring(0,4);
                               //console.log(date);
                               //console.log(day);
                               //console.log(mo);
                               //console.log(year);
                              var currentDate = new Date();

                                var d = ""+currentDate.getDate();
                                var m = currentDate.getMonth(); //Be careful! January is 0 not 1
                                var y = ""+currentDate.getFullYear();
                                var mu = ""+(m+1);
                                if( mu.length <= 1){ mu = "0"+mu;}
                                if( d.length <= 1){ d = "0"+d;}
                                //var dateString = d + "-" +(m + 1) + "-" + y;
                               //console.log(dateString);
                               //console.log(y);
                               //console.log(year);
                               //console.log(mu);
                               //console.log(mo);
                               //console.log(d);
                               //console.log(day);
                               
                               if((year === y)&&(mo === mu)&&(day === d)){
                                   var dic = {headline: title , title: date, subtitle: "Abierto" ,};
                                   this.items.push(dic);
                               }
                               else{
                                   var dic = {headline: title , title: date, subtitle: "" ,};
                               this.items.push(dic);
                               }
                               
                               
                              
                              
                              
                              }
                       }
          });
      });
        
        
        
        
        
        
        
        
    }
    })