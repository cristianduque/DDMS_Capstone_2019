var demos = new Vue({
      el: '#demos',
      data () {
        return {
          selected: [2],
          items: []
        }
      },

      methods: {
          
        toggle (index) {
          const i = this.selected.indexOf(index)
          if (i > -1) {
            this.selected.splice(i, 1)
          } else {
            this.selected.push(index)
          }
        },
        linkfn(id){
            console.log("press")
            if(id !== ""){
                location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/DemoOptions2.aspx?id="+id+"";
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
        
         var months= ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

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
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter= email eq '"+ user_email +"'&$select=event_id,event_date,event_client,event_demonstrator,Event_Status";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
            axios.get(endPointUrl).then(response => {
                       form = response.data.value;
                       // No upcoming demos    
                       if(typeof form[0] === 'undefined'){ 
                            var dic = {headline: "NINGUNA DEMOSTRACION PAUTADA" , title: "", subtitle: "" ,id:""};
                            this.items.push(dic);}
                       var i;
                       for (i=0; ;i++){
                           // Check if finish looping schedule Events
                           if(typeof form[i] === 'undefined'){break}
                           // Check if event is schedule or in progress
                           if((form[i].Event_Status !== 'FINISH') && (form[i].Event_Status !== 'CANCELED') ){
                               var event_id = form[i].event_id;
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
                            //Check if demo hasn't passed       
                            if((Number(year) >= Number(y))&&(Number(mo) >= Number(mu))&&(Number(day) >= Number(d)) ){
                                //demo is today
                               if((year === y)&&(mo === mu)&&(day === d)){
                                   date = months[Number(mo)-1] +"/" + day +"/"+year;
                                   var dic = {headline: title , title: date, subtitle: "Abierto" ,id:event_id};
                                   this.items.push(dic);
                               }
                               else{
                                   date = months[Number(mo)-1] +"/" + day +"/"+year;
                                   var dic = {headline: title , title: date, subtitle: "" ,id:""};
                               this.items.push(dic);
                               }
                               
                               
                               }
                              
                              
                              }
                       }
          });
      });
        
        
        
        
        
        
        
        
    }
    })