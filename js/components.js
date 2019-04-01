var Planning = Vue.component('Planning', {
    data: function (){
        return{
            count:0
        }
    },
    //template: '<button v-on:click="count++"> You clicked me {{count}} times in Approvals. </button>'
});
var CreateEvent = Vue.component('CreateEvent', {
    data: {
        object: {
            firstName: 'John',
            lastName: 'Doe',
            age: 30
        }
    }
    ,
    template: `<div class="planning-form">
        <div>
            <header class="header">
                <h1>La Aguadillana </h1>
            </header>
        </div>

        <div>
            <form class="date">
                Seleccione la fecha de la demostracion: <input type="date" name="date">
            </form>

            <form class="hour">
                Seleccione la hora de la demostracion: <input type="time" name="time">
            </form>
        </div>

        <div>
            <form id="client" class="client" v-on="getListData()"> Seleccione el cliente:
                <select name="cars" v-for="user in users">
                    <option value="title">{{user.Title}}</option>
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

        <div>
            <form class="multiplier"> Seleccione el multiplicador:
                <input type="number">
            </form>
        </div>

        <div>
            <form class="approval"> Seleccione las personas del proceso de aprobacion:
                    <select name="first-employee"> 1.
                        <option value="Luis"> Luis </option>
                    </select>
                <br/>
                    <select name="second-employee"> 2.
                        <option value="Damaris"> Damaris </option>
                    </select>
                <br/>
                    <select name="third-employee"> 3.
                        <option value="Roberto"> Roberto </option>
                    </select>

            </form>
        </div>

    </div>

        `, methods: {
        getListData: function () {
            var endPointUrl = "https://aguadillana.sharepoint.com/DDMS/_api/web/lists/getbyTitle('Test')/items";
            console.log(endPointUrl);
            var headers = {
                "accept": "application/json;odata=verbose",
                "content-type": "application/json;odata=verbose"
            };
            this.status = "getting data...";
            var vm = this;
            axios.get(endPointUrl).then(response => {
                console.log(response.data.value);
                vm.users = response.data.value
            });
        }
    }
});
var ManageEvent =  Vue.component('ManageEvent', {
    data: function (){
        return{
            count:0
        }
    },
    template: '<div> <h1> Hello ManageEvent! </h1></div>'
});

const routes = [
    //{ path: '/', component: Home},
    { path: '/Planning', component: Planning},
    { path: '/CreateEvent', component: CreateEvent},
    { path: '/ManageEvent', component: ManageEvent}
];
const router = new VueRouter({
    routes // short for `routes: routes`
});

const app = new Vue({
    router
}).$mount('#app')
