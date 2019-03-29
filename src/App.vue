<template>
  <div id="app">
    <CreateEvent />
    <Products v-bind:product="productList" v-on=""/>

  </div>
</template>

<script>
    import Products from './components/Products';
    import CreateEvent from "./components/CreateEvent";

    export default {
        name: 'app',
        components: {
            CreateEvent,
            Products,
        }
    }
</script>

<style >

</style>
