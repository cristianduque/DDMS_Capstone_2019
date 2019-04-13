<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Formulario de Costos Misceláneos</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script
src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

      <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>

<style>
  .submit_button, .save_button, .cancel_button{
   display: inline-block;
   }
</style>

<body>
  <div id="app">
    <v-app>
      <v-container fluid>
        <v-layout row wrap>
          <v-flex xs12 sm4 text-xs-center>
            <v-toolbar color="red" dark>
              <v-toolbar-title >Menu de Opciones</v-toolbar-title>

            </v-toolbar>

              <v-card>
                <v-card-title primary-title>
                  <h4>Seleccione una de las sigientes opciones:</h4>
                  <p>Lat = {{lat}} Lon ={{lon}}</p>
                </v-card-title>

                  <!-- FALTA
                  functions before start: disable (fill & c-out)
                  getLocation() working properly -->

                  <div class="add_button">
                              <v-btn type="button" id ="checkIn" @click="getName(); disableCheckIn(); date(); enableCheckOut(); enableFill(); getLocation(); putListData(); getListData()" >Check-in</v-btn>
                            </div>
                  <div class="add_button">
                            <v-btn type="button" id="fill" @click="disableCancel();getName();linkfn()" >Llenar Reporte</v-btn>
                            </div>
                  <div class="add_button">

                            <v-btn type="button" id="cancel" @click="enterReason(); disableFill()" >Cancelar Demo</v-btn>
                            </div>
                  <div class="add_button">
                            <v-btn type="button"  id="checkOut" @click="disableFill(); disableCancel(); date(); getLocation()">Check-out</v-btn>


                          </div>

              </v-card>
              <br>

          </v-flex>
        </v-layout>
      </v-container>
    </v-app>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
</body>
</html>

<script type="text/javascript">
  var vueApp = new Vue({
    el:"#app",

 data: {
       error:'',
      lat:'',
      lon:'',
        dates:'',
      listData: [],
      RequestDigest:'',
      id:''
  },
             created: function(){
                 //this.getListFields();
                 this.getRequestDigestValue();
                 //this.getName();
                 //console.log(this.forms);
             },
             beforeMount(){
             //this.getName();

        },
    methods:{

    disableCheckIn: function(){

    checkIn.disabled = true;

    },

    enableCheckOut: function(){

    checkOut.disabled = false;

    },

    disableCheckOut: function(){

    checkOut.disabled = true;

    },

    enableFill: function(){

    fill.disabled = false;

    },

    disableFill: function(){

    fill.disabled = true;

    },

    disableCancel: function(){

    cancel.disabled = true;

    },
    linkfn(){
        console.log(this.id);
        location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/DemoForm.aspx?id="+this.id+"";
    },

    enterReason: function(){
    var reason = prompt("Entre razon de cancelacion : ");

        //fix if user cancel in prompt

        if(reason){

        swal("Se sometio la razon. Su respuesta fue: " + reason);
        window.open('mailto:jan.robles@upr.edu?subject=Demo%20Cancelada&body=Demo%20se%20cancelo');


        }
    },

    getLocation: function(){
     if(navigator.geolocation){
     navigator.geolocation.getCurrentPosition(function(position){
     this.lat = position.coords.latitude;
         this.lon = position.coords.longitude;
         console.log(this.lat);
     });

     }else{
     this.error = "Geolocation is not supported.";

     }
    },

    showPosition: function(position){
    this.lat = position.coords.latitude;
        this.lon = position.coords.longitude;
        //console.log(this.lat);
    },

      testPosition: function(position){
    swal("This: " + navigator.geolocation.getCurrentPosition(showPosition));
    },

    date: function(){
    var date = new Date();
        var dates;
    swal("Today is (MM/DD/YYYY) " + (date.getMonth()+1) + "/" + date.getDate() + "/"+ date.getFullYear() +" " + "Time:  " +   date.getHours()+ ":"+ date.getMinutes() +":" + date.getSeconds());
    this.dates = (date.getMonth()+1) + "/" + date.getDate() + "/"+ date.getFullYear()+" "+date.getHours()+ ":"+ date.getMinutes() +":" + date.getSeconds();
console.log(this.dates);
        },




          calculateTotal: function(){
              this.total = 0;
              for(var i = 0; i<this.fieldList.length; i++){
                  this.total = this.fieldList[4] - this.fieldList[3];
              };
        console.log(this.total)
          }
    ,

      getListData: function(){
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Employee')/items";
       var headers = {
           "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
       };
           this.status = "getting data...";
           var vm = this;
           axios.get(endPointUrl).then(response => {
              console.log(response.data.value);
              vm.users = response.data.value
            });
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

   postListData: function(){


   $.ajax({
     async: true,
     url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items",
     method: "POST",
     data: JSON.stringify({
         '__metadata': {
             'type': 'SP.Data.DemoFormListItem' // it defines the ListEntityTypeName
         },
         "LocalizacionLlegada": this.lat, //position.coords.latitude
                 "InventarioFinal": this.InventarioFinal,
                 "Fecha": this.dates
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
         this.getListData();
     },
     error: function(error) {
         console.log(JSON.stringify(error));
     }
});


    },  getName: function () {
          this.id = window.location.href.split('=').pop()
          console.log(this.id);
          //var header = document.getElementById("reporte");
        //  header.innerHTML = id;
      },
    putListData: function(){
    var endpointUrl= "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items('"+this.id+"')";
    console.log(endpointUrl);
    console.log(this.lon);
    console.log(this.lat);
    					$.ajax({
    						async: true,
    						url: endpointUrl,
    						method: "POST",
    						data: JSON.stringify({
    							'__metadata': {
    								'type': 'SP.Data.DemoFormListItem' // it defines the ListEntityTypeName
    							},
    							"LatLlegada":  this.lat,
                  "LonLlegada": this.lon,
                  "HoraLlegada": this.dates
    							//"receipt_picture": this.src,
    						}),
    						headers: {
    							"accept": "application/json;odata=verbose",
    							"content-type": "application/json;odata=verbose",
    							"X-RequestDigest": this.RequestDigest,
    							"IF-MATCH": "*",
    							"X-HTTP-Method": "MERGE"
    						},
    						success: function(data) {
    							console.log("Item created successfully");
    							swal("Info Succesfully Entered to List", {icon:"success"});
    						},
    						error: function(error) {
    							console.log(JSON.stringify(error));
    						}
    					});
       		}
    }
  })
</script>
