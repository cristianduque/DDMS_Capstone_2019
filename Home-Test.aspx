
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
  <script src = "https://unpkg.com/vue-router/dist/vue-router.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script type="text/javascript" src="https://cdn.rawgit.com/highcharts/highcharts-vue/1ce7e656/dist/script-tag/highcharts-vue.min.js"></script>
  <style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
  body {
    background-color: #EEEEEE;
    font-family: 'Montserrat', sans-serif;
    display: grid;
    grid-template-rows: auto;
    justify-items: center;
    padding-top: 50px;
  }

  nav {
    padding: 20px 20px 20px 0;
  }

  nav a {
    padding: 25px;
    text-decoration: none;
    background: #fff;
    border-radius: 3px;
    color: rgb(0, 110, 255);
    font-weight: bold;
    margin-right: 45px;
    font-size: 35px;
  }
  </style>
  </head>
  <body>
    <div id="app">
      <img alt="La Aguadillana logo" src="https://aguadillana.sharepoint.com/DDMS/Shared%20Documents/img/DDMSLogo.png">
      <!--<h1>{{message}}</h1>
      <img alt="La Aguadillana logo" src="img/LaAguadillanaLogo.png">-->
      <nav>
        <!--<router-link to = "/">Home</router-link>-->
        <router-link to = "/Planning">Planning</router-link>
        <router-link to = "/ManageLists">Manage Lists</router-link>
        <router-link to = "/Approvals">Approvals</router-link>
        <router-link to = "/Report">Report</router-link>
      </nav>

      <!--<Approvals></Approvals>-->
       <router-view></router-view>

<form v-on:submit = "postListData">
  <input v-model="Title" placeholder="Login">
  <input v-model="RequestDigest" id="request">
  {{Title}}
     <button type="submit">Submit</button>

</form>
   <highcharts :options="chartOptions"></highcharts>
   <table>
<tr>
<th>Title</th>
</tr>
<tr v-for="user in users">
<td>{{ user.Title }}</td>
</tr>
</table>
    </div>

    <script type="text/javascript">
      var Home = Vue.component('Home', {
        data: function (){
          return{
            count:0
          }
        },
        //template: '<button v-on:click="count++"> You clicked me {{count}} times in Approvals. </button>'
      });
      var Approvals = Vue.component('Approvals', {
        data: function (){
          return{
            count:0
          }
        },
        template: '<button v-on:click="count++"> You clicked me {{count}} times in Approvals. </button>'
      });
    var Planning =  Vue.component('Planning', {
        data: function (){
          return{
            count:0
          }
        },
        template: '<button v-on:click="count++"> You clicked me {{count}} times in Planning. </button>'
      });
      var ManageLists =  Vue.component('ManageLists', {
          data: function (){
            return{
              count:0
            }
          },
          template: '<button v-on:click="count++"> You clicked me {{count}} times in Planning. </button> <form v-on:submit = "postListData"  method="post">  <input v-model="Title" placeholder="Login">   <button type="submit">Submit</button>  </form>'
        });
        var Report =  Vue.component('Report', {
            data: function (){
              return{
                count:0
              }
            },
            template: '<div><h1>Reports</h1><button v-on:click="count++"> You clicked me {{count}} times in Planning. </button>  <highcharts :options="chartOptions"></highcharts> <table><tr>  <th>Title</th></tr>    <tr v-for="user in users"><td>{{ user.Title }}</td>  </tr>  </table></div>'
          });
      const routes = [
      //{ path: '/', component: Home},
         { path: '/Approvals', component: Approvals},
         { path: '/Planning', component: Planning},
         { path: '/Report', component: Report},
         { path: '/ManageLists', component: ManageLists}

      ];
      const router = new VueRouter({
            routes
         });
         Vue.use(HighchartsVue.default);
  var vueApp = new Vue({
  el: "#app",
  router,
  data() {

    return {
      chartOptions: {
        chart: {
          type: 'bar'
        },
        title: {
          text: 'test'
        },
        series: [{
          data: [10, 0, 8, 2, 6, 4, 5, 5]
        }]
      },
      message: "Data Demonstration Management System",
      users: [],
      Title:"hola",
      RequestDigest:""
    }
  },
  created: function(){
        this.getRequestDigestValue();
        this.getListData();
        this.postListData();
    },
  methods: {
       getListData: function(){
        var endPointUrl = "https://aguadillana.sharepoint.com/DDMS/_api/web/lists/getbyTitle('Test')/items";
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
       },
       getRequestDigestValue: function(){

         var headers ={
           "Accept": "application/json;odata=verbose",
         };
         var vm = this;
         axios.post("https://aguadillana.sharepoint.com/DDMS/_api/contextinfo",headers)
         .then(response => {
           console.log(response.data.FormDigestValue);
           vm.RequestDigest = response.data.FormDigestValue
         })
         .catch(function (error) {
           console.log(error);
           console.log("failed");
         });
   },
   postListData: function(){
     var postData = JSON.stringify({
      " __metadata": { "type": "SP.Data.TestListItem" },
       "Title": this.Title
     });
     console.log(postData);

     var headers ={
       "Accept": "application/json;odata=verbose",
       "Content-Type": "application/json;odata=verbose",
       //"X-HTTP-Method": "POST",
       "X-RequestDigest": document.getElementById("request").value
     };
     console.log(headers);
     axios.post("https://aguadillana.sharepoint.com/DDMS/_api/web/lists/getbyTitle('Test')/items", postData,headers)
     .then(response => {
       this.getListData();
       console.log(response.data.value);
     })
     .catch(function (error) {
       console.log(error);
       console.log("failed");
     });


}

 }



});

    </script>
  </body>
</html>
