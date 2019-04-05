<!DOCTYPE html>
<html>
<head>
    <title>Review</title>
    
    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
    <!-- Vuetify -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <!-- Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
     
    <!-- Empanados Donut Chart  -->
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawEmpanados);
        
        function drawEmpanados() {
        var data = google.visualization.arrayToDataTable([
          ['Categoria', 'Ventas'],
          ['Embutidos',     35],
          ['Total',      65]
        ]);

        var options = {
          width: 'auto',
          height: 'auto',
          title: '',
          legend: 'none',
          pieSliceText: 'value',
          pieStartAngle: 180,
          pieHole: 0.4,
          tooltip: { trigger: 'none' },
        };

        var chart = new google.visualization.PieChart(document.getElementById('empanados'));
        chart.draw(data, options);
            
         window.onresize = function(){
            drawEmpanados();
        }
      }
        
    </script>
    
    <!-- Embutidos Donut Chart -->
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawEmbutidos);
        
        function drawEmbutidos() {
        var data = google.visualization.arrayToDataTable([
          ['Categoria', 'Ventas'],
          ['Embutidos',     20],
          ['Total',      80]
        ]);

        var options = {
          width: 'auto',
          height: 'auto',
          title: '',
          legend: 'none',
          pieSliceText: 'value',
          pieStartAngle: 180,
          pieHole: 0.4,
          tooltip: { trigger: 'none' },
        };

        var chart = new google.visualization.PieChart(document.getElementById('embutidos'));
        chart.draw(data, options);
            
         window.onresize = function(){
            drawEmbutidos();
        }
      }
    </script>
   
    
    <!-- Link to profile CSS -->
<!--    <link rel="stylesheet" type="text/css" href="review.css">-->
    <style>
     /* Optional: Makes the sample page fill the window. */
html, body {
        height: 100%;
        padding: 0;
        background-color: #fafafa;
      }

    a:link {
      color: white;
      background-color: transparent;
      text-decoration: none;
    }
    a:visited {
      color: white;
      background-color: transparent;
      text-decoration: none;
    }
    a:hover {
      color: white;
      background-color: transparent;
      text-decoration: none;
    }
    a:active {
      color: white;
      background-color: transparent;
      text-decoration: none;
    }


#menu{
   
    height: 10%;
}  

.chart_container{
    position: relative;
    padding: 50%;
    padding-bottom: 100%; 
    height: 0;
    overflow: auto;
    margin: auto;  
}

#empanados{
        position: absolute;
        top: 3%;
        left: 3%;
        right: 3%;
        width:90%;
        height:500px;
        margin-left: auto;
        margin-right: auto;
}

#embutidos{
        position: absolute;
        top: 3%;
        left: 3%;
        right: 3%;
        width:90%;
        height:500px;
        margin-left: auto;
        margin-right: auto;
}
/* Set-up map container position relative*/
.map_container{
    position: relative;
    padding: 50%;
    padding-bottom: 100%; 
    height: 0;
    overflow: auto;
    margin: auto;  
    
}

#map {
        position: absolute;
        top: 3%;
        left: 3%;
        right: 3%;
        width:90%;
        height:500px;
        margin-left: auto;
        margin-right: auto;
        
        
      }   

#hours{
    height: 40%;
    padding-bottom: 5%;
}

#products{
    height: 50%;
    padding-bottom: 5%
}

#attendance{
    height: 50%;
    margin-bottom: 20%;
}

    </style>
    
    
    
</head>
    
<body>
    <v-container grid-list-xs text-xs-center>
   
    <!-- Toolbar -->
    <v-layout row wrap> 
        <v-flex xs12>
        <div id="menu">
          <v-app id="inspire">
            <v-toolbar color="red" dark fixed>

                  <v-toolbar-side-icon><a href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/history.aspx"><v-icon>arrow_back</v-icon></a></v-toolbar-side-icon>
                  <v-toolbar-title >Reseña</v-toolbar-title>
                  <v-spacer></v-spacer>
                  <v-toolbar-items class="hidden-sm-and-down">
                  </v-toolbar-items>


                </v-toolbar>
            </v-app>
        </div>
        </v-flex>
    </v-layout>  
    
    <script>
      var vm = new Vue({
      el: '#menu',
    data: () => ({
      drawer: false
    }),
    props: {
      source: String
    }
  })
    </script>
    
    <!-- Get Report Title -->
    <v-layout row>  
        <v-flex xs12>  
            <h2 id="reporte">Reporte</h2>
            <div id = "report"></div>
        </v-flex>  
    </v-layout>  
    <script>
        var report= new Vue({
          el: '#report',
          methods: {
            // Get Report Name
            getName: function () {
                var header = document.getElementById("reporte");
                header.innerHTML = "Supermercado Colegio - Feb 28";
            },
      },
      
      // Run functions @ page-load
      beforeMount(){
      this.getName();
   
 },
})</script>
    
    <!-- Donut Charts -->
    <v-layout row wrap>
        <v-flex xs6 md6 shrink pa-1>
            <div class="chart_container">
             <div id="embutidos"></div>
            </div>
             <p>Embutidos</p>
        </v-flex>
        <v-flex xs6 md6 shrink pa-1>
            <div class="chart_container">
             <div id="empanados"></div>
            </div>
             <p>Empanados</p>
        </v-flex>
    </v-layout>
    
    <h2>Localización:</h2>
    <!-- Google Map w/ Marker -->
    <v-layout row wrap>
        <v-flex xs12>
            <div class = "map_container">
             <div id="map"></div>
            </div>
         </v-flex>
    </v-layout>
    <script type="text/javascript">
          var map;
          function initMap() {

              // Center of Map (should be upcoming demo)
              var colegio = {lat: 18.209527, lng: -67.139727};
              map = new google.maps.Map(document.getElementById('map'), {center: colegio,zoom: 15});
              //Marker
              var marker = new google.maps.Marker({position: colegio, map: map});
          }

        </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg71kA9ufXlx4ZdpQEvlii-nrKoDx-jlM&callback=initMap" async defer></script> 

    <!-- Work Hours Table -->
    <v-layout row wrap>
        <v-flex xs12>
            <div id="hours">
    <v-app>
      <v-content>
        <v-container>
          <template>
              <v-card-title>
              Horas Trabajadas
              </v-card-title>
            <v-spacer></v-spacer>
            <v-data-table :headers="headers" :items="reports"  :hide-actions="true"  >
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.entrance }}</td>
                  <td class="text-xs-center">{{ props.item.exit }}</td>
                </tr>
              </template>
                
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Sorry, nothing to display here :(</v-alert>
            </template>
                
            </v-data-table>
          </template>
        </v-container>

      </v-content>
    </v-app>
  </div>
        </v-flex>
    </v-layout>
    <script>
        var vm = new Vue({
      el: '#hours',
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
            { text: 'Entrada', value: 'entrance', width: '15%',sortable: false, align: 'center', },
            { text: 'Salida', value: 'exit', width: '15%',sortable: false, align: 'center', },
           
          ],
          reports: [
            {
              value: false,
              name: 'Horas Establecidas',
              entrance: '11:00',
              exit: "4:00",
            },
                        {
              value: false,
              name: 'Horas Registradas',
              entrance: '11:00',
              exit: "4:02",
            },
          ]
        }
      }
    })
    </script>
    
    <!-- Products Sold -->
    <v-layout row wrap>
        <v-flex xs12>
            <div id="products">
    <v-app>
      <v-content>
        <v-container>
          <template>
              <v-card-title>
              Productos Vendidos
              </v-card-title>
            <v-spacer></v-spacer>
            <v-data-table :headers="headers" :items="reports"  :hide-actions="true"  >
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.sold }}</td>
                </tr>
              </template>
                
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Sorry, nothing to display here :(</v-alert>
            </template>
                
            </v-data-table>
          </template>
        </v-container>

      </v-content>
    </v-app>
  </div>
        </v-flex>
    </v-layout>
    <script>
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
            {
              value: false,
              name: 'Producto 1',
              sold: 35,
            },
            {
              value: false,
              name: 'Producto 2',
              sold: 45,
            },
                        {
              value: false,
              name: 'Producto 3',
              sold: 10,
            },
          ]
        }
      }
    })
    </script>
    
     <!-- People Attended -->
    <v-layout row wrap>
        <v-flex xs12>
            <div id="attendance">
    <v-app>
      <v-content>
        <v-container>
          <template>
              <v-card-title>
              Personas Attendida
              </v-card-title>
            <v-spacer></v-spacer>
            <v-data-table :headers="headers" :items="reports" :hide-actions="true"  >
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.attended }}</td>
                </tr>
              </template>
                
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Sorry, nothing to display here :(</v-alert>
            </template>
                
            </v-data-table>
          </template>
        </v-container>

      </v-content>
    </v-app>
  </div>
        </v-flex>
    </v-layout>
    <script>
        var vm = new Vue({
      el: '#attendance',
     
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
            { text: 'Total de personas atendidas', value: 'attended', width: '15%',sortable: false, align: 'center', },
            
           
          ],
          reports: [
            {
              value: false,
              name: 'Hora 1',
              attended: 35,
            },
            {
              value: false,
              name: 'Hora 2',
              attended: 35,
            },
            {
              value: false,
              name: 'Hora 3',
              attended: 35,
            },
            {
              value: false,
              name: 'Hora 4',
              attended: 35,
            },
            {
              value: false,
              name: 'Hora 5',
              attended: 35,
            },

          ]
        }
      }
    })
    </script>
    
    <!-- Miscellaneous -->
    <v-layout row wrap>
        <v-flex xs12>
            <div id="add">
      <v-app id="inspire">
        <div class="text-xs-center">
          <v-btn fab dark color="green">
            <v-icon dark>add</v-icon>
          </v-btn>
          <p>Add Miscellaneous</p>
        </div>
      </v-app>       
    </div>
        </v-flex>
    </v-layout>
    <script>
        new Vue({
            el: '#add',
        })
    </script>
    
    </v-container>
</body>
</html>