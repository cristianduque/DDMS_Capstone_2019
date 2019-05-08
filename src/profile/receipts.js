/**
*
* This functions fetches last ten demonstrations
* miscellaneous costs receipts.
* Fetched receipts are available from that datetime.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
var receipts = new Vue({
  el: '#list',
  data () {
    return {
      selected: [2],
      items: [ ]
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
    },
    // Check if id available and allow to edit Miscellaneous Cost form
    linkfn(id){
            console.log("press")
            if(id !== ""){
                location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/MCform.aspx?title="+id+"";
            }
            
        }
  },   
  mounted(){
        //Global variables
        var family   = "";
        var form     = "";
        var form2    = "";
        var form3    = "";
        var date     = "";
        var event_id = "";
        var title    = "";
       
        var total2   = 0; 
        var product  = "";
        var user_email = "";
        var tit      = "";  // title
        var s1       = "";  // sales1
        var s2       = "";
        var i1       = 0;   // incentive1
        var i2       = "";
        var tot      = "";  // total
      
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
        
        // Fetch User in order to know which Employee information to extract
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        axios.get(endPointUrl).then(response =>  {
            
            user_email = response.data.Email; // returns user email
                   
            // Get Reports by user email, order by date asc (last first) and filter from today's ate, and get top 10 
            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$top=10&$filter=email eq '"+ user_email+ "' and (Fecha le '"+s+"') &$orderby=Fecha desc ";
            var headers = {
                "async": false,
                "accept": "application/json;odata=verbose",
                "content-type": "application/json;odata=verbose"
            };
             axios.get(endPointUrl).then(response =>  {
                    var form = response.data.value; // First response containing all demo forms
                    var i;
                    for( i=0; ; i++ ){    
                        // Check if user has any data at all, it doesn't populate at all
                        if(typeof form[0] === 'undefined'){
                            dic.title = "Not Available"; dic.headline="Not Available";                                     dic.subtitle ="<span class='text--primary'> Not Available </span> &mdash; - "; 
                            dic.status ="NaN"
                            this.items.push(dic); // set values to 0
                            break;
                        }  
                        // Check if end of values in first response has been reached, and exit loop
                        if(typeof form[i] === 'undefined'){break}  
                        // Continue looping and storing to arrays
                        else{
                            
                             let form2       = form[i];          // Use for looping forms and get their details
                             let product     = form[i].Producto; // Product demosntrated
                             let event_id    = form[i].event_id; // CAN CHANGE TO (event_id), Use to identify extra products sold if
                             let date_fecha = (form2.Fecha).substring(0,10);
                             var date_split = date_fecha.split('-')
                             date_fecha = months[Number(date_split[1])-1]+"/"+Number(date_split[2])+"/"+date_split[0]
                            
                             let title = date_fecha;
                             let tit = form2.Title;
                            
                            // Get Receipt by above demoS event_id
                            var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Receipt')/items?$filter=event_id eq '" + event_id + "' &$select=event_id,OData__x0073_mm7,title0,Receipt_Status";
                            var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                            axios.get(endPointUrl).then(response =>  { 
                                 var dic = { headline: 'title',title: 'YYYY/MM/DD ',subtitle:"",fecha:"",id:""};
                                 var total = 0;
                                 let form3 = response.data.value; // receipt form
                                 
                                 // Get all receipts for that report
                                 if(typeof form3[0] === 'undefined'){ 
                                                    dic.headline = tit; 
                                                    var date_fecha = (form2.Fecha).substring(0,10);
                                                    var date_split = date_fecha.split('-')
                                                    dic.fecha = date_fecha;
                                                    date_fecha = months[Number(date_split[1])-1]+"/"+Number(date_split[2])+"/"+date_split[0]
                                                    dic.title = date_fecha;// (form2.Fecha).substring(0,10);
                                                    dic.subtitle ="<span class='text--primary'>"+title+"</span> &mdash; None "; 
                                                    this.items.push(dic);
                                                      // Sort by Date
                                        this.items.sort(function(a, b) {var dateA = new Date(a.fecha);
                                                                        var dateB = new Date(b.fecha);
                                                                        return dateB - dateA;});
                                        } //no receipt available
                                else{
                                        var j;
                                        for( j=0; ; j++ ){
                                         //no more receipts
                                         if(typeof response.data.value[j] === 'undefined'){total = 0; break} 
                                                    total2 = Number(form3[j].OData__x0073_mm7); //
                                                    total =total + total2; 
                                                    dic.subtitle ="<span class='text--primary'>"+title+"</span> &mdash; $" + total + "";
                                          }//for loop
                                                    
                                          dic.title = tit; 
                                          let date_fecha = (form2.Fecha).substring(0,10);
                                          var date_split = date_fecha.split('-')
                                          dic.fecha = date_fecha;
                                          date_fecha = months[Number(date_split[1])-1]+"/"+Number(date_split[2])+"/"+date_split[0]
                                          dic.headline = date_fecha; 
                                          dic.status = form3[0].Receipt_Status;
                                        
                                          // Check status and assign event_id
                                          if( (form3[0].Receipt_Status === 'Editable') || (form3[0].Receipt_Status === 'Guardado') ){dic.id = event_id;}
                                         // if no status set Editable        
                                          if(!form3[0].Receipt_Status){
                                                        dic.status = "Editable";
                                                        dic.id = event_id;
                                          }
                                          this.items.push(dic); 
                                          // Sort by Date
                                          this.items.sort(function(a, b) {var dateA = new Date(a.fecha);
                                                                          var dateB = new Date(b.fecha);
                                                                          return dateB - dateA;});
            
                                        }
                                     });//Third
                                    }//else
                                }//for
                    }); // Second
  }); // Third
  }, //mount
})