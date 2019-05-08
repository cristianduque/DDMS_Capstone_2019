/**
*
* This functions fetches all of the users demonstrations reports
* filtered by today's date
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
var vm = new Vue({
      el: '#app',
      expand: false,
      methods: {
        
        rowClick(name) {
          this.selectedItem = name;
        },
        // allow user to view report's review
        linkfn(id){
            location.href = "https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/review.aspx?title="+id+"";
        },
      },
      data: function () {
        return {   
          search: '',
          pagination: {
              rowsPerPage: 10,
          },
          headers: [
            {
              text:     'Título',
              align:    'left',
              sortable: false,
              value:    'name',
              width:    '25%'
            },
            { text: 'Mes', value: 'month', width: '15%' },
            { text: 'Dia', value: 'day', width: '15%' },
            { text: 'Año', value: 'year', width: '15%' },
            { text: 'Pueblo', value: 'pueblo', width: '16%' },
            { text: 'Cadena', value: 'chain', width: '16%' },
            { text: 'Estatus de Gastos', value: 'status', width: '16%' }
          ],
          reports: [],
          load: false,
        }
      },
      created(){
          
        // Global variable scope
        var family = "";
        var form   = "";
        var form2  = "";
        var pueblp = "";
        var date   = "";
        var municipio = "";
        var chain  = "";
        var units2 = 0;
        var tienda = "";
        var user_email = "";
        var title  = "";
        var day    = "";
        var mo     = "";
        var year   = "";
        
        this.load = false;
        
        // Get current date and adjust format
        var currentDate = new Date();
        var s = currentDate.toISOString().split("T");
        var s2 = s[0].split("-")
        var day =""+ (Number(s2[2])+0);
        var mon = s2[1];
        var year = s2[0];
        if( day.length <= 1){ day = "0"+ day;}
        s = year+"-"+mon+"-"+day;

        var months= ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

        // Get Current user
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        axios.get(endPointUrl).then(response =>  {
                    
            user_email = response.data.Email; // returns user email
            
            // Get user Reports
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=email eq '"+ user_email +"'and (Fecha le '"+s+"') &$orderby=Fecha asc &$select=event_id,Tienda,Fecha,Pueblo,Title";
            var headers = {
                        "async": false,
                        "accept": "application/json;odata=verbose",
                        "content-type": "application/json;odata=verbose"
                    };
            axios.get(endPointUrl).then(response =>  {
                        
                        form = response.data.value;  // all past demo forms
                        var i;
                        for( i=0; ; i++ ){    
                            if(typeof form[i] === 'undefined'){break}
                            // Continue looping and storing to arrays
                            else{
                             
                                let form2      = form[i];         // Use for looping forms and get their details
                                let tienda     = form[i].Tienda;  // Client's identifier number
                                let date       = form[i].Fecha;   
                                let pueblo     = form[i].Pueblo;  
                                let event_id   = form[i].event_id;
                                let title      = form[i].Title;

                                // Get Clients supermarket name and chain 
                                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter= Title eq '"+ tienda +"' &$select=Title,q89x,zqlz";
                                var headers = {
                                            "async": false,
                                            "accept": "application/json;odata=verbose",
                                            "content-type": "application/json;odata=verbose"
                                        };

                                axios.get(endPointUrl).then(response =>  {
                                            
                                            municipio = response.data.value[0].q89x;
                                            chain = response.data.value[0].zqlz;
                                            
                                            var spliced = date.split("T");
                                            date = spliced[0].split("-");
                                            let day = date[2];
                                            let mo = date[1];
                                            let year = date[0];

                                    var dic = { 
                                        value: false,
                                        name:'', 
                                        month:'',
                                        day:0,
                                        year:0,
                                        pueblo:'',
                                        chain:'',
                                        link: "",
                                        status:""};

                                    // Get Product family by searching in Products the specified product and returning family type
                                    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Receipt')/items?$filter=event_id eq '" + event_id + "' &$select=event_id,OData__x0073_mm7,title0,Receipt_Status";
                                    var headers = {
                                        "async": false,
                                        "accept": "application/json;odata=verbose",
                                        "content-type": "application/json;odata=verbose"};
                                    axios.get(endPointUrl).then(response =>  { 
                                        
                                     if(!response.data.value[0].Receipt_Status){
                                                        dic.status = "Editable";
                                                    }  
                                      else{
                                                    dic.status = response.data.value[0].Receipt_Status;
                                                    }

                                    });

                                    dic.name = title; //chain+" | "+municipio; 
                                    dic.month = months[Number(mo)-1];
                                    dic.day = Number(day); dic.year = year; dic.pueblo = municipio; dic.chain = chain;
                                    dic.link = event_id;

                                    this.reports.push(dic);

                                }); //Third
                        } //else
                     } //for
                    this.load = true;
            }); //Second
        }); //First
          
      }, //Mounted
    
    watch: {
    reports () {
      this.$nextTick(() => {
        this.pagination.totalItems = this.reports.length;
      })
    }
  },
    computed: {
    pages () {
        
        if(this.load){
          if (this.pagination.rowsPerPage == null || this.pagination.totalItems == null) {return 0;}
          return Math.ceil(this.pagination.totalItems / this.pagination.rowsPerPage);
        }
    }
  },
       
    })