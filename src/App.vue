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
    import Header from '../../IdeaProjects/DDMS_Capstone_2019/src/components/Header';
    import Calendar from "../../IdeaProjects/DDMS_Capstone_2019/src/components/Calendar";
    import Client from '../../IdeaProjects/DDMS_Capstone_2019/src/components/Client';
    import Demonstrator from "../../IdeaProjects/DDMS_Capstone_2019/src/components/Demonstrator";
    import Products from '../../IdeaProjects/DDMS_Capstone_2019/src/components/Products';

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
