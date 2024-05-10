app.controller('userCtrl', function($scope, $rootScope, $location){

    $scope.user = {};
    $scope.users = [];
    let { serverUrl, passwdRegExp, emailRegExp, loggedUser } = $rootScope;
    $scope.url = $location.path();

    // belépés
    $scope.login = function(){
        // ha nem adott meg minden adtot
        if ($scope.user.email == null || $scope.user.passwd == null){
            alert('Nem adtad meg a bejelentkezési adtokat!');
        }else{
            // létrehozzuk a user objektumot, lekódolt jelszóval
            let data = {
                email: $scope.user.email,
                passwd: CryptoJS.SHA1($scope.user.passwd).toString()
            }
            // elküldjük a szervenek a belépési adatokat ellenőrzésre
            axios.post($rootScope.serverUrl + '/logincheck', data).then(res=>{
                // ha helyesek a belépési adatok, akkor kapunk a szervertől egy ACCESS_TOKEN-t
                if (res.data.token != ''){
                    // a tokent letároljuk a sessionStorage-ban
                    sessionStorage.setItem('access_token', JSON.stringify(res.data.token));
                    
                    // hozzáadjuk az axios-hoz, hogy innentől minden lekérdezéssel küldje el a szerver számára a kapott token-t
                    token = JSON.parse(sessionStorage.getItem('access_token'));
                    axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
                    
                    // belépünk és átirányítjuk az adatfelvétel nézetre
                    $rootScope.isLoggedIn = true;
                    $rootScope.loggedUser = $rootScope.getLoggedUserData(token);
                    $location.path('/newdata');
                    $scope.$apply();
                }else{
                    // ha nem jó adatokat ad meg
                    alert('Hibás belépési adatok!');
                }

            });
        }

    }

    // kijelentkezés
    $scope.logout = function(){
        // töröljük a sessionStorage-ből és az axios-ból a tokent-t, majd átirányítjuk a login nézetre
        sessionStorage.removeItem('access_token');
        axios.defaults.headers.common['Authorization'] = ``;
        $rootScope.isLoggedIn = false;
        $rootScope.loggedUser = null;
        $location.path('/login');
    }

    $scope.getUsers = function(){
        axios.get(serverUrl + '/felhasznalok').then(res =>{
            $scope.users = res.data;
            $scope.$apply();
        });
    }

    if ($scope.url == '/felhasznalok'){
        $scope.getUsers();
    }

    $scope.addUser = function(){
       
        let { name, email, passwd, confirm } = $scope.user;
        
        if (   ){
            alert('Nem adtál meg minden adatot!');
            return;
        }

        if (   ){
            alert('A megadott jelszavak nem egyeznek!');
            return;
        }

        if (   ){
            alert('Nem megfelelő e-mail cím formátum!');
        }

        if (   ){
            alert('A megadott jelszó nem felel meg a biztonsági kritériumoknak!');
            return;
        }

        axios.post(     ).then(res => {
            if (res.data.length > 0){
                alert('A megadott e-mail cím már foglalt!');
                return;
            }
            let data = {
                nev: name,
                email: email,
                jelszo:  jelszo = CryptoJS.SHA1(passwd).toString()
            }

            axios.post(serverUrl + '/felhasznalok', data).then(res =>{
                alert('A felhasználó felvéve!');
                $scope.getUsers();
                $scope.user = null;
                $rootScope.$emit("updateStatistics", {});
            }); 
        });

    }

    $scope.deleteUser = function(id){

        if (confirm('Biztosan törlöd a felhasználót?')){
            axios.delete(serverUrl + '/felhasznalok/'+id).then(res => {
                alert('A felhasználó törölve!');
                $scope.getUsers();
                $rootScope.$emit("updateStatistics", {});
            });
        }
    }
});