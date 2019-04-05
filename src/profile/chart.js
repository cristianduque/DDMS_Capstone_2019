
// Callback that creates and populates a data table,
// instantiates the column chart, passes in the data and
// draws it.
function drawChart() {
    
    console.log("Hello " + _spPageContextInfo.userLoginName);



    
        // Some raw data (not necessarily accurate)
        var empanados = [['Date', 'Sales'],
                        ['2004/05', 5],
                        ['2005/06', 4],
                        ['2006/07', 3],
                        ['2007/08', 2],
                        ['2008/09', 1],
                        ['2004/05', 1],
                        ['2005/06', 2],
                        ['2006/07', 3],
                        ['2007/08', 4],
                        ['2008/09', 5]
                        ];
    
        var embutidos = [['Date', 'Sales'],
                        ['2004/05', 1],
                        ['2005/06', 2],
                        ['2006/07', 3],
                        ['2007/08', 4],
                        ['2008/09', 5],
                        ['2004/05', 5],
                        ['2005/06', 4],
                        ['2006/07', 3],
                        ['2007/08', 2],
                        ['2008/09', 1]
                        ];

        // Create and populate the data tables.
        var data = [];
        data[0] = google.visualization.arrayToDataTable(empanados);
        data[1] = google.visualization.arrayToDataTable(embutidos);

       // Fetch Table
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')";
                console.log(endPointUrl);
                var headers = {
                    "accept": "application/json;odata=verbose",
                    "content-type": "application/json;odata=verbose"
                };
                this.status = "getting data...";
                
                axios.get(endPointUrl).then(response =>  {
                    console.log(response.data.value[0].Title);
                });
                    
                
    
        // Set chart options
        var options = {'title':'Empanados',                     // set title
                       'legend': 'none',                        // remove legend
                       'vAxis': { title: 'Sales',
                                  gridlines: { count: 6 },      // set gridlines
                                  viewWindow: {min:0, max:7}},  // set limits
                       'hAxis': { textPoistion: 'right' },
                       'animation':{
                                    duration: 500,              // animation time
                                    easing: 'out',},            // Fast out, slow in
                       'ticks': [0, 3, 6], // display labels every 25
                       'width': 'auto',
                       'height': 'auto',};
    
        // Controls which chart to display
        var current = 0; // 0 = Empanados, 1 = Embutidos

        // Create and draw the visualization.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        var button = document.getElementById("chart_div");
    
    
    
        // Disabling the button while the chart is drawing.
        function drawChart() {
        button.disabled = true;
          // Disabling the button while the chart is drawing.
          button.disabled = true;
          google.visualization.events.addListener(chart, 'ready',
              function() {
                button.disabled = false;
                button.value = (current ? 'Embutidos' : 'Empanados');
              });
          options['title'] = 'Ventas de ' + (current ? 'Embutidos' : 'Empanados') + ' por demo ';

          chart.draw(data[current], options);
        }
    
        //chart.draw(data, options);
        
//        button.onclick = function() {
//          current = 1 - current; // Switch Chart
//          drawChart();
//        }
         
        window.onresize = function(){
            drawChart();
        }
        
        
       
        // Draw chart without key press
        drawChart(); 
        
        
      }

