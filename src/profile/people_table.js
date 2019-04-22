  var vm = new Vue({
      el: '#attendance',
     
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
            { text: 'Total de personas atendidas', value: 'attended', width: '15%',sortable: false, align: 'center', },
            
           
          ],
          reports: [
//            {
//              value: false,
//              name: 'Hora 1',
//              attended: 35,
//            },
      

          ]
        }
      },
      
      mounted () {
          
           // Global variable scope
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
        
        // Get report title 
        var id = window.location.href.split('=').pop();
            
        // Get Report by title
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
        var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
        this.status = "getting data..."; 
        axios.get(endPointUrl).then(response =>  {
            
            //console.log(response.data.value[0]);
            
            var dic1 = {value: false,name: 'Hora 1',attended: 0,};
            dic1.attended = response.data.value[0].Atendidos1;
            this.reports.push(dic1);
            var dic2 = {value: false,name: 'Hora 2',attended: 0,};
            dic2.attended = response.data.value[0].Atendidos2;
            this.reports.push(dic2);
            var dic3 = {value: false,name: 'Hora 3',attended: 0,};
            dic3.attended = response.data.value[0].Atendidos3;
            this.reports.push(dic3);
            var dic4 = {value: false,name: 'Hora 4',attended: 0,};
            dic4.attended = response.data.value[0].Atendidos4;
            this.reports.push(dic4);
            var dic5 = {value: false,name: 'Hora 5',attended: 0,};
            dic5.attended = response.data.value[0].Atendidos5;
            this.reports.push(dic5);
          
      });
    },
  })