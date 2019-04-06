<!DOCTYPE html>
<html>
<head>
    
    <title>Perfil</title>
    

    
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
    <style>
        /* use # for id and . for class*/

/* Optional: Makes the sample page fill the window. */
html, body {
        height: 100%;
        padding: 0;
        background-color: #fafafa;
      } 

/* Avoid links to change color and etc. */
a:link {
  color: black;
  background-color: transparent;
  text-decoration: none;
}
a:visited {
  color: black;
  background-color: transparent;
  text-decoration: none;
}
a:hover {
  color: black;
  background-color: transparent;
  text-decoration: none;
}
a:active {
  color: black;
  background-color: transparent;
  text-decoration: none;
}

/* Adjust Menu vertical height problem */
#menu{
   
    height: 10%;
}

#btn1{
    height: 5%;
}

#btn2{
    height: 5%;
}

#list{
    padding: 3%;
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
#demos{
    
    padding: 3%;
    height: 0;
    margin-bottom: 10%;
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

/* Edit button to toogle Profile Summary Chart*/
#toogle{
        height:25px;
        width: 100px;
        margin-left: 25%;
        background-color: white;
        color:black;
        border-radius: 12px;
    
      }      

    </style>
    


</head>
    
<body>

<v-container grid-list-xs text-xs-center>
    <!--  Toolbar -->
     <v-layout row wrap>
        <v-flex xs12>
            <div id="menu">
                      <v-app id="inspire">
                        <v-navigation-drawer
                          v-model="drawer"
                          fixed
                          app
                        >
                          <v-list dense>
                            <v-list-tile @click="">
                              <a href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/profile.aspx"><v-list-tile-action>
                                <v-icon>home</v-icon>
                              </v-list-tile-action></a>
                              <v-list-tile-content>
                                <v-list-tile-title>Perfil</v-list-tile-title>
                              </v-list-tile-content>
                            </v-list-tile>
                            <v-list-tile @click="">

                             <a href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/history.aspx"> <v-list-tile-action>
                                <v-icon>list</v-icon>
                              </v-list-tile-action> </a>
                              <v-list-tile-content>
                                  <v-list-tile-title>Historial</v-list-tile-title>
                              </v-list-tile-content>
                            </v-list-tile>
                          </v-list>
                        </v-navigation-drawer>
                        <v-toolbar color="red" dark fixed app>
                          <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
                          <v-toolbar-title>Profile</v-toolbar-title>
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
        </v-flex>
    </v-layout> 
   <!--     Alert of upcoming demo -->
   <!--
    <h2 id="AH!" >Alertas</h2>
    <div id="alerts">
    <ul>
        <li v-for="alert in alerts">
          {{ alert.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=alerts.js></script>
-->

    <!-- Column Chart -->
    <v-layout row wrap >
       <v-flex xs12 shrink pa-1>
           <div class="chart_container">
                <div id="chart_div"></div>  
           </div>
           
<!--            <h3>Click on Chart to change view</h3>-->
       </v-flex>
    </v-layout>
    
    <!-- Buttons   -->
    
       <v-layout row>
           
        <v-flex xs3 >
           <div id="btn1">
              <v-app id="inspire">
                <div class="text-xs-center">
                  <v-btn>
                   Touch Me
                  </v-btn>
                </div>
              </v-app>       
            </div>  
          </v-flex>
          
        
        <v-flex xs3 >
           <div id="btn2">
              <v-app id="inspire">
                <div class="text-xs-center">
                  <v-btn>
                   Ouch!
                  </v-btn>
                </div>
              </v-app>       
            </div>  
           </v-flex>
           
           
    </v-layout> 
    
     <script>
        new Vue({
            el: '#btn1',
        })
    </script>
    
    <script>
        new Vue({
            el: '#btn2',
        })
     </script>
        
    
    <!-- Table -->
    <v-layout row wrap>
        <v-flex xs-12>
            <div id="table">
                <v-app>
                  <v-content>
                    <v-container>
                      <template>
                          <v-card-title>
                          Reportes
                          <v-spacer></v-spacer>

                    </v-card-title>

                        <v-data-table :headers="headers" :items="reports"  :hide-actions="true"  item-key="name" class="elevation-1">
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
        </v-flex>    
    </v-layout>
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
             {
              value: false,
              title: 'Reporte 3',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
             {
              value: false,
              title: 'Reporte 4',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 5',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 6',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 7',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 8',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 9',
              sale1: 23,
              sale2: 25,
              ince1: 1,
              ince2: 4,
              total: 45,
            },
            {
              value: false,
              title: 'Reporte 10',
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
    <h2> Gastos Pasados:</h2>
    <!--
       <div id="misc">
    <ul>
        <li v-for="cost in costs">
          {{ cost.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=misc.js></script>
-->
    
    <!-- Gastos -->
    <v-layout row wrap >
        <v-flex xs-12 >
            <div id="list">
                <div id="app">
  <v-app id="inspire">
    <v-layout row>
      <v-flex xs12 sm6 offset-sm3>
        <v-card>
  
          <v-list two-line>
            <template v-for="(item, index) in items">
              <v-list-tile
                :key="item.title"
                avatar
                ripple
                @click="toggle(index)"
              >
                <v-list-tile-content>
                    <v-list-tile-title v-html="item.title"></v-list-tile-title>
                <v-list-tile-sub-title v-html="item.subtitle"></v-list-tile-sub-title>
<!--
                  <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                  <v-list-tile-sub-title class="text--primary">{{ item.headline }}</v-list-tile-sub-title>
                  <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
-->
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
    </v-layout>
    <script>
    new Vue({
  el: '#list',
  data () {
    return {
      selected: [2],
      items: [
        {
          headline: 'Supermercado Pueblos',
          title: 'Feb/24/2019',
          subtitle: "<span class='text--primary'>Supermercados Pueblos - Mayaguez</span> &mdash; $5.47"
        },
        {
          headline:'Supermercado Ajies' ,
          title: 'Feb/28/2019',
          subtitle: "<span class='text--primary'>Supermercado Ajies - Aguada</span> &mdash; $5.47"
        },
        {
          headline: 'Supermercado Selectos',
          title: 'Abril/1/2019',
          subtitle: "<span class='text--primary'>Supermercado Selectos - Mayaguez</span> &mdash; $6.00"
        },
        {
          headline: 'Supermercado Selectos II',
          title: 'Abril/2/2019',
          subtitle: "<span class='text--primary'>Supermercado Selectos II - Mayaguez</span> &mdash; $10.47"
        },
          {
          headline: 'Supermercado Pueblos',
          title: 'Feb/24/2019',
          subtitle: "<span class='text--primary'>Supermercados Pueblos - Mayaguez</span> &mdash; $5.47"
        },
        {
          headline:'Supermercado Ajies' ,
          title: 'Feb/28/2019',
          subtitle: "<span class='text--primary'>Supermercado Ajies - Aguada</span> &mdash; $5.47"
        },
        {
          headline: 'Supermercado Selectos',
          title: 'Abril/1/2019',
          subtitle: "<span class='text--primary'>Supermercado Selectos - Mayaguez</span> &mdash; $6.00"
        },
        {
          headline: 'Supermercado Selectos II',
          title: 'Abril/2/2019',
          subtitle: "<span class='text--primary'>Supermercado Selectos II - Mayaguez</span> &mdash; $10.47"
        },
          {
          headline: 'Supermercado Pueblos',
          title: 'Feb/24/2019',
          subtitle: "<span class='text--primary'>Supermercados Pueblos - Mayaguez</span> &mdash; $5.47"
        },
        {
          headline:'Supermercado Ajies' ,
          title: 'Feb/28/2019',
          subtitle: "<span class='text--primary'>Supermercado Ajies - Aguada</span> &mdash; $5.47"
        },
      
      ]
    }
  },

  methods: {
    toggle (index) {
      const i = this.selected.indexOf(index)

      if (i > -1) {
        this.selected.splice(i, 1)
      } else {
        this.selected.push(index)
      }
    }
  }
})
    </script>

    
    <h2>Proximas demonstraciones:</h2>
    <!-- Google Map -->
    <v-layout row wrap>
        <v-flex xs-12>
            <div class ="map_container">
                <div id="map"></div>
            </div>    
         </v-flex>
    </v-layout>
<!--     Script order matters  -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg71kA9ufXlx4ZdpQEvlii-nrKoDx-jlM&callback=initMap"
    async defer></script> 
    
<!--
    <div id="demos">
    <ul>
        <li v-for="demo in demos">
          {{ demo.text }}
        </li>
    </ul>
    </div>
    <script type="text/javascript" src=demos.js></script>
-->
    
    <!-- Upcoming Demos   -->
    <v-layout row wrap>
        <v-flex xs-12>
         <div id="demos">
             <div id="app">
      <v-app id="inspire">
        <v-layout row>
          <v-flex xs12 sm6 offset-sm3>
            <v-card>

              <v-list two-line>
                <template v-for="(item, index) in items">
                  <v-list-tile
                    :key="item.title"
                    avatar
                    ripple
                    @click="toggle(index)"
                  >
                    <v-list-tile-content>

                      <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                      <v-list-tile-sub-title class="text--primary">{{ item.headline }}</v-list-tile-sub-title>
                      <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
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
         <script>
       var demos = new Vue({
      el: '#demos',
      data () {
        return {
          selected: [2],
          items: [
            {
              headline: 'Supermercado Pueblos',
              title: 'Feb/24/2019',
              subtitle: ""
            },
            {
              headline:'Supermercado Ajies' ,
              title: 'Feb/28/2019',
              subtitle: ""
            },
            {
              headline: 'Supermercado Selectos',
              title: 'Abril/1/2019',
              subtitle: ""
            },
            {
              headline: 'Supermercado Selectos II',
              title: 'Abril/2/2019',
              subtitle: ""
            },
          ]
        }
      },

      methods: {
        toggle (index) {
          const i = this.selected.indexOf(index)

          if (i > -1) {
            this.selected.splice(i, 1)
          } else {
            this.selected.push(index)
          }
        }
      }
    })

        </script>
        </v-flex>
    </v-layout>

    
          
    </v-container>  
    
</body>
    
</html>