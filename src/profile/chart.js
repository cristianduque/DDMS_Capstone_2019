
// Callback that creates and populates a data table,
// instantiates the column chart, passes in the data and
// draws it.
function drawChart() {
    
        // Gloabl variable scope
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
    
        //Button to switch chart view
        var ToogleBtn = document.getElementById("btn1"); 
        // Controls which chart to display
        var current = 0; // 0 = Empanados, 1 = Embutidos

        // Create Column Chart @ specified element id
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    
        // Set chart options
        var options = {'title':'Empanados',                              // set title
                        'legend': 'none',                                // remove legend
                        'vAxis': { title: 'Sales',
                         gridlines: { count: 6 },                        // set gridlines
                                      viewWindow: {min:0, max:160}},     // set limits
                        'hAxis': { textPoistion: 'right' },
                        'animation':{
                                        duration: 500,                   // animation time
                                        easing: 'out',},                 // Fast out, slow in
                        'ticks': [0, 3, 6],                              // display labels every 25
                        'width': 'auto',
                        'height': 'auto',};
    
        // Arrays to store data 
        var empanados = [['Date', 'Sales'],];
        var embutidos = [['Date', 'Sales'],];
    
        // Array to store arrays for button toogle ƪ(ړײ)ƪ 
        var data = [];
        
        // Fetch User in order to know which Employee information to extract (｡◕‿‿◕｡)
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/currentuser";
        var headers = {
                    "async": false,
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
        this.status = "getting data..."; 
        axios.get(endPointUrl).then(response =>  {
                    
                    // returns user email
                    user_email = response.data.Email; 
                    
            
                    // Get Reports by user email, order by date asc (last first), get top 10 and get only sales and product
                    var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=email eq '"+ user_email +"'&$orderby=Fecha asc &$select=UnidadesVendidas,Producto,Title,Fecha";
                    var headers = {
                                "async": false,
                                "accept": "application/json;odata=verbose",
                                "content-type": "application/json;odata=verbose"
                            };
                    this.status = "getting data..."; 
                    axios.get(endPointUrl).then(response =>  {
                                
                                
                                var form = response.data.value; // First response containing all demo forms
                                var i;
                                for( i=0; ; i++ ){
                                    
                                    // Check if user has any data at all, if user doesn't graph empty
                                    if(typeof form[0] === 'undefined'){
                                        var arr = new Array("Not Available", 0);empanados.push(arr); embutidos.push(arr); // set values to 0
                                        // Populate Array of Arrays fro button toogle
                                        data[0] = google.visualization.arrayToDataTable(empanados);
                                        data[1] = google.visualization.arrayToDataTable(embutidos);
                                        chart.draw(data[current], options); break}  // draw graph
                                    
                                    // Check if end of values in first response has been reached, and exit loop
                                    if(typeof form[i] === 'undefined'){break}
                                    
                                    // Continue looping and storing to arrays
                                    else{
                                         let form2       = form[i];         // Use for looping forms and get their details
                                         let product     = form[i].Producto;// Product demosntrated
                                         let title       = form[i].Title;   // CAN CHANGE TO (event_id), Use to identify extra products sold if
                                        
                                        //console.log(form2.Fecha); //debug
                                        //console.log(product);     //debug
                                        
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
                                            
                                          //console.log(" ");           //debug
                                          //console.log(product);       //debug
                                          //console.log(family);        //debug
                                          //console.log(date);          //debug
                                          //console.log(units);         //debug
                                            
                                         // Get Product family by searching in Products the specified product and returning family type
                                         var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=Title eq '"+ title +"'&$select=Title,UnidadesVendidas"
                                         var headers = {
                                                    "async": false,
                                                    "accept": "application/json;odata=verbose",
                                                    "content-type": "application/json;odata=verbose"
                                                };
                                        this.status = "getting data..."; 
                                        axios.get(endPointUrl).then(response =>  { 
                                            //console.log(response.data.value[0]);       //debug
                                            let form3 = response.data.value;
                                            if (response.data.value[0] === 'undefined'){} // No extra products demo
                                            else{
                                                var j;
                                                for( j=0; ; j++ ){
                                                    if(typeof response.data.value[j] === 'undefined'){break}
                                                    console.log(response.data.value[j].Title);
                                                    console.log(response.data.value[j].UnidadesVendidas);
                                                    let units2 = Number(form3[j].UnidadesVendidas);
                                                    units = Number(units) + units2; 
                                                    //console.log("Extras");       //debug
                                                    //console.log(units);          //debug
                                                    
                                                }
                                            }
                                            
                                            //console.log("Final");        //debug
                                            //console.log(units);          //debug
                                            var arr1 = new Array(date ,units);
                                            var arr2 = new Array(date ,0);
                                          
                                            // Check for family and add to data[]
                                            if( family == 'EMPANADO'){ empanados.push(arr1); embutidos.push(arr2);}
                                            else{ embutidos.push(arr1); empanados.push(arr2);} // else Embutido
                                            
                                            
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
        
                console.log(empanados);
                console.log(embutidos);
   
                                                               
        function drawChart() {
                                       // Disabling the button while the chart is drawing.
                                      ToogleBtn.disabled = true;
                                      // Disabling the button while the chart is drawing.
                                      ToogleBtn.disabled = true;
                                      google.visualization.events.addListener(chart, 'ready',
                                          function() {
                                            ToogleBtn.disabled = false;
                                            ToogleBtn.value = (current ? 'Embutidos' : 'Empanados');
                                          });
                                      options['title'] = 'Ventas de ' + (current ? 'Embutidos' : 'Empanados') + ' por demo ';
                                      chart.draw(data[current], options);
                              }
         

        
        
       
        // Draw chart without key press
        drawChart(); 
        
        
      }

