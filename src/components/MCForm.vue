<template>
<div>
  <h1> Formulario de Costos Misceláneos </h1>


  <p>Ingrese todos los costos incurridos durante la demonstración. Todos los campos deben ser llenados antes de someter el formulario</p>


<form action="/action_page.php">
<div>
  <label for = "name"> Artículo </label>

  <select name="products">
    <option value="emp-pollo">emp-pollo</option>
    <option value="emp-pavo">emp-pavo</option>
    <option value="emp-bistec">Emp-bistec</option>
    <option value="longaniza">Longaniza</option>
  </select>
</div>
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

  Inventario Final:
  <input name="inv_final" type="number">
  <br><br>

  Total Unidades Vendidas:
  <output name="vendidas" type="number"></output>
  <br><br>

  Total Unidades Creditos:
  <input name="creditos" type="number">
  <br><br>
 <button type="anadirProducto">Add another product</button>

  <input type="submit">
</form>

</div>


</template>
