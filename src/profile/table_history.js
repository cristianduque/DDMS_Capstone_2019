 var vm = new Vue({
      el: '#app',
        expand: false,
      methods: {
        
        rowClick(name) {
          this.selectedItem = name;
        },
        linkfn(title){
            //console.log(title);
            location.href = "https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/review.aspx?title="+title+"";
        }
      },
      data: function () {
        return {
            
          search: '',
          pagination: {},
          headers: [
            {
              text: 'Supermercado',
              align: 'left',
              sortable: false,
              value: 'name',
              width: '25%'
            },
            { text: 'Mes', value: 'month', width: '15%' },
            { text: 'Dia', value: 'day', width: '15%' },
            { text: 'Año', value: 'year', width: '15%' },
            { text: 'Pueblo', value: 'pueblo', width: '16%' },
            { text: 'Cadena', value: 'chain', width: '16%' },
            //{ text: 'Aprobado', value: 'approve', width: '16%' }
          ],
          reports: [
//            {
//              value: false,
//              name: 'Supermercado Colegio',
//              month: 'Feb',
//              day: 28,
//              year: 2019,
//              pueblo: 'Mayaguez',
//              chain: 'UPR',
//              //approve: false,
//              link: "testbench.html"
//            
//            },

            
            
          ]
        }
      },
      mounted(){
        // Global variable scope
        var family ="";
        var form  = "";
        var form2 = "";
        var pueblp ="";
        var date  = "";
        var municipio = "";
        var chain = "";
        var units2 = 0;
        var tienda = "";
        var user_email = "";
        var title ="";
         
        var months= ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
          
        
          
        // Get Current user
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        this.title = "getting data..."; 
        axios.get(endPointUrl).then(response =>  {
                    // returns user email
                    user_email = response.data.Email; 
                    //console.log(user_email);
            // Get user Reports
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=email eq '"+ user_email +"'&$orderby=Fecha asc &$select=Tienda,Fecha,Pueblo,Title";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
            this.title = "getting data..."; 
            axios.get(endPointUrl).then(response =>  {
                        // returns user email
                        form = response.data.value; 
                        //console.log(form);
                        var i;
                        for( i=0; ; i++ ){
                                    
                        //If user doesn't has any data at all, it just display the default empty message
                                    
                        if(typeof form[i] === 'undefined'){break}
                        // Continue looping and storing to arrays
                        else{
                             
                            let form2      = form[i];         // Use for looping forms and get their details
                            let tienda     = form[i].Tienda;  // Client's identifier number
                            let date       = form[i].Fecha;   
                            let pueblo     = form[i].Pueblo;  
                            let title       = form[i].Title;
                            //console.log(tienda);
                            
                            // Get Clients supermarket name and chain
                            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter= t1q7 eq '"+ tienda +"' &$select=Title,q89x,zqlz";
                            var headers = {
                                        "async": false,
                                        "accept": "application/json;odata=verbose",
                                        "content-type": "application/json;odata=verbose"
                                    };
                            this.title = "getting data..."; 
                            axios.get(endPointUrl).then(response =>  {
                                        // returns user email
                                        //console.log(response.data);
                                        municipio = response.data.value[0].q89x;
                                        chain = response.data.value[0].zqlz;
                                        var day = date.substring(0,2);
                                        var mo = date.substring(3,5);
                                        var year = date.substring(6,10);
                                        //console.log(chain+"|"+municipio);
                                        
                                        //console.log(Number(day));
                                        //console.log(months[Number(mo)-1]);
                                        //console.log(year);
                                var dic = { value: false,name:'', month:'',day:0,year:0,pueblo:'',chain:'',link: ""};
                                
                                dic.name = chain+" | "+municipio; dic.month = months[Number(mo)-1];
                                dic.day = Number(day); dic.year = year; dic.pueblo = municipio; dic.chain = chain;
                                dic.link = title;
                                
                                this.reports.push(dic);
                            }); //Third
                        } //else
                        } //for
            }); //Second
        }); //First
      }, //Mounted
    })