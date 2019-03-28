<template>
    <form class="client"> Enter the client:
        <select name="cars">
            <option value="volvo">Volvo</option>
            <option value="saab">Saab</option>
            <option value="fiat">Fiat</option>
            <option value="audi">Audi</option>
        </select>
    </form>
</template>

<script>
    export default {
        name: "Client"
    }
</script>

<style scoped>
    .client {
        line-height: 40pt;
        padding-bottom:  auto !important;
        text-align: center !important;
    }
</style>