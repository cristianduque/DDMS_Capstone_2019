/**
*
* This functions determines if any miscellaneous costs were
* incurred. If not display option to add costs, else display
* miscellaneous costs of that report on reviwe.aspx
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
var receipts = new Vue({
  el: '#add',
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
    // if available allow to edit receipt
    linkfn(subtitle){
        console.log("press");
        var id = window.location.href.split('=').pop();
        if((subtitle == 'Editable') || (subtitle == 'Revisar') || (subtitle == 'Guardado')){
            location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/MCform.aspx?title="+id+"";
            }
        },
    // add miscellanoeus cost
    linkfn2(){
        console.log("press");
        var id = window.location.href.split('=').pop();
        location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/MCform.aspx?title="+id+"";
            
        }
  },
  mounted(){
      
        //Global variables
        var receipt ="";
        var date  = "";
        var event_id = "";
        var title ="";
       
        var total2 = 0;
        var product = "";
        var user_email = "";
        var tit = "";
        var s1  = "";
        var s2  = "";
        var i1 = 0;
        var i2 = "";
        var tot = "";
      
        // Get report title from page's URL
        var id = window.location.href.split('=').pop();
      
        // Get Receipt of specified event_id f
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Receipt')/items?$filter=event_id eq '" + id + "' &$select=*";
        var headers = {
           "async": false,
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
        axios.get(endPointUrl).then(response =>  { 
        var dic = { headline: 'title',title: 'YYYY/MM/DD ',subtitle:""};
        var total = 0;
        receipt = response.data.value[0];   // receipt's $$$
        
        //Check if status null, allow to add costs
        if(!receipt.Receipt_Status){            
             var x = document.getElementById("misc2");
                 x.style.display = "true";
        }
        // display already cost and status of receipt 
        else{
            
            var x = document.getElementById("misc");
                x.style.display = "none";
            
            dic.subtitle = receipt.Receipt_Status;
            dic.headline ="$ "+ receipt.OData__x0073_mm7; //total price
            dic.title = receipt.receipt_product;
           
            this.items.push(dic);
        }
            
     });//Third
  }, //mount
})