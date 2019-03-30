<template>
    <div class="planning-form">
        <div>
            <header class="header">
                <h1>La Aguadillana </h1>
            </header>
        </div>

        <div>
            <form class="date">
                Seleccione la hora y fecha de la demostracion: <input type="date" name="date">
            </form>
        </div>

        <div>
            <form class="client"> Seleccione el cliente:
                <select name="cars">
                    <option value="volvo">Volvo</option>
                    <option value="saab">Saab</option>
                    <option value="fiat">Fiat</option>
                    <option value="audi">Audi</option>
                </select>
            </form>
        </div>

        <div>
            <form class="demonstrator"> Seleccione la demostradora:
                <select name="cars">
                    <option value="volvo">Volvo</option>
                    <option value="saab">Saab</option>
                    <option value="fiat">Fiat</option>
                    <option value="audi">Audi</option>
                </select>
            </form>
        </div>

        <div>
            <form class="products"> Seleccione los productos:
                <input type="checkbox"> Carne empanada de pollo
                <br/>
                <input type="checkbox"> Carne de bistec
                <br/>
                <input type="checkbox"> Carne de Salchicha
                <br/>
                <input type="checkbox"> Carne de embutido
                <br/>
            </form>
        </div>

    </div>



</template>

<script>
    export default {
        name: "CreateEvent"
    }
</script>

<style scoped>
    .header {
        background: #333;
        color: #fff;
        text-align: center;
        padding: 10px;
    }
    .header a {
        color: #fff;
        padding-right: 5px;
    }

    .date {
        text-align: center;
    }

    .client {
        line-height: 40pt;
        padding-bottom:  auto !important;
        text-align: center !important;
    }

    .demonstrator {
        line-height: 30pt;
        padding-bottom: auto !important;
        text-align: center !important;
    }

    .products {
        line-height: 30pt;
        padding-bottom: auto !important;
        text-align: center !important;
    }

</style>