/**
*
* This function display all info from the bar graph and 
* incentive levels and comission.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
var table_profile = new Vue({
      el: '#table',
      data: function () {
        return {
            
          search: '',
          pagination: {},
          headers: [
            {
              text: 'Reporte',
              align: 'left',
              sortable: false,
              value: 'title',
              width: '25%'
            },
            { text: 'Familia', value: 'prod', width: '15%',sortable: false , align: 'center', },
            { text: 'Total de Ventas', value: 'sale1', width: '15%',sortable: false , align: 'center', },
            { text: 'Nivel de Incentivo', value: 'ince1', width: '16%',sortable: false, align: 'center', },
            { text: 'Comisión', value: 'money', width: '16%' , sortable: false, align: 'center',},
        
          ],
          reports: [ ],

        }
      }, 
    created: function(){   
        this.rowClick();
    },
    methods: {
       rowClick(name) {
          this.selectedItem = name;
        },
    },
    mounted(){
        
        // Global variable scope
        var family ="";
        var form  = "";
        var form2 = "";
        var form3 ="";
        var date  = "";
        var event_id = "";
        var units   = 0;
        var units2 = 0;
        var product = "";
        var user_email = "";
        var tit = "";
        var s1  = "";
        var s2  = "";
        var i1 = 0;
        var i2 = 0;
        var tot = "";
        
        // Today's date adjusted
        var currentDate = new Date();
        var s = currentDate.toISOString().split("T");
        var s2 = s[0].split("-")
        var day =""+ (Number(s2[2])+0);
        var mon = s2[1];
        var year = s2[0];
        if( day.length <= 1){ day = "0"+ day;}
        s = year+"-"+mon+"-"+day;

        // Fetch User in order to know which Employee information to extract 
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        axios.get(endPointUrl).then(response =>  {
                    
            user_email = response.data.Email; // returns user email
                    
           
            // Get Reports by user email, order by date asc (last first), get top 10 and get only sales and product
            var endPointUrl =           "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$top=10&$filter=email eq '"+ user_email+ "' and (Fecha le '"+s+"') &$orderby=Fecha desc";
            var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
            axios.get(endPointUrl).then(response =>  {
                        var form = response.data.value; // First response containing all demo forms
                        var i;
                        for( i=0; ; i++ ){
           
                            // Check if end of values in first response has been reached, and exit loop
                            if(typeof form[i] === 'undefined'){break}
                                    
                            // Continue looping and storing to arrays
                            else{
                                         
                                let form2       = form[i];           // Use for looping forms and get their details
                                let product     = form[i].product_id;// Product demosntrated
                                let event_id    = form[i].event_id;  // CAN CHANGE TO (event_id), Use to identify extra products sold if

                                let tit = form2.Title;
                                        
                                // Get Product family by searching in Products the specified product and returning family type
                                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu";
                                var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                axios.get(endPointUrl).then(response =>  { 
                                            
                                    let family = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)
                                            
                                    let date        = form2.Fecha;
                                    let units       = Number(form2.UnidadesVendidas);
                                            
                                    // Get Extra Products sold
                                    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ event_id+"'&$select=Title,UnidadesVendidas"
                                         var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                    
                                    axios.get(endPointUrl).then(response =>  { 
                                            let form3 = response.data.value;
                                            if (response.data.value[0] === 'undefined'){} // No extra products demo
                                            else{
                                                var j;
                                                for( j=0; ; j++ ){
                                                    if(typeof response.data.value[j] === 'undefined'){break}
                                                    let units2 = Number(form3[j].UnidadesVendidas);
                                                    units = Number(units) + units2; 
                                                }//for
                                            }//else

                                    var dic = { 
                                    value: false,
                                    title: ' ',
                                    sale1: 0, 
                                    sale2: " ", 
                                    ince1: 0, 
                                    ince2: 0 ,
                                    total: 0, 
                                    money: 0, };    
                                        
                                     // Check for family and add to corresponding fields and check incentive level
                                      if( family == 'EMPANADO'){
                                                
                                       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMPANADOS' &$select=xery,tr7c,efdx";
                                       var headers = {
                                                            "async": false,
                                                            "accept": "application/json;odata=verbose",
                                                            "content-type": "application/json;odata=verbose"
                                                        };
                                       xios.get(endPointUrl).then(response =>  {

                                                        // Compare incentive levels for EMPANADOS and comission
                                           
                                                        if(units <= response.data.value[0].xery ){
                                                            i1 = Number(response.data.value[0].tr7c);
                                                            i2 = Number(response.data.value[0].efdx);}
                                                        if( (units >= response.data.value[1].xery) && (units < response.data.value[2].xery)){ 
                                                            i1 = Number(response.data.value[1].tr7c);
                                                            i2 = Number(response.data.value[1].efdx);}
                                                        if( (units >= response.data.value[2].xery) && (units < response.data.value[3].xery)){ 
                                                            i1 = Number(response.data.value[2].tr7c);
                                                            i2 = Number(response.data.value[2].efdx);}
                                                        if( (units >= response.data.value[3].xery)){ 
                                                            i1 = Number(response.data.value[3].tr7c);
                                                            i2 = Number(response.data.value[3].efdx);
                                                        }
                                                    
                                                        dic.money = "$ " + i2;
                                                        dic.title = tit; dic.family = "Empanados"; dic.sale1 = units; dic.sale2 = units; dic.ince1 = i1; dic.ince2 = i1; dic.total = units; dic.date = date; this.reports.push(dic);
                                                        
                                                         this.reports.sort(function(a, b) {var dateA = new Date(a['date']), dateB = new Date(b['date']);return dateB - dateA;});
                                               
                                                    });
 
                                                } //EMPANADOS

                                            else{
                                                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMBUTIDOS' &$select=xery,tr7c,efdx";
                                                var headers = {
                                                            "async": false,
                                                            "accept": "application/json;odata=verbose",
                                                            "content-type": "application/json;odata=verbose"
                                                        };
                                                axios.get(endPointUrl).then(response =>  {
                                                
                                                var dic = { 
                                                    value: false,
                                                    title: ' ',
                                                    sale1: 0, 
                                                    sale2: " ",
                                                    ince1: 0, 
                                                    ince2: " ",
                                                    total: 0, 
                                                    money: 0, 
                                                    date:""};  
                                                    
                                                    // Check incentive levels and comission for EMBUTIDOS
                                                    
                                                    if(units <= response.data.value[0].xery ){
                                                        i1 = Number(response.data.value[0].tr7c);
                                                        i2 = Number(response.data.value[0].efdx);}
                                                    if( (units >= response.data.value[1].xery) && (units < response.data.value[2].xery)){
                                                        i1 = Number(response.data.value[1].tr7c);
                                                        i2 = Number(response.data.value[1].efdx);}
                                                    if( (units >= response.data.value[2].xery) && (units < response.data.value[3].xery)){
                                                        i1 = Number(response.data.value[2].tr7c);
                                                        i2 = Number(response.data.value[2].efdx);}
                                                    if( (units >= response.data.value[3].xery)){
                                                        i1 = Number(response.data.value[3].tr7c);
                                                        i2 = Number(response.data.value[3].efdx);}
                                                    
                                                    dic.money = "$ " + i2;
                                                    dic.title = tit; dic.family = "Embutidos"; dic.sale1 = units; dic.sale2 = units; dic.ince1 = i1; dic.ince2 = i1; dic.total = units; dic.date = date; this.reports.push(dic);
                                                    
                                                    this.reports.sort(function(a, b) {var dateA = new Date(a['date']), dateB = new Date(b['date']);return dateB - dateA;});
                                                    
                                                                                                   }); //EMBUTIDOS

                                               
                                        }                       
                    }); //Fourth
 
    }); //Third
                                    }//else 
                                }//for  
                    }); // Second
        }); //First   

    },// Methods   
});