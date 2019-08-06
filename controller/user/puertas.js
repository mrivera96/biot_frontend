app.controller('puertas', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'

    $scope.carga = true;
    $scope.filters = {};
    $scope.filters.search = "";

    $scope.formato = false;
    $scope.mostrar = function() {
        $scope.formato = true; // no queremos que se despliegue por los momentos
    }

    $scope.ocultar = function() {
        $scope.formato = false;
    }

    

    cargarDispositivo();
    function cargarDispositivo(){
        $http({
            method: "GET",
            url: $rootScope.ipServer+"/public/api/dispositivos",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.dispositivos = response.data.data;
                $scope.carga = false;

                $scope.tama = $scope.dispositivos.length;
                $scope.currentPage = 0; 
                $scope.pageSize = 20; 
                $scope.pages = [];
                $scope.pages.length = 0;
                
                var ini = $scope.currentPage - 4;
                var fin = $scope.currentPage + 5;
                if (ini < 1) {
                    ini = 1;
                    fin = Math.ceil($scope.tama/$scope.pageSize);
                    /*if (Math.ceil($scope.tama/$scope.pageSize) > 6)
                    fin = Math.ceil($scope.tama/$scope.pageSize);
                    else
                    fin = Math.ceil($scope.tama/$scope.pageSize);*/
                } else {
                    if (ini >= Math.ceil($scope.tama/$scope.pageSize) - 20) {
                    ini = Math.ceil($scope.tama/$scope.pageSize) - 20;
                    fin = Math.ceil($scope.tama/$scope.pageSize);
                    }
                }
                if (ini < 1) ini = 1;
                for (var i = ini; i <= fin; i++) {
                    $scope.pages.push({
                    no: i
                    });
                }
        
                if ($scope.currentPage >= $scope.pages.length)
                    $scope.currentPage = $scope.pages.length - 1;
                
        
                $scope.setPage = function(index) {
                $scope.currentPage = index - 1;
                };
                
            },
            function error(response) {
                $scope.carga = false;
                alert('Error al cargar los dispositivos');
            }
        );
    }

});