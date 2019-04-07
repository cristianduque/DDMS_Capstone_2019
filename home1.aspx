
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.18"></script>
  <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
  <script src="https://unpkg.com/vue-chartjs/dist/vue-chartjs.min.js"></script>

  <script type="text/javascript" src="https://cdn.rawgit.com/highcharts/highcharts-vue/1ce7e656/dist/script-tag/highcharts-vue.min.js"></script>
  <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-google-maps/0.1.21/vue-google-maps.js"></script>-->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <!--Vuetify-->
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  </head>
  <body>
    <div id="app">
        <v-app>
          <img alt="La Aguadillana logo" src="https://aguadillana.sharepoint.com/sites/DDMS/Shared%20Documents/DDMSLogo.png">
          <v-toolbar>
             <v-spacer></v-spacer>
             <v-toolbar-items>
          <v-btn flat to= '/Planning' >Planning</v-btn>
          <v-btn flat to= '/ManageLists' >Manage List</v-btn>
          <v-btn flat to= '/Approvals' >Approval</v-btn>
          <v-btn flat to = '/Report' >Report</v-btn>
          <v-btn flat href = 'https://aguadillana.sharepoint.com/sites/DDMS/SitePages/Forms/ByAuthor.aspx'>Settings</v-btn>
        </v-toolbar-items>
        <v-spacer></v-spacer>
   </v-toolbar>
   <transition name="fade">
     <router-view></router-view>
   </transition>
</v-app>
    </div>
    <!--Vuetify-->
     <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>

    <script type="text/javascript">
     Vue.use(Vuetify);
     Vue.use(VueRouter);
     var Charts = Vue.component('line-chart', {
       extends: VueChartJs.Line,
       props: ['data', 'labels'],
       mounted () {
    this.renderChart({
      labels: this.labels,
      datasets: [
        {
          lineTension: 0,
          label: 'Data One',
          backgroundColor: '#f87979',
          borderColor: '#f87979',
          fill: false,
          data: this.data
        }
      ]
    }, {responsive: true, maintainAspectRatio: false, pieceLabel: {
           render: 'value',
           precision: 1
         },
         showAllTooltips: true})
  }

     });
     var Charts = Vue.component('bar-chart', {
       extends: VueChartJs.Bar,
        props: ['data', 'labels'],
       mounted () {
    this.renderChart({
      labels: this.labels,
      datasets: [
        {
          label: 'Data One',
          backgroundColor: '#f87979',
          data: this.data
        }
      ]
    },{responsive: true, maintainAspectRatio: false, pieceLabel: {
           render: 'value',
           precision: 1
         },
         showAllTooltips: true})
  }

     });
     var Charts = Vue.component('pie-chart', {
       extends: VueChartJs.Pie,
       props: ['data', 'labels'],
       mounted () {
    this.renderChart({
     labels: this.labels,
     datasets: [
       {
         backgroundColor: [
           '#41B883',
           '#E46651',
           '#00D8FF',
           '#DD1B16',
           'darkgreen',
           'darkred',
           'darkblue'
         ],
         data: this.data
       }
     ]
   }, {responsive: true, maintainAspectRatio: false, pieceLabel: {
           render: 'value',
           precision: 1
         },
         showAllTooltips: true})
 }

     });
      var Home = Vue.component('Home', {
        data: function (){
          return{
            count:0
          }
        },
        //template: '<button v-on:click="count++"> You clicked me {{count}} times in Approvals. </button>'
      });
      var Approvals = Vue.component('Approvals', {
        data: function (){
          return{
            count:0
          }
        },
        template: '<h1>Approvals</h1><!--<button v-on:click="count++"> You clicked me {{count}} times in Approvals. </button>-->'
      });
    var Planning =  Vue.component('Planning', {
        data: function (){
          return{
      today: '2019-01-08',
      events: [
        {
          title: 'Vacation',
          details: 'Going to the beach!',
          date: '2018-12-30',
          open: false
        },
        {
          title: 'Vacation',
          details: 'Going to the beach!',
          date: '2018-12-31',
          open: false
        },
        {
          title: 'Vacation',
          details: 'Going to the beach!',
          date: '2019-01-01',
          open: false
        },
        {
          title: 'Meeting',
          details: 'Spending time on how we do not have enough time',
          date: '2019-01-07',
          open: false
        },
        {
          title: '30th Birthday',
          details: 'Celebrate responsibly',
          date: '2019-01-03',
          open: false
        },
        {
          title: 'New Year',
          details: 'Eat chocolate until you pass out',
          date: '2019-01-01',
          open: false
        },
        {
          title: 'Conference',
          details: 'Mute myself the whole time and wonder why I am on this call',
          date: '2019-01-21',
          open: false
        },
        {
          title: 'Hackathon',
          details: 'Code like there is no tommorrow',
          date: '2019-02-01',
          open: false
        }
      ]
    }
  },
    computed: {
      // convert the list of events into a map of lists keyed by date
      eventsMap () {
        const map = {}
        this.events.forEach(e => (map[e.date] = map[e.date] || []).push(e))
        return map
      }
    },
    methods: {
      open (event) {
        alert(event.title)
      }
    },    style:`<style lang="stylus" scoped>
.my-event {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  border-radius: 2px;
  background-color: #1867c0;
  color: #ffffff;
  border: 1px solid #1867c0;
  width: 100%;
  font-size: 12px;
  padding: 3px;
  cursor: pointer;
  margin-bottom: 1px;
}
</style>`,
        template: `
        <v-layout wrap>
      <v-flex
        sm12
        lg3
        class="pa-3 mb-3 feature-pane"
      >
        <v-btn
          fab
          outline
          small
          absolute
          left
          color="primary"
          @click="$refs.calendar.prev()"
        >
          <v-icon dark>
            keyboard_arrow_left
          </v-icon>
        </v-btn>
        <v-btn
          fab
          outline
          small
          absolute
          right
          color="primary"
          @click="$refs.calendar.next()"
        >
          <v-icon
            dark
          >
            keyboard_arrow_right
          </v-icon>
        </v-btn>
        <br><br><br>
        <v-select
          v-model="type"
          :items="typeOptions"
          label="Type"
        ></v-select>
        <v-checkbox
          v-model="dark"
          label="Dark"
        ></v-checkbox>
        <v-select
          v-model="color"
          :items="colorOptions"
          label="Color"
        ></v-select>
        <v-menu
          ref="startMenu"
          v-model="startMenu"
          :close-on-content-click="false"
          :nudge-right="40"
          :return-value.sync="start"
          transition="scale-transition"
          min-width="290px"
          lazy
          offset-y
          full-width
        >
          <template v-slot:activator="{ on }">
            <v-text-field
              v-model="start"
              label="Start Date"
              prepend-icon="event"
              readonly
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="start"
            no-title
            scrollable
          >
            <v-spacer></v-spacer>
            <v-btn
              flat
              color="primary"
              @click="startMenu = false"
            >
              Cancel
            </v-btn>
            <v-btn
              flat
              color="primary"
              @click="$refs.startMenu.save(start)"
            >
              OK
            </v-btn>
          </v-date-picker>
        </v-menu>
        <v-menu
          v-if="hasEnd"
          ref="endMenu"
          v-model="endMenu"
          :close-on-content-click="false"
          :nudge-right="40"
          :return-value.sync="end"
          transition="scale-transition"
          min-width="290px"
          lazy
          offset-y
          full-width
        >
          <template v-slot:activator="{ on }">
            <v-text-field
              v-model="end"
              label="End Date"
              prepend-icon="event"
              readonly
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="end"
            no-title
            scrollable
          >
            <v-spacer></v-spacer>
            <v-btn
              flat
              color="primary"
              @click="endMenu = false"
            >
              Cancel
            </v-btn>
            <v-btn
              flat
              color="primary"
              @click="$refs.endMenu.save(end)"
            >
              OK
            </v-btn>
          </v-date-picker>
        </v-menu>
        <v-menu
          ref="nowMenu"
          v-model="nowMenu"
          :close-on-content-click="false"
          :nudge-right="40"
          :return-value.sync="now"
          transition="scale-transition"
          min-width="290px"
          lazy
          offset-y
          full-width
        >
          <template v-slot:activator="{ on }">
            <v-text-field
              v-model="now"
              label="Today"
              prepend-icon="event"
              readonly
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="now"
            no-title
            scrollable
          >
            <v-spacer></v-spacer>
            <v-btn
              flat
              color="primary"
              @click="nowMenu = false"
            >
              Cancel
            </v-btn>
            <v-btn
              flat
              color="primary"
              @click="$refs.nowMenu.save(now)"
            >
              OK
            </v-btn>
          </v-date-picker>
        </v-menu>
        <v-select
          v-model="weekdays"
          :items="weekdaysOptions"
          label="Weekdays"
        ></v-select>
        <v-text-field
          v-if="type === 'custom-weekly'"
          v-model="minWeeks"
          label="Minimum Weeks"
          type="number"
        ></v-text-field>
        <v-select
          v-if="hasIntervals"
          v-model="intervals"
          :items="intervalsOptions"
          label="Intervals"
        ></v-select>
        <v-select
          v-if="type === 'custom-daily'"
          v-model="maxDays"
          :items="maxDaysOptions"
          label="# of Days"
        ></v-select>
        <v-select
          v-if="hasIntervals"
          v-model="styleInterval"
          :items="styleIntervalOptions"
          label="Styling"
        ></v-select>
      </v-flex>
      <v-flex
        sm12
        lg9
        class="pl-3"
      >
        <v-sheet height="500">
          <v-calendar
            ref="calendar"
            v-model="start"
            :type="type"
            :start="start"
            :end="end"
            :min-weeks="minWeeks"
            :max-days="maxDays"
            :now="now"
            :dark="dark"
            :weekdays="weekdays"
            :first-interval="intervals.first"
            :interval-minutes="intervals.minutes"
            :interval-count="intervals.count"
            :interval-height="intervals.height"
            :interval-style="intervalStyle"
            :show-interval-label="showIntervalLabel"
            :color="color"
          >
            <template v-slot:day="day">
              <div
                v-if="day.day % 3 === 0"
                class="day"
              >
                day slot {{ day.date }}
              </div>
            </template>
            <template v-slot:header="day">
              <div
                v-if="day.weekday % 2"
                class="day-header"
              >
                day-header slot {{ day.date }}
              </div>
            </template>
            <template v-slot:day-body="day">
              <div
                v-if="day.weekday % 3 === 2"
                class="day-body"
              >
                day-body slot {{ day.date }}
              </div>
            </template>
          </v-calendar>
        </v-sheet>
      </v-flex>
    </v-layout> `
      });
      var ManageLists =  Vue.component('ManageLists', {
          data: function (){
            return{
              count:0
            }
          },
        template: '<button v-on:click="count++"> You clicked me {{count}} times in Manage List. </button>'
        });
        var Report =  Vue.component('Report', {
            data: function (){
              return{
                forms: [],
                ventas: [],
                ventasPorMes:[0,0,0,0,0,0,0,0,0,0,0,0],
                demoPorMes:[0,0,0,0,0,0,0,0,0,0,0,0],
                tiendas: [],
                mes:['January','February','March','April','May','June','July','August','September','October','November','December'],
                headers: [
                    {
                      text: 'Key',
                      align: 'left',
                      value: 'Title'
                    },
                    { text: 'Tienda', align: 'left',value: 'Tienda' },
                    { text: 'Pueblo', align: 'left',value: 'Pueblo' },
                    { text: 'Precio PrecioEspecial', align: 'left',value: 'PrecioEspecial' },
                    { text: 'Unidades Vendidas', align: 'left',value: 'UnidadesVendidas' }
                  ],
                  tab: null,
      items: [
        'web', 'shopping', 'videos'
      ]
              }
            },
            template: ` <div>
            <template>
       <v-tabs
         v-model="tab"
         color="cyan"
         grow
       >
         <v-tabs-slider color="yellow"></v-tabs-slider>

         <v-tab
           v-for="item in items"
           :key="item"
         >
           {{ item }}
         </v-tab>
       </v-tabs>
     </template>

     <v-tabs-items v-model="tab">

      <v-tab-item>
        <v-card flat>
          <v-card-text>
          <line-chart :labels="mes" :data="ventasPorMes"></line-chart>
            <line-chart :labels="mes" :data="demoPorMes"></line-chart>
          <bar-chart :labels="tiendas" :data="ventas"></bar-chart>
           <v-data-table
             :headers="headers"
             :items="forms"
             class="elevation-l"
             prev-icon="mdi-menu-left"
             next-icon="mdi-menu-right"
             sort-icon="mdi-menu-down"
             >

             <template v-slot:items="props">
               <td>{{props.item.Title}}</td>
               <td class="text-xs-right">{{props.item.Tienda}}</td>
                <td class="text-xs-right">{{props.item.Pueblo}}</td>
                <td class="text-xs-right">{{props.item.PrecioEspecial}}</td>
                <td class="text-xs-right">{{props.item.UnidadesVendidas}}</td>
              </template>
           </v-data-table>

           </v-card-text>

           </v-card>
           </v-tab-item>

           <v-tab-item>
             <v-card flat>
               <v-card-text>
               <bar-chart :labels="tiendas" :data="ventas"></bar-chart>
                <v-data-table
                  :headers="headers"
                  :items="forms"
                  class="elevation-l"
                  prev-icon="mdi-menu-left"
                  next-icon="mdi-menu-right"
                  sort-icon="mdi-menu-down"
                  >

                  <template v-slot:items="props">
                    <td>{{props.item.Title}}</td>
                    <td class="text-xs-right">{{props.item.Tienda}}</td>
                     <td class="text-xs-right">{{props.item.Pueblo}}</td>
                     <td class="text-xs-right">{{props.item.PrecioEspecial}}</td>
                     <td class="text-xs-right">{{props.item.UnidadesVendidas}}</td>
                   </template>
                </v-data-table>

                </v-card-text>

                </v-card>
                </v-tab-item>

                <v-tab-item>
                  <v-card flat>
                    <v-card-text>
                    <pie-chart v-bind:labels="['four', 'five', 'six']"v-bind:data="[8,9,10]"></pie-chart>
                     <v-data-table
                       :headers="headers"
                       :items="forms"
                       class="elevation-l"
                       prev-icon="mdi-menu-left"
                       next-icon="mdi-menu-right"
                       sort-icon="mdi-menu-down"
                       >

                       <template v-slot:items="props">
                         <td>{{props.item.Title}}</td>
                         <td class="text-xs-right">{{props.item.Tienda}}</td>
                          <td class="text-xs-right">{{props.item.Pueblo}}</td>
                          <td class="text-xs-right">{{props.item.PrecioEspecial}}</td>
                          <td class="text-xs-right">{{props.item.UnidadesVendidas}}</td>
                        </template>
                     </v-data-table>

                     </v-card-text>

                     </v-card>
                     </v-tab-item>
    </v-tabs-items>
           </div>
           `,
           created: function(){
                 //this.getListFields();
                 this.getListData();
                 //console.log(this.forms);
             },
           methods:{
             getListData: function(){
              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items";
              console.log(endPointUrl);
             var headers = {
                 "accept": "application/json;odata=verbose",
                  "content-type": "application/json;odata=verbose"
             };
                 this.status = "getting data...";
                 var vm = this;
                 var sales=0;
                 var i=0;
                 var fecha;
                 var m;
                 //var demo=0;

                 axios.get(endPointUrl).then(response => {
                    console.log(response.data.value);
                    vm.forms = response.data.value
                    for(i; i< vm.forms.length; i++){
                      fecha = new Date(vm.forms[i].Fecha);
                      vm.tiendas.push(vm.forms[i].Tienda);
                      vm.ventasPorMes[fecha.getMonth()] += vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      vm.demoPorMes[fecha.getMonth()]++;
                      console.log(vm.ventasPorMes);
                      console.log(vm.tiendas);
                      sales = vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      console.log(sales);
                      vm.ventas.push(sales);
                    }

                  });
             }
           }
          });
      const routes = [
      //{ path: '/', component: Home},
         { path: '/Approvals', component: Approvals, name:'Home',icon:'home'},
         { path: '/Planning', component: Planning , name:'Planning',icon:'home'},
         { path: '/Report', component: Report, name:'Report',icon:'dashboard'},
         { path: '/ManageLists', component: ManageLists, name:'Manage List' ,icon:'home'}

      ];
      const router = new VueRouter({
            routes // short for `routes: routes`
         });
  var vueApp = new Vue({
  el: "#app",
  router,
  data: {
    message: "Data Demonstration Management System",
    users: [],
    Title:"",
    routes,
    chartData: [
        ['Year', 'Sales', 'Expenses', 'Profit'],
        ['2014', 1000, 400, 200],
        ['2015', 1170, 460, 250],
        ['2016', 660, 1120, 300],
        ['2017', 1030, 540, 350]
      ],
      chartOptions: {
        chart: {
          title: 'Company Performance',
          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        }
      }
  },
  methods: {
       getListFields: function(){
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/fields";
        console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
       };
           this.status = "getting data...";
           var vm = this;
           axios.get(endPointUrl).then(response => {
              console.log(response.data.value);
              vm.headers = response.data.value
            });

       },
       postListData: function(){
         $.ajax({
       url: "https://aguadillana.sharepoint.com/DDMS/_api/web/lists/getbyTitle('Test')/items",
       type: "POST",
       headers: {
           "accept": "application/json;odata=verbose",
           "X-RequestDigest": $("#__REQUESTDIGEST").val(),
           "content-Type": "application/json;odata=verbose"
       },
       data: JSON.stringify(data.Title),
       success: function (data) {
           console.log(data);
       },
       error: function (error) {
           alert(JSON.stringify(error));
       }
   });
   }

}

});

    </script>
  </body>
</html>
