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
    template: '<button v-on:click="count++"> You clicked me {{count}} times in Planning. </button>'
  });
  var Report =  Vue.component('Report', {
      data: function (){
        return{
          count:0
        }
      },
      template: '<button v-on:click="count++"> You clicked me {{count}} times in Planning. </button>'
    });
