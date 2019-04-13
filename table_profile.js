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
//            { text: 'Total de Ventas', value: 'total', width: '16%' , sortable: false, align: 'center',},

          ],
          reports: [
//            {
//              value: false,
//              title: 'Reporte 1',
//              sale1: 23,
//              sale2: "-",
//              ince1: 1,
//              ince2: "-",
//              total: 45,
//            },

          ],
        titles: [],
        sales1: [],
        sales2: [],
        inces1: [],
        inces2: [],
        totals: [],
        family: [],
        }
      }, // END OF DATA
    created: function(){
        this.rowClick();
    },
    methods: {
       rowClick(name) {
          this.selectedItem = name;
        },
        linkfn(id){
            console.log(id);
            location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/DemoOptions2.aspx?id="+id+"";
        }
    },
    mounted(){
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
        var tit = "";
        var s1  = "";
        var s2  = "";
        var i1 = 0;
        var i2 = "";
        var tot = "";
        var id = 0;


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
                    //console.log("Fetch Reports"); // debug
                    // Get Reports by user email, order by date asc (last first), get top 10 and get only sales and product
                    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=email eq '"+ user_email +"'&$orderby=Fecha asc &$select=UnidadesVendidas,Producto,Title,Fecha,event_id,Id";
                    var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
                    this.status = "getting data...";
                    axios.get(endPointUrl).then(response =>  {
                        var form = response.data.value; // First response containing all demo forms
                        console.log(form);
                                var i;
                                for( i=0; ; i++ ){

                                    // Check if user has any data at all, it doesn't populate at all
                                    //if(typeof form[0] === 'undefined'){dic.title = "Not Available"; dic. // set values to 0
                                    //     break}  // draw graph
                                    // Check if end of values in first response has been reached, and exit loop
                                    if(typeof form[i] === 'undefined'){break}

                                    // Continue looping and storing to arrays
                                    else{

                                         let form2       = form[i];         // Use for looping forms and get their details
                                         let product     = form[i].Producto;// Product demosntrated
                                         let title       = form[i].Title;   // CAN CHANGE TO (event_id), Use to identify extra products sold if

                                        //console.log(form2.Title) //debug
                                        let tit = form2.Title;
                                        let id =form2.Id;
                                        //console.log(id);
                                        //console.log(tit); // debug

                                         // Get Product family by searching in Products the specified product and returning family type
                                         var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu";
                                         var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                        this.status = "getting data...";
                                        axios.get(endPointUrl).then(response =>  {

                                            let family = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)

                                            let date        = form2.Fecha;
                                            let units       = Number(form2.UnidadesVendidas);

                                         // Get Product family by searching in Products the specified product and returning family type
                                         var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=Title eq '"+ title +"'&$select=Title,UnidadesVendidas"
                                         var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                        this.status = "getting data...";
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

                                            //console.log("Final");        //debug
                                            //console.log(units);          //debug


                                var dic = { value: false,title: ' ',sale1: 0, sale2: " ", ince1: 0, ince2: 0 ,total: 0,id: 0};

                                            // Check for family and add to corresponding fields and check incentive level
                                            if( family == 'EMPANADO'){

                                                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMPANADOS' &$select=xery,tr7c";
                                                var headers = {
                                                            "async": false,
                                                            "accept": "application/json;odata=verbose",
                                                            "content-type": "application/json;odata=verbose"
                                                        };
                                                this.title = "getting data...";


                                                axios.get(endPointUrl).then(response =>  {

                                                        if(units <= response.data.value[0].xery ){i1 = Number(response.data.value[0].tr7c);}
                                                        if( (units >= response.data.value[1].xery) && (units < response.data.value[2].xery)){ i1 = Number(response.data.value[1].tr7c);}
                                                        if( (units >= response.data.value[2].xery) && (units < response.data.value[3].xery)){ i1 = Number(response.data.value[2].tr7c);}
                                                        if( (units >= response.data.value[3].xery)){ i1 = Number(response.data.value[3].tr7c);}

                                                        dic.title = tit; dic.id = id; dic.family = "Empanados"; dic.sale1 = units; dic.sale2 = units; dic.ince1 = i1; dic.ince2 = i1; dic.total = units; this.reports.push(dic);
console.log(this.reports)

                                                    });

                                                } //EMPANADOS




                                            else{
                                                var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMBUTIDOS' &$select=xery,tr7c";
                                                var headers = {
                                                            "async": false,
                                                            "accept": "application/json;odata=verbose",
                                                            "content-type": "application/json;odata=verbose"
                                                        };
                                                this.title = "getting data...";
                                                axios.get(endPointUrl).then(response =>  {

                                                var dic = { value: false,title: ' ',sale1: 0, sale2: " ", ince1: 0, ince2: " ",total: 0,};
                                                    if(units <= response.data.value[0].xery ){i1 = Number(response.data.value[0].tr7c); }
                                                    if( (units >= response.data.value[1].xery) && (units < response.data.value[2].xery)){i1 = Number(response.data.value[1].tr7c); }
                                                    if( (units >= response.data.value[2].xery) && (units < response.data.value[3].xery)){i1 = Number(response.data.value[2].tr7c); }
                                                    if( (units >= response.data.value[3].xery)){i1 = Number(response.data.value[3].tr7c); }

                                                    dic.title = tit; dic.family = "Embutidos"; dic.sale1 = units; dic.sale2 = units; dic.ince1 = i1; dic.ince2 = i1; dic.total = units; this.reports.push(dic);


                                                }); //EMBUTIDOS


                                        }

                                     // else Embutido

                    }); //Fourth



    }); //Third
                                    }//else
                                }//for
                    }); // Second
        }); //First


    },// Methods

});
