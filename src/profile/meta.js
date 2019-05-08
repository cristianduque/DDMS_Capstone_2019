/**
*
* This functions calculates the amount of boxes sold
* of a product and gets the expected amount to be sold.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/

var embutidos = new Vue({
      el: '#meta',
      data () {
        return {
          interval: {},
          value: 0,
          total: 0,
          
        }
      },
      beforeDestroy () {
        clearInterval(this.interval)
      },
      mounted () {      

        // Global variable scope
        var family= "";
        var caja  = 0;
        var form  = "";
        var form2 = "";
        var form3 = "";
        var date  = "";
        var title = "";
        var units   = 0;
        var units2  = 0;
        var product = "";
        var user_email = "";

        // Get report title from page's URL
        var id = window.location.href.split('=').pop();
            
        // Get Report by title
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
        var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
        axios.get(endPointUrl).then(response =>  {          
        
        var form    = response.data.value;        // demo form
        let product = form[0].product_id;         // Product demosntrated
        let title   = form[0].Title;              // form's title
        units = Number(form[0].UnidadesVendidas); // Amount of products sold
        var tienda = form[0].Tienda;              // Client

        // Search for Client by Title : t1q7 - client num.
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter= Title eq '"+ tienda +"' &$select=*";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
        };                          
        axios.get(endPointUrl).then(response =>  { 
            
              var mult = response.data.value[0].c9jm; // Client's multiplier
              var meta = response.data.value[0].meta; // Client's goal

              this.total =  (mult * meta).toFixed(1); //multiplier x meta
        
             }); 
           
                                        
        // Get Product family by searching in Products the specified product and returning family type
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu,a83e";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
        };
                                        
        axios.get(endPointUrl).then(response =>  { 
                                            
              let family = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)
              let caja = response.data.value[0].a83e;   // Units needed to be sold to make 1 box
               
              // Get Product family by searching in Products the specified product and returning family type
              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ id+"'&$select=Title,UnidadesVendidas"
              var headers = {
                             "async": false,
                             "accept": "application/json;odata=verbose",
                             "content-type": "application/json;odata=verbose"
                                                };
              axios.get(endPointUrl).then(response =>  { 
                                            
              let form3 = response.data.value;               // extra products 
              if (response.data.value[0] === 'undefined'){ } // No extra products demo
              else{                                          // iterate over extra products
                    var j;
                    for( j=0; ; j++ ){
                    if(typeof response.data.value[j] === 'undefined'){ break;} // no more extra products
                    let units2 = Number(form3[j].UnidadesVendidas);            // extra products sold
                     units = Number(units) + units2;                           // add extra products to total
                      }
                  }
                                            
                  this.value = (units/caja).toFixed(1);                         // set amount achieved
                   
                }); //Third Query
             }); //Second 2 Query
        }); // First Query      
  },
})