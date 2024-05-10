app.controller('chartCtrl', function($scope, $rootScope){

    $scope.labels = ['Január', 'Február', 'Március', 'Április', 'Május', 'Június', 'Július', 'Augusztus', 'Szeptember', 'Október', 'November', 'December']
    $scope.data = [];
    let { serverUrl } = $rootScope;
    
    axios.get(serverUrl + '/grafikon').then(res =>{
        res.data.forEach(element => {
            $scope.data.push(element.osszeg);
        });
        $scope.$apply();
    
        const ctx = document.getElementById('chart');
  
        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: $scope.labels,
            datasets: [{
              label: 'Javítások összege hónaponként (Ft)',
              data: $scope.data,
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
    });
    
});