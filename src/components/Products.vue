<template>

    <div class="products">
        <table class="table">
            <thead>
                <tr>
                    <td><strong> Seleccione productos: </strong></td>
                    <td><strong> Selected: </strong></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td> <select title="products" v-bind:key="product" v-for="(product, index) in productList">
                            <option value="product.name">{{product.name}}</option>
                    </select> </td>
                    <td>
                        <a v-on:click="deleteProduct(id);" style="cursor: pointer"> Remove </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
</template>

<script>
    export default {
        name: "Products",
        data(){
            return {
                productList: [
                    {
                        id: 1,
                        name: 'Empanado'
                    },

                    {
                        id: 2,
                        name: 'Bistec'
                    }

                ]
            }
        },
        methods:{
            deleteProduct(id){
                this.productList = this.productList.filter(product => product.id !== id);
            }
        }
    }
</script>

<style scoped>
    .table{
        text-align: center;
    }

</style>