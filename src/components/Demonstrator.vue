<template>
    <form class="demonstrator"> Enter the demonstrator:
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
        name: "Demonstrator"
    }
</script>

<style scoped>
    .demonstrator {
        line-height: 30pt;
        padding-bottom: auto !important;
        text-align: center !important;
    }
</style>