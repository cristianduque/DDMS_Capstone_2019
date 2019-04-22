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
    linkfn(){
        var id = window.location.href.split('=').pop();
        location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/MCform.aspx?title="+id+"";
        }
  },
    
  mounted(){
      //Global*
       
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
    // Get report title 
        var id = window.location.href.split('=').pop();
      
    // Get Product family by searching in Products the specified product and returning family type
      var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Receipt')/items?$filter=event_id eq '" + id + "' &$select=*";
       var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response =>  { 
        var dic = { headline: 'title',title: 'YYYY/MM/DD ',subtitle:""};
        var total = 0;
        receipt = response.data.value[0];
        console.log(response.data.value[0].reciept_price);
            
        if(!(receipt.reciept_price)){ }
        else{
            
            var x = document.getElementById("misc");
            x.style.display = "none";
            dic.headline ="$ "+ receipt.reciept_price;
            dic.title = receipt.title0;
            this.items.push(dic);
        }
     });//Third


  
  }, //mount
})