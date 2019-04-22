  var vm = new Vue({
      el: '#products',
     
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
            { text: 'Vendidos', value: 'sold', width: '15%',sortable: false, align: 'center', },
            
           
          ],
          reports: [
//            {
//              value: false,
//              name: 'Producto 1',
//              sold: 35,
//            },
//            {
//              value: false,
//              name: 'Producto 2',
//              sold: 45,
//            },
//                        {
//              value: false,
//              name: 'Producto 3',
//              sold: 10,
//            },
          ]
        }
      },
      mounted (){
     
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
                                                   
            var form = response.data.value;    // Demo Form
            let product     = form[0].Producto;// Product demosntrated
            let title       = form[0].Title;   // CAN CHANGE TO (event_id), Use to identify extra products sold if
                                
        // Get Product family by searching in Products the specified product and returning family type
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=*";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
        };
                                        
        axios.get(endPointUrl).then(response =>  { 
                              
              //console.log(response.data.value)
              let family = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)
              let units  = Number(form[0].UnidadesVendidas);
              var product_title = response.data.value[0].e9lf;
            
              //console.log(product_title);
                                            
              var dic = { value: false,name: 'Producto 1',sold: 0,}
              dic.name = product_title; dic.sold = units;
              //console.log(dic);
              this.reports.push(dic);
                                            
              // Search for any extra products
              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ id +"'&$select=Title,UnidadesVendidas"
              var headers = {
                             "async": false,
                             "accept": "application/json;odata=verbose",
                             "content-type": "application/json;odata=verbose"
                                                };
              axios.get(endPointUrl).then(response =>  { 
                                            //console.log(response.data.value[0]);       //debug
              var form3 = response.data.value;
              if (response.data.value[0] === 'undefined'){} // No extra products demo
              else{
                    
                    var j;
                    for( j=0; ; j++ ){
                        if(typeof response.data.value[j] === 'undefined'){break} // no more 
                        
                        let dic2 = { value: false,name: 'Producto 1',sold: 0,}
                        let units2 = Number(form3[j].UnidadesVendidas);
                        dic2.sold = units2;
                        //console.log(dic2.sold);
                        
                        // Get Product name by searching in Products the specified product and returning family type
                        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=*";
                        var headers = {
                            "async": false,
                            "accept": "application/json;odata=verbose",
                            "content-type": "application/json;odata=verbose"
                        };
                        axios.get(endPointUrl).then(response =>  { 


                                //console.log(dic2.sold);
                                let product_title2 = response.data.value[0].e9lf;
                            
                                dic2.name = product_title2;
                                //console.log(dic2);
                                this.reports.push(dic2);



                        });
                    
                    
                    }
                  }
                                            
                 
                                            
                }); //Fourth Query
             }); //Third Query
            }); // Second Query
          
         
      },
    })