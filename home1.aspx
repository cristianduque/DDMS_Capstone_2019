
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            Events:[],
            eventDate:new Date().toISOString().substr(0, 10),
            eventTime:'',
            clients:[],
            products: [],
            demonstrators: [],
            employees: [],
            eventList: [],
  errorMessages: '',
    menu: false,
            menuTime: false,
            editedItemEvents: {
              name: '',
              Title: '',
                      event_id: '',
                      event_date: '',
                      products: [],
                      event_client: '',
                      event_demonstrator:'',
                      event_mult: 0,
                      event_approver1: '',
                      event_approver2: '',
                      event_approver3: '',
                      Event_Status: '',
                      Event_Status_Text:'',
                      event_reason:''
            },
            defaultItemEvents: {
              name: '',
              Title: '',
                      event_id: '',
                      event_date: '',
                      products: [],
                      event_client: '',
                      event_demonstrator:'',
                      event_mult: 0,
                      event_approver1: '',
                      event_approver2: '',
                      event_approver3: '',
                      Event_Status: '',
                      Event_Status_Text:'',
                      event_reason:''

            },
            headersEvents: [
              {
                      text: 'Nombre',
                      align: 'left',
                      value: 'Title'
                      },
                      { text: 'Fecha', align: 'left', value: 'event_date' },
                      { text: 'Productos', align: 'left', value: 'products' },
                      { text: 'Cliente', align: 'left', value: 'event_client' },
                      { text: 'Demonstratora', align: 'left', value: 'event_demonstrator' },
                      { text: 'Multiplicador', align: 'left', value: 'event_mult' },
                      { text: 'Aprobador #1', align: 'left', value: 'event_approver1' },
                      { text: 'Aprobador #2', align: 'left', value: 'event_approver2'},
                      { text: 'Aprobador #3', align: 'left', value: 'event_approver3'},
                      //{ text: 'Estado', align: 'left', value: 'Event_Status'},
                      //{ text: 'Razon', align: 'left', value: 'Event_Status_Text'},
                      { text: 'Actions', align: 'left', value: 'name', sortable: false }

            ],
               dialogEvent: false,
               dialogEventCancel:false,
                 ItemId: -1,
                 editedIndex:-1,
                 canceledIndex:-1,
                 type: 'month',
      start: '2019-01-01',
      end: '2019-01-06',
      typeOptions: [
        { text: 'Day', value: 'day' },
        { text: '4 Day', value: '4day' },
        { text: 'Week', value: 'week' },
        { text: 'Month', value: 'month' },
        { text: 'Custom Daily', value: 'custom-daily' },
        { text: 'Custom Weekly', value: 'custom-weekly' }
      ],
      Reasons:[]

    }
  },
  computed: {
       formTitle () {
         return this.editedIndex === -1 ? 'Nuevo Evento' : 'Editar Evento'
       }
     },

     watch: {
       dialogEvent (val) {
         val || this.closeEvent()
       },
       dialogEventCancel (val) {
         val || this.closeCancelEvent()
       }
    },
    created: function(){
      this.getRequestDigestValue();
      this.getListData();
      this.handlerData();
      //this.getListData();
    },
    methods:{
      editItemEvent (item) {
this.editedIndex = this.Events.indexOf(item)
this.ItemId = item.Id
this.editedItemEvents = Object.assign({}, item)
this.dialogEvent = true

},
deleteItemEvent (item) {
this.canceledIndex = this.Events.indexOf(item)
this.ItemId = item.Id
this.editedItemEvents = Object.assign({}, item)
this.dialogEventCancel = true

},
saveCancelEvent () {
  if (this.canceledIndex > -1) {
    //Object.assign(this.Events[this.editedIndex], this.editedItemEvents);
    console.log(this.canceledIndex);
      this.Events.splice(this.canceledIndex, 1);
    if(this.editedItemEvents.event_reason === null && this.editedItemEvents.Event_Status_Text === null) {
        swal({
            title: "Campos vacios",
            text: "Usted tiene campos vacios en el formulario. Por favor verifique que cada campo este lleno",
            icon: "info",
            dangerMode: true,
        });
        this.$refs.formdelete.validate();
        return;
    }
  //confirm('Are you sure you want to delete this item?') && this.Events.splice(index, 1)
  else{
  $.ajax({
      async: true,
      url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items('"+this.ItemId+"')",
      method: "POST",
      data: JSON.stringify({
        '__metadata': {
          'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
        },
       //  /*
        "Event_Status": 'CANCELED',
        "event_reason": this.editedItemEvents.event_reason,
        "Event_Status_Text": this.editedItemEvents.Event_Status_Text
         //*/
          //this.editedItem;
      }),
      headers: {
        "accept": "application/json;odata=verbose",
        "content-type": "application/json;odata=verbose",
        "X-RequestDigest": this.RequestDigest,
        "IF-MATCH": "*",
        "X-HTTP-Method": "MERGE"
      },
      success: function(data) {
        swal("Info Succesfully Deleted", {icon:"success"})


        console.log("Item edited to canceled successfully");
        //swal("Info Succesfully Entered to List", {icon:"success"})
         //this.getListData();
      },
      error: function(error) {
        console.log(JSON.stringify(error));
      }
    });
    this.closeCancelEvent()
  /*  this.closeEvent()
    swal("Evento en agenda exitosamente!", {
        icon: "success",
    });*/
  }
}
},
closeEvent () {
  this.dialogEvent = false
  setTimeout(() => {
    this.editedItemEvents = Object.assign({}, this.defaultItemEvents)
    this.editedIndex = -1
  }, 300)
},
closeCancelEvent () {
  this.dialogEventCancel = false

},
saveEvent () {
  if (this.editedIndex > -1) {
    Object.assign(this.Events[this.editedIndex], this.editedItemEvents);
    if(this.editedItemEvents.Title === null || this.eventDate === null || this.eventTime === null || this.editedItemEvents.event_client === undefined || this.editedItemEvents.event_demonstrator === undefined || this.editedItemEvents.products.toString() === '' || this.editedItemEvents.event_mult === null || this.editedItemEvents.event_approver1 === undefined) {
        swal({
            title: "Campos vacios",
            text: "Usted tiene campos vacios en el formulario. Por favor verifique que cada campo este lleno",
            icon: "info",
            dangerMode: true,
        });
        this.$refs.form.validate();
        return;
    }

    else if(this.checkDemonstratorConflict() === false || this.checkClientConflict() === false){
        swal({
            title: "Alertas vigentes",
            text: "Usted tiene alertas pendientes en el formulario que no ha corregido. Por favor verifique que los campos de cliente y demostradora esten llenos sin alertas!",
            icon: "info",
            dangerMode: true,
        });
        return;
    }

    else {

      var temp = this.eventDate + " " + this.eventTime;
      var eDate = new Date(temp);
      eDate.setHours(eDate.getHours() - 3);
      this.editedItemEvents.event_date = eDate.toISOString();
      swal({
          title: "Esta seguro de la adicion de este evento?",
          icon: "info",
          buttons: true,
      })
          .then((willAdd) => {
              if (willAdd) {


    $.ajax({
        async: true,
        url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items('"+this.ItemId+"')",
        method: "POST",
        data: JSON.stringify({
          '__metadata': {
            'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
          },
         //  /*
          "Title": this.editedItemEvents.Title,
          "event_date": this.editedItemEvents.event_date,
          "event_id": this.editedItemEvents.Title +'&'+ this.editedItemEvents.event_date,
          "products": this.editedItemEvents.products.toString(),
          "event_client": this.editedItemEvents.event_client,
           "event_demonstrator": this.editedItemEvents.event_demonstrator,
           "event_mult": this.editedItemEvents.event_mult,
           "event_approver1": this.editedItemEvents.event_approver1,
           "event_approver2": this.editedItemEvents.event_approver2,
           "event_approver3": this.editedItemEvents.event_approver3



           //*/
            //this.editedItem;
        }),
        headers: {
          "accept": "application/json;odata=verbose",
          "content-type": "application/json;odata=verbose",
          "X-RequestDigest": this.RequestDigest,
          "IF-MATCH": "*",
          "X-HTTP-Method": "MERGE"
        },
        success: function(data) {
          console.log("Item edited successfully");
          //swal("Info Succesfully Entered to List", {icon:"success"})
          //this.getListData();

        },
        error: function(error) {
          console.log(JSON.stringify(error));
        }
      });
    this.closeEvent()
    swal("Evento en agenda exitosamente!", {
        icon: "success",
    });
} else {
    window.location.href = '/sites/DDMS/Shared%20Documents/planning.aspx#/CreateEvent';
}
});

    }
  } else {
    this.postListDataEvent();
    this.Events.push(this.editedItemEvents)

  }

},
         getListData: function(){
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter=Event_Status eq 'AGENDA'";
          var endPointUrl1 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ReasonsToCancel')/items?$select=Title";
          console.log(endPointUrl);
         var headers = {
             "accept": "application/json;odata=verbose",
              "content-type": "application/json;odata=verbose"
         };
             this.status = "getting data...";
             var vm = this;
             var j=0;
             axios.get(endPointUrl).then(response => {
              //response.data.value.products = response.data.value.products.split();
               //console.log(response.data.value.products);
               for(j=0; j< response.data.value.length; j++){
                 //console.log(response.data.value[j].Title);
                 if(response.data.value[j].products !== null){
                   response.data.value[j].products = response.data.value[j].products.split(",");
                   //console.log(response.data.value[j].products);
               }
                 //vm.rutas[j] = response.data.value[j].Title;
               }
                vm.Events = response.data.value;
                //console.log(vm.Events);
              });
              axios.get(endPointUrl1).then(response => {
                 vm.Reasons = response.data.value;

               });
         },
         postListDataEvent: function(){

           if(this.editedItemEvents.Title === null || this.eventDate === null || this.eventTime === null || this.editedItemEvents.event_client === undefined || this.editedItemEvents.event_demonstrator === undefined || this.editedItemEvents.products.toString() === '' || this.editedItemEvents.event_mult === null || this.editedItemEvents.event_approver1 === undefined) {
               swal({
                   title: "Campos vacios",
                   text: "Usted tiene campos vacios en el formulario. Por favor verifique que cada campo este lleno",
                   icon: "info",
                   dangerMode: true,
               });
               this.$refs.form.validate();
               return;
           }

           else if(this.checkDemonstratorConflict() === false || this.checkClientConflict() === false){
               swal({
                   title: "Alertas vigentes",
                   text: "Usted tiene alertas pendientes en el formulario que no ha corregido. Por favor verifique que los campos de cliente y demostradora esten llenos sin alertas!",
                   icon: "info",
                   dangerMode: true,
               });
               return;
           }

           else {

             var temp = this.eventDate + " " + this.eventTime;
             var eDate = new Date(temp);
             eDate.setHours(eDate.getHours() - 3);
             this.editedItemEvents.event_date = eDate.toISOString();

               swal({
                   title: "Esta seguro de la adicion de este evento?",
                   icon: "info",
                   buttons: true,
               })
                   .then((willAdd) => {
                       if (willAdd) {

                           $.ajax({
                               async: true,
                               url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items",
                               method: "POST",
                               data: JSON.stringify({
                                   '__metadata': {
                                       'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
                                   },
                                   "Title": this.editedItemEvents.Title,
                                   "event_date": this.editedItemEvents.event_date,
                                   "event_id": this.editedItemEvents.Title +'&'+ this.editedItemEvents.event_date,
                                   "products": this.editedItemEvents.products.toString(),
                                   "event_client": this.editedItemEvents.event_client,
                                    "event_demonstrator": this.editedItemEvents.event_demonstrator,
                                    "event_mult": this.editedItemEvents.event_mult,
                                    "event_approver1": this.editedItemEvents.event_approver1,
                                    "event_approver2": this.editedItemEvents.event_approver2,
                                    "event_approver3": this.editedItemEvents.event_approver3,
                                   "Event_Status": 'AGENDA'
                               }),
                               headers: {
                                   "accept": "application/json;odata=verbose",
                                   "content-type": "application/json;odata=verbose",
                                   "X-RequestDigest":  this.RequestDigest
                               },
                               success: function (data) {
                                   console.log("Item created successfully");
                                   //alert("Event was added succesfully");
                                  //this.Events.push(this.editedItemEvents)
                                  //this.getListData();

                               },
                               error: function (error) {
                                   console.log(JSON.stringify(error));
                               }
                           });
                           this.closeEvent()
                           swal("Evento en agenda exitosamente!", {
                               icon: "success",
                           });
                       } else {
                           window.location.href = '/sites/DDMS/Shared%20Documents/planning.aspx#/CreateEvent';
                       }
                   });
           }
},
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
   getClientListData: function () {
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items";
       console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           vm.clients = response.data.value;
       });
   },
   getProductListData: function () {
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items";
       console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           vm.products = response.data.value;
       });
   },
   getDemonstratorListData: function () {
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'DEMO'";
       console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           vm.demonstrators = response.data.value;
       });
   },
   getApprovalListData: function () {
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'SUPERVISOR'";
       console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           vm.employees = response.data.value;
       });
   },
   getEventListData: function () {
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items";
       console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       axios.get(endPointUrl).then(response => {
           vm.eventList = response.data.value;
           console.log(vm.eventList);
       });
   },
   checkClientConflict: function(){
       for (var j = 0; j < this.eventList.length; j++){

           var eClient = this.editedItemEvents.event_client;
           console.log(eClient);
           console.log(this.eventList[j].event_client);

           var temp = this.eventDate + " " + this.eventTime;
           var eDate = new Date(temp);
           eDate.setHours(eDate.getHours() - 4);
           console.log(eDate.toISOString());

           var date = new Date(this.eventList[j].event_date);
           date.setHours(date.getHours() - 3);

           // now you can get the string
           var isodateList = date.toISOString();
           console.log(isodateList);

           if(this.eventList[j].event_client === eClient && isodateList === eDate.toISOString()){
                   return false;
           }

           else{
               return true;
           }
       }
   },
   checkDemonstratorConflict: function(){
       for (var j = 0; j < this.eventList.length; j++){
           var eDemonstrator = this.editedItemEvents.event_demonstrator;


           var temp = this.eventDate + " " + this.eventTime;
           var eDate = new Date(temp);
           eDate.setHours(eDate.getHours() - 4);
           console.log(eDate.toISOString());

           var date = new Date(this.eventList[j].event_date);
           date.setHours(date.getHours() - 3);

           // now you can get the string
           var isodateList = date.toISOString();

           console.log(isodateList);
           console.log(this.eventList[j].event_client);

           if(this.eventList[j].event_demonstrator === eDemonstrator && isodateList === eDate.toISOString()){
               return false;
           }

           else {
               return true;
           }
       }
   },
   handlerAlerts: function(){
       this.checkDemonstratorConflict();
       this.checkClientConflict();
   },
   handlerData: function () {
       this.getProductListData();
       this.getClientListData();
       this.getDemonstratorListData();
       this.getApprovalListData();
       this.getEventListData();
   }
    },
        template: `<div>

        <template>
  <v-layout wrap>
    <v-flex
      xs12
      class="mb-3"
    >
      <v-sheet height="500">
        <v-calendar
          ref="calendar"
          v-model="start"
          :type="type"
          :end="end"
          color="primary"
        ></v-calendar>
      </v-sheet>
    </v-flex>

    <v-flex
      sm4
      xs12
      class="text-sm-left text-xs-center"
    >
      <v-btn @click="$refs.calendar.prev()">
        <v-icon
          dark
          left
        >
          keyboard_arrow_left
        </v-icon>
        Prev
      </v-btn>
    </v-flex>
    <v-flex
      sm4
      xs12
      class="text-xs-center"
    >
      <v-select
        v-model="type"
        :items="typeOptions"
        label="Type"
      ></v-select>
    </v-flex>
    <v-flex
      sm4
      xs12
      class="text-sm-right text-xs-center"
    >
      <v-btn @click="$refs.calendar.next()">
        Next
        <v-icon
          right
          dark
        >
          keyboard_arrow_right
        </v-icon>
      </v-btn>
    </v-flex>
  </v-layout>
</template>

         <template>
    <div>
      <v-toolbar flat color="white">
        <v-toolbar-title>Eventos</v-toolbar-title>
        <v-divider
          class="mx-2"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialogEvent" max-width="500px">
          <template v-slot:activator="{ on }">
            <v-btn color="primary" dark class="mb-2" v-on="on">Nuevo Evento</v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container grid-list-md>
                <v-layout wrap>
                  <v-form ref="form" class="planning-form">
                  <div class="name-demo">
                      <h3> Seleccione nombre de la demostracion: </h3>

                            <v-text-field
                            id="name-demo-text"
                            v-model="editedItemEvents.Title"
                            :rules="[(n) => !!n || 'Este campo es requerido']"
                            required
                            clearable
                            > </v-text-field>

                  </div>

                  <div class="date-hour">
                      <h3> Seleccione la fecha de la demostracion:</h3>

                                <v-menu
                                  v-model="menu"
                                  :close-on-content-click="false"
                                  :nudge-right="40"
                                  lazy
                                  transition="scale-transition"
                                  offset-y
                                  full-width
                                  min-width="290px"
                                >
                                  <template v-slot:activator="{ on }">
                                    <v-text-field
                                      v-model="eventDate"
                                      prepend-icon="event"
                                      :rules="[(f) => !!f || 'Este campo es requerido']"
                                      readonly
                                      required
                                      clearable
                                      hint="MM/DD/YYYY format"
                                      v-on="on"
                                    ></v-text-field>
                                  </template>
                                  <v-date-picker v-model="eventDate" @input="menu = false"></v-date-picker>
                                </v-menu>

                       <h3> Seleccione la hora de la demostracion:</h3>

                       <template>
                            <v-layout row wrap>

                                    <v-menu
                                      ref="menu"
                                      v-model="menuTime"
                                      :close-on-content-click="false"
                                      :nudge-right="40"
                                      :return-value.sync="time"
                                      lazy
                                      transition="scale-transition"
                                      offset-y
                                      full-width
                                      max-width="290px"
                                      min-width="290px"
                                    >
                                      <template v-slot:activator="{ on }">
                                        <v-text-field
                                          v-model="eventTime"
                                          prepend-icon="access_time"
                                          :rules="[(h) => !!h || 'Este campo es requerido']"
                                          clearable
                                          readonly
                                          v-on="on"
                                        ></v-text-field>
                                      </template>
                                      <v-time-picker
                                        v-if="menuTime"
                                        v-model="eventTime"
                                        required
                                        clearable
                                        full-width
                                        @click:minute="$refs.menu.save(eventTime)"
                                      ></v-time-picker>
                                    </v-menu>

                              </v-layout>
                       </template>
                  </div>

                  <div class="client">
                        <h3> Seleccione el cliente:</h3>

                                <v-select
                                  id="clientList"
                                  v-model="editedItemEvents.event_client"
                                  :items="clients"
                                  item-text="Title"
                                  :error-messages="errorMessages"
                                  :rules="[(c) => !!c || 'Este campo es requerido',
                                  (c) => checkClientConflict() || 'Cliente tiene demostracion en la fecha escogida. Escoja otra fecha o otro cliente'
                                  ]"
                                  required
                                  clearable
                                  >
                                </v-select>
                  </div>

                  <div class="demonstrator">
                        <h3> Seleccione la demostradora/demostrador:</h3>

                          <v-select
                                  id="demList"
                                  v-model="editedItemEvents.event_demonstrator"
                                  :items="demonstrators"
                                  item-text="vblv"
                                  :error-messages="errorMessages"
                                  :rules="[(d) => !!d|| 'Este campo es requerido',
                                  (d) => checkDemonstratorConflict() || 'Demostradora tiene demostracion en la fecha escogida. Escoja otra fecha o otra demostradora'
                                  ]"
                                  required
                                  clearable
                                  >
                                </v-select>
                  </div>

                  <div class="products">
                      <h3>Seleccione los productos:</h3>

                      <v-select

                                  v-model="editedItemEvents.products"
                                  :items="products"
                                  multiple
                                  required
                                  clearable
                                  :rules="[(selectedProducts) =>  selectedProducts.length !== 0 || 'Este campo es requerido']"
                                  item-text="e9lf"
                                  >
                      </v-select>
                  </div>

                  <div class="multiplier">
                      <h3> Seleccione el multiplicador: </h3>
                              <v-text-field
                              v-model="editedItemEvents.event_mult"
                              id="multiplier-num"
                              type="number"
                              v-bind:min="0"
                              :rules="[(m) => !!m || 'Este campo es requerido']"
                              required
                              clearable
                              > </v-text-field>
                  </div>

                  <div class="approval">

                      <h3> Seleccione las personas que seran parte del proceso de aprobacion:</h3>


                              <v-select
                                  v-model="editedItemEvents.event_approver1"
                                  id="first-employee"
                                  :items="employees"
                                  label="Primera persona en aprobar"
                                  item-text="vblv"
                                  :rules="[(e) => !!e || 'Este campo es requerido']"
                                  required
                                  clearable
                                  >
                                </v-select>
                          <br/>

                              <v-select
                                  v-model="editedItemEvents.event_approver2"
                                  id="second-employee"
                                  :items="employees"
                                  label="Segunda persona en aprobar"
                                  item-text="vblv"
                                  clearable
                                  >
                                </v-select>
                          <br/>

                              <v-select
                                  v-model="editedItemEvents.event_approver3"
                                  id="third-employee"
                                  :items="employees"
                                  label="Tercera persona en aprobar el reporte"
                                  item-text="vblv"
                                  clearable
                                  >
                                </v-select>
                  </div>
</v-form>
                </v-layout>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" flat @click="closeEvent">Cancel</v-btn>
              <v-btn color="blue darken-1" flat @click="saveEvent">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <v-dialog v-model="dialogEventCancel" max-width="500px">
          <v-card>
            <v-card-title>
              <span class="headline">Cancelar Evento</span>
            </v-card-title>

            <v-card-text>
              <v-container grid-list-md>
                <v-layout wrap>

                  <v-form ref="formdelete">
                  <h3>Seleccione Razon de Cancelacion</h3>
                  <v-select
                      v-model="editedItemEvents.event_reason"
                      :items="Reasons"
                      item-text="Title"
                      clearable
                      required
                      :rules="[(r) => !!r || 'Este campo es requerido']"
                      >
                    </v-select>
                    <h3>Comentario</h3>
                    <v-text-field v-model="editedItemEvents.Event_Status_Text" required :rules="[(c) => !!c || 'Este campo es requerido']"></v-text-field>

</v-form>
                </v-layout>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" flat @click="closeCancelEvent">Cancel</v-btn>
              <v-btn color="blue darken-1" flat @click="saveCancelEvent">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
      <v-data-table
        :headers="headersEvents"
        :items="Events"
        class="elevation-1"
      >
        <template v-slot:items="props">
          <td>{{props.item.Title}}</td>
          <td class="text-xs-right">{{ props.item.event_date}}</td>
          <td class="text-xs-right">{{ props.item.products}}</td>
          <td class="text-xs-right">{{ props.item.event_client}}</td>
          <td class="text-xs-right">{{ props.item.event_demonstrator}}</td>
          <td class="text-xs-right">{{ props.item.event_mult}}</td>
          <td class="text-xs-right">{{ props.item.event_approver1}}</td>
          <td class="text-xs-right">{{ props.item.event_approver2}}</td>
          <td class="text-xs-right">{{ props.item.event_approver3}}</td>
          <td class="justify-center layout px-0">
            <v-icon
              small
              class="mr-2"
              @click="editItemEvent(props.item)"
            >
              edit
            </v-icon>
            <v-icon
              small
              @click="deleteItemEvent(props.item)"
            >
              delete
            </v-icon>
          </td>
        </template>
        <template v-slot:no-data>
          <v-btn color="primary" @click="getListData">Reset</v-btn>
        </template>
      </v-data-table>
    </div>
  </template>
  </div>`
      });
      var ManageLists =  Vue.component('ManageLists', {
          data: function (){
            return{
              Products:[],
              Employees:[],
              Clients:[],
              ItemId: -1,
              headersClients: [
     {
       text: 'Nombre',
       align: 'left',
       value: 'Title'
     },
     { text: 'Num. Cliente', align: 'left', value: 't1q7' },
     { text: 'Cadena', align: 'left', value: 'zqlz' },
     { text: 'Ciudad', align: 'left', value: 'q89x' },
     { text: 'Ruta', align: 'left', value: 'nc7a' },
     { text: 'Multiplicador', align: 'left', value: 'c9jm' },
     { text: 'Email', align: 'left', value: 'OData__x0065_cv5' },
     { text: 'Actions', align: 'left', value: 'name', sortable: false }
   ],
   headersEmployees: [
{
text: 'Nombre',
align: 'left',
value: 'vblv'
},
{ text: 'Apellido', align: 'left', value: 'cytw' },
{ text: 'Rol', align: 'left', value: 'bevs' },
{ text: 'Ruta', align: 'left', value: 'w3s7' },
{ text: 'Email', align: 'left', value: 'OData__x0077_v79' },
{ text: 'Salario', align: 'left', value: 'OData__x0079_ex6' },
{ text: 'Actions', align: 'left', value: 'name', sortable: false }
],
headersProducts: [
{
text: 'NUM. Producto',
align: 'left',
value: 's2l1'
},
{ text: 'Descripcion', align: 'left', value: 'e9lf' },
{ text: 'Unidades', align: 'left', value: 'a83e' },
{ text: 'Familia', align: 'left', value: 'r0hu' },
{ text: 'Costo/LB', align: 'left', value: 'qrdu' },
{ text: 'Meta', align: 'left', value: 'se1v' },
{ text: 'Actions', align: 'left', value: 'name', sortable: false }
],
   dialogProduct: false,
   dialogClient: false,
   dialogEmployee: false,
   editedIndex: -1,
      editedItemProducts: {
        name: '',
        a83e: '',
        qrdu: 0,
        e9lf: '',
        r0hu: '',
        s2l1:'',
        se1v:''
      },
      defaultItemProducts: {
        name: '',
        a83e: '',
        qrdu: 0,
        e9lf: '',
        r0hu: '',
        s2l1:'',
        se1v:''
      }
      ,
         editedItemClients: {
           name: '',
           Title: '',
           t1q7: '',
           zqlz: '',
           q89x: '',
           nc7a:'',
           c9jm:'',
           OData__x0065_cv5:''

         },
         defaultItemClients: {
           name: '',
           Title: '',
           t1q7: '',
           zqlz: '',
           q89x: '',
           nc7a:'',
           c9jm:'',
           OData__x0065_cv5:''
         }
         ,
            editedItemEmployees: {
              name: '',
              vblv: '',
              cytw: '',
              w3s7: '',
              bevs: '',
              OData__x0079_ex6:0,
              OData__x0077_v79:''
            },
            defaultItemEmployees: {
              name: '',
              vblv: '',
              cytw: '',
              w3s7: '',
              bevs: '',
              OData__x0079_ex6:0,
              OData__x0077_v79:''
            }

            }
          },
        template: `<div>



        <template>
  <div>
    <v-toolbar flat color="white">
      <v-toolbar-title>Productos</v-toolbar-title>
      <v-divider
        class="mx-2"
        inset
        vertical
      ></v-divider>
      <v-spacer></v-spacer>
      <v-dialog v-model="dialogProduct" max-width="500px">
        <template v-slot:activator="{ on }">
          <v-btn color="primary" dark class="mb-2" v-on="on">Nuevo Producto</v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">{{ formTitle }}</span>
          </v-card-title>

          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.s2l1" label="Num. producto"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.e9lf" label="Descripcion"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.a83e" label="Unidades"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.r0hu" label="Familia"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.qrdu" label="Costo/LB"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItemProducts.se1v" label="Meta"></v-text-field>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click="closeProduct">Cancel</v-btn>
            <v-btn color="blue darken-1" flat @click="saveProduct">Save</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-toolbar>
    <v-data-table
      :headers="headersProducts"
      :items="Products"
      class="elevation-1"
    >
      <template v-slot:items="props">
        <td>{{props.item.s2l1}}</td>
        <td class="text-xs-right">{{ props.item.e9lf}}</td>
        <td class="text-xs-right">{{ props.item.a83e}}</td>
        <td class="text-xs-right">{{ props.item.r0hu}}</td>
        <td class="text-xs-right">{{ props.item.qrdu}}</td>
        <td class="text-xs-right">{{ props.item.se1v}}</td>
        <td class="justify-center layout px-0">
          <v-icon
            small
            class="mr-2"
            @click="editItemProduct(props.item)"
          >
            edit
          </v-icon>
          <v-icon
            small
            @click="deleteItemProduct(props.item)"
          >
            delete
          </v-icon>
        </td>
      </template>
      <template v-slot:no-data>
        <v-btn color="primary" @click="getListData">Reset</v-btn>
      </template>
    </v-data-table>
  </div>
</template>

<br><v-spacer></v-spacer><br>

<template>
<div>
<v-toolbar flat color="white">
<v-toolbar-title>Empleados</v-toolbar-title>
<v-divider
class="mx-2"
inset
vertical
></v-divider>
<v-spacer></v-spacer>
<v-dialog v-model="dialogEmployee" max-width="500px">
<template v-slot:activator="{ on }">
  <v-btn color="primary" dark class="mb-2" v-on="on">Nuevo Empleado</v-btn>
</template>
<v-card>
  <v-card-title>
    <span class="headline">{{ formTitle }}</span>
  </v-card-title>

  <v-card-text>
    <v-container grid-list-md>
      <v-layout wrap>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.vblv" label="Nombre"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.cytw" label="Apellido"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.bevs" label="Rol"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.w3s7" label="Ruta"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.OData__x0077_v79" label="Email"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemEmployees.OData__x0079_ex6" label="Salario"></v-text-field>
        </v-flex>
      </v-layout>
    </v-container>
  </v-card-text>

  <v-card-actions>
    <v-spacer></v-spacer>
    <v-btn color="blue darken-1" flat @click="closeEmployee">Cancel</v-btn>
    <v-btn color="blue darken-1" flat @click="saveEmployee">Save</v-btn>
  </v-card-actions>
</v-card>
</v-dialog>
</v-toolbar>
<v-data-table
:headers="headersEmployees"
:items="Employees"
class="elevation-1"
>
<template v-slot:items="props">
<td>{{props.item.vblv}}</td>
<td class="text-xs-right">{{ props.item.cytw}}</td>
<td class="text-xs-right">{{ props.item.bevs}}</td>
<td class="text-xs-right">{{ props.item.w3s7}}</td>
<td class="text-xs-right">{{ props.item.OData__x0077_v79}}</td>
<td class="text-xs-right">{{ props.item.OData__x0079_ex6}}</td>
<td class="justify-center layout px-0">
  <v-icon
    small
    class="mr-2"
    @click="editItemEmployee(props.item)"
  >
    edit
  </v-icon>
  <v-icon
    small
    @click="deleteItemEmployee(props.item)"
  >
    delete
  </v-icon>
</td>
</template>
<template v-slot:no-data>
<v-btn color="primary" @click="getListData">Reset</v-btn>
</template>
</v-data-table>
</div>
</template>

<br><v-spacer></v-spacer><br>

<template>
<div>
<v-toolbar flat color="white">
<v-toolbar-title>Clientes</v-toolbar-title>
<v-divider
class="mx-2"
inset
vertical
></v-divider>
<v-spacer></v-spacer>
<v-dialog v-model="dialogClient" max-width="500px">
<template v-slot:activator="{ on }">
  <v-btn color="primary" dark class="mb-2" v-on="on">Nuevo Cliente</v-btn>
</template>
<v-card>
  <v-card-title>
    <span class="headline">{{ formTitle }}</span>
  </v-card-title>

  <v-card-text>
    <v-container grid-list-md>
      <v-layout wrap>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.Title" label="Nombre"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.t1q7" label="Num. Cliente"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.zqlz" label="Cadena"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.q89x" label="Ciudad"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.nc7a" label="Ruta"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.c9jm" label="Multiplicador"></v-text-field>
        </v-flex>
        <v-flex xs12 sm6 md4>
          <v-text-field v-model="editedItemClients.OData__x0065_cv5" label="Email"></v-text-field>
        </v-flex>
      </v-layout>
    </v-container>
  </v-card-text>

  <v-card-actions>
    <v-spacer></v-spacer>
    <v-btn color="blue darken-1" flat @click="closeClient">Cancel</v-btn>
    <v-btn color="blue darken-1" flat @click="saveClient">Save</v-btn>
  </v-card-actions>
</v-card>
</v-dialog>
</v-toolbar>
<v-data-table
:headers="headersClients"
:items="Clients"
class="elevation-1"
>
<template v-slot:items="props">
<td>{{props.item.Title}}</td>
<td class="text-xs-right">{{ props.item.t1q7}}</td>
<td class="text-xs-right">{{ props.item.zqlz}}</td>
<td class="text-xs-right">{{ props.item.q89x}}</td>
<td class="text-xs-right">{{ props.item.nc7a}}</td>
<td class="text-xs-right">{{ props.item.c9jm}}</td>
<td class="text-xs-right">{{ props.item.OData__x0065_cv5}}</td>
<td class="justify-center layout px-0">
  <v-icon
    small
    class="mr-2"
    @click="editItemClient(props.item)"
  >
    edit
  </v-icon>
  <v-icon
    small
    @click="deleteItemClient(props.item)"
  >
    delete
  </v-icon>
</td>
</template>
<template v-slot:no-data>
<v-btn color="primary" @click="getListData">Reset</v-btn>
</template>
</v-data-table>
</div>
</template>



</div>`,
computed: {
     formTitle () {
       return this.editedIndex === -1 ? 'Nuevo' : 'Editar'
     }
   },

   watch: {
     dialogProduct (val) {
       val || this.closeProduct()
     },
     dialogEmployee (val) {
       val || this.closeEmployee()
     },
     dialogClient (val) {
       val || this.closeClient()
     }
   },
            created: function(){
              this.getRequestDigestValue();
              this.getListData();
              //this.getListData();
            },
            methods:{
              editItemProduct (item) {
       this.editedIndex = this.Products.indexOf(item)
       this.ItemId = item.Id
       this.editedItemProducts = Object.assign({}, item)
       this.dialogProduct = true

     },        editItemClient (item) {
      this.editedIndex = this.Clients.indexOf(item)
      this.ItemId = item.Id
      this.editedItemClients = Object.assign({}, item)
      this.dialogClient = true

    },
    editItemEmployee (item) {
this.editedIndex = this.Employees.indexOf(item)
this.ItemId = item.Id
this.editedItemEmployees = Object.assign({}, item)
this.dialogEmployee = true

},

     deleteItemProduct (item) {
       const index = this.Products.indexOf(item)
       confirm('Are you sure you want to delete this item?') && this.Products.splice(index, 1)
       $.ajax({
           async: true,
           url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items('"+item.Id+"')",
           method: "POST",
           data: JSON.stringify({
             '__metadata': {
               'type': 'SP.Data.ProductListItem' // it defines the ListEntityTypeName
             },
            //  /*
             "status": 'Discontinued'
              //*/
               //this.editedItem;
           }),
           headers: {
             "accept": "application/json;odata=verbose",
             "content-type": "application/json;odata=verbose",
             "X-RequestDigest": this.RequestDigest,
             "IF-MATCH": "*",
             "X-HTTP-Method": "MERGE"
           },
           success: function(data) {
             console.log("Item edited to discontinued successfully");
             //swal("Info Succesfully Entered to List", {icon:"success"})
             //this.getListData();
           },
           error: function(error) {
             console.log(JSON.stringify(error));
           }
         });
     },
     deleteItemClient (item) {
       const index = this.Clients.indexOf(item)
       confirm('Are you sure you want to delete this item?') && this.Clients.splice(index, 1)
       $.ajax({
           async: true,
           url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items('"+item.Id+"')",
           method: "POST",
           data: JSON.stringify({
             '__metadata': {
               'type': 'SP.Data.ClientsListItem' // it defines the ListEntityTypeName
             },
            //  /*
             "status": 'Terminated'
              //*/
               //this.editedItem;
           }),
           headers: {
             "accept": "application/json;odata=verbose",
             "content-type": "application/json;odata=verbose",
             "X-RequestDigest": this.RequestDigest,
             "IF-MATCH": "*",
             "X-HTTP-Method": "MERGE"
           },
           success: function(data) {
             console.log("Item edited to terminated successfully");
             //swal("Info Succesfully Entered to List", {icon:"success"})
             //this.getListData();
           },
           error: function(error) {
             console.log(JSON.stringify(error));
           }
         });
     },
     deleteItemEmployee (item) {
       const index = this.Employees.indexOf(item)
       confirm('Are you sure you want to delete this item?') && this.Employees.splice(index, 1)
       $.ajax({
           async: true,
           url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items('"+item.Id+"')",
           method: "POST",
           data: JSON.stringify({
             '__metadata': {
               'type': 'SP.Data.EmployeeListItem' // it defines the ListEntityTypeName
             },
            //  /*
             "status": 'Terminated'
              //*/
               //this.editedItem;
           }),
           headers: {
             "accept": "application/json;odata=verbose",
             "content-type": "application/json;odata=verbose",
             "X-RequestDigest": this.RequestDigest,
             "IF-MATCH": "*",
             "X-HTTP-Method": "MERGE"
           },
           success: function(data) {
             console.log("Item edited to terminated successfully");
             //swal("Info Succesfully Entered to List", {icon:"success"})
             //this.getListData();
           },
           error: function(error) {
             console.log(JSON.stringify(error));
           }
         });
     },

     closeProduct () {
       this.dialogProduct = false
       setTimeout(() => {
         this.editedItemProducts = Object.assign({}, this.defaultItemProducts)
         this.editedIndex = -1
       }, 300)
     },
     closeEmployee () {
       this.dialogEmployee = false
       setTimeout(() => {
         this.editedItemEmployees = Object.assign({}, this.defaultItemEmployees)
         this.editedIndex = -1
       }, 300)
     },
     closeClient () {
       this.dialogClient = false
       setTimeout(() => {
         this.editedItemClients = Object.assign({}, this.defaultItemClients)
         this.editedIndex = -1
       }, 300)
     },
     saveEmployee () {
       if (this.editedIndex > -1) {
         Object.assign(this.Employees[this.editedIndex], this.editedItemEmployees);
         $.ajax({
             async: true,
             url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items('"+this.ItemId+"')",
             method: "POST",
             data: JSON.stringify({
               '__metadata': {
                 'type': 'SP.Data.EmployeeListItem' // it defines the ListEntityTypeName
               },
              //  /*
               "OData__x0079_ex6": this.editedItemEmployees.OData__x0079_ex6,
               "OData__x0077_v79": this.editedItemEmployees.OData__x0077_v79,
               "bevs": this.editedItemEmployees.bevs,
               "cytw": this.editedItemEmployees.cytw,
               "vblv": this.editedItemEmployees.vblv,
                "w3s7": this.editedItemEmployees.w3s7
                //*/
                 //this.editedItem;
             }),
             headers: {
               "accept": "application/json;odata=verbose",
               "content-type": "application/json;odata=verbose",
               "X-RequestDigest": this.RequestDigest,
               "IF-MATCH": "*",
               "X-HTTP-Method": "MERGE"
             },
             success: function(data) {
               console.log("Item edited successfully");
               //swal("Info Succesfully Entered to List", {icon:"success"})
               //this.getListData();
             },
             error: function(error) {
               console.log(JSON.stringify(error));
             }
           });
       } else {
         this.Employees.push(this.editedItemEmployees)
         this.postListDataEmployee();
       }
       this.closeEmployee()
     },
     saveClient () {
       if (this.editedIndex > -1) {
         Object.assign(this.Clients[this.editedIndex], this.editedItemClients);
         $.ajax({
             async: true,
             url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items('"+this.ItemId+"')",
             method: "POST",
             data: JSON.stringify({
               '__metadata': {
                 'type': 'SP.Data.ClientsListItem' // it defines the ListEntityTypeName
               },
              //  /*
               "Title": this.editedItemClients.Title,
               "t1q7": this.editedItemClients.t1q7,
               "zqlz": this.editedItemClients.zqlz,
               "q89x": this.editedItemClients.q89x,
               "nc7a": this.editedItemClients.nc7a,
              "c9jm": this.editedItemClients.c9jm,
              "OData__x0065_cv5": this.editedItemClients.OData__x0065_cv5

                //*/
                 //this.editedItem;
             }),
             headers: {
               "accept": "application/json;odata=verbose",
               "content-type": "application/json;odata=verbose",
               "X-RequestDigest": this.RequestDigest,
               "IF-MATCH": "*",
               "X-HTTP-Method": "MERGE"
             },
             success: function(data) {
               console.log("Item edited successfully");
               //swal("Info Succesfully Entered to List", {icon:"success"})
               //this.getListData();
             },
             error: function(error) {
               console.log(JSON.stringify(error));
             }
           });
       } else {
         this.Clients.push(this.editedItemClients)
         this.postListDataClient();
       }
       this.closeClient()
     },
     saveProduct () {
       if (this.editedIndex > -1) {
         Object.assign(this.Products[this.editedIndex], this.editedItemProducts);
         $.ajax({
             async: true,
             url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items('"+this.ItemId+"')",
             method: "POST",
             data: JSON.stringify({
               '__metadata': {
                 'type': 'SP.Data.ProductListItem' // it defines the ListEntityTypeName
               },
              //  /*
               "a83e": this.editedItemProducts.a83e,
               "e9lf": this.editedItemProducts.e9lf,
               "qrdu": this.editedItemProducts.qrdu,
               "r0hu": this.editedItemProducts.r0hu,
               "s2l1": this.editedItemProducts.s2l1,
                "se1v": this.editedItemProducts.se1v
                //*/
                 //this.editedItem;
             }),
             headers: {
               "accept": "application/json;odata=verbose",
               "content-type": "application/json;odata=verbose",
               "X-RequestDigest": this.RequestDigest,
               "IF-MATCH": "*",
               "X-HTTP-Method": "MERGE"
             },
             success: function(data) {
               console.log("Item edited successfully");
               //swal("Info Succesfully Entered to List", {icon:"success"})
               //this.getListData();
             },
             error: function(error) {
               console.log(JSON.stringify(error));
             }
           });
       } else {
         this.Products.push(this.editedItemProducts)
         this.postListDataProduct();
       }
       this.closeProduct()
     },
              getListData: function(){
               var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items?$filter=status eq 'Active'";
                var endPointUrl1 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=status eq 'Active'";
                 var endPointUrl2 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items?$filter=status eq 'Active'";
               console.log(endPointUrl);
              var headers = {
                  "accept": "application/json;odata=verbose",
                   "content-type": "application/json;odata=verbose"
              };
                  this.status = "getting data...";
                  var vm = this;
                  axios.get(endPointUrl).then(response => {
                     vm.Products = response.data.value;
                   });
                   axios.get(endPointUrl1).then(response => {
                      vm.Employees = response.data.value;
                      console.log(vm.Employees);
                    });
                    axios.get(endPointUrl2).then(response => {
                       vm.Clients = response.data.value;
                       console.log(vm.Clients);
                     });

              },
              postListDataProduct: function(){
              $.ajax({
                   async: true,
                   url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items",
                   method: "POST",
                   data: JSON.stringify({
                       '__metadata': {
                           'type': 'SP.Data.ProductListItem' // it defines the ListEntityTypeName
                       },
                       "a83e": this.editedItemProducts.a83e,
                       "e9lf": this.editedItemProducts.e9lf,
                       "qrdu": this.editedItemProducts.qrdu,
                       "r0hu": this.editedItemProducts.r0hu,
                       "s2l1": this.editedItemProducts.s2l1,
                       "se1v": this.editedItemProducts.se1v,
                       "status": 'Active'
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
                       "OData__x0079_ex6": this.editedItemEmployees.OData__x0079_ex6,
                       "OData__x0077_v79": this.editedItemEmployees.OData__x0077_v79,
                       "bevs": this.editedItemEmployees.bevs,
                       "cytw": this.editedItemEmployees.cytw,
                       "vblv": this.editedItemEmployees.vblv,
                        "w3s7": this.editedItemEmployees.w3s7,
                        "status": 'Active'
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
            postListDataClient: function(){
            $.ajax({
                 async: true,
                 url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items",
                 method: "POST",
                 data: JSON.stringify({
                     '__metadata': {
                         'type': 'SP.Data.ClientsListItem' // it defines the ListEntityTypeName
                     },
                     "Title": this.editedItemClients.Title,
                     "t1q7": this.editedItemClients.t1q7,
                     "zqlz": this.editedItemClients.zqlz,
                     "q89x": this.editedItemClients.q89x,
                     "nc7a": this.editedItemClients.nc7a,
                    "c9jm": this.editedItemClients.c9jm,
                    "OData__x0065_cv5": this.editedItemClients.OData__x0065_cv5,
                    "status": 'Active'
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
