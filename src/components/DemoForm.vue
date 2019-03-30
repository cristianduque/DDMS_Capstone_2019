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
  <br><br>
 <button type="anadirProducto">Add another product</button>
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
