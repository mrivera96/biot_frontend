app.controller('departamentos', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'

    $scope.carga = true;
    $scope.filters = {};
    $scope.filters.search = "";

    $rootScope.titulo = "Departamentos";

    $scope.formato = false;
    $scope.mostrar = function() {
        $scope.formato = true;
    }


    $scope.ocultar = function() {
        $scope.formato = false;
    }

    cargarDepartaments();
    function cargarDepartaments(){
        $http({
            method: "GET",
            url: $rootScope.ipServer+"/public/api/departamentos",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.departamentos = response.data.respuesta;
                $scope.carga = false;

                $scope.tama = $scope.departamentos.length;
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
                $('#error-message').text('Error al cargar los departamentos.');
                $('#show-modal').click();

            }
        );
    }

    $scope.creardepartamento=function(dataForm) {



        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/creardepartamento",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                document.getElementById('IdParent').value = "";
                document.getElementById('Description').value = "";
                document.getElementById('SupervisorName').value = "";
                cargarDepartaments();
            },
            function error(response) {
                 $('#error-message').text('Error al cargar los usuarios por dispositivo.');
                $('#show-modal').click();

            }
        );
    }

    $scope.editardepartamento=function(IdDepartment) {
        $rootScope.IdDepartment=IdDepartment;
        $location.path('editardepartamento');
    }

});