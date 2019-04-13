
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
  <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
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
       mixins: [VueChartJs.mixins.reactiveProp],
       //props: ['data','options'], //'labels','label'],
       data: function () {
       return {
       options: {
       scales: {
         yAxes: [{
           ticks: {
             beginAtZero: true
           },
           gridLines: {
             display: true
           }
         }],
         xAxes: [{
           ticks: {
             beginAtZero: true
           },
           gridLines: {
             display: false
           }
         }]
       },
       legend: {
         display: true
       },
       responsive: true,
       maintainAspectRatio: false,
       height: 200
       }
       }
       },
       mounted () {
       this.renderChart(this.chartData,this.options);

       }
     });
     var Charts = Vue.component('bar-chart', {
       extends: VueChartJs.Bar,
       //extends: VueChartJs.Mixins,
        mixins: [VueChartJs.mixins.reactiveProp],
        //props: ['data','options'], //'labels','label'],
        data: function () {
		return {
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						},
						gridLines: {
							display: true
						}
					}],
					xAxes: [{
						ticks: {
							beginAtZero: true
						},
						gridLines: {
							display: false
						}
					}]
				},
				legend: {
					display: true
				},
				responsive: true,
				maintainAspectRatio: false,
				height: 200
			}
		}
	},
  mounted () {
    this.renderChart(this.chartData,this.options);

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
    },
        template: ``
      });
      var ManageLists =  Vue.component('ManageLists', {
          data: function (){
            return{
              count:0,
              Product_Number:'',
              Product_Name:'',
              Product_Units:'' ,
              Product_Family:'',
              Product_Cost:0 ,
              Goal: '',
              Emp_FN:'',
              Emp_LN:'',
              Emp_Rt:0,
              Emp_role: '',
              Emp_Route: '',
              Emp_email:''
            }
          },
        template: ` <div><v-form>
              <v-card>
                <v-card-title primary-title>
                  <h4>Producto</h4>
                </v-card-title>
	                <v-card-text>
											<v-text-field label="Product_Number"  type="text" v-model="Product_Number" ></v-text-field>
											<v-text-field label="Product_Name"  type="text" v-model="Product_Name" ></v-text-field>
											<v-text-field label="Product_Units"  type="text" v-model="Product_Units" ></v-text-field>
	                    <v-text-field label="Product_Family" type="text"  v-model="Product_Family"></v-text-field>
	                    <v-text-field label="Product_Cost"  type="number" v-model="Product_Cost"></v-text-field>
	                    <v-text-field label="Goal"  type="text" v-model="Goal" ></v-text-field>
	                </v-card-text>

              </v-card>
              <br>
              <v-card>
                <v-card-title>
                  <h4>Crear Producto</h4>
                </v-card-title>
                <v-card-actions>
										<div class="end_button">
              				<v-btn  type="button" @click="postListDataProduct">Someter</v-btn >
              			</div>
                </v-card-actions>
              </v-card>
            </v-form>

            <v-form>
                  <v-card>
                    <v-card-title primary-title>
                      <h4>Demostradora</h4>
                    </v-card-title>
    	                <v-card-text>
    											<v-text-field label="Name"  type="text" v-model="Emp_FN" ></v-text-field>
    											<v-text-field label="Last name"  type="text" v-model="Emp_LN" ></v-text-field>
    											<v-text-field label="rate"  type="text" v-model="Emp_Rt" ></v-text-field>
    	                    <v-text-field label="route" type="text"  v-model="Emp_Route"></v-text-field>
    	                    <v-text-field label="email"  type="text" v-model="Emp_email"></v-text-field>
    	                    <v-text-field label="role"  type="text" v-model="Emp_role" ></v-text-field>
    	                </v-card-text>
    									<v-spacer></v-spacer>
                  </v-card>
                  <br>
                  <v-card>
                    <v-card-title>
                      <h4>Crear Demostradora</h4>
                    </v-card-title>
                    <v-card-actions>
    										<div class="end_button">
                  				<v-btn  type="button" @click="postListDataEmployee">Someter</v-btn >
                  			</div>
                    </v-card-actions>
                  </v-card>
                </v-form>
                </div>`,
            created: function(){
              this.getRequestDigestValue();
              //this.getListData();
            },
            methods:{
              postListDataProduct: function(){
              $.ajax({
                   async: true,
                   url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items",
                   method: "POST",
                   data: JSON.stringify({
                       '__metadata': {
                           'type': 'SP.Data.ProductListItem' // it defines the ListEntityTypeName
                       },
                       "s2l1": this.Product_Number,
                       "e9lf": this.Product_Name,
                       "a83e": this.Product_Units,
                       "r0hu": this.Product_Family,
                       "qrdu": this.Product_Cost,
                       "se1v": this.Goal
                   }),

                   headers: {
                       "accept": "application/json;odata=verbose",
                       "content-type": "application/json;odata=verbose",
                       "X-RequestDigest": this.RequestDigest
                       //"Cookie": "FedAuth=77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+VjUsMGguZnxtZW1iZXJzaGlwfDEwMDMyMDAwM2NlMjFmNzNAbGl2ZS5jb20sMCMuZnxtZW1iZXJzaGlwfGNhcHN0b25lQGxhYWd1YWRpbGxhbmEuY29tLDEzMTk5MTIzNjkwMDAwMDAwMCwxMzE5NTA2MjUwMzAwMDAwMDAsMTMxOTkyMTAxMDc5MDU1MjkwLDAuMC4wLjAsMixmNDRiNzA4OC0xNTc5LTQ3OWUtYTQ3NS1iZmQyYjQ2MDI0OWEsLCxhZWE4ZDA5ZS00MDc4LTgwMDAtOTk5NS1kODc2MTViMDEyOGYsYWVhOGQwOWUtNDA3OC04MDAwLTk5OTUtZDg3NjE1YjAxMjhmLCwwLDAsMCwsYmJXUStQWDUwekRyWHhBLzdOcHhlM0JpS0FaZEtrMTRNRGtFOW9GWUQ2aE9QZFBqMTZIUlVIOGRjWWRnOGVkT0doM2p6VVduZkY4U25MRDRPTW9LQTFFVWZ0UzhENUNkc1lheHg1OGdKSUo2U1ZoTjJlT3VHcmM4M2pISFREQ0xVdmVrTEgzMFJBWVpkU2xicmFmc0grVkV1TWhjN2l2ZThwWE5Kc3djWDJxbS9OWEVKREhBVC9NZk9OTTd3MzEzaVBxWmJXT2hETkx1Z2orMTJ3SE83M3NwRkorOHQxYllTOEJxU0hqQURuWVFrV2lRdVY4aHBWL011ekNJSU4zSXpKNVdodHA4c1YwTjNxTUhpTFluZEJUT245MzVud1ljRHUyVE5yaTZsWGE4NUhXb0ZkbDdiazljQ1FVUDUxcUFmRXNBZldzU2Z6UEluK2dhRGN4UnJnPT08L1NQPg==; path=/; secure; HttpOnly",
                       //"Cookie": "rtFa=ibALGjJdBQDSLFH1z9kQ0+CkjjfKKbdDQnfCAHKKjzcmRjQ0QjcwODgtMTU3OS00NzlFLUE0NzUtQkZEMkI0NjAyNDlBr0JITHJLD45lVwPZQR5mn5F95FfVvEqF0WrL2388U7Czs5a7Yz8P0CCCj7llogci6rPTv3DAri+iLcdArQQ/rKlHCc7UNZyiF0UKRP8iDtyrwayhlMlkpXCr8VqTybmiQ3cdK71Odk9PdfQkPXw5O5Re+RrY7bkGLXuHh1T4KYLw/5qLsKgT1Jj/DQS6owOquGRVvTe+Trte1Eioz7mKBgQN5e0Gkb06+NDdtInIRAjevi5ot7BIgeb0bSvz9EGCtVO9xlzmm3n2PN7wuJR7NDp22U9XkJ3G0NoNWHwWaR12+wgGZLYZ2ds68BsSl77XmIUAOV4mCui1yTaXkoeFn0UAAAA=; domain=sharepoint.com; path=/; secure; HttpOnly"
                   },
                   success: function(data) {
                       console.log("Item created successfully");
                       //this.getListData();
                   },
                   error: function(error) {
                       console.log(JSON.stringify(error));

                   }
              });
            },

              postListDataEmployee: function(){
              $.ajax({
                   async: true,
                   url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items",
                   method: "POST",
                   data: JSON.stringify({
                       '__metadata': {
                           'type': 'SP.Data.EmployeeListItem' // it defines the ListEntityTypeName
                       },
                       "vblv": this.Emp_FN,
                       "cytw": this.Emp_LN,
                       "OData__x0079_ex6": this.Emp_Rt,
                       "w3s7": this.Emp_Route,
                       "OData__x0077_v79": this.Emp_email,
                       "bevs": this.Emp_role
                   }),

                   headers: {
                       "accept": "application/json;odata=verbose",
                       "content-type": "application/json;odata=verbose",
                       "X-RequestDigest": this.RequestDigest
                       //"Cookie": "FedAuth=77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+VjUsMGguZnxtZW1iZXJzaGlwfDEwMDMyMDAwM2NlMjFmNzNAbGl2ZS5jb20sMCMuZnxtZW1iZXJzaGlwfGNhcHN0b25lQGxhYWd1YWRpbGxhbmEuY29tLDEzMTk5MTIzNjkwMDAwMDAwMCwxMzE5NTA2MjUwMzAwMDAwMDAsMTMxOTkyMTAxMDc5MDU1MjkwLDAuMC4wLjAsMixmNDRiNzA4OC0xNTc5LTQ3OWUtYTQ3NS1iZmQyYjQ2MDI0OWEsLCxhZWE4ZDA5ZS00MDc4LTgwMDAtOTk5NS1kODc2MTViMDEyOGYsYWVhOGQwOWUtNDA3OC04MDAwLTk5OTUtZDg3NjE1YjAxMjhmLCwwLDAsMCwsYmJXUStQWDUwekRyWHhBLzdOcHhlM0JpS0FaZEtrMTRNRGtFOW9GWUQ2aE9QZFBqMTZIUlVIOGRjWWRnOGVkT0doM2p6VVduZkY4U25MRDRPTW9LQTFFVWZ0UzhENUNkc1lheHg1OGdKSUo2U1ZoTjJlT3VHcmM4M2pISFREQ0xVdmVrTEgzMFJBWVpkU2xicmFmc0grVkV1TWhjN2l2ZThwWE5Kc3djWDJxbS9OWEVKREhBVC9NZk9OTTd3MzEzaVBxWmJXT2hETkx1Z2orMTJ3SE83M3NwRkorOHQxYllTOEJxU0hqQURuWVFrV2lRdVY4aHBWL011ekNJSU4zSXpKNVdodHA4c1YwTjNxTUhpTFluZEJUT245MzVud1ljRHUyVE5yaTZsWGE4NUhXb0ZkbDdiazljQ1FVUDUxcUFmRXNBZldzU2Z6UEluK2dhRGN4UnJnPT08L1NQPg==; path=/; secure; HttpOnly",
                       //"Cookie": "rtFa=ibALGjJdBQDSLFH1z9kQ0+CkjjfKKbdDQnfCAHKKjzcmRjQ0QjcwODgtMTU3OS00NzlFLUE0NzUtQkZEMkI0NjAyNDlBr0JITHJLD45lVwPZQR5mn5F95FfVvEqF0WrL2388U7Czs5a7Yz8P0CCCj7llogci6rPTv3DAri+iLcdArQQ/rKlHCc7UNZyiF0UKRP8iDtyrwayhlMlkpXCr8VqTybmiQ3cdK71Odk9PdfQkPXw5O5Re+RrY7bkGLXuHh1T4KYLw/5qLsKgT1Jj/DQS6owOquGRVvTe+Trte1Eioz7mKBgQN5e0Gkb06+NDdtInIRAjevi5ot7BIgeb0bSvz9EGCtVO9xlzmm3n2PN7wuJR7NDp22U9XkJ3G0NoNWHwWaR12+wgGZLYZ2ds68BsSl77XmIUAOV4mCui1yTaXkoeFn0UAAAA=; domain=sharepoint.com; path=/; secure; HttpOnly"
                   },
                   success: function(data) {
                       console.log("Item created successfully");
                       //this.getListData();
                   },
                   error: function(error) {
                       console.log(JSON.stringify(error));

                   }
              });
            }

              ,
              getRequestDigestValue: function(){

                var headers ={
                  "Cookie": "FedAuth=77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+VjUsMGguZnxtZW1iZXJzaGlwfDEwMDMyMDAwM2NlMjFmNzNAbGl2ZS5jb20sMCMuZnxtZW1iZXJzaGlwfGNhcHN0b25lQGxhYWd1YWRpbGxhbmEuY29tLDEzMTk5MTIzNjkwMDAwMDAwMCwxMzE5NTA2MjUwMzAwMDAwMDAsMTMxOTkyMTAxMDc5MDU1MjkwLDAuMC4wLjAsMixmNDRiNzA4OC0xNTc5LTQ3OWUtYTQ3NS1iZmQyYjQ2MDI0OWEsLCxhZWE4ZDA5ZS00MDc4LTgwMDAtOTk5NS1kODc2MTViMDEyOGYsYWVhOGQwOWUtNDA3OC04MDAwLTk5OTUtZDg3NjE1YjAxMjhmLCwwLDAsMCwsYmJXUStQWDUwekRyWHhBLzdOcHhlM0JpS0FaZEtrMTRNRGtFOW9GWUQ2aE9QZFBqMTZIUlVIOGRjWWRnOGVkT0doM2p6VVduZkY4U25MRDRPTW9LQTFFVWZ0UzhENUNkc1lheHg1OGdKSUo2U1ZoTjJlT3VHcmM4M2pISFREQ0xVdmVrTEgzMFJBWVpkU2xicmFmc0grVkV1TWhjN2l2ZThwWE5Kc3djWDJxbS9OWEVKREhBVC9NZk9OTTd3MzEzaVBxWmJXT2hETkx1Z2orMTJ3SE83M3NwRkorOHQxYllTOEJxU0hqQURuWVFrV2lRdVY4aHBWL011ekNJSU4zSXpKNVdodHA4c1YwTjNxTUhpTFluZEJUT245MzVud1ljRHUyVE5yaTZsWGE4NUhXb0ZkbDdiazljQ1FVUDUxcUFmRXNBZldzU2Z6UEluK2dhRGN4UnJnPT08L1NQPg==; path=/; secure; HttpOnly",
                  "Cookie": "rtFa=ibALGjJdBQDSLFH1z9kQ0+CkjjfKKbdDQnfCAHKKjzcmRjQ0QjcwODgtMTU3OS00NzlFLUE0NzUtQkZEMkI0NjAyNDlBr0JITHJLD45lVwPZQR5mn5F95FfVvEqF0WrL2388U7Czs5a7Yz8P0CCCj7llogci6rPTv3DAri+iLcdArQQ/rKlHCc7UNZyiF0UKRP8iDtyrwayhlMlkpXCr8VqTybmiQ3cdK71Odk9PdfQkPXw5O5Re+RrY7bkGLXuHh1T4KYLw/5qLsKgT1Jj/DQS6owOquGRVvTe+Trte1Eioz7mKBgQN5e0Gkb06+NDdtInIRAjevi5ot7BIgeb0bSvz9EGCtVO9xlzmm3n2PN7wuJR7NDp22U9XkJ3G0NoNWHwWaR12+wgGZLYZ2ds68BsSl77XmIUAOV4mCui1yTaXkoeFn0UAAAA=; domain=sharepoint.com; path=/; secure; HttpOnly"
                };

                var vm = this;
                axios.post("https://aguadillana.sharepoint.com/sites/DDMS/_api/contextinfo",headers)
                .then(response => {
                  console.log(response);
                  vm.RequestDigest = response.data.FormDigestValue
                })
                .catch(function (error) {
                  console.log(error);
                  console.log("failed");
                });
          },

        }





        });
        var Report =  Vue.component('Report', {
            data: function (){
              return{
                forms: [],
                ventas: [],
                rutas:[],
                clientes:[],
                empaque:[],
                familia:[],
                TotalQRuta:0,
                TotalVRuta:0,
                TotalQFamilia:0,
                TotalVFamilia:0,
                TotalQEmpaque:0,
                TotalVEmpaque:0,
                TotalQMes:0,
                TotalVMes:0,

                AvgQRuta:0,
                AvgVRuta:0,
                AvgQFamilia:0,
                AvgVFamilia:0,
                AvgQEmpaque:0,
                AvgVEmpaque:0,
                AvgQMes:0,
                AvgVMes:0,
                chartDemosPorRutaData:null,
                chartventasPorRoutes:null,
                chartdemoPorFamilia:null,
                chartventasPorFamilia:null,
                chartdemoPorEmpaque:null,
                chartventasPorEmpaque:null,
                chartdemoPorMes:[],
                chartventasPorMes:[],
                ventasPorMes:[0,0,0,0,0,0,0,0,0,0,0,0],
                demoPorMes:[0,0,0,0,0,0,0,0,0,0,0,0],
                demoPorRoutes:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                ventasPorRoutes:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                demoPorEmpaque:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                ventasPorEmpaque:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                demoPorFamilia:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                ventasPorFamilia:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                tiendas: [],
                 search: '',

                mes:['January','February','March','April','May','June','July','August','September','October','November','December'],
                headersDemostradora: [
                    {
                      text: 'Key',
                      align: 'left',
                      value: 'Title'
                    },
                    { text: 'Demostradora', align: 'center',value: 'Demostradora' },
                    { text: 'Fecha', align: 'center',value: 'Fecha' },
                    { text: 'Hora de Llegada', align: 'center',value: 'HoraLlegada' },
                    { text: 'Producto', align: 'center',value: 'Producto' },
                    { text: 'Horas Trabajadas', align: 'center',value: 'HorasTrabajadas' },
                    { text: 'Unidades Vendidas', align: 'center',value: 'UnidadesVendidas' }
                  ],
                headers: [
                    {
                      text: 'Key',
                      align: 'left',
                      value: 'Title'
                    },
                    { text: 'Tienda', align: 'center',value: 'Demostradora' },
                    { text: 'Pueblo', align: 'center',value: 'Pueblo' },
                    { text: 'Pueblo', align: 'center',value: 'route' },
                    { text: 'Precio PrecioEspecial', align: 'center',value: 'PrecioEspecial' },
                    { text: 'Unidades Vendidas', align: 'center',value: 'UnidadesVendidas' }
                  ],
                  tab: null,
      items: [
        'Reporte de Demos', 'Reporte de Demostradora'
      ]
              }
            }, template:` <div>
            <template>
       <v-tabs
         v-model="tab"
         color="gray"
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
          <v-btn @click="getListData()">Generate Report</v-btn>
          <h1>Monthly</h1>
          <p>Total de Demos: {{TotalQMes}} -  Promedio: {{AvgQMes}}</p>
          <p>Total de Ventas:$ {{TotalVMes}} -  Promedio:$ {{AvgVMes}}</p>
            <line-chart  :chart-data="chartdemoPorMes"></line-chart>
            <line-chart  :chart-data="chartventasPorMes"></line-chart>
          <h1>Routes</h1>
          <p>Total de Demos: {{TotalQRuta}} -  Promedio: {{AvgQRuta}}</p>
          <p>Total de Ventas:$ {{TotalVRuta}} - Promedio:$ {{AvgVRuta}}</p>
          <bar-chart :chart-data="chartDemosPorRutaData"></bar-chart>
          <bar-chart :chart-data="chartventasPorRoutes"></bar-chart>
          <h1>Family Of Products</h1>
          <p>Total de Demos: {{TotalQFamilia}} -  Promedio: {{AvgQFamilia}}</p>
          <p>Total de Ventas:$ {{TotalVFamilia}} -  Promedio:$ {{AvgVFamilia}} </p>
          <bar-chart :chart-data="chartdemoPorFamilia"></bar-chart>
          <bar-chart :chart-data="chartventasPorFamilia"></bar-chart>
          <h1>Empaque</h1>
          <p>Total de Demos: {{TotalQEmpaque}} - Promedio: {{avgQEmpaque}}</p>
          <p>Total de Ventas:$ {{TotalVEmpaque}} -  Promedio:$ {{avgVEmpaque}}</p>
          <bar-chart :chart-data="chartdemoPorEmpaque"></bar-chart>
          <bar-chart :chart-data="chartventasPorEmpaque"></bar-chart>
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
                <td class="text-xs-right">{{props.item.Product}}</td>
                <td class="text-xs-right">{{props.item.familia}}</td>
                <td class="text-xs-right">{{props.item.route}}</td>
                <td class="text-xs-right">{{props.item.PrecioEspecial}}</td>
                <td class="text-xs-right">{{props.item.UnidadesVendidas}}</td>
              </template>
           </v-data-table>

           </v-card-text>

           </v-card>
           </v-tab-item>


           <v-tab-item>

<v-card>
  <v-card-title>
    Reporte por Demostradoras
    <v-spacer></v-spacer>
    <v-text-field
      v-model="search"
      append-icon="search"
      label="Search"
      single-line
      hide-details
    ></v-text-field>
  </v-card-title>
  <v-data-table
    :headers="headersDemostradora"
    :items="forms"
    :search="search"
  >
    <template v-slot:items="props">
       <td>{{props.item.Title}}</td>
         <td class="text-xs-right">{{ props.item.Demostradora}}</td>
      <td class="text-xs-right">{{ props.item.Fecha}}</td>
      <td class="text-xs-right">{{ props.item.HoraLlegada}}</td>
      <td class="text-xs-right">{{ props.item.Producto}}</td>
      <td class="text-xs-right">{{ props.item.HorasTrabajadas}}</td>
      <td class="text-xs-right">{{ props.item.UnidadesVendidas}}</td>
    </template>
    <v-alert v-slot:no-results :value="true" color="error" icon="warning">
      Your search for "{{ search }}" found no results.
    </v-alert>
  </v-data-table>
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
           </div>`
           ,
          // created: function(){
                 //this.getListFields();
                // this.getListData();
                 //console.log(this.forms);
            // },
           methods:{

                    sumOf: function(arr){
                      var sum=0;
                      for(var i=0; i<arr.length; i++){
                        sum += arr[i];
                      }
                      return sum;
                    },
             getListData: function(){
              var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items";
              var endPointUrl1 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Routes')/items";
              var endPointUrl2 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items";
              var endPointUrl3 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items";
              console.log(endPointUrl);
             var headers = {
                 "accept": "application/json;odata=verbose",
                  "content-type": "application/json;odata=verbose"
             };
                 this.status = "getting data...";
                 var vm = this;
                 var sales=0;
                 var i=0,j=0;
                 var fecha;


                /*vm.ventasPorMes=[0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.demoPorMes=[0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.demoPorRoutes=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.ventasPorRoutes=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.demoPorEmpaque=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.ventasPorEmpaque=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.demoPorFamilia=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                 vm.ventasPorFamilia=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];*/
                 axios.get(endPointUrl1).then(response => {
                    console.log(response.data.value);
                    for(j=0; j< response.data.value.length; j++){
                      //console.log(response.data.value[j].Title);
                      vm.rutas[j] = response.data.value[j].Title;
                    }
                  });
                  axios.get(endPointUrl2).then(response => {
                     console.log(response.data.value);
                     for(j=0; j< response.data.value.length; j++){
                       //console.log(response.data.value[j].Title);
                       vm.familia[j] = response.data.value[j].r0hu;
                       vm.empaque[j] = response.data.value[j].s2l1;
                     }
                   });
                   axios.get(endPointUrl3).then(response => {
                      console.log(response.data.value);
                      for(j=0; j< response.data.value.length; j++){
                        //console.log(response.data.value[j].Title);
                        vm.clientes[j] = response.data.value[j].zqlz;

                      }
                    });
                 axios.get(endPointUrl).then(response => {
                    console.log(response.data.value);
                    vm.forms = response.data.value
                      size =vm.forms.length;
                    for(i=0; i< size; i++){
                      fecha = new Date(vm.forms[i].Fecha);
                      //vm.tiendas.push(vm.forms[i].Tienda);
                      vm.ventasPorMes[fecha.getMonth()] += vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      vm.demoPorMes[fecha.getMonth()]++;
                      vm.demoPorRoutes[vm.rutas.indexOf(vm.forms[i].route)]++;
                      vm.ventasPorRoutes[vm.rutas.indexOf(vm.forms[i].route)]+=vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      vm.demoPorEmpaque[vm.empaque.indexOf(vm.forms[i].Producto)]++;
                      vm.ventasPorEmpaque[vm.empaque.indexOf(vm.forms[i].Producto)]+=vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      vm.demoPorFamilia[vm.familia.indexOf(vm.forms[i].familia)]++;
                      vm.ventasPorFamilia[vm.familia.indexOf(vm.forms[i].familia)]+=vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      //console.log(vm.ventasPorMes);
                      //console.log(vm.tiendas);
                      //sales = vm.forms[i].UnidadesVendidas * vm.forms[i].PrecioEspecial;
                      //vm.forms.push({key: "UnidadesVendidas",value: sales});
                      //console.log(sales);
                      //vm.ventas.push(sales);
                      //console.log(sumOf(vm.demoPorMes));

                    }
                    vm.TotalQMes=parseFloat(this.sumOf(vm.demoPorMes)).toFixed(2);
                    vm.TotalVMes=parseFloat(this.sumOf(vm.ventasPorMes)).toFixed(2);
                    vm.TotalQRuta=parseFloat(this.sumOf(vm.demoPorRoutes)).toFixed(2);
                    vm.TotalVRuta=parseFloat(this.sumOf(vm.ventasPorRoutes)).toFixed(2);
                    vm.TotalQEmpaque=parseFloat(this.sumOf(vm.demoPorEmpaque)).toFixed(2);
                    vm.TotalVEmpaque=parseFloat(this.sumOf(vm.ventasPorEmpaque)).toFixed(2);
                    vm.TotalQFamilia=parseFloat(this.sumOf(vm.demoPorFamilia)).toFixed(2);
                    vm.TotalVFamilia=parseFloat(this.sumOf(vm.ventasPorFamilia)).toFixed(2);



                    vm.AvgQMes=parseFloat(this.sumOf(vm.demoPorMes)/vm.demoPorMes.length).toFixed(2);
                    vm.AvgVMes=parseFloat(this.sumOf(vm.ventasPorMes)/vm.ventasPorMes.length).toFixed(2);
                    vm.AvgQRuta=parseFloat(this.sumOf(vm.demoPorRoutes)/vm.demoPorRoutes.length).toFixed(2);
                    vm.AvgVRuta=parseFloat(this.sumOf(vm.ventasPorRoutes)/vm.ventasPorRoutes.length).toFixed(2);
                    vm.AvgQEmpaque=parseFloat(this.sumOf(vm.demoPorEmpaque)/vm.demoPorEmpaque.length).toFixed(2);
                    vm.AvgVEmpaque=parseFloat(this.sumOf(vm.ventasPorEmpaque)/vm.ventasPorEmpaque.length).toFixed(2);
                    vm.AvgQFamilia=parseFloat(this.sumOf(vm.demoPorFamilia)/vm.demoPorFamilia.length).toFixed(2);
                    vm.AvgVFamilia=parseFloat(this.sumOf(vm.ventasPorFamilia)/vm.ventasPorFamilia.length).toFixed(2);

                  });
                  vm.chartdemoPorMes=
                  {
                    labels: vm.mes,
                    datasets: [
                      {
                        lineTension: 0,
                        label: 'Cantidad de Demos',
                        backgroundColor: '#f87979',
                        borderColor: '#f87979',
                        fill: false,
                        data: vm.demoPorMes
                      }
                    ]
                  };
                  vm.chartventasPorMes=
                  {
                    labels: this.mes,
                    datasets: [
                      {
                        lineTension: 0,
                        label: 'Ventas',
                        backgroundColor: '#f87979',
                        borderColor: '#f87979',
                        fill: false,
                        data: this.ventasPorMes
                      }
                    ]
                  };
               vm.chartDemosPorRutaData=
                  {
                    labels:vm.rutas,
                    datasets: [
                      {
                        label: 'Cantidad de Demos',
                        backgroundColor: '#f87979',
                        data: vm.demoPorRoutes
                      }
                    ]
                  };
                  vm.chartventasPorRoutes=
                     {
                       labels:vm.familia,
                       datasets: [
                         {
                           label: 'Ventas',
                           backgroundColor: '#f87979',
                           data: vm.ventasPorRoutes
                         }
                       ]
                     };
                     vm.chartdemoPorFamilia=
                        {
                          labels:vm.familia,
                          datasets: [
                            {
                              label: 'Cantidad de Demos',
                              backgroundColor: '#f87979',
                              data: vm.demoPorFamilia
                            }
                          ]
                        };
                        vm.chartventasPorFamilia=
                           {
                             labels:vm.familia,
                             datasets: [
                               {
                                 label: 'Ventas',
                                 backgroundColor: '#f87979',
                                 data: vm.ventasPorFamilia
                               }
                             ]
                           };
                           vm.chartdemoPorEmpaque=
                              {
                                labels:vm.empaque,
                                datasets: [
                                  {
                                    label: 'Cantidad de Demos',
                                    backgroundColor: '#f87979',
                                    data: vm.demoPorEmpaque
                                  }
                                ]
                              };
                              vm.chartventasPorEmpaque=
                                 {
                                   labels:vm.empaque,
                                   datasets: [
                                     {
                                       label: 'Ventas',
                                       backgroundColor: '#f87979',
                                       data: vm.ventasPorEmpaque
                                     }
                                   ]
                                 };
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
