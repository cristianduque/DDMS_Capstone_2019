
var misc= new Vue({
          el: '#misc',
          data: {
            // Upcoming Demos
            costs: [
              { text: '$10' },
              { text: '$30' },
              { text: '$45' }
            ]
          },
          methods: {
             
            updateCosts: function () {
                
            },
      },
      
      //Run functions @ page-load
      beforeMount(){
      this.updateCosts();
      
   
 },
})
 