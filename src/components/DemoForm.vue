<template>
<div>

  <h2>Nombre Tienda:___________   Pueblo:_____________ </h2>
  <h3>Fecha:________________</h3>


<form action="/action_page.php">
  <p> Seleccione producto a demostrar: </p>

  <select name="products">
    <option value="Emp-pollo">Emp-pollo</option>
    <option value="Emp-pavo">Emp-pavo</option>
    <option value="Emp-bistec">Emp-bistec</option>
    <option value="Longaniza">Longaniza</option>
  </select>
  <br><br>
  Precio Regular:
  <input name="precio_regular" type="text">
  <br><br>

  Precio Especial:
  <input name="precio_especial" type="text">
  <br><br>

  Inventario Inicial:
  <input name="inv_initial" type="number">
  <br><br>

  Foto Inventario Inicial:
  <input type="file" name="initial_pic" accept="image/*">
  <br><br>

  Inventario Final:
  <input name="inv_final" type="number">
  <br><br>

  Foto Inventario Final:
  <input type="file" name="final_pic" accept="image/*">
  <br><br>

  Total Unidades Vendidas:
  <output name="vendidas" type="number"></output>
  <br><br>

  Hubo unidades de crédito?
  <form>

    <input type="radio" name="credit" value="Yes"> Yes
    <input type="radio" name="credit" value="No"> No<br>

  </form>
  <br>

  Total Unidades Creditos:
  <input name="creditos" type="number">
  <br><br><br><br>

  ------Solo para llenar por empleado del establecimiento------
  <br><br>

  Nombre del empleado:
  <input name="nombre_empleado" type="text">
  <br><br>

  Puesto del empleado:
  <input name="puesto_empleado" type="text">
  <br><br>

  Codigo de la tienda (adjunto en el email de confirmación de demostración):
  <input name="codigo_tienda" type="password">
  <br><br>

 <br><br><br>
  <input type="submit">
</form>

</div>


</template>

<script>
export default {
  name: 'DemoForm',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>


<!--
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Reporte de Demostraciones</title>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
	  <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
	  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>

<style>
  .submit_button, .save_button, .cancel_button{
   display: inline-block;
   }

   .deny_button, .approve_button{
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
              <v-toolbar-title >Reporte de Demostracion</v-toolbar-title>
              <v-spacer></v-spacer>
            </v-toolbar>
            <v-form>
              <v-card>
                <v-card-title primary-title>
                  <h4>Tienda: ____ Pueblo: _____</h4>
                </v-card-title>
                <v-card-text>
                  <span id="article_info" v-for="n in fieldList" >
                    <v-select label="Producto 1" :items="items" v-model="n.artículo" required></v-select>
                    <v-text-field label="Precio Regular"  type="text" v-model="n.precioregular" required></v-text-field>

                    <v-text-field label="Precio Especial"  type="text" v-model="n.precioregular" required></v-text-field>

                    <v-text-field label="Inventario Inicial"  type="number" v-model="n.precioregular" required></v-text-field>

                    <v-text-field label="Inventario Final"  type="text" v-model="n.precioregular" required></v-text-field>

                    <v-text-field label="Foto Inicial"  type="text" v-model="n.precioregular" required></v-text-field>

                    <v-text-field label="Foto Final"  type="text" v-model="n.precioregular" required></v-text-field>
                    <v-text-field label="Precio" @blur="calculateTotal" prefix="$" type="number" step=".01" v-model="n.precio" required></v-text-field>
                  </span>
                    <v-text-field label="Total" v-model="total"  type="number" readonly></v-text-field>
                </v-card-text>
                <v-card-actions>
                  <div class="add_button">
          					<v-btn type="button" @click="addFields">Añadir otro Artículo</v-btn>
          				</div>
                </v-card-actions>
              </v-card>
              <br>
              <v-card>
                <v-card-title>
                  <h4>Evidencia</h4>
                </v-card-title>
                <v-card-text>
                  <v-img
                  :src="src"
                  aspect-ratio="1"
                  class="grey lighten-2"
                ></v-img>
                  <input type="file" id="evidence" name="article_evidence" accept="image/*" multiple required>
                </v-card-text>
                <v-card-actions>
                  <v-btn type="button" @click="deletePhoto">Borrar Foto</v-btn>
                </v-card-actions>
              </v-card>
              <br>
              <v-card>
                <v-card-title>
                  <h4>Acción</h4>
                </v-card-title>
                <v-card-actions>
                  <span id="demonstrator" hidden>
                    <div class="cancel_button">
                      <v-btn type="button" @click="alert('cancel')">Cancelar</v-btn >
                    </div>
                    <div class="save_button">
              				<v-btn  type="button" @click="alert('save')">Guardar</v-btn >
              			</div>
                    <div class="submit_button">
              				<v-btn type="button" @click="alert('submit')">Someter</v-btn >
              			</div>
                  </span>
                  <span id="demonstrator2" hidden>
                      <div class="edit_button">
              					<v-btn type="button">Editar</v-btn>
              				</div>
                  </span>
                  <span id="supervisor">
                      <div class="deny_button">
              					<v-btn type="button" @click="alert('deny')">Negar</v-btn >
              				</div>
                      <div class="approve_button">
              					<v-btn type="button" @click="alert('approve')">Aprovar</button>
              				</div>
                  </span>
                </v-card-actions>
              </v-card>
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
  			 artículo: "",
  			 cantidad: "",
  			 precio: ""
  		 }],
  		 items: [
  			 "Palillos",
  			 "Servilletas",
  			 "Aceite",
  			 "Platos"
  		 ],
  		 inputShow: true,
       total: "",
       src: `https://picsum.photos/500/300?image=${5 + 10}`
  	},
    methods:{
      addFields: function(){
  			var elem = document.getElementById('info');
  			//var space = document.createElement('br');
  			//elem.appendChild(space);
  			this.fieldList.push({
  				artículo: "",
  				cantidad: "",
  				precio: ""
  			});
  			console.log(this.fieldList);
  		},

  		calculateTotal: function(){
  			this.total = 0;
  			for(var i = 0; i<this.fieldList.length; i++){
  				this.total = this.fieldList[i].cantidad * this.fieldList[i].precio + this.total;
  			};
        console.log(this.total)
  		},

      alert: function(text){
  			if(text == 'cancel'){
  				swal("Warning!!!","Are you sure you want to cancel the form?", "warning",{
  					buttons: ["No","Yes"]
  				});
  			}else if(text == 'submit'){
  				swal("Warning!!!","Are you sure you want to submit the form?", "warning",{
  					buttons: ["No","Yes"]
  				});
  			}else if(text == 'deny'){
  				swal("Warning!!!","Are you sure you want to deny the form?", "warning",{
  					buttons: ["No","Yes"]
  				});
  			}else if(text == 'approve'){
  			 	swal("Warning!!!","Are you sure you want to approve the form?", "warning",{
  			 		buttons: ["No","Yes"]
  			 	});
  			}else{
  			swal("Warning!!!","Are you sure you want to save the form?", "warning",{
  				buttons: ["No","Yes"]
  				});
  			}
  		},

      deletePhoto: function(){
        this.src='';
      }
    }
  })
</script>

-->