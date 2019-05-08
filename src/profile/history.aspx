<!DOCTYPE html>
<html>
<head>
    
    <title>Historial</title>
    
    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
    <!-- Axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    <!-- Alerts -->
    <script src="https://unpkg.com/vue-swal"></script>
    
    <!-- Vuetify -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    
     <!-- Page settings -->
    <meta name="viewport" content="initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    
    <!-- Link to profile CSS -->
<!--    <link rel="stylesheet" type="text/css" href="history.css">-->
    <style>
     /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        padding: 0;
      }

    #r-link{
    color: indianred;
}
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

   #menu{
   
    height: 3%;
}
        
   .v-table__overflow {
    width: 250%;
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
                              <a style="text-decoration:none; background-color: transparent; color:transparent;"  href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/profile.aspx"><v-list-tile-action>
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
                          <v-toolbar-title style="color:white">Historial</v-toolbar-title>
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
    
<!-- Data Table -->    
 <div id="app">
    <v-app>
      <v-content>
         
        <v-container>
          <template>
              <v-card-title>
              Reportes
              <v-spacer></v-spacer>
              <v-text-field
                v-model="search"
                append-icon="search"
                label="Búsqueda"
                single-line
                hide-details
              ></v-text-field>
        </v-card-title>
              <div>
             <div id="table" style="width: 100%;
                                    overflow-x: scroll;">
            <v-data-table v-if="load"
                          :headers="headers" 
                          :items="reports" 
                          :search="search" 
                          :pagination.sync="pagination"
                          item-key="name" 
                          hide-actions
                         
                          >
              <template slot="items" slot-scope="props">
               <tr @click= "linkfn( props.item.link )"> 
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.month }}</td>
                  <td class="text-xs-center">{{ props.item.day }}</td>
                  <td class="text-xs-center">{{ props.item.year }}</td>
                  <td class="text-xs-center">{{ props.item.pueblo }}</td>
                  <td class="text-xs-center">{{ props.item.chain }}</td>
                  <td style="color:#ff6f6f;" v-html="props.item.status" v-if="props.item.status == 'Denegado' " ></td>
                  <td style="color:#2095c0;" v-html="props.item.status" v-else-if="props.item.status == 'Editable' " ></td>
                  <td style="color:#7fbf7f;" v-html="props.item.status" v-else-if="props.item.status == 'Aprobado' " ></td>
                  <td v-html="props.item.status" v-else></td>
                </tr>
              </template>
                
            <template v-slot:expand="props">
              <v-card flat>
               <v-card-text>  <a id="r-link" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/review.aspx" > Ver reporte </a></v-card-text> 
              </v-card>
           </template>
            <!-- Detects if there isn't any data and display accordingly -->
             <template v-slot:no-data>
                    <v-alert :value="true" color="error" icon="warning">Disculpa, no hay datos al momento.</v-alert>
            </template>
                
            <!-- Alert if nothing found -->
            <template v-slot:no-results >
                <v-alert :value="true" color="error" icon="warning">
                Su busqueda "{{ search }}" no obtuvo resultados.
                </v-alert>
            </template>
            </v-data-table>
            </div>
            <div class="text-xs-center pt-2">
                <v-pagination v-if="load" v-model="pagination.page" :length="pages"></v-pagination>
            </div>
                  </div>
          </template>
        </v-container>
          
      </v-content>
    </v-app>
  </div>
    
        <!-- Validate user -->
    <div id="validation"></div>


<script type="text/javascript" src=validation.js></script>   
    
 <script type="text/javascript" src=table_history.js></script>

</body>
</html>