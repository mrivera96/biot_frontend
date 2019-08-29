app.controller('usuariospordispositivo', function($scope, $rootScope, $http, $location, $filter) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'
    $scope.carga = true;
    $scope.filters = {};
    $scope.filters.search = "";
    $rootScope.titulo = "Usuarios por dispositivo";
    var param = {
         IdDevice: $rootScope.IdDevice
        ,IP: $rootScope.IP
        ,Type: $rootScope.Type
    };



    cargarUsuariosPorDispositivo();
    function cargarUsuariosPorDispositivo(){
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/usuariospordispositivo",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.usuariospordispositivo = response.data.respuesta;
                $scope.carga = false;

                $scope.tama = $scope.usuariospordispositivo.length;
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
                $scope.carga = false;

             $('#error-message').text(response.data.respuesta);
            $('#show-modal').click();

            }
        );
    }

    cargarDispositivo();
    function cargarDispositivo(){
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/dispositivo",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $scope.dispositivo = response.data.respuesta;
            },
            function error(response) {

             $('#error-message').text('Error al cargar los usuarios por dispositivo.');
            $('#show-modal').click();

            }
        );
    }

    $scope.editardispositivo=function(dataForm) {


        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/editardispositivo",
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
             $('#error-message').text(response.data.message);
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


    $scope.exportData = function () {

        var mystyle = {
            sheetid: 'My Big Table Sheet',
            headers: true,
            caption: {
                title: 'Reporte de usuarios en biométricos',
                style: 'font-size: 50px; color:blue;' // Sorry, styles do not works
            },
            style: '',
            column: {
                style: 'font-size:30px'
            },
            columns: [
                { columnid: 'IdUser', title: 'Código de Empleado' },
                { columnid: 'Name', title: 'Nombre' },
                { columnid: 'IdentificationNumber', title: 'Número de Identidad' },
                { columnid: 'Description', title: 'Departamento' },
                { columnid: 'Active', title: 'Activo' }
            ],
        };


        $scope.result = $filter('filter')($scope.usuariospordispositivo, $scope.filters.search);
        alasql('SELECT * INTO XLS("Reporte acceso.xls",?) FROM ?', [mystyle, $scope.result]);
    };
});