<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>

    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
    <!-- Axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
    
    <!-- Vuetify -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    
    <!-- Alerts -->
    <script src="https://unpkg.com/vue-swal"></script>
    
    <!-- Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <!-- Scripts -->
    <script type="text/javascript" src="chart.js"></script>
    <script type="text/javascript" src="map.js"></script>    

    <!-- Load and draw chart -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    </script>
    
    <!-- Page settings -->
    <meta name="viewport" content="initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    
    <!-- Link to profile CSS -->
<!--    <link rel="stylesheet" type="text/css" href="profile.css">-->

<style scoped>
        /* use # for id and . for class*/

/* Optional: Makes the sample page fill the window. */
html, body {
        height: 100%;
        padding: 0;
        background-color: #fafafa;
      }

/* Adjust Menu vertical height problem */
#menu{

    height: 10%;
}

#btn1{
    height: 5%;
    margin-top: 1rem;
    margin-bottom: 2rem;
}

#data_table{
    
    min-height: 10%!important;
    margin-top: 3%;
    margin-left: 3%;
    margin-right: 3%;
    margin-bottom: auto;
    overflow: auto;
    
    }
    
#table{
    overflow-x: scroll;
    min-height: inherit;
    
          }

#list{
    padding: 3%;
    margin-bottom: 2rem;
}

#map {
        width:auto;
        height:500px;
        margin-left: 3%;
        margin-right: 3%;
        margin-bottom: 2rem;
        border-radius: 15px;
      }
          
#demos{

    padding: 3%;
    height: 0;
    margin-bottom: 10%;
    border-style: solid;
    border: red;
}

.results{
    margin: auto;
/*
    margin-left: 40%;
    margin-right: auto;
*/

}

.wrapper{
    text-align: center;
}

#toogle{
        height:25px;
        width: 100px;
        margin-left: 25%;
        background-color: white;
        color:black;
        border-radius: 12px;

      }

#button{
/*
              border-style: dotted;  
              border-color: red;
*/
              height: 4rem;
          }
    
.application--wrap {
    flex: 1 1 auto;
    backface-visibility: hidden;
    display: flex;
    flex-direction: column;
    min-height: 10vh; 
    height: auto;
    max-width: 100%;
    position: relative;
  /*margin-bottom: 2rem;*/
}

.theme--light.v-table tbody tr:hover:not(.v-datatable__expand-row) {
    background: transparent;
}
    
.v-table__overflow {
    width: 215%;
    overflow-x: hidden;
    overflow-y: hidden;
}
    
::-webkit-scrollbar {
   -webkit-appearance: none;
}

::-webkit-scrollbar:vertical {
   width: 10px;
}

::-webkit-scrollbar:horizontal {
   height: 10px;
}

::-webkit-scrollbar-thumb {
   background-color: #ccc;
   border-radius: 10px;
   border: 2px solid #eee;
}

::-webkit-scrollbar-track { 
   background-color: #eee; 
}
    
.layout.row {
    margin-bottom: 1rem;
}

</style>

</head> 
<body>
    
    <!-- Toolbar -->
    <div id="menu">
         <v-app id="inspire">
                 <v-navigation-drawer
                          v-model="drawer"
                          fixed
                          app
                        >
                          <v-list dense>
                            <v-list-tile @click="">
                              <a style="text-decoration:none; background-color: transparent; color:transparent;" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/profile.aspx"><v-list-tile-action>
                                <v-icon>home</v-icon>
                              </v-list-tile-action></a>
                              <v-list-tile-content>
                                  <v-list-tile-title><a style="text-decoration:none; background-color: transparent; color:#757575;" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/profile.aspx">Perfil</a></v-list-tile-title>
                              </v-list-tile-content>
                            </v-list-tile>
                            <v-list-tile @click="">

                             <a style="text-decoration:none; background-color: transparent; color:transparent;" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/history.aspx"> <v-list-tile-action>
                                <v-icon>list</v-icon>
                              </v-list-tile-action> </a>
                              <v-list-tile-content>
                                  <v-list-tile-title><a style="text-decoration:none; background-color: transparent; color:#757575;" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/history.aspx">Historial</a></v-list-tile-title>
                              </v-list-tile-content>
                            </v-list-tile>
                          </v-list>
                        </v-navigation-drawer>
                        <v-toolbar color="#2095c0" fixed app>
                          <v-toolbar-side-icon style="color:white" @click.stop="drawer = !drawer"></v-toolbar-side-icon>
                          <v-toolbar-title style="color:white" >Perfil</v-toolbar-title>
                             <v-spacer></v-spacer>
                            <v-toolbar-title text-xs-left style="color:white">{{message}}</v-toolbar-title>
                        </v-toolbar>
                        <v-content>
                          <v-container fluid fill-height>
                            <v-layout
                              justify-center
                              align-center
                            >
                              <v-flex text-xs-center>
                              </v-flex>
                            </v-layout>
                          </v-container>
                        </v-content>
                      </v-app>
    </div>

    <div id="app">
      <v-app id="inspire">
        <v-container grid-list-md text-xs-center>
          <v-layout row wrap>
              
              
            <!-- Column Chart -->
            <v-flex xs12>
            <div style="margin: 3%; box-shadow: 3px 1px 10px 1px #888888;">
              <v-card >
                <div class="chart_container">
                  <div id="chart_div"></div>  
                </div>
              </v-card>
            </div>
            </v-flex>
              
            <!-- Button -->
            <v-flex xs3 ms6 >
               <div id="btn1">
                  <v-app id="button">
                    <div class="text-xs-center">
                      <v-btn id="option"  color="#2095c0" style ="position: relative; left: auto; right: 95px; color: white; border-radius: 9px;"> Empanados</v-btn>
                    </div>
                  </v-app>       
                </div>
              </v-flex>
                
            <v-flex xs3 ms6 >
              
                <div id="btn2">
                  <v-app id="button">
                    <div class="text-xs-center">
                      <v-btn id="option"  color="#2095c0" style ="position: relative; top:-84px; left: 95px; right: auto; color: white; border-radius: 9px;"> Embutidos</v-btn>
                    </div>
                  </v-app>       
                </div>
                
            </v-flex>
              
            <!-- Table Header -->
            <div class="flex display-1 font-weight-thin" style="margin-left: 1rem"> Tabla de Reportes:</div>
              
            <!-- Table -->
            <v-flex xs12 >
              <v-card >
                <div id="data_table" style="margin-bottom: 2rem;">
                 <v-app  style="" id="table" style="width: 200%;" >
                    <template>
                     <v-data-table 
                     :headers="headers" :items="reports" 
                     :hide-actions="true"  item-key="name" class="elevation-1"  >
                          <template slot="items" slot-scope="props">
                            <tr >
                              <td>{{ props.item.title }}</td>
                              <td class="text-xs-center">{{ props.item.family }}</td>
                              <td class="text-xs-center">{{ props.item.sale1 }}</td>
                              <td class="text-xs-center">{{ props.item.ince1 }}</td>
                              <td class="text-xs-center">{{ props.item.money }}</td>
                            </tr>
                          </template>

                       
                          <div class="text-xs-center pt-2"></div>
                        <!-- Detects if there isn't any data -->
                        <template v-slot:no-data>
                            <v-alert :value="true" color="error" icon="warning"> Disculpa, no hay datos al momento.</v-alert>
                        </template>
                        </v-data-table>
                      </template>
                 </v-app>
                </div>
              </v-card>
            </v-flex>
              
            <!-- Miscellaneous Costs Header -->
            <div class="flex display-1 font-weight-thin" style="margin-left: 1rem"> Gastos Misceláneos:</div>  
              
            <!-- Gastos -->
            <v-flex xs-12 >
                <div id="list">
                    <v-app id="gastos">
                        <v-card>
                            <v-list two-line>
                            <template v-for="(item, index) in items">
                                  <v-list-tile
                                    :key="item.title"
                                    avatar
                                    ripple
                                    @click="toggle(index),linkfn(item.id)"
                                  >
                                    <v-list-tile-content>
                                        <v-list-tile-title v-html="item.title"></v-list-tile-title>
                                        <v-list-tile-sub-title v-html="item.subtitle"></v-list-tile-sub-title>
                                        <v-list-tile-sub-title style="color:#7fbf7f;"v-html="item.status" v-if="item.status == 'Aprobado' "></v-list-tile-sub-title>
                                        <v-list-tile-sub-title style="color:#2095c0;"v-html="item.status" v-else-if="item.status == 'Editable' "></v-list-tile-sub-title>
                                        <v-list-tile-sub-title style="color:#ff6f6f;"v-html="item.status" v-else-if="item.status == 'Denegado' "></v-list-tile-sub-title>
                                        <v-list-tile-sub-title v-html="item.status" v-else></v-list-tile-sub-title>
                                    </v-list-tile-content>

                                  </v-list-tile>
                                  <v-divider
                                    v-if="index + 1 < items.length"
                                    :key="index"
                                  ></v-divider>
                            </template>
                            </v-list>
                        </v-card>
                  </v-app>
            </div>
        </v-flex>
   
            <!-- Upcoming Header -->
            <div class="flex display-1 font-weight-thin" style="margin-left: 1rem; margin-bottom: 2rem;"> Proximas demostraciones:</div>
              
            <!-- Google Map -->
            <v-flex xs-12>
                    <div id="map"></div>
             </v-flex>
              
            <!-- Upcoming -->
            <v-flex xs-12>
             <div id="demos">
                 <div id="app">
                  <v-app id="up">
                    <v-layout row>
                      <v-flex xs12 sm6 offset-sm3>
                        <v-card>

                          <v-list two-line>
                            <template v-for="(item, index) in items">
                              <v-list-tile
                                :key="item.title"
                                avatar
                                ripple
                                @click= "toggle(index),linkfn(item.id)"
                               
                              >
                                <v-list-tile-content>
                                  <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                                  <v-list-tile-sub-title class="text--primary">{{ item.headline }}</v-list-tile-sub-title>
                                  <v-list-tile-sub-title style="color:#2095c0;">{{ item.subtitle }}</v-list-tile-sub-title>
                                </v-list-tile-content>

                              </v-list-tile>
                                
                              <v-divider
                                v-if="index + 1 < items.length"
                                :key="index"
                              ></v-divider>
                                
                            </template>
                          </v-list>
                            
                        </v-card>
                      </v-flex>
                    </v-layout>
                  </v-app>
                </div>
             </div>
            </v-flex>
              
            <div style="margin-top: 2rem;"></div>
    
          </v-layout>
        </v-container>
      </v-app>
    </div>
    
    
    <!-- Alert of upcoming demo -->
    <div id="alerts"></div>
    

<!--<script type="text/javascript" src=validation.js></script>    -->
<script type="text/javascript" src=alerts.js></script>
<script type="text/javascript" src=table_profile.js></script>
<script type="text/javascript" src=receipts.js></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANn9G0LKcoEKip9nEpH9MtkcO8EvgbbVY&callback=initMap" async defer></script>
<script type="text/javascript" src=upcoming_list.js></script>
<script>
  var vm = new Vue({
      el: '#menu',
      data: () => ({
      drawer: false,
      message: ' '
      }),
      props: {
      source: String
      },
    mounted(){
      
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
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=OData__x0077_v79 eq '"+ user_email+ "'";
            
            //vblv first name
            //cytw second name
            //OData__x0077_v79 email
          var headers = {"async": false,"accept": "application/json;odata=verbose","content-type": "application/json;odata=verbose"};
            
          axios.get(endPointUrl).then(response =>  {
              
              var first  = response.data.value[0].vblv;
              var second = response.data.value[0].cytw;
              
              var name = " "+ first + " " + second;
              this.message = name;
              
          });
        });
    
},
   })
</script>
<script>
new Vue({
  el: '#app',
  el: '#btn1',
  
})
</script>
<script>
new Vue({
  el: '#btn2', 
})
</script>
   
</body>
    
</html>