<!DOCTYPE html>
<html>
<head>
    
    <title>Historial</title>
    
    <!-- VueJs -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
    
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
           <a href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/profile.aspx"> <v-list-tile-action>
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
      <v-toolbar-title>Historial</v-toolbar-title>
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
                label="Search"
                single-line
                hide-details
              ></v-text-field>
        </v-card-title>
            
            <v-data-table :headers="headers" :items="reports" :search="search" :pagination.sync="pagination" item-key="name" class="elevation-1">
              <template slot="items" slot-scope="props">
               <tr @click="props.expanded = !props.expanded"> 
                  <td>{{ props.item.name }}</td>
                  <td class="text-xs-center">{{ props.item.month }}</td>
                  <td class="text-xs-center">{{ props.item.day }}</td>
                  <td class="text-xs-center">{{ props.item.year }}</td>
                  <td class="text-xs-center">{{ props.item.pueblo }}</td>
                  <td class="text-xs-center">{{ props.item.chain }}</td>
                  <td class="text-xs-center">{{ props.item.approve }}</td>
                  
                </tr>
              </template>
                
            <template v-slot:expand="props">
              <v-card flat>
               <v-card-text>  <a id="r-link" href="https://aguadillana.sharepoint.com/sites/DDMS/perfil/SitePages/review.aspx" > Ver reporte </a></v-card-text> 
              </v-card>
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
      el: '#app',
        expand: false,
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
              text: 'Supermercado',
              align: 'left',
              sortable: false,
              value: 'name',
              width: '25%'
            },
            { text: 'Mes', value: 'month', width: '15%' },
            { text: 'Dia', value: 'day', width: '15%' },
            { text: 'Año', value: 'year', width: '15%' },
            { text: 'Pueblo', value: 'pueblo', width: '16%' },
            { text: 'Cadena', value: 'chain', width: '16%' },
            { text: 'Aprobado', value: 'approve', width: '16%' }
          ],
          reports: [
            {
              value: false,
              name: 'Supermercado Colegio',
              month: 'Feb',
              day: 28,
              year: 2019,
              pueblo: 'Mayaguez',
              chain: 'UPR',
              approve: false,
              link: "testbench.html"
            
            },
            {
              value: false,
              name: 'Supermercado IUPI',
              month: 'Abril',
              day: 28,
              year: 2018,
              pueblo: 'Rio Piedras',
              chain: 'UPR',
              approve: true,
              link: "link 3"
            },
                        {
              value: false,
              name: 'Supermercado Inter',
              month: 'Feb',
              day: 29,
              year: 2019,
              pueblo: 'Aguadilla',
              chain: 'Inter',
              approve: true,
              link: "link 2"
            },
            
            
          ]
        }
      }
    })
  </script>

</body>
</html>