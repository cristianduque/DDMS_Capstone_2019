/**
*
* This function fetches from Events and DemoForm the establish
* event hours and the registered ones.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/

var vm = new Vue({
      el: '#hours',
      data: function () {
      return {
          headers: [
            {
              text: '',
              align: 'left',
              sortable: false,
              value: 'name',
              width: '25%'
            },
            { text: 'Entrada', value: 'entrance', width: '15%',sortable: false, align: 'center', },
            { text: 'Salida', value: 'exit', width: '25%',sortable: false, align: 'center', },
           
          ],
          reports: []
        }
      },
      mounted(){
         
        // Get report title from page's URL
        var id = window.location.href.split('=').pop();
      
        // Fetch demo form to get event_id and registered work hours
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
        var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
        axios.get(endPointUrl).then(response => {
                      
                      var form = response.data.value[0]; 
                      var event_id = form.event_id;

                      var leaving_time = (form.HoraSalida).split(" ");
                      leaving_time = leaving_time[1].split(":");
                    
                      // Adjust registered hours from 24-Hour format to 12-Hour format
                        if( Number(leaving_time[0]) > 12){ 
                          if(Number(leaving_time[0]) == 12){leaving_time[0] = (Number(leaving_time[0])); }
                          else{leaving_time[0] = (Number(leaving_time[0]))%12; }
                        }
                      leaving_time = leaving_time[0]+":"+leaving_time[1];
            
                      var arrival_time = (form.HoraLlegada).split(" ");
                      arrival_time = arrival_time[1].split(":");
        
                        if( Number(arrival_time[0]) > 12){ 
                          if(Number(arrival_time[0]) == 12){arrival_time[0] = (Number(arrival_time[0])); }
                          else{arrival_time[0] = (Number(arrival_time[0]))%12; }
                        }
                      arrival_time = arrival_time[0]+":"+arrival_time[1];
                      
                      // Fetch event's form
                      var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter=event_id eq '"+ id +"'&$select=*";
                      var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                       }; 
                      axios.get(endPointUrl).then(response => {
                      
                      var date = (response.data.value[0].event_date).split("T"); // establishet datetime
                      var time = date[1].split(":")                              // split time portion
                      var establish_hour = time[0];                              // HH
                      var minutes        = time[1];                              // MM
                      var am_pm          = "";                                   // AM or PM 
                      
                      // Asdjust establish hours format from 24 Hours to 12 Hours format and set's if AM or PM
                      if( Number(establish_hour) > 12){ 
                          if((Number(establish_hour)-3) == 12){establish_hour = (Number(establish_hour)-3); }
                          else{establish_hour = (Number(establish_hour)-3)%12; }
                          am_pm = " PM"; }
                      else{ am_pm =" AM";}
                      
                      // Set establish ending hours
                      var ending_hour = (((Number(establish_hour)+5)) % 12)+":"+minutes+am_pm;
                      establish_hour  = establish_hour+":"+minutes+am_pm;
                    
                    
                      var establish = {name: 'Horas Establecidas', entrance: "",exit: ""};
                      establish.entrance = establish_hour; establish.exit = ending_hour;
                      this.reports.push(establish);
                          
                      var register = {name: 'Horas Registradas', entrance: "", exit: ""};
                      register.entrance = arrival_time +am_pm; register.exit = leaving_time +am_pm;
                      this.reports.push(register);
          });
        });
         
      }
    })