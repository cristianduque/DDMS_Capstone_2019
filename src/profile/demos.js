var misc= new Vue({
          el: '#demos',
          data: {
            // Upcoming Demos
            demos: [
              { text: 'Supermercado Colegio - Mayaguez' },
              { text: 'Pueblo - Mayaguez' },
              { text: '' }
            ]
          },
          methods: {
             
            getDemos: function () {
                
            },
      },
      
      //Run functions @ page-load
      beforeMount(){
      this.getDemos();
      
   
 },
})