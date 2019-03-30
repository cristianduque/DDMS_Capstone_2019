<!DOCTYPE html>
<html>
<head>
    
    <title>Perfil</title>
    
    <!-- Scripts -->
    <script type="text/javascript" src="chart.js"></script>
    <script type="text/javascript" src="map.js"></script>
   
    
    <!-- Bootstrap -->
    
    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
    <!-- Vuetify -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    
    <!-- Alerts -->
    <script src="https://unpkg.com/vue-swal"></script>
    
    <!-- Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <!-- Load and draw chart -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    </script>

    <!-- Page settings -->
    <meta name="viewport" content="initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Link to profile CSS -->
    <link rel="stylesheet" type="text/css" href="profile.css">
    


</head>
    
<body>
    
    <h1>Profile</h1>
    <ul>
        <li><a href="profile.html">Perfil</a></li>
        <li><a href="history.html">Historial</a></li>
    </ul>
    
    <!-- Alert of upcoming demo -->
    <h2 id="AH!" >Alertas</h2>
    <div id="alerts">
    <ul>
        <li v-for="alert in alerts">
          {{ alert.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=alerts.js></script>

    
    <!-- Column Chart -->
    <div class="chart">
    <div id="chart_div"></div>
    
        
    <!-- Button to toogle -->
    <button id="toogle">Switch</button>
    </div>
    
    <!-- Table -->
  <div id="table">
    <v-app>
      <v-content>
        <v-container>
          <template>
              <v-card-title>
              Reportes
              <v-spacer></v-spacer>

        </v-card-title>
            
            <v-data-table :headers="headers" :items="reports"  :hide-actions="true" :pagination.sync="pagination" item-key="name" class="elevation-1">
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td rowspan="2">{{ props.item.title }}</td>
                  <td class="text-xs-center">Embutidos</td>
                  <td class="text-xs-center">{{ props.item.sale1 }}</td>
                  <td class="text-xs-center">{{ props.item.ince1 }}</td>
                  <td rowspan ="2" class="text-xs-center">{{props.item.total}}</td>
                </tr>
                <tr>
                  <td class="text-xs-center">Empanados</td>
                  <td class="text-xs-center">{{ props.item.sale2 }}</td>
                  <td class="text-xs-center">{{ props.item.ince2 }}</td>
                </tr>
              </template>
                
            <div class="text-xs-center pt-2">
              <v-pagination v-model="pagination.page" :length="pages"></v-pagination>
            </div>
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Sorry, nothing to display here :(</v-alert>
            </template>
                
            <!-- Alert if nothing found -->
            <template v-slot:no-results >
                <v-alert :value="true" color="error" icon="warning">
                Your search for "{{ search }}" found no results.
                </v-alert>
            </template>
            </v-data-table>
          </template>
        </v-container>

      </v-content>
    </v-app>
  </div>
    
    
  <script>
    var vm = new Vue({
      el: '#table',
      methods: {
        rowClick(name) {
          this.selectedItem = name;
        }
      },
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
            { text: 'Ventas', value: 'sale1', width: '15%',sortable: false , align: 'center', },
            { text: 'Nivel de Incentivo', value: 'ince1', width: '16%',sortable: false, align: 'center', },
            { text: 'Total de Ventas', value: 'total', width: '16%' , sortable: false, align: 'center',},
        
          ],
          reports: [
            {
              value: false,
              title: 'Reporte 1',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,

            },
            {
              value: false,
              title: 'Reporte 2',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,

            },
            
            
          ]
        }
      }
    })
  </script>

    
    <!-- Miscellaneous Costs of past 10 -->
    <h2>Gastos Pasados:</h2>
       <div id="misc">
    <ul>
        <li v-for="cost in costs">
          {{ cost.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=misc.js></script>
    
    
    <h2>Proximas demonstraciones:</h2>
    <!-- Google Map -->
    <div id="map"></div> 
    <!-- Script order matters  -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg71kA9ufXlx4ZdpQEvlii-nrKoDx-jlM&callback=initMap"
    async defer></script> 
    
    <div id="demos">
    <ul>
        <li v-for="demo in demos">
          {{ demo.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=demos.js></script>


    
    
</body>
    
</html>