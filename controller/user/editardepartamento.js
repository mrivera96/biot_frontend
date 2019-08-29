app.controller('editardepartamento', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'

    $scope.filters = {};
    $scope.filters.search = "";

    var param = {
        IdDepartment: $rootScope.IdDepartment
    };
    $rootScope.titulo = "Editar Departamento";

    cargarDepartamento();
    function cargarDepartamento(){
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/departamento",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.departamento = response.data.respuesta;
                $scope.padres = response.data.padres;
            },
            function error(response) {
                $('#error-message').text('Error al cargar el departamento seleccionado.');
                $('#show-modal').click();
            }
        );
    }

    $scope.editardepartamento=function(dataForm) {
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/editardepartamento",
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
                    $('#error-message').text('Departamento actualizado con éxito.');
                    $('#show-modal').click();

            },
            function error(response) {
                $('#error-message').text(response.data.message);
                $('#show-modal').click();

            }
        );
    }

    $scope.verDetail = function (idUser, Departament) {
        $rootScope.idUser = idUser;
        $rootScope.department = Departament;
        $location.path('empleadoDetail');
    }

    $http({
        method: "POST",
        url: $rootScope.ipServer+"/public/api/usuariospordepartamento",
        data: $.param(param),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept':'application/json',
            'Authorization':'Bearer '+$rootScope.token
        }
    }).then(
        function success(response) {
            usuarios = response.data.respuesta;
            $scope.empleados = response.data.respuesta;

            $scope.tama = $scope.empleados.length;
            $scope.currentPage = 0;
            $scope.pageSize = 50;
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
                if (ini >= Math.ceil($scope.tama/$scope.pageSize) - 50) {
                ini = Math.ceil($scope.tama/$scope.pageSize) - 50;
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
            $('#error-message').text(response.data.message);
                $('#show-modal').click();
        }
    );
});