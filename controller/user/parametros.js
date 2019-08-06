app.controller('parametros', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'

    $scope.filters = {};
    $scope.filters.search = "";
    $rootScope.titulo = "Parámetros del Sistema";
    $scope.formato = false;
    $scope.mostrar = function() {
        $scope.formato = true;
    }


    $scope.ocultar = function() {
        $scope.formato = false;
    }

    cargarParametros();
    function cargarParametros(){
        $http({
            method: "GET",
            url: $rootScope.ipServer+"/public/api/parametros",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.parametros = response.data.respuesta;
                respuesta = response;
            },
            function error(response) {
                alert('Error al cargar los parametros');
            }
        );
    }

    $scope.crearparametro=function(dataForm) {

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/crearparametro",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                alert('Parámetro creado con éxito');
                cargarParametros();
            },
            function error(response) {
                alert('Error al crear un nuevo parametro del sistema.');
            }
        );
    }

    $scope.editarparametro=function(id) {
        $rootScope.id=id;
        //$location.path('editardepartamento');
    }

});