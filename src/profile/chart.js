
// Callback that creates and populates a data table,
// instantiates the column chart, passes in the data and
// draws it.
function drawChart() {
    
        // Global variable scope
        var user_email = ""; 
    
        var form  = "";     //all demo forms stored in 1st response
    
        var report = "";    //report
        var product = "";   //product sold 
    
        var family ="";     //product family
        var date  = "";     //report's date
        var units  = 0;     //total of units sold
    
        var form3 ="";      //use to get extra products
        var units2 = 0;     //use to for extra products sold
    
        var title = "";
        
    
        //Button to switch chart view
        var ToogleBtn = document.getElementById("btn1"); 
    
        // Controls which chart to display | 0 = Empanados, 1 = Embutidos
        var current = 0;  

        // Create Column Chart @ specified element id
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    
        // Set chart options
        var options = { 'title':'Empanados',                          // set title
                       'titleTextStyle': {
                                            fontStyle: 'Source Sans',
                                            fontSize: 15, // 12, 18 whatever you want 
                                        },
                        'legend': 'none',                             // remove legend
                        'vAxis': { 
                                   title: 'Ventas',
                                   ticks: [36,60,80],
                                   gridlines: {color: '#F69F00', count: 6},
                                   textStyle: {fontSize:9,},
                                   //viewWindowMode: 'pretty',
                                   viewWindow: {min:0, max:160}},  // set limits
                        'hAxis': { 
                                   
                                   type:'category',
                                   format: 'MM-d-yy',
                                   textStyle : {fontSize: 10,},// or the number you want
                                   
                                   },
                       
                        'animation':{duration: 500,easing: 'out',},   // time, fast out
                        'ticks': [0, 3, 6],                           // display labels every 25
                         //backgroundColor: '#fafafa',
                        'width': 'auto',
                        'height': 'auto',};
    
        // Arrays to store data 
        var empanados = [['Date', 'Sales'],];
        var embutidos = [['Date', 'Sales'],];
    
        // Array to store arrays for button toogle  
        var data = [];
        
        // Fetch User in order to know which Employee information to extract 
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                }; 
        axios.get(endPointUrl).then(response =>  {
                    
          // Return user email
          var user_email = response.data.Email; 
                    
          // Get Reports by user email, order by date asc, get top 10 
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$top=10&$filter=email eq '"+user_email+"'&$orderby=Fecha desc ";
            
          var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
            
          axios.get(endPointUrl).then(response =>  {
                                
            var form = response.data.value; // First response containing all demo forms
            var i;
            for( i=0; ; i++ ){
                                    
              // Check if user has any data at all, if user doesn't graph empty
              if(typeof form[0] === 'undefined'){
                                    // set values to 0
                                    var arr = new Array("Not Available", 0);empanados.push(arr); embutidos.push(arr); 
                                    // Populate Array of Arrays fro button toogle
                                    data[0] = google.visualization.arrayToDataTable(empanados);
                                    data[1] = google.visualization.arrayToDataTable(embutidos);
                                    chart.draw(data[current], options); // draw graph
                                    break;
                                }    
              // Check if end of values in first response has been reached, and exit loop
              if(typeof form[i] === 'undefined'){break;}
              // Continue looping and storing to arrays
              else{
                   let report       = form[i];         // Use for looping forms and get their details
                   let product      = form[i].Producto;// Product demosntrated
                   let event_id     = form[i].event_id;   // CAN CHANGE TO (event_id), Use to identify extra products sold if
                                
                  // Get Product family by searching in Products the specified product and returning family type
                  var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu";
                  var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
                  axios.get(endPointUrl).then(response =>  { 
                                            
                    let family  = response.data.value[0].r0hu; // get product demonstrated family (Embutidos || Empanados)
                    let date    = report.Fecha;
                    let units   = Number(report.UnidadesVendidas);
                    var splited = date.split('-');
                    
                    //Fix date being displayed
                    if(Number(splited[2]) > 9){date = date.substring(0,8) + (Number(splited[2])+1);}
                    else{date = date.substring(0,8) + (Number(splited[2]));}
                      
                     // Get extra Products sold 
                     var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ event_id +"'&$select=UnidadesVendidas"
                     var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
                     axios.get(endPointUrl).then(response =>  { 
                                            
                        let form3 = response.data.value;
                        if (response.data.value[0] === 'undefined'){} // No extra products demo
                        else{
                             var j;
                             for( j=0; ; j++ ){
                                if(typeof response.data.value[j] === 'undefined'){break;}
                                let units2 = Number(form3[j].UnidadesVendidas);
                                units = Number(units) + units2;  
                              }
                             }
                                            
                             var arr1 = new Array(new Date(date) ,units); // date w/ value
                             var arr2 = new Array(new Date(date) ,0);     // date w/ zero value
                                          
                             // Check for family and add to data[]
                             if( family == 'EMPANADO'){ empanados.push(arr1); embutidos.push(arr2);}
                             else{ embutidos.push(arr1); empanados.push(arr2);} 
                            
                             // Sort by Date
                             empanados.sort(function(a, b) {var dateA = new Date(a[0]), dateB = new Date(b[0]);
                                                            return dateA - dateB;});
                             embutidos.sort(function(a, b) {var dateA = new Date(a[0]), dateB = new Date(b[0]);
                                                            return dateA - dateB;});
                         
                             // Create and populate the data tables.
                             data[0] = google.visualization.arrayToDataTable(empanados);
                             data[1] = google.visualization.arrayToDataTable(embutidos);

                             chart.draw(data[current], options);
                                            
                       }); //Fourth Query
                                            

                       ToogleBtn.onclick = function() {
                                                  current = 1-current; // Switch Chart
                                                  drawChart();
                                            }
                                            
                     }); //Third Query
                    }
                   }
                 }); // Second Query
                }); // First Query
             
        var embutidos_inc = [0,0,0];
        var empanados_inc = [0,0,0];
    
        // Empanados Incentives
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMPANADOS' &$select=xery,tr7c";
        var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response =>  {
            empanados_inc[0] = Number(response.data.value[1].xery);
            empanados_inc[1] = Number(response.data.value[2].xery);
            empanados_inc[2] = Number(response.data.value[3].xery);
            //console.log(empanados_inc);
        });
        // Embutidos Incentives
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMBUTIDOS' &$select=xery,tr7c";
        var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response =>  {
            //console.log(response.data.value);
            embutidos_inc[0] = Number(response.data.value[1].xery);
            embutidos_inc[1] = Number(response.data.value[2].xery);
            embutidos_inc[2] = Number(response.data.value[3].xery);
            //console.log(embutidos_inc);
         }); //EMBUTIDOS

    
        function drawChart() {
               // Disabling the button while the chart is drawing.
               ToogleBtn.disabled = true;
               // Disabling the button while the chart is drawing.
               ToogleBtn.disabled = true;
               google.visualization.events.addListener(chart, 'ready',
               function() {
                  ToogleBtn.disabled = false;
                  ToogleBtn.value = (current ? 'Embutidos' : 'Empanados');
                  ToogleBtn.value = (current ? document.getElementById("option").innerHTML="Empanados" : document.getElementById("option").innerHTML="Embutidos"
                                    );
               });
            
               options['title'] = 'Ventas de ' + (current ? 'Embutidos' : 'Empanados') + ' por demo ';
               // Nivel de incentivo por familia
               options['vAxis']['ticks'] = current ? embutidos_inc:empanados_inc;//[46,70,90]:[36,60,80]; 
               chart.draw(data[current], options);
                              }
        
        // Draw chart without key press
        drawChart(); 
        
        
      }

