app.controller('statCtrl', function($scope, $rootScope){

    const { serverUrl, penznem } = $rootScope;
   
    $scope.getStatistics = function(){
   
    }

    $scope.getStatistics();

    $rootScope.$on("updateStatistics", function(){
        $scope.getStatistics();
     });
});