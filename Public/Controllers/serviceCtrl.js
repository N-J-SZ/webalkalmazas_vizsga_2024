app.controller('serviceCtrl', function($scope, $routeParams, $rootScope){
    
    $scope.title = '';
    $scope.param = $routeParams.type;
    $scope.records = [];
    $scope.fields = [];
    let { serverUrl } = $rootScope;

    switch($scope.param){
        case 'javitasok': { $scope.title = 'Javítások'; break;}
        case 'tulajdonos': { $scope.title = 'Tulajdonosok'; break;}
        case 'szerelok': { $scope.title = 'Szerelők'; break;}
        case 'tipusok': { $scope.title = 'Kerékpártípusok'; break;}
    }
    
    $scope.getRecords = function(){
        axios.get(serverUrl + '/' + $scope.param).then(res =>{
            $scope.records = res.data;
            $scope.fields = Object.keys($scope.records[0]);
            $scope.$apply();
        });
    }

    $scope.getRecords();
});