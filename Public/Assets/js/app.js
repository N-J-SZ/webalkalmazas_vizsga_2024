let app = angular.module('kerekparApp', ['ngRoute']);

app.run(function($rootScope, $window){
    $rootScope.appTitle = "Kerékpár Web Szervíz";
    $rootScope.subTitle = "Webfejlesztés vizsgafeladat";
    $rootScope.company = "Bajai SZC Türr István Technikum";
    $rootScope.classroom = "5/13.SZOFT";
    $rootScope.author = "";
    $rootScope.workstation = "";
    $rootScope.year = "2024.";
    $rootScope.isLoggedIn = false;
    $rootScope.serverUrl = "";
    $rootScope.penznem = "Ft";

    $rootScope.emailRegExp = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    $rootScope.passwdRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;

    $rootScope.getLoggedUserData = function(token){
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace('-', '+').replace('_', '/');
        user = JSON.parse($window.atob(base64));
        loggedUser = {
            ID: user.ID,
            name: user.name,
            email: user.email
        }
        return loggedUser;
    }

    if(sessionStorage.getItem('access_token')){
        $rootScope.isLoggedIn = true;
        token = JSON.parse(sessionStorage.getItem('access_token'));
        $rootScope.loggedUser = $rootScope.getLoggedUserData(token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
    }

});

app.config(function($routeProvider){
    $routeProvider

    .when('/home', {
        templateUrl: 'Views/feladatleiras.html',
    })

    .when('/list/:type', {
        templateUrl: 'Views/lista.html',
        controller: 'serviceCtrl'
    })

    .when('/felhasznalok', {
        templateUrl: 'Views/felhasznalok.html',
        controller: 'userCtrl'
    })

    .when('/naptar', {
        templateUrl: 'Views/naptar.html',
        controller: 'calendarCtrl'
    })

});
