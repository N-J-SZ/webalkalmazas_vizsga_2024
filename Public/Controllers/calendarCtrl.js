app.controller('calendarCtrl', function($scope, $rootScope){
  
  $scope.events = [];
  let { serverUrl } = $rootScope;
  
  axios.get(serverUrl + '/javitasok').then(res =>{
    res.data.forEach(element => {
        $scope.events.push(     
            { 
              title: element.Tulajdonos + ' [ szerelő: ' + element.Szerelő + ' ]', 
              start: moment(element.Dátum).format('YYYY-MM-DD'), 
              end: moment(element.Dátum).add(element.Javításidő,'d').format('YYYY-MM-DD'),
              borderColor: '#60b5ef',
              backgroundColor: '#9ad0f5',
              textColor: '#000000'
            }
        );
    });
    $scope.$apply();
    
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      initialView: 'dayGridMonth',
      initialDate: '2019-01-01',
      editable: false,
      selectable: false,
      events: $scope.events
    });

    calendar.render();
    
  });
    
});