  var vm = new Vue({
      el: '#hours',
      data: function () {
        return {
            
          headers: [
            {
              text: '',
              align: 'left',
              sortable: false,
              value: 'name',
              width: '25%'
            },
            { text: 'Entrada', value: 'entrance', width: '15%',sortable: false, align: 'center', },
            { text: 'Salida', value: 'exit', width: '15%',sortable: false, align: 'center', },
           
          ],
          reports: [
            {
              value: false,
              name: 'Horas Establecidas',
              entrance: '11:00',
              exit: "4:00",
            },
                        {
              value: false,
              name: 'Horas Registradas',
              entrance: '11:00',
              exit: "4:02",
            },
          ]
        }
      }
    })