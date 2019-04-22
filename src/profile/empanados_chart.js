var empanados = new Vue({
      el: '#pie2',
      data () {
        return {
          interval: {},
          value: 0,
          
        }
      },
      beforeDestroy () {
        clearInterval(this.interval)
      },
      mounted () {//        this.interval = setInterval(() => {

     
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
                                
                                
        var form = response.data.value; // First response containing all demo forms
        let product     = form[0].Producto;// Product demosntrated
        let title       = form[0].Title;   // CAN CHANGE TO (event_id), Use to identify extra products sold if
        units = Number(form[0].UnidadesVendidas);
        //console.log(units);     //debug
                                        
        // Get Product family by searching in Products the specified product and returning family type
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
        };
                                        
        axios.get(endPointUrl).then(response =>  { 
                                            
              let family = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)
               
                                            
                                          //console.log(" ");           //debug
                                          //console.log(product);       //debug
                                          //console.log(family);        //debug
                                          //console.log(units);         //debug
                                            
              // Get Product family by searching in Products the specified product and returning family type
              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ id+"'&$select=Title,UnidadesVendidas"
              var headers = {
                             "async": false,
                             "accept": "application/json;odata=verbose",
                             "content-type": "application/json;odata=verbose"
                                                };
              axios.get(endPointUrl).then(response =>  { 
                                            //console.log(response.data.value[0]);       //debug
              let form3 = response.data.value;
              if (response.data.value[0] === 'undefined'){this.interval = setInterval(() => {this.value = units;}, 1000);} // No extra products demo
              else{
                    var j;
                    for( j=0; ; j++ ){
                    if(typeof response.data.value[j] === 'undefined'){ break;}
                    let units2 = Number(form3[j].UnidadesVendidas);
                     units = Number(units) + units2;
                     //console.log(units);
                      }
                  }
                                            
                  if( family == 'EMPANADO'){this.interval = setInterval(() => {this.value = units;}, 1000) }
                  else{} // else Embutido
                                            
                }); //Fourth Query
             }); //Third Query
            }); // Second Query

  },
})