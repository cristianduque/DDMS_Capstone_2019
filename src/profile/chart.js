/**
*
* This functions creates a bar graph of the last ten demonstrations.
* The graph displays the last ten demonstrations Date of demo. vs Sales.
* Two buttons allow to change the graph based on the products sold family.
*
* @author: Diego Capre 
* @version: 1.0
* @date: 2019-05-07
*
**/
function drawChart() {
    
        // Global variable scope
        var user_email = "";            // User's email
    
        var form       = "";            // All demo forms stored in 1st response
    
        var report     = "";            // report
        var product    = "";            // product sold 
    
        var family     = "";            // product family
        var date       = "";            // report's date
        var units      = 0;             // total of units sold
    
        var form3      = "";            // use to get extra products
        var units2     = 0;             // use to for extra products sold
    
        
        var currentDate = new Date();                 // today's datetime
        var s = currentDate.toISOString().split("T"); // convert to ISO format and parse
        var s2 = s[0].split("-")                      // parse date portion
        var day =""+ (Number(s2[2])+0);               // get today's day
        var mon = s2[1];                              // today's month
        var year = s2[0];                             // today's year
        
        // Adjust day format (Ex. 1 -> 01)
        if( day.length <= 1){ day = "0"+ day;}
        // Convert to ISO format again, only the date part
        s = year+"-"+mon+"-"+day;

/**************************************************************************************************************************
                                                    CHART
**************************************************************************************************************************/
        //Buttons to switch chart view
        var ToogleBtn = document.getElementById("btn1"); 
        var ToogleBtn2 = document.getElementById("btn2"); 
    
        // Controls which chart to display | 0 = Empanados, 1 = Embutidos
        var current = 0;  

        // Create Column Chart @ specified element id
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    
        // Set chart options
        var options = { 'title':'Empanados',                          
                        'titleTextStyle': {
                                            fontStyle: 'Source Sans',
                                            fontSize: 18,
                                        },
                        'legend': 'none',                             
                        'vAxis': { 
                                   title: 'Ventas',
                                   titleTextStyle:{
                                       fontSize:13,
                                   },
                                   ticks: [36,60,80],
                                   gridlines: {color: '#F69F00', count: 6},
                                   textStyle: {fontSize:11,},
                                   viewWindow: {min:0, max:160}},  // set limits
                        'tooltip' : {
                                    trigger: 'none'
                                    },
                        'hAxis': { 
                                   format: "MMM-dd",
                                   textStyle : {fontSize: 11,},     
                                   gridlines: {count: 10},  
                                   },
                       
                        'animation':{duration: 500,easing: 'out',}, // time, fast out
                        'ticks': [0, 3, 6],                         // display labels every 25
                        'width': 'auto',
                        'height': 'auto',};
    
        // Arrays to store data 
        var empanados = [['Date', 'Sales',{ role: 'style' }],];
        var embutidos = [['Date', 'Sales',{ role: 'style' }],];
    
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
          // Get Reports by user email, order by date asc and filter by today's date, get top 10 
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$top=10&$filter=email eq '"+ user_email+ "' and (Fecha le '"+s+"') &$orderby=Fecha desc";
          var headers = {
              "async": false,
              "accept": "application/json;odata=verbose",
              "content-type": "application/json;odata=verbose"};
          axios.get(endPointUrl).then(response =>  {
                                
            var form = response.data.value; // First response containing all demo forms
            var i;
            for( i=0; ; i++ ){
                                    
              // Check if user has any data at all, if user doesn't the graph empty
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
              // Continue looping and storing values to arrays
              else{
                   let report       = form[i];           // Use for looping forms and get their details
                   let product      = form[i].product_id;// Product demosntrated
                   let event_id     = form[i].event_id;  // event's id (key for other tables)
                                
                  // Get Product family by searching in Products the specified product and returning family type
                  var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter= s2l1 eq '"+ product +"' &$select=r0hu";
                  var headers = {
                      "async": false,
                      "accept": "application/json;odata=verbose",
                      "content-type": "application/json;odata=verbose"};
                  axios.get(endPointUrl).then(response =>  { 
                                            
                    let family  = response.data.value[0].r0hu;     // get product demonstrated family
                    let date    = report.Fecha;                    // report's datetime
                    let units   = Number(report.UnidadesVendidas); // Units sold for report
                    var initSplice = date.split("T");              // get date portion from datetime
                    var splited = initSplice[0].split('-');        // split year,month,day
                    
                    //Fix date being displayed 
                    if(Number(splited[2]) > 9){date = date.substring(0,8) + (Number(splited[2])+0);}
                    else{date = date.substring(0,8) + (Number(splited[2]));}

                     // Get extra Products sold for that report
                     var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ExtraProdsDemo')/items?$filter=event_id eq '"+ event_id +"'&$select=UnidadesVendidas"
                     var headers = {
                         "async": false,
                         "accept": "application/json;odata=verbose",
                         "content-type": "application/json;odata=verbose"};
                      
                     axios.get(endPointUrl).then(response =>  { 
                                            
                        let form3 = response.data.value;              // extra products forms
                        if (response.data.value[0] === 'undefined'){} // No extra products sold
                        else{
                             // iterate over extra products sold
                             var j;
                             for( j=0; ; j++ ){
                                if(typeof response.data.value[j] === 'undefined'){break;} // no more extra products sold
                                let units2 = Number(form3[j].UnidadesVendidas);           // store extra product sold
                                units = Number(units) + units2;                           // add extra to total
                              } 
                             }
                                                         
                             // Check for family and add to data[]
                             if( family == 'EMPANADO'){ 
                                 var arr1 = new Array(new Date(date) ,units, 'color: #4ca6ff'); // date w/ value #a6a6a6
                                 var arr2 = new Array(new Date(date) ,0, 'color: #4ca6ff');     // date w/ zero value
                                 empanados.push(arr1); embutidos.push(arr2);}
                             else{ 
                                 var arr1 = new Array(new Date(date) ,units, 'color: #ff9999'); // date w/ value
                                 var arr2 = new Array(new Date(date) ,0, 'color: #ff9999');     // date w/ zero value
                                 embutidos.push(arr1); empanados.push(arr2);} 
                            
                             // Sort by Date graph
                             empanados.sort(function(a, b) {var dateA = new Date(a[0]), dateB = new Date(b[0]);
                                                            return dateA - dateB;});
                             embutidos.sort(function(a, b) {var dateA = new Date(a[0]), dateB = new Date(b[0]);
                                                            return dateA - dateB;});
                         
                             // Create and populate the data tables.
                             data[0] = google.visualization.arrayToDataTable(empanados);
                             data[1] = google.visualization.arrayToDataTable(embutidos);

                             chart.draw(data[current], options);
                                            
                       }); //Fourth Query
                                            
/**************************************************************************************************************************
                                                    BUTTON FUNCTIONS
**************************************************************************************************************************/
                       ToogleBtn.onclick = function() {
                                                  current = 0;//1-current; // Switch Chart
                                                  drawChart();
                                            }
                        ToogleBtn2.onclick = function() {
                                                  current = 1; // Switch Chart
                                                  drawChart();
                                            }
                                            
                     }); //Third Query
                    }
                   }
                 }); // Second Query
                }); // First Query
        
        // Incentive levels arrays
        var embutidos_inc = [0,0,0];
        var empanados_inc = [0,0,0];
    
        // GET Empanados Incentives
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMPANADOS' &$select=xery,tr7c";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response =>  {
            empanados_inc[0] = Number(response.data.value[1].xery);
            empanados_inc[1] = Number(response.data.value[2].xery);
            empanados_inc[2] = Number(response.data.value[3].xery);
          });
    
        // GET Embutidos Incentives
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Incentive')/items?$filter= oqys eq 'EMBUTIDOS' &$select=xery,tr7c";
        var headers = {
            "async": false,
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"};
        axios.get(endPointUrl).then(response =>  {
            embutidos_inc[0] = Number(response.data.value[1].xery);
            embutidos_inc[1] = Number(response.data.value[2].xery);
            embutidos_inc[2] = Number(response.data.value[3].xery);
         }); //EMBUTIDOS

        
        /**
        *
        * This functions creates a bar graph of the last ten demonstrations.
        * The graph displays the last ten demonstrations Date of demo. vs Sales.
        * Two buttons allow to change the graph based on the products sold family.
        *
        * @author: Diego Capre 
        * @version: 1.0
        * @date: 2019-05-07
        *
        **/
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
            
               options['title'] = 'Ventas de ' + (current ? 'Embutidos' : 'Empanados') + '';
               options['vAxis']['ticks'] = current ? embutidos_inc:empanados_inc; 
               chart.draw(data[current], options);
                              }
        
        // Draw chart without key press
        drawChart(); 
        
        
      }

