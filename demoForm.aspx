<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Formulario de Costos Misceláneos</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
      <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
      <script
      src="https://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
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
          <v-flex>
            <v-toolbar color="red" dark>
              <v-toolbar-title >Formulario Demostracion</v-toolbar-title>
              <v-spacer></v-spacer>
            </v-toolbar>
            <v-form>
              <v-card>
                <v-card-title primary-title>
                  <h4>Tienda:{{users.Tienda}}     Pueblo:{{users.Pueblo}}</h4>
                  <h4>Demostradora:{{users.Demostradora}}</h4>
                </v-card-title>
                <v-card-text>
                  <span id="article_info" v-for="n in fieldList" >
                    <v-select label="Producto demostrado" :items="items" v-model="n.producto" required></v-select>
                    <v-text-field label="Precio Regular"  type="number" v-model="n.PrecioRegular" required></v-text-field>
                     <v-text-field label="Precio Especial"  type="number" v-model="n.PrecioEspecial" required></v-text-field>
                      <v-text-field label="Inventario Inicial"  type="number" v-model="n.InventarioInicial" required></v-text-field>
                       <v-text-field label="Inventario Final"  type="number" v-model="n.InventarioFinal" required></v-text-field>
        <v-text-field label="Total" v-model="total" type="number" readonly></v-text-field>
                       <v-text-field label="Clientes Hora 1"  type="number" v-model="n.ClientesHora1" required></v-text-field>

                       <v-text-field label="Clientes Hora 2"  type="number" v-model="n.ClientesHora2" required></v-text-field>

                       <v-text-field label="Clientes Hora 3"  type="number" v-model="n.ClientesHora3" required></v-text-field>

                       <v-text-field label="Clientes Hora 4"  type="number" v-model="n.ClientesHora4" required></v-text-field>

                       <v-text-field label="Clientes Hora 5"  type="number" v-model="n.ClientesHora5" required></v-text-field>

                  </span>

                </v-card-text>


                 <v-expansion-panel>
    <v-expansion-panel-content
      v-for="(item,i) in 5"
      :key="i"
    >
      <template v-slot:header>
        <div>Producto Extra {{i+1}} </div>
      </template>
      <v-card>
        <v-card-text>




        <span id="article_info"  >
        <v-select label="Producto" :items="items"  required></v-select>
        <v-text-field label="Precio Regular"  type="number" required></v-text-field>

                             <v-text-field label="Precio Especial"  type="number"  required></v-text-field>
                      <v-text-field label="Inventario Inicial"  type="number"  required></v-text-field>


                      Foto Inicial:
                       <input type="file" name="initpic" accept="image/*">

                      Foto Final:
                       <v-text-field label="Inventario Final"  type="number"  required></v-text-field>

                       <input type="file" name="finalpic" accept="image/*">

         <v-text-field label="Total" type="number" @click= "calculateTotal"readonly></v-text-field>

        </span>
        </v-card-text>
      </v-card>
    </v-expansion-panel-content>
  </v-expansion-panel>


 <v-card>
 <v-card-text>
  <v-text-field label="Nombre Empleado Tienda" id="empleadoTienda" type="text" clear-icon="mdi-close-circle" clearable></v-text-field>





  <v-text-field label="Puesto Empleado" id="empleadoPuesto" type="text"></v-text-field>
  </v-card-text>
 </v-card>

                <v-card-actions>
                  <div class="submit_button">
                              <v-btn type="button" @click="getName();putListData(); linkfn()">Submit</v-btn>
                          </div>
                </v-card-actions>
              </v-card>
              <br>

            </v-form>
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
           //message: "Hello World!!!"
           fieldList: [{
               producto: "",
               PrecioRegular: "",
               PrecioEspecial: "",
             InventarioInicial:"",
             InventarioFinal:"",
             Total:"",
             ClientesHora1:"",
             ClientesHora2:"",
             ClientesHora3:"",
             ClientesHora4:"",
             ClientesHora5:""
           }],
           items: [
               "Empanada de Pollo",
               "Empanada de Pavo",
               "Empanada de Cerdo",
               "Empanada de Bistec",
             "Res",
             "Tender"
           ],
           inputShow: true,
       total: "",
             RequestDigest:'',
             users:[],
             id:''

      },

        created: function(){
                 //this.getListFields();
                 this.getRequestDigestValue();
                 //this.getName();
                 this.getListData();
                 //console.log(this.forms);
             },
    methods:{


          calculateTotal: function(){
              this.total = 0;
              for(var i = 0; i<this.fieldList.length; i++){
                  this.Total = this.fieldList[4] - this.fieldList[3];
              }
        console.log(this.total)
          }
    ,linkfn(){
        console.log(this.id);
        location.href = "https://aguadillana.sharepoint.com/sites/DDMS/SitePages/DemoOptions2.aspx?id="+this.id+"";
    },

      getListData: function(){
        this.getName();
        var endPointUrl = "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items('"+this.id+"')";
        console.log(endPointUrl);
       var headers = {
           "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose"
       };
           this.status = "getting data...";
           var vm = this;
           axios.get(endPointUrl).then(response => {
              console.log(response.data);
              vm.users = response.data
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
         "PrecioRegular": this.fieldList[0].PrecioRegular
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


},
getName: function () {
    this.id = window.location.href.split('=').pop()
    console.log(this.id);
    //var header = document.getElementById("reporte");
  //  header.innerHTML = id;
},
putListData: function(){
  this.getName();
					$.ajax({
						async: true,
						url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('DemoForm')/items("+this.id+")",
						method: "POST",
						data: JSON.stringify({
							'__metadata': {
								'type': 'SP.Data.DemoFormListItem' // it defines the ListEntityTypeName
							},
							"PrecioRegular": this.fieldList[0].PrecioRegular
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
