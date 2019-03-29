 var getAlerts= new Vue({
          el: '#alerts',
          data: {
            // Upcoming Demos
            alerts: [
              { text: 'Today!' },
              { text: 'In 2 days' },
              { text: 'In 1 week' }
            ]
          },
         methods: {
             // Current day demo
             alert() {
              this.$swal("Demo hoy!", "Supermercado Colegial", "info", );
            },
            // Update alert count
            updateAlert: function () {
                var header = document.getElementById("AH!");
                header.innerHTML += " (3)";
        }
      },
     
      // Run functions @ page-load
      beforeMount(){
      this.updateAlert();
      this.alert();
 },
})
 
