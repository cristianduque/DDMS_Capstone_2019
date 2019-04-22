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
         
        // Get report title 
        var id = window.location.href.split('=').pop();
      
        // Fetch form to get event_id and work hours
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
        var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    }; 
        axios.get(endPointUrl).then(response => {
                      //console.log(response.data.value[0]); //debugging
                      var form = response.data.value[0];
                      var event_id = form.event_id;
                      //console.log(event_id); //debugging
                       
                      var leaving_time = (form.HoraSalida).substring(0,(form.HoraSalida).length-3);
                      var arrival_time = (form.HoraLlegada).substring(0,(form.HoraLlegada).length-3);
                      
                      // Fetch form to get event_id and work hours
                      var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter=event_id eq '"+ id +"'&$select=*";
                      var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                       }; 
                      axios.get(endPointUrl).then(response => {
                      //console.log(response.data.value[0]); //debugging
                      var establish_hour = (response.data.value[0].event_date).substring(11,13);
                      var minutes        = (response.data.value[0].event_date).substring(14,16);
                      var am_pm          = "";
                      //console.log(establish_hour);
                      if( Number(establish_hour) > 12){ establish_hour = (Number(establish_hour)-3)%12; am_pm = " PM"; }
                      else{ am_pm =" AM";}
                      
                      var ending_hour = (Number(establish_hour) + 5)+":"+minutes+am_pm;
                      establish_hour  = establish_hour+":"+minutes+am_pm;
                          
                      //console.log(establish_hour);
                      //console.log(ending_hour);
                      var establish = {name: 'Horas Establecidas', entrance: "",exit: ""};
                      establish.entrance = establish_hour; establish.exit = ending_hour;
                      this.reports.push(establish);
                          
                      var register = {name: 'Horas Registradas', entrance: "", exit: ""};
                      register.entrance = arrival_time+am_pm; register.exit = leaving_time+am_pm;
                      this.reports.push(register);
          });
        });
      
        
        
        
        
        
        
        
        
    }
    })