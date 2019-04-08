var receipts = new Vue({
  el: '#list',
  data () {
    return {
      selected: [2],
      items: [
//        {
//          headline: 'Supermercado Pueblos',
//          title: 'Feb/24/2019',
//          subtitle: "<span class='text--primary'>Supermercados Pueblos - Mayaguez</span> &mdash; $5.47"
//        },
        
      ]
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
    }
  },
    
  mounted(){
      //Global*
        var family ="";
        var form  = "";
        var form2 = "";
        var form3 ="";
        var date  = "";
        var title = "";
       
        var total2 = 0;
        var product = "";
        var user_email = "";
        var tit = "";
        var s1  = "";
        var s2  = "";
        var i1 = 0;
        var i2 = "";
        var tot = "";
        
         // Fetch User in order to know which Employee information to extract (｡◕‿‿◕｡)
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
                    //console.log(user_email); //make sure getting user
                    // Get Reports by user email, order by date asc (last first), get top 10 
                    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=email eq '"+ user_email +"'&$orderby=Fecha asc &$select=UnidadesVendidas,Producto,Title,Fecha,event_id";
                    var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
                    this.status = "getting data..."; 
                    axios.get(endPointUrl).then(response =>  {
                        var form = response.data.value; // First response containing all demo forms
                        //console.log(form); //make sure its getting all reports
                                var i;
                                for( i=0; ; i++ ){
                                    
                                    // Check if user has any data at all, it doesn't populate at all
                                    if(typeof form[0] === 'undefined'){dic.title = "Not Available"; dic.headline="Not Available"; dic.subtitle ="<span class='text--primary'> Not Available </span> &mdash; - "; this.items.push(dic); // set values to 0
                                         break}  // draw graph
                                    // Check if end of values in first response has been reached, and exit loop
                                    if(typeof form[i] === 'undefined'){break}
                                    
                                    // Continue looping and storing to arrays
                                    else{
                                         
                                         let form2       = form[i];         // Use for looping forms and get their details
                                         let product     = form[i].Producto;// Product demosntrated
                                         let title       = form[i].Title;   // CAN CHANGE TO (event_id), Use to identify extra products sold if
                                        
                                        //console.log(form2.Title) //debug
                                        let tit = form2.Title;
                                        //console.log(tit); // debug
                                        
                                         // Get Product family by searching in Products the specified product and returning family type
                                         var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Receipt')/items?$filter=title0 eq '" + title + "' &$select=event_id,OData__x0073_mm7,title0";
                                         var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                        this.status = "getting data..."; 
                                            
                                        axios.get(endPointUrl).then(response =>  { 
                                            var dic = { headline: 'title',title: 'YYYY/MM/DD ',subtitle:""};
                                            var total = 0;
                                                let form3 = response.data.value;
                                                //console.log(form3); //make sure getting specified form receipts
                                                // Get all receipts for that report
                                                if(typeof form3[0] === 'undefined'){ dic.headline = tit; dic.title = form2.Fecha;dic.subtitle ="<span class='text--primary'>"+title+"</span> &mdash; None "; this.items.push(dic); }
                                                //console.log(title);

                                                
                                                else{
                                                //console.log(response.data.value[j]);
                                                var j;
                                                for( j=0; ; j++ ){
                                                    if(typeof response.data.value[j] === 'undefined'){total = 0; break}
                                                    total2 = Number(form3[j].OData__x0073_mm7); //
                                                    
                                                    total =total + total2; 
                                                    //console.log(total);
         
                                                    dic.subtitle ="<span class='text--primary'>"+title+"</span> &mdash; $" + total + "";
                                                }//for
                                                    //console.log(title);
                                                    //console.log(total);
                                                
                                                    dic.headline = tit; dic.title = form2.Fecha; 
                                                    this.items.push(dic);  
                                        }
                                            });//Third
                                        

        //debug
                                            
                                            
                        

                                 
                                    }//else
                                }//for
                    }); // Second
         
       
  }); // Third
  
  }, //mount
})