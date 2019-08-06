app.controller('empleados', function($scope, $rootScope, $http, $location, $filter) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'
    $scope.crear = false;
    $scope.carga = true;
    $scope.carga2 = true;
    $scope.filters = {};
    $scope.filters.search = "";
    $rootScope.titulo = "Empleados";
    $scope.empleado = {'fechaF':new Date()};

    $scope.product = {};
    $rootScope.tempProduct = []
    $rootScope.fingers = ["",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""];

    $scope.crearEmpleado = function () {
        $scope.crear = true;
    }


    $scope.descartarEmpleado = function () {
        $scope.crear = false;
        $scope.empleado = {'fechaF':new Date()};
    }

    loadEmployees();
    function loadEmployees(){
        $http({
            method: "GET",
            url: $rootScope.ipServer+"/public/api/usuarios",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $rootScope.empleados = response.data.respuesta;
                $scope.carga2 = false;
             
                $rootScope.pagination($rootScope.empleados.length,50);
            },
            function error(response) {
                $scope.carga2 = false;
                alert('Error al cargar los empleados');
            }
        );
    }

    $scope.filterData = function (data) {
        tama = $filter('filter')($rootScope.empleados, data);
        $rootScope.pagination(tama.length,50);
    };

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
            $scope.departments = response.data.respuesta;
        },
        function error(response) {
            alert('Se produjo un error al cargar los departamentos');
        }
    );

    $http({
        method: "GET",
        url: $rootScope.ipServer+"/public/api/horarios",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept':'application/json',
            'Authorization':'Bearer '+$rootScope.token
        }
    }).then(
        function success(response) {
            $scope.horarios = response.data.respuesta;
        },
        function error(response) {
            alert('Se produjo un error al cargar los horarios');
        }
    );

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
            $rootScope.dispositivos = response.data.data;
           
        },
        function error(response) {
            alert('Error al cargar los dispositivos');
        }
    );

    $scope.agregarDispositivo = function(){
        var conta = 0;
        angular.forEach($rootScope.tempProduct, function(value, key) {
            if (value.IdDevice == $scope.empleado['IdDispositivo']) {
                conta += 1;
            }
        });

        vacio = 0;
        for (i = 0; i < $rootScope.fingers.length; i++) {
            if ($rootScope.fingers[i]==""){
                vacio+=1;
            }
        }

        if (conta == 0) {
            if (vacio==10 && $rootScope.tempProduct.length == 0){
                angular.forEach($rootScope.dispositivos, function(value, key){
                    tipo = 'bw';
                    if (value.Type = 12){
                        tipo = 'bioface'
                    }

                    if(value.IdDevice == $scope.empleado['IdDispositivo']){
                        $scope.product = {
                            IdDevice:$scope.empleado['IdDispositivo'],
                            IP:value.IP,
                            Type:tipo,
                            MachineNumber:value.MachineNumber,
                            Description:value.Description
                        };
                        $rootScope.tempProduct.push($scope.product);
                        $scope.product = {};
                    }
                });

                alert('Sin huellas dactilares, solo se puede agregar un dispositivo');

            }else if(vacio >=0 && vacio<10){
                angular.forEach($rootScope.dispositivos, function(value, key){
                    if(value.IdDevice == $scope.empleado['IdDispositivo']){
                        $scope.product = {
                            IdDevice:$scope.empleado['IdDispositivo'],
                            IP:value.IP,
                            Type:tipo,
                            MachineNumber:value.MachineNumber,
                            Description:value.Description
                        };
                        $rootScope.tempProduct.push($scope.product);
                        $scope.product = {};
                    }
                });
            }
        }
    }

    $scope.deleteMate = function(i){
        $rootScope.tempProduct.splice(i,1);
    }

    $scope.verDetail = function (idUser, Departament) {
        $rootScope.idUser = idUser;
        $rootScope.department = Departament;
        $location.path('empleadoDetail');
    }

    $scope.guardarEmpleados = function (userInfo) {
        if ($rootScope.tempProduct.length == 0){
            alert('Debe tener asignado al menos un dispositivo');
        }else{
            var dateObj = new Date(userInfo["fechaF"]);
            var month = dateObj.getUTCMonth() + 1; //months from 1-12
            var day = dateObj.getUTCDate();
            var year = dateObj.getUTCFullYear();
            var hora = dateObj.getHours()
            var minuto = dateObj.getMinutes()
            var segundo = dateObj.getSeconds()

            userInfo['Birthday'] = year + "-" + month + "-" + day + " " + hora + ":" + minuto + ":" + segundo;
            userInfo['UseShift'] = 'TRUE';
            userInfo['listaDispositivos'] = $rootScope.tempProduct;
            userInfo['fingerprints'] = $rootScope.fingers;

            $scope.carga = false;

            $http({
                method: "POST",
                url: $rootScope.ipServer+"/public/api/crearusuario",
                data: $.param(userInfo),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept':'application/json',
                    'Authorization':'Bearer '+$rootScope.token
                }
            }).then(
                function success(response) {
                    $scope.carga = true;
                    alert(''+response.data.respuesta);
                    $scope.crear = false;
                    $scope.empleado = {'fechaF':new Date()};
                    $rootScope.tempProduct = []
                    $rootScope.fingers = [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""];
                    loadEmployees();
                },
                function error(response) {
                    alert('Error al crear el administrador.');
                }
            );
        }
    }
});
