<!DOCTYPE html>
<html>
  <head>
    <meta  http-equiv="Content-Type" content="text/html; charset=utf-8">
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
      /**
       * Function that initializes the data is going to be managed in the component
       */
        data: function (){
          return{
            Events:[], //All of the events
            eventDate:new Date().toISOString().substr(0, 10), //Date chosen by user
            datePermitted: '', //Holds the date picker limit
            eventTime:'', //Holds the time chosen by the user
            clients:[], //All of the current clients
            products: [], //All of the current products
            demonstrators: [], //All of the current demonstrators
            employees: [], //All of the current employees
            supervisors: [], //All of the current supervisors
            gerentes: [], //All of the current managers
            eventList: [], //All of the events in agenda
  errorMessages: '', //Error Messages when a rule is broken in the form
    menu: false, //Menu dialog of the date picker
            menuTime: false, //Menu dialog of the time picker
            //Items of the data table
            editedItemEvents: {
              name: '', //Name of the event
              Title: '', //Name of the event
                      event_id: '', //Id of the event
                      event_date: '', //Date and time of a event
                      products: [], //Products of the event
                      event_client: '', //Client of the event
                      event_demonstrator:'', //demonstrator of the event
                      event_mult: '', //multiplier of the event
                      event_approver1: '', //First approver of the event
                      event_approver2: '', //Second approver of the event
                      event_approver3: '', //Third approver of the event
                      Event_Status: '', //Status of the event
                      Event_Status_Text:'', //Comment section of the event status
                      event_reason:'' //The reason of cancelation of event
            },
            defaultItemEvents: {
              name: '', //Name of the event
              Title: '', //Name of the event
                      event_id: '', //Id of the event
                      event_date: '', //Date and time of a event
                      products: [], //Products of the event
                      event_client: '', //Client of the event
                      event_demonstrator:'', //demonstrator of the event
                      event_mult: '', //multiplier of the event
                      event_approver1: '', //First approver of the event
                      event_approver2: '', //Second approver of the event
                      event_approver3: '', //Third approver of the event
                      Event_Status: '', //Status of the event
                      Event_Status_Text:'', //Comment section of the event status
                      event_reason:'' //The reason of cancelation of event
            },
            //Header names of the table to display data
            headersEvents: [
              {       //Name of event
                      text: 'Nombre',
                      align: 'center',
                      value: 'Title'
                      },
                      { text: 'Fecha', align: 'center', value: 'event_date' }, //Date of event
                      { text: 'Productos', align: 'center', value: 'products' }, //Products of event
                      { text: 'Cliente', align: 'center', value: 'event_client' }, //Client of event
                      { text: 'Demonstrador/a', align: 'center', value: 'event_demonstrator' },//demonstrator of event
                      { text: 'Multiplicador', align: 'center', value: 'event_mult' }, //Multiplier of event
                      { text: 'Aprobador #1', align: 'center', value: 'event_approver1' }, //First approver of the event
                      { text: 'Aprobador #2', align: 'center', value: 'event_approver2'}, //Second approver of the event
                      { text: 'Aprobador #3', align: 'center', value: 'event_approver3'}, //Third approver of the event
                      { text: 'Acciones', align: 'center', value: 'name', sortable: false } //Actions of editing and canceling a event
            ],
               dialogEvent: false, //variable to toggle the dialog event window
               dialogEventCancel:false, //variable to toggle the dialog event cancel window
                 ItemId: -1, //variable to hold the item id
                 editedIndex:-1, //variable to hold the index of the edit item chosen
                 canceledIndex:-1, //variable to hold the index of the cancel item chosen
                 type: 'month', //Type of calendar view
      start: new Date().toISOString().substring(0,10), //Date permitted variable
      Reasons:[] //The reasons of cancelation of a event
    }
  },
  /**
   * Functions that execute to update a v-model variable
   */
  computed: {
      /**
       * Changes the title of the dialog depending of the editedIndex
       */
       formTitle () {
         return this.editedIndex === -1 ? 'Nuevo Evento' : 'Editar Evento'
       },
       /**
        * Executes the formatDate function to DD/MM/YYYY format
        */
       computedDateFormatted: {
         get(){
            return this.formatDate(this.eventDate);
          },
          //if the clearable feature is clicked, the eventDate is null
          set(){
            this.eventDate = '';
          }
      },
      /**
       * Maps the dates of the events of the calendar
       */
       eventsMap () {
           const map = {};
           var list = this.eventList;
           //For each event in agenda, map the date and push it to the map
           list.forEach(e => (map[e.event_date.substring(0,10)] = map[e.event_date.substring(0,10)] || []).push(e));
           return map;
       },
       /**
        * Gets the month and year of the calendar
        */
       getYearAndMonth: {
         get(){
             //this function will determine what is displayed in the input
            var dateString  = this.start;
            //Get year
            var year        = dateString.substring(0,4);
            //Get month
            var month       = dateString.substring(5,7);
            //Get day
            var day         = dateString.substring(8,10);
            //Get the whole date in Date object
            var date        = new Date(year, month-1, day);

            //Array of months
            var month = new Array();
            month[0] = "Enero";
            month[1] = "Febrero";
            month[2] = "Marzo";
            month[3] = "Abril";
            month[4] = "Mayo";
            month[5] = "Junio";
            month[6] = "Julio";
            month[7] = "Agosto";
            month[8] = "Septiembre";
            month[9] = "Octubre";
            month[10] = "Noviembre";
            month[11] = "Diciembre";

            //Return month and year is currently viewing
            var n = month[date.getMonth()];
            return n + " " + date.getFullYear();
         }
     }
       },
       /**
        * Function that is executed when a event is launched by the user
        */
     watch: {
       /**
        * Opens the dialog view of event depending of its value
        */
       dialogEvent (val) {
         val || this.closeEvent()
       },
       /**
        * Opens the dialog view of event cancelation depending of its value
        */
       dialogEventCancel (val) {
         val || this.closeCancelEvent()
       }
    },
    /**
     * Function that executes when the rendering of the page is being executed
     */
    created: function(){
      this.getRequestDigestValue();
      this.getListData();
      this.handlerData();
      this.getDates();
      //this.getListData();
    },
    methods:{
      /**
       * Takes the id of the event to edit and sets the dialogEvent to display
       * @param  {Object} item The item to edit
       */
      editItemEvent (item) {
        //Take the index of the chosen event to edit
        this.editedIndex = this.Events.indexOf(item)
        //The id of the event
        this.ItemId = item.Id
        //Maps the object of the item of the map of editedItemEvents
        this.editedItemEvents = Object.assign({}, item)
        //Display the dialog of the event form
        this.dialogEvent = true
      },
      /**
       * Takes the id of the event to cancel and sets the dialogEventCancel to display
       * @param  {Object} item The item to cancel
       */
      deleteItemEvent (item) {
        //Take the index of the chosen event to cancel
        this.canceledIndex = this.Events.indexOf(item)
        //The id of the event
        this.ItemId = item.Id
        //Maps the object of the item of the map of editedItemEvents
        this.editedItemEvents = Object.assign({}, item)
        //Display the dialog of the event form of cancelation
        this.dialogEventCancel = true
      },
      /**
       * Cancels the event chosen using MERGE request to update Event_Status = Canceled
       */
      saveCancelEvent () {
        //The index of the chosen event to cancel is valid
        if (this.canceledIndex > -1) {
          //Object.assign(this.Events[this.editedIndex], this.editedItemEvents);
            //Eliminate the item from the table
            this.Events.splice(this.canceledIndex, 1);
          //If the reason was not chosen nor the comments secction, throw the alert
          if(this.editedItemEvents.event_reason === null && this.editedItemEvents.Event_Status_Text === null) {
              swal({
                  title: "Campos vacíos",
                  text: "Usted tiene campos vacíos en el formulario. Por favor verifique que cada campo este lleno",
                  icon: "info",
                  dangerMode: true,
              });
              this.$refs.formdelete.validate();
              return;
          }
          else{
            //Reason and comments section was provided. MERGE request to update Event_Status = Canceled
          $.ajax({
              async: true,
              url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items('"+this.ItemId+"')",
              method: "POST",
              data: JSON.stringify({
                '__metadata': {
                  'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
                },
               //  /*
                "Event_Status": 'Canceled', //Column to update the status
                "event_reason": this.editedItemEvents.event_reason, //Establish the reason of the cancelation
                "Event_Status_Text": this.editedItemEvents.Event_Status_Text //The comment section of the cancelation
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
                swal("Evento ", {icon:"success"})
                console.log("Evento cancelado exitosamente");
              },
              error: function(error) {
                console.log(JSON.stringify(error));
              }
            });
            //Close the dialog of dialogEventCancel
            this.closeCancelEvent()
          }
        }
      },
      /**
       * Close the dialog of dialogEvent, update the editedIndex to -1
       */
      closeEvent () {
        this.dialogEvent = false
        setTimeout(() => {
          this.editedItemEvents = Object.assign({}, this.defaultItemEvents)
          this.editedIndex = -1
        }, 300)
      },
      /**
       * Close the dialog of dialogEventCancel
       */
      closeCancelEvent () {
        this.dialogEventCancel = false
      },
      /**
       * The POST request to save a event demonstration from edition
       */
      saveEvent: function() {
        //If chosen item to edit is valid
          if (this.editedIndex > -1) {
            //Assign the object to map the editItemEvents object
            Object.assign(this.Events[this.editedIndex], this.editedItemEvents);
            //Check if any of the fields required of empty, if any is empty, throw alert and prevent POST request
            if(this.editedItemEvents.Title === '' || this.eventDate === '' || this.eventDate === undefined || this.eventTime === '' || this.eventTime === null || this.editedItemEvents.event_client === '' || this.editedItemEvents.event_client === undefined || this.editedItemEvents.event_demonstrator === '' || this.editedItemEvents.event_demonstrator === undefined || this.editedItemEvents.products.toString() === '' || this.editedItemEvents.products.toString() === undefined || this.editedItemEvents.event_mult === '' || this.editedItemEvents.event_mult === undefined || this.editedItemEvents.event_approver1 === '' || this.editedItemEvents.event_approver1 === undefined) {
                swal({
                    title: "Campos vacíos",
                    text: "Usted tiene campos vacíos en el formulario. Por favor verifique que cada campo esté lleno",
                    icon: "info",
                    dangerMode: true,
                });
                //Display the required fields left to fill
                this.$refs.form.validate();
                //Exit the method
                return;
            }
            //Check if any of the alerts are present in the form, if any, throw alert and prevent POST request
            else if(this.checkDemonstratorConflict() === false || this.checkClientConflict() === false){
                swal({
                    title: "Alertas vigentes",
                    text: "Usted tiene alertas pendientes en el formulario que no ha corregido. Por favor verifique que los campos de cliente y demostradora estén llenos sin alertas!",
                    icon: "info",
                    dangerMode: true,
                });
                //Exit the method
                return;
            }
            //Proceed with the POST request
            else {
              //Concatenate the date and time
              var temp = this.eventDate + " " + this.eventTime;
              //Transform it in Date object
              var eDate = new Date(temp);
              //Subtract 1 hour for the server time
              eDate.setHours(eDate.getHours() - 1);
              //To ISO format
              this.editedItemEvents.event_date = eDate.toISOString();
              //Concatenation of the id with the name and date/time of the event
              this.editedItemEvents.event_id = this.editedItemEvents.Title +'&'+ eDate.toISOString();
              //Alert if user is sure of the addition of the event
              swal({
                  title: "¿Está seguro de la adición de este evento?",
                  icon: "info",
                  buttons: true,
              })
                  .then((willAdd) => {
                      if (willAdd) {
                        //If the user was sure of the addition of the event
                        $.ajax({
                            async: true,
                            url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items('"+this.ItemId+"')",
                            method: "POST",
                            data: JSON.stringify({
                              '__metadata': {
                                'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
                              },
                             //  /*
                              "Title": this.editedItemEvents.Title, //The name of the event
                              "event_date": this.editedItemEvents.event_date, //The date and time of the event
                              "event_id": this.editedItemEvents.event_id, //The id of the event
                              "products": this.editedItemEvents.products.toString(), //The products of the event
                              "event_client": this.editedItemEvents.event_client, // The client of the event
                               "event_demonstrator": this.editedItemEvents.event_demonstrator, //The demonstrator of the event
                               "event_mult": this.editedItemEvents.event_mult, //The multiplier of the event
                               "event_approver1": this.editedItemEvents.event_approver1, //The first approver of the event
                               "event_approver2": this.editedItemEvents.event_approver2, //The second approver of the event
                               "event_approver3": this.editedItemEvents.event_approver3 //The third approver of the event
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
                            },
                            error: function(error) {
                              console.log(JSON.stringify(error));
                            }
                          });
                          //Close the dialogEvent
                        this.closeEvent()
                        //Alert to show user the event was added succesfully
                        swal("Evento añadido exitosamente!", {
                            icon: "success",
                        });
        } else {
            //Go back to dialog
            window.location.href = '/sites/DDMS/Shared%20Documents/planning.aspx#/Planning';
        }
        });
            }
          } else {
            //Post the date if the save event was not in the list
            this.postListDataEvent();
            //Check if any fields are empty in the form
            if(this.editedItemEvents.Title === '' || this.eventDate === '' || this.eventDate === undefined || this.eventTime === '' || this.eventTime === null || this.editedItemEvents.event_client === '' || this.editedItemEvents.event_client === undefined || this.editedItemEvents.event_demonstrator === '' || this.editedItemEvents.event_demonstrator === undefined || this.editedItemEvents.products.toString() === '' || this.editedItemEvents.products.toString() === undefined || this.editedItemEvents.event_mult === '' || this.editedItemEvents.event_mult === undefined || this.editedItemEvents.event_approver1 === '' || this.editedItemEvents.event_approver1 === undefined)
                return;
            //Check if any alerts are present in the form
            if (this.checkDemonstratorConflict() === false || this.checkClientConflict() === false)
                return;
            //Update the table of the events in agenda
            else this.Events.push(this.editedItemEvents);

          }
        },
        /**
         * The GET request to get all events in agenda and the reasons to cancel a event.
         */
         getListData: function(){
           //The REST API endpoints of the GET data of the events in agenda
          var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter=Event_Status eq 'AGENDA'";
          //The REST API endpoints of the GET data of the reasons to cancel
          var endPointUrl1 = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('ReasonsToCancel')/items?$select=Title";
          console.log(endPointUrl);
         var headers = {
             "accept": "application/json;odata=verbose",
              "content-type": "application/json;odata=verbose"
         };
             this.status = "getting data...";
             var vm = this;
             var j=0;
             //The GET method using axios
             axios.get(endPointUrl).then(response => {
               //The separation of the products to become a string to visualize in the table
               for(j=0; j< response.data.value.length; j++){
                 //If the data of products is not null
                 if(response.data.value[j].products !== null){
                   //Split the products through the comma
                   response.data.value[j].products = response.data.value[j].products.split(",");
               }

              //Transform date/time to Date object
               var dateConversion = new Date(response.data.value[j].event_date);
               //dateConversion.setHours(dateConversion.getHours() - 3);
               var timestamp = ''

               //If the minutes of the time is < 10, assign a 0 at the first position of the minutes
               if(dateConversion.getMinutes() < 10){
                    //Sum 1 hour (getHours() is from 0 - 11). Concatenation of the the hours and minutes
                    timestamp = (dateConversion.getHours() + 1) + ":" + "0" + (dateConversion.getMinutes());
              }
              //Keep normal Concatenation
              else timestamp = (dateConversion.getHours() + 1) + ":" + (dateConversion.getMinutes());
              //Assign the AM/PM stamp in the time
              var realTime = this.tConvert(timestamp);

              //Assign the event_date in DD/MM/YYYY format in 12 hour format
               response.data.value[j].event_date = dateConversion.toLocaleDateString('en-GB') + " " + realTime;

               }
               //Save response data to Events array
                vm.Events = response.data.value;
                //console.log(vm.Events);
              });
              //GET mehtod of the Reasons endPointUrl
              axios.get(endPointUrl1).then(response => {
                //Save response data to Reasons array
                 vm.Reasons = response.data.value;
               });
         },
         /**
          * The POST request to save a event if is a new event to add
          */
         postListDataEvent: function(){
           //Check if any of the fields required of empty, if any is empty, throw alert and prevent POST request
           if(this.editedItemEvents.Title === '' || this.eventDate === '' || this.eventDate === undefined || this.eventTime === '' || this.eventTime === null || this.editedItemEvents.event_client === '' || this.editedItemEvents.event_client === undefined || this.editedItemEvents.event_demonstrator === '' || this.editedItemEvents.event_demonstrator === undefined || this.editedItemEvents.products.toString() === '' || this.editedItemEvents.products.toString() === undefined || this.editedItemEvents.event_mult === '' || this.editedItemEvents.event_mult === undefined || this.editedItemEvents.event_approver1 === '' || this.editedItemEvents.event_approver1 === undefined) {
               swal({
                   title: "Campos vacíos",
                   text: "Usted tiene campos vacíos en el formulario. Por favor verifique que cada campo este lleno",
                   icon: "info",
                   dangerMode: true,
               });
               //Display the required fields left to fill
               this.$refs.form.validate();
               return;
           }
           //Check if any of the alerts are present in the form, if any, throw alert and prevent POST request
           else if(this.checkDemonstratorConflict() === false || this.checkClientConflict() === false){
               swal({
                   title: "Alertas vigentes",
                   text: "Usted tiene alertas pendientes en el formulario que no ha corregido. Por favor verifique que los campos de Cliente y Demostradora estén llenos sin alertas",
                   icon: "info",
                   dangerMode: true,
               });
               //Exit the method
               return;
           }
           //Proceed with the POST request
           else {
             //Concatenate the date and time
             var temp = this.eventDate + " " + this.eventTime;
             //Transform it in Date object
             var eDate = new Date(temp);
             //Subtract 1 hour for the server time
             eDate.setHours(eDate.getHours() - 1);
             //To ISO Format
             this.editedItemEvents.event_date = eDate.toISOString();
             //Concatenation of the id with the name and date/time of the event
             this.editedItemEvents.event_id = this.editedItemEvents.Title +'&'+ this.editedItemEvents.event_date;
             //Alert if user is sure of the addition of the event
               swal({
                   title: "¿Está seguro de la adición de este evento?",
                   icon: "info",
                   buttons: true,
               })
                   .then((willAdd) => {
                       if (willAdd) {
                         //If the user was sure of the addition of the event
                           $.ajax({
                               async: true,
                               url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items",
                               method: "POST",
                               data: JSON.stringify({
                                   '__metadata': {
                                       'type': 'SP.Data.EventsListItem' // it defines the ListEntityTypeName
                                   },
                                   "Title": this.editedItemEvents.Title, //The name of the event
                                   "event_date": this.editedItemEvents.event_date, //The date and time of the event
                                   "event_id": this.editedItemEvents.event_id, //The id of the event
                                   "products": this.editedItemEvents.products.toString(), //The products of the event
                                   "event_client": this.editedItemEvents.event_client, // The client of the event
                                    "event_demonstrator": this.editedItemEvents.event_demonstrator, //The demonstrator of the event
                                    "event_mult": this.editedItemEvents.event_mult, //The multiplier of the event
                                    "event_approver1": this.editedItemEvents.event_approver1, //The first approver of the event
                                    "event_approver2": this.editedItemEvents.event_approver2, //The second approver of the event
                                    "event_approver3": this.editedItemEvents.event_approver3, //The third approver of the event
                                   "Event_Status": 'AGENDA' //The status of the event in agenda
                               }),
                               headers: {
                                   "accept": "application/json;odata=verbose",
                                   "content-type": "application/json;odata=verbose",
                                   "X-RequestDigest":  this.RequestDigest
                               },
                               success: function (data) {
                                   console.log("Item created successfully");
                                   //Update the table of events in agenda
                                  this.getListData();
                               },
                               error: function (error) {
                                   console.log(JSON.stringify(error));
                               }
                           });
                           //Close the dialog of event
                           this.closeEvent()
                           //Alert to show user the event was added succesfully
                           swal("Evento creado exitosamente", {
                               icon: "success",
                           });
                       } else {
                         //Go back to Planning view
                           window.location.href = '/sites/DDMS/Shared%20Documents/planning.aspx#/Planning';
                       }
                   });
                 }
         },
         /**
          * The GET request to get the request digest value to perform the POST and MERGE requests
          */
       getRequestDigestValue: function(){
         //The cookies of SharePoint platform to get the FormDigestValue
         var headers ={
           "Cookie": "FedAuth=77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+VjUsMGguZnxtZW1iZXJzaGlwfDEwMDMyMDAwM2NlMjFmNzNAbGl2ZS5jb20sMCMuZnxtZW1iZXJzaGlwfGNhcHN0b25lQGxhYWd1YWRpbGxhbmEuY29tLDEzMTk5MTIzNjkwMDAwMDAwMCwxMzE5NTA2MjUwMzAwMDAwMDAsMTMxOTkyMTAxMDc5MDU1MjkwLDAuMC4wLjAsMixmNDRiNzA4OC0xNTc5LTQ3OWUtYTQ3NS1iZmQyYjQ2MDI0OWEsLCxhZWE4ZDA5ZS00MDc4LTgwMDAtOTk5NS1kODc2MTViMDEyOGYsYWVhOGQwOWUtNDA3OC04MDAwLTk5OTUtZDg3NjE1YjAxMjhmLCwwLDAsMCwsYmJXUStQWDUwekRyWHhBLzdOcHhlM0JpS0FaZEtrMTRNRGtFOW9GWUQ2aE9QZFBqMTZIUlVIOGRjWWRnOGVkT0doM2p6VVduZkY4U25MRDRPTW9LQTFFVWZ0UzhENUNkc1lheHg1OGdKSUo2U1ZoTjJlT3VHcmM4M2pISFREQ0xVdmVrTEgzMFJBWVpkU2xicmFmc0grVkV1TWhjN2l2ZThwWE5Kc3djWDJxbS9OWEVKREhBVC9NZk9OTTd3MzEzaVBxWmJXT2hETkx1Z2orMTJ3SE83M3NwRkorOHQxYllTOEJxU0hqQURuWVFrV2lRdVY4aHBWL011ekNJSU4zSXpKNVdodHA4c1YwTjNxTUhpTFluZEJUT245MzVud1ljRHUyVE5yaTZsWGE4NUhXb0ZkbDdiazljQ1FVUDUxcUFmRXNBZldzU2Z6UEluK2dhRGN4UnJnPT08L1NQPg==; path=/; secure; HttpOnly",
           "Cookie": "rtFa=ibALGjJdBQDSLFH1z9kQ0+CkjjfKKbdDQnfCAHKKjzcmRjQ0QjcwODgtMTU3OS00NzlFLUE0NzUtQkZEMkI0NjAyNDlBr0JITHJLD45lVwPZQR5mn5F95FfVvEqF0WrL2388U7Czs5a7Yz8P0CCCj7llogci6rPTv3DAri+iLcdArQQ/rKlHCc7UNZyiF0UKRP8iDtyrwayhlMlkpXCr8VqTybmiQ3cdK71Odk9PdfQkPXw5O5Re+RrY7bkGLXuHh1T4KYLw/5qLsKgT1Jj/DQS6owOquGRVvTe+Trte1Eioz7mKBgQN5e0Gkb06+NDdtInIRAjevi5ot7BIgeb0bSvz9EGCtVO9xlzmm3n2PN7wuJR7NDp22U9XkJ3G0NoNWHwWaR12+wgGZLYZ2ds68BsSl77XmIUAOV4mCui1yTaXkoeFn0UAAAA=; domain=sharepoint.com; path=/; secure; HttpOnly"
         };
         var vm = this;
         //POST method url
         axios.post("https://aguadillana.sharepoint.com/sites/DDMS/_api/contextinfo",headers)
         .then(response => {
           console.log(response);
           //Save the value
           vm.RequestDigest = response.data.FormDigestValue
         })
         .catch(function (error) {
           console.log(error);
           console.log("failed");
         });
   },
   /**
    * The GET request to get all of the clients
    */
   getClientListData: function () {
     //The endpoint url to get all clients
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Clients')/items";
       //Receive data in JSON format
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       //GET method
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           //Save the response data
           vm.clients = response.data.value;
       });
   },
   /**
    * The GET request to get all of the products
    */
   getProductListData: function () {
     //The endpoint url to get all products
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items";
       //Receive data in JSON format
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       //GET method
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           //Save response date
           vm.products = response.data.value;
       });
   },
   /**
    * The GET request to get all of the demonstrators
    */
   getDemonstratorListData: function () {
     //The endpoint url to get all demonstrators
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'DEMO'";
       //Receive data in JSON format
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       //GET method
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           //Save response data
           vm.demonstrators = response.data.value;
       });
   },
   /**
    * The GET request to get all of the supervisors
    */
   getSupervisors: function(){
     //The endpoint url to get all supervisors
     var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'SUPERVISOR'";
     //Receive data in JSON format
     var headers = {
         "accept": "application/json;odata=verbose",
         "content-type": "application/json;odata=verbose"
     };
     this.status = "getting data...";
     var vm = this;
     //GET method
     axios.get(endPointUrl).then(response => {
         console.log(response.data.value);
         //Save response data
         vm.supervisors = response.data.value;
     });
   },
   /**
    * The GET request to get all of the managers
    */
   getManagers: function(){
     //The endpoint url to get all managers
     var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'GERENTE'";
     console.log(endPointUrl);
     //Receive data in JSON format
     var headers = {
         "accept": "application/json;odata=verbose",
         "content-type": "application/json;odata=verbose"
     };
     this.status = "getting data...";
     var vm = this;
     //GET method
     axios.get(endPointUrl).then(response => {
         console.log(response.data.value);
         //Save response data
         vm.gerentes = response.data.value;
     });
   },
   /**
    * The GET request to get all approval list employees
    */
   getApprovalListData: function () {
     //The endpoint url to get all vendors
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items?$filter=bevs eq 'VENDOR'";
       console.log(endPointUrl);
       //Receive data in JSON format
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       //GET method
       axios.get(endPointUrl).then(response => {
           console.log(response.data.value);
           //Save response data
           vm.employees = response.data.value;
       });
   },
   /**
    * Detects the vendor of a client chosen by the user
    */
   getApproversFromClient: function(){
     //Variables for the for loop
     var j = 0;
     var i = 0;
     //Route variable
     var route = '';

     for(i=0; i < this.clients.length; i++){
       //Get the route of a the client chosen
         if(this.editedItemEvents.event_client === this.clients[i].Title ){
           //Save the route
           route = this.clients[i].nc7a;
       }
     }
    for(j=0; j < this.employees.length; j++){
      //If vendor has the same route, then set the employee has thr default value
       if(this.employees[j].w3s7 === route){
         //Save the vendor
         this.editedItemEvents.event_approver1 = this.employees[j].vblv;
       }
    }
   },
   /**
    * Gets all of the events in agenda
    */
   getEventListData: function () {
     //The endpoint url to get all events in agenda
       var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Events')/items?$filter=Event_Status eq 'AGENDA'";
       console.log(endPointUrl);
       //Receive data in JSON format
       var headers = {
           "accept": "application/json;odata=verbose",
           "content-type": "application/json;odata=verbose"
       };
       this.status = "getting data...";
       var vm = this;
       //GET method
       axios.get(endPointUrl).then(response => {
         //Save the response data
           vm.eventList = response.data.value;
           console.log(vm.eventList);
       });
   },
   /**
    * Detetcs if client chosen has a event the date and time chosen
    * @return {boolean} if detects conflict, false. Else is true.
    */
   checkClientConflict: function(){
       for (var j = 0; j < this.eventList.length; j++){
         //Client chosen
           var eClient = this.editedItemEvents.event_client;
           //Date and time chosen
           var temp = this.eventDate + " " + this.eventTime;
           var eDate = new Date(temp);
           //Subtract 4 to get client side time
           eDate.setHours(eDate.getHours() - 4);
           //Date and time of event analyzing
           var date = new Date(this.eventList[j].event_date);
           //Subtract 3 to get client side time

           date.setHours(date.getHours() - 3);
           // To ISO format
           var isodateList = date.toISOString();
           //If there is a client already with a event the day and time chosen
           if(this.eventList[j].event_client === eClient && isodateList === eDate.toISOString()){
                   return false;
           }
       }
       return true;
   },
   /**
    * Detetcs if demonstrator chosen has a event the date and time chosen
    * @return {boolean} if detects conflict, false. Else is true.
    */
   checkDemonstratorConflict: function(){
       for (var j = 0; j < this.eventList.length; j++){
         //demonstrator chosen
           var eDemonstrator = this.editedItemEvents.event_demonstrator;
           //Date and time chosen
           var temp = this.eventDate + " " + this.eventTime;
           var eDate = new Date(temp);
           //Subtract 4 to get client side time
           eDate.setHours(eDate.getHours() - 4);
           //Date and time of event analyzing
           var date = new Date(this.eventList[j].event_date);
           //Subtract 3 to get client side time
           date.setHours(date.getHours() - 3);
           // To ISO format
           var isodateList = date.toISOString();

           //If there is a demonstrator already with a event the day and time chosen
           if(this.eventList[j].event_demonstrator === eDemonstrator && isodateList === eDate.toISOString()){
               return false;
           }
       }
       return true;
   },
   /**
    * Sets the dates permitted to choose in the date picker of the form
    */
   getDates: function(){
     //Today's date
      var today = new Date();
      var yesterday = new Date(today.getTime());
      //Set the date before to get client side day
      yesterday.setDate(today.getDate() - 1);
      //Format day to 2 digits
      var dd = String(yesterday.getDate()).padStart(2, '0');
      //Format month to 2 digits
      var mm = String(yesterday.getMonth() + 1).padStart(2, '0'); //January is 0!
      //Get year
      var yyyy = yesterday.getFullYear();
      //Save the mininum day to permit
      this.datePermitted = new Date(yyyy + '-' + mm + '-' + dd).toISOString();
   },
   /**
    * Limiter function to establish the maximun products the user can choose in the form
    */
   getProductLimit: function(){
     //The maximum products to choose is 5
     if (this.editedItemEvents.products.length > 5) {
       //Pop from the variable list
       this.editedItemEvents.products.pop();
       return false;
     }
     //Length is not already met
     else return true;
   },
   /**
    * Assigns the AM/PM format to the time
    * @return {String} timeString the hour in AM/PM 12 hour format
    */
   tConvert: function (time) {
      // Check correct time format and split into components
      var timeString = time.toString();
      var hourEnd = timeString.indexOf(":");
      //get the minutes
      var H = +timeString.substr(0, hourEnd);
      var h = H % 12 || 12;
      //If hour is < 12, AM assign, if not then PM is assigned
      var ampm = (H < 12 || H === 24) ? "AM" : "PM";
      //Format the time string
      timeString = h + timeString.substr(hourEnd, 3) + ampm;
      return timeString;
    },
    /**
     * Formats the date in DD/MM/YYYY format
     * @return {String} the formatted day in DD/MM/YYYY format
     */
    formatDate:function(date) {
      //if date is not chosen
       if (!date) return null
       //Split from the date
       const [year, month, day] = date.split('-')
       return `${day}/${month}/${year}`
   },
   /**
    * Handles the alerts of client and demonstrator in one single function
    */
   handlerAlerts: function(){
       this.checkDemonstratorConflict();
       this.checkClientConflict();
   },
   /**
    * Handles the GET methods in one single function
    */
   handlerData: function () {
       this.getProductListData();
       this.getClientListData();
       this.getDemonstratorListData();
       this.getApprovalListData();
       this.getSupervisors();
       this.getManagers();
       this.getEventListData();
   }
    },
        template: `<div class="text-xs-center">
        <v-container>
        <v-layout row wrap justify-center>
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
            Mes Anterior
          </v-btn>
        </v-flex>

        <v-flex
          shrink
          class="text-xs-center"
        >
      <h1>  {{getYearAndMonth}} </h1>
        </v-flex>

        <v-flex
          sm4
          xs12
          class="text-sm-right text-xs-center"
        >
          <v-btn @click="$refs.calendar.next()">
            Próximo Mes
            <v-icon
              right
              dark
            >
              keyboard_arrow_right
            </v-icon>
          </v-btn>
        </v-flex>

    <v-flex
      xs12
      class="mb-3">
      <v-sheet height="500">

                      <v-calendar
                        ref="calendar"
                        type="month"
                        v-model="start"
                        color="#135973"
                        style="
                            border-style: outset;
                        "
                      >
                        <template v-slot:day="{ date }">
                          <template v-for="event in eventsMap[date]">
                            <v-menu
                              :key="event.Title"
                              full-width
                              offset-x
                            >
                              <template v-slot:activator="{ on }">
                                <div
                                  class="my-event"
                                  style="
                                      overflow: hidden;
                                      text-overflow: ellipsis;
                                      white-space: nowrap;
                                      border-radius: 2px;
                                      background-color: #2095C0;
                                      color: #ffffff;
                                      border: 1px solid #1867c0;
                                      width: 100%;
                                      font-size: 12px;
                                      padding: 3px;
                                      cursor: pointer;
                                      margin-bottom: 1px;
                                  "
                                  v-on="on"
                                  v-html="event.Title"
                                ></div>
                              </template>
                              <v-card
                                color="grey lighten-4"
                                min-width="350px"
                                flat
                              >
                                <v-toolbar
                                  color="#2095C0"
                                  dark
                                >
                                  <v-toolbar-title v-html="event.Title"></v-toolbar-title>
                                  <v-spacer></v-spacer>
                                </v-toolbar>
                                <v-card-title primary-title>
                                  <v-textarea readonly auto-grow style="white-space: pre-wrap;" v-html="event.event_details"></v-textarea>
                                </v-card-title>
                                <v-card-actions>
                                  <v-btn
                                    flat
                                    color="#2095C0"
                                  >
                                    Cancelar
                                  </v-btn>
                                </v-card-actions>
                              </v-card>
                            </v-menu>
                          </template>
                        </template>
                      </v-calendar>
                    </v-sheet>
    </v-flex>

  </v-layout>
  </v-container>
</template>


    <div>
      <v-toolbar flat color="white">
        <v-toolbar-title>Eventos en Agenda</v-toolbar-title>
        <v-divider
          class="mx-2"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialogEvent" max-width="500px">
          <template v-slot:activator="{ on }">
            <v-btn color="#2095C0" dark class="mb-2" v-on="on">Nuevo Evento</v-btn>
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
                      <h3> Seleccione nombre de la demostración: </h3>
                            <v-text-field
                            id="name-demo-text"
                            v-model="editedItemEvents.Title"
                            :rules="[(n) => !!n || 'Este campo es requerido']"
                            required
                            clearable
                            > </v-text-field>
                  </div>
                  <div class="date-hour">
                      <h3> Seleccione la fecha de la demostración:</h3>
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
                                      v-model="computedDateFormatted"
                                      prepend-icon="event"
                                      :rules="[(f) => !!f || 'Este campo es requerido']"
                                      readonly
                                      required
                                      clearable
                                      v-on="on"
                                    ></v-text-field>
                                  </template>
                                  <v-date-picker v-model="eventDate" locale="es-419" :min="datePermitted" @input="menu = false"></v-date-picker>
                                </v-menu>
                       <h3> Seleccione la hora de la demostración:</h3>
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
                                  @change="getApproversFromClient"
                                  :rules="[(c) => !!c || 'Este campo es requerido',
                                  (c) => checkClientConflict() || 'Cliente tiene demostración en la fecha escogida. Escoja otra fecha o otro cliente'
                                  ]"
                                  required
                                  clearable
                                  >
                                </v-select>
                  </div>
                  <div class="demonstrator">
                        <h3> Seleccione la demostrador/a:</h3>
                          <v-select
                                  id="demList"
                                  v-model="editedItemEvents.event_demonstrator"
                                  :items="demonstrators"
                                  item-text="vblv"
                                  :error-messages="errorMessages"
                                  :rules="[(d) => !!d|| 'Este campo es requerido',
                                  (d) => checkDemonstratorConflict() || 'Demostradora tiene demostración en la fecha escogida. Escoja otra fecha o otra demostrador/a'
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
                                  v-on:input="getProductLimit"
                                  clearable
                                  :rules="[(selectedProducts) =>  selectedProducts.length !== 0 || 'Este campo es requerido',
                                  (selectedProducts) => selectedProducts.length < 6 || 'Numero máximo de productos a demostrar es 5']"
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
                      <h3> Seleccione las personas que serán parte del proceso de aprobación: </h3>
                              <v-select
                                  v-model="editedItemEvents.event_approver1"
                                  id="first-employee"
                                  :items="employees"
                                  label="Vendedores (Requerido)"
                                  item-text="vblv"
                                  item-value=""
                                  :rules="[(e) => !!e || 'Este campo es requerido']"
                                  required
                                  clearable
                                  >
                                </v-select>
                          <br/>
                              <v-select
                                  v-model="editedItemEvents.event_approver2"
                                  id="second-employee"
                                  :items="supervisors"
                                  label="Supervisores (Opcional)"
                                  item-text="vblv"
                                  clearable
                                  >
                                </v-select>
                          <br/>
                              <v-select
                                  v-model="editedItemEvents.event_approver3"
                                  id="third-employee"
                                  :items="gerentes"
                                  label="Gerentes de Ventas (Opcional)"
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
              <v-btn color="blue darken-1" flat @click="closeEvent">Cancelar</v-btn>
              <v-btn color="blue darken-1" flat @click="saveEvent">Guardar</v-btn>
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
                  <h3>Seleccione Razón de Cancelación</h3>
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
              <v-btn color="blue darken-1" flat @click="closeCancelEvent">Cancelar</v-btn>
              <v-btn color="blue darken-1" flat @click="saveCancelEvent">Guardar</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
      <v-card>
      <v-data-table
        :headers="headersEvents"
        :items="Events"
        class="elevation-1"
      >
        <template v-slot:items="props">
          <td>{{props.item.Title}}</td>
          <td class="text-xs-center">{{ props.item.event_date}}</td>
          <td class="text-xs-center">{{ props.item.products}}</td>
          <td class="text-xs-center">{{ props.item.event_client}}</td>
          <td class="text-xs-center">{{ props.item.event_demonstrator}}</td>
          <td class="text-xs-center">{{ props.item.event_mult}}</td>
          <td class="text-xs-center">{{ props.item.event_approver1}}</td>
          <td class="text-xs-center">{{ props.item.event_approver2}}</td>
          <td class="text-xs-center">{{ props.item.event_approver3}}</td>
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
      </v-card>
    </div>
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
