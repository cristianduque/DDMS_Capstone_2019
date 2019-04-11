<!DOCTYPE html>
<html>
<head>
    <title>Review</title>
    
    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
    <!-- Axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    <!-- Vuetify -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 

    <!-- Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
    <!-- Page settings -->
    <meta name="viewport" content="initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    
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
    .v-progress-circular{ 
        margin: 1rem;
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
                var id = window.location.href.split('=').pop()
                //console.log(id);
                var header = document.getElementById("reporte");
                header.innerHTML = id;
            },
      },
      
      // Run functions @ page-load
      beforeMount(){
      this.getName();
   
 },
})</script>
    
    <!-- Donut Charts -->
    <v-layout row wrap>
        
        <div class="text-xs-center">
        
            <v-flex xs6 id="pie">
            <v-progress-circular
              :rotate="90"
              :size="150"
              :width="30"
              :value="value"
              color="primary"
            >
              {{ value }}
            </v-progress-circular>
            </v-flex>
            <h2>Embutidos</h2>

            <v-flex xs6 id="pie2">
            <v-progress-circular
              :rotate="90"
              :size="150"
              :width="30"
              :value="value"
              color="primary"
            >
              {{ value }}
            </v-progress-circular>
            </v-flex>
            <h2>Empanados</h2>
    </div>
    
<!--
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
-->
    </v-layout>
        
    <script type="text/javascript" src="embutidos_chart.js"></script>
    
    <script type="text/javascript" src="empanados_chart.js"></script>
    
        
    <h2>Localización:</h2>
    <!-- Google Map w/ Marker -->
    <v-layout row wrap>
        <v-flex xs12>
            <div class = "map_container">
             <div id="map"></div>
            </div>
         </v-flex>
    </v-layout>
    <script type="text/javascript" src="map_report.js"></script>
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
    <script type="text/javascript" src="hours_table.js"></script>
    
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
    <script type="text/javascript" src="products_table.js"></script>
    
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
    <script type="text/javascript" src="people_table.js"></script>
    
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
    <script type="text/javascript" src="miscellaneous.js"></script>
    
    </v-container>
</body>
</html>