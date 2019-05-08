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

#map {
      
        width: auto;
        height:500px;
        margin-top: 2%;
        margin-left: 3%;
        margin-right: 3%;
        border-radius: 15px;

      } 

/*
#hours{
    height: 40%;
    padding-bottom: 5%;
}
*/

/*
#products{
    height: 50%;
    padding-bottom: 5%
}
*/

/*
#attendance{
    height: 50%;
    margin-bottom: 20%;
}
*/
    
.application--wrap {
    flex: 1 1 auto;
    backface-visibility: hidden;
    display: flex;
    flex-direction: column;
    min-height: 10vh; 
    height: auto;
    max-width: 100%;
    position: relative;
    margin-bottom: 1rem;
}

.theme--light.v-table tbody tr:hover:not(.v-datatable__expand-row) {
    background: transparent;
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
            <v-toolbar color="#2095c0" fixed>

                  <v-toolbar-side-icon><a style="text-decoration:none; background-color: transparent; color:white;"href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/history.aspx"><v-icon style="color:white">arrow_back</v-icon></a></v-toolbar-side-icon>
                  <v-toolbar-title style="color:white" >Reseña</v-toolbar-title>
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
            <div id = "reporte" class="flex display-1 font-weight-thin" style="margin-left: 1rem"> Reporte</div>
<!--            <h2 id="reporte">Reporte</h2>-->
            <div id = "report"></div>
        </v-flex>  
    </v-layout>  
    <script>
        var report= new Vue({
          el: '#report',
      // Run functions @ page-load
      mounted(){
          var id = window.location.href.split('=').pop()
          console.log(id);
          var header = document.getElementById("reporte");
                
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items?$filter=event_id eq '"+ id +"'&$select=*";
        var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
         axios.get(endPointUrl).then(response =>  {header.innerHTML = response.data.value[0].Title;});
      
   
 },
})</script>
    
    <!-- Meta Chart -->
    <v-layout row wrap>
        
        <div  class="flex display-4 font-weight-regular" style="color:#2095c0; text-align: center; margin-top:5rem; ">
            <v-flex xs12 id="meta" >
<!--
                <div style="margin-left: 30%">Cajas Vendidas: {{value}}</div>
                <div style="margin-right: 50%;">Cajas Esperadas: {{total}}</div>
-->
                 <div class="flex display-1 font-weight-regular" style="color:#2095c0; text-align: center; margin-left: 1rem;  margin-bottom: 1rem;">Cajas Vendidas: {{value}} </div>
                <div class="flex display-1 font-weight-regular" style="color:#2095c0; text-align: center;  margin-left: 1rem; margin-bottom: 3rem;">Meta Esperada: {{total}}</div>
            </v-flex>
    </div>
<!--
    <div class="flex display-2 font-weight-regular" style="color:#2095c0; text-align: center; margin-top:2rem; "> META</div>
    <div class="flex title font-weight-regular" style="color:#2095c0; text-align: center; margin-bottom: 2rem;"> Cajas vendidas </div>
-->

    </v-layout>
        
    <script type="text/javascript" src="meta.js"></script>

        
    <div class="flex display-1 font-weight-thin" style="margin-left: 1rem; margin-bottom: 2rem;"> Localización:</div>
    <!-- Google Map w/ Marker -->
    <v-layout row wrap>
        <v-flex xs12>
            <div class = "map_container">
             <div id="map"></div>
            </div>
         </v-flex>
    </v-layout>
    <script type="text/javascript" src="map_report.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANn9G0LKcoEKip9nEpH9MtkcO8EvgbbVY&callback=initMap" async defer></script> 

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
            <v-card>
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
                    <v-alert :value="true" color="error" icon="warning">Disculpa, no hay datos al momento.</v-alert>
            </template>
                
            </v-data-table>
            </v-card>
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
            <v-card>
            <v-data-table :headers="headers" :items="reports" :hide-actions="true"  >
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.sold }}</td>
                </tr>
              </template>
                 
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Disculpa, no hay datos al momento.</v-alert>
            </template>
                
            </v-data-table>
            </v-card>
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
              Personas Atendidas
              </v-card-title>
            <v-spacer></v-spacer>
            <v-card>
            <v-data-table :headers="headers" :items="reports" :hide-actions="true"  >
              <template slot="items" slot-scope="props">
                <tr @click="rowClick(props.item.name)">
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.attended }}</td>
                </tr>
              </template>
                
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Disculpa, no hay datos al momento.</v-alert>
            </template>
                
            </v-data-table>
            </v-card>
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
            <div id="misc2"     style="
                                margin-top: 7vh;
                                margin-left: 5%;
                                margin-right: 5%;
                                box-shadow: 3px 1px 10px 1px #888888;"
                 >
<!--                <div id = "reporte" class="flex display-1 font-weight-thin" style="margin-left: 1rem">Gastos</div>-->
                  <v-card-title>
              Gastos Incurrido
              </v-card-title>
            <v-spacer></v-spacer>
              <v-list two-line>
                <template v-for="(item, index) in items">
                  <v-list-tile
                    :key="item.title"
                    avatar
                    ripple
                    @click= "toggle(index),linkfn(item.subtitle)"
                  >
                    <v-list-tile-content>

                      <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                      <v-list-tile-sub-title class="text--primary">{{ item.headline }}</v-list-tile-sub-title>
                      <v-list-tile-sub-title style="color:#ff6f6f;"v-html="item.subtitle" v-if=" item.subtitle == 'Denegado' "></v-list-tile-sub-title>
                      <v-list-tile-sub-title style="color:#2095c0;"v-html="item.subtitle" v-else-if=" item.subtitle == 'Editable' "></v-list-tile-sub-title>
                      <v-list-tile-sub-title style="color:#7fbf7f;"v-html="item.subtitle" v-else-if=" item.subtitle == 'Aprobado' "></v-list-tile-sub-title>
                      <v-list-tile-sub-title style="color:black;"v-html="item.subtitle" v-else></v-list-tile-sub-title>
                    </v-list-tile-content>

                  </v-list-tile>
                  <v-divider
                    v-if="index + 1 < items.length"
                    :key="index"
                  ></v-divider>
                </template>
              </v-list>
           
            <div id= "misc">
                <div id = "reporte" class="flex display-1 font-weight-thin" style="margin-left: 1rem"> Añadir Gastos</div>
                  <v-btn fab dark color="green"  @click = "linkfn2()">
                    <v-icon dark>add</v-icon>
                  </v-btn>
            </div>
            
            </div>
            </div>
      </v-app>       
    </div>
        </v-flex>
    </v-layout>
    <script type="text/javascript" src="miscellaneous.js"></script>
    
        <!-- Validate user -->
    <div id="validation"></div>


<script type="text/javascript" src=validation.js></script>  
        
    </v-container>
</body>
</html>