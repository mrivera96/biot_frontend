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

             $('#error-message').text('Error al cargar los parámetros');
            $('#show-modal').click();

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
                 $('#modal-header').removeClass('alert-danger').addClass('alert-success');
            $('#modal-title').text('¡Éxito!');
             $('#error-message').text('Parámetro creado con éxito.');
            $('#show-modal').click();
                cargarParametros();
            },
            function error(response) {

             $('#error-message').text('Error al crear un nuevo parámetro del sistema.');
            $('#show-modal').click();

            }
        );
    }

    $scope.editarparametro=function(id) {
        $rootScope.id=id;
        //$location.path('editardepartamento');
    }

});