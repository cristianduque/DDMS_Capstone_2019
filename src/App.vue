<template>
  <div id="app">
    <Header />
    <Calendar />
    <Client />
    <Demonstrator />
    <Products v-bind:product="productList" v-on=""/>

  </div>
</template>

<script>
    import Header from './components/Header';
    import Calendar from "./components/Calendar";
    import Client from './components/Client';
    import Demonstrator from "./components/Demonstrator";
    import Products from './components/Products';

    export default {
        name: 'app',
        components: {
            Products,
            Demonstrator,
            Calendar,
            Header,
            Client
        }
    }
</script>

<style >

</style>
