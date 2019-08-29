app.controller('permisosusuarios', function ($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>';
    data = {
        'id_user': $rootScope.idUser
    };
    $rootScope.titulo = "Detalle de Usuario";
    $scope.cargar = true;

    $scope.tempDevArray = [];
    $scope.tempDeptArray = [];
    $scope.newDev = {};

loadData();
    function loadData(){
        $http({
            method: "POST",
            url: $rootScope.ipServer + "/public/api/platformuserData",
            data: $.param(data),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + $rootScope.token
            }
        }).then(
            function success(response) {
                $scope.currUsr = {};
                $scope.currUsr.id = $rootScope.idUser;
                $scope.currUsr.name = response.data.name;
                $scope.currUsr.last_name = response.data.last_name;
                $scope.currUsr.genero = response.data.genero;
                $scope.currUsr.no_identidad = response.data.no_identidad;
                $scope.currUsr.email = response.data.email;
                $scope.currUsr.telefono = response.data.telefono;
                $scope.currUsr.departments=[];
                doorlist();
                deptslist();
                $scope.cargar=false;
            },
            function error(response) {

             $('#error-message').text('Error al consultar los datos del usuario.');
            $('#show-modal').click();


            }
        );
    }


    function doorlist() {
        $http({
            method: "POST",
            url: $rootScope.ipServer + "/public/api/verpermisosdoor",
            data: $.param({
                'id_user': $scope.currUsr.id,
                'nombre': 1
            }),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + $rootScope.token
            }
        }).then(
            function success(response) {
                $scope.currUsr.devices = response.data.puertas;
            },
            function error(response) {

             $('#error-message').text('Error al cargar los dispositivos.');
            $('#show-modal').click();

            }
        );
    };


    $http({
        method: "GET",
        url: $rootScope.ipServer + "/public/api/departamentos",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + $rootScope.token
        }
    }).then(
        function success(response) {
            $scope.departamentos = response.data.respuesta;

        },
        function error(response) {

             $('#error-message').text('Error al cargar los departamentos.');
            $('#show-modal').click();


        }
    );


    function deptslist() {
        $http({
            method: "POST",
            url: $rootScope.ipServer + "/public/api/verdepartments",
            data: $.param({
                'id_user': $scope.currUsr.id
            }),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + $rootScope.token
            }
        }).then(
            function success(response) {
                //$scope.currUsr.departments = response.data.departamentos;
                angular.forEach($scope.departamentos, function(value){
                    angular.forEach(response.data.departamentos, function(value1){
                        if(value.IdDepartment==value1.Id_department){
                            newDepto={
                                Id_department:value1.Id_department,
                                Description:value.Description
                            };
                            $scope.currUsr.departments.push(newDepto);

                        }
                    });
                });

            },
            function error(response) {

             $('#error-message').text('Error al cargar los departamentos del usuario.');
            $('#show-modal').click();

            }
        );
    };

    $http({
        method: "GET",
        url: $rootScope.ipServer + "/public/api/dispositivos",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + $rootScope.token
        }
    }).then(
        function success(response) {
            $scope.dispositivos = response.data.data;

        },
        function error(response) {

             $('#error-message').text('Error al cargar los dispositivos.');
            $('#show-modal').click();

        }
    );

    $scope.permisos = {
        reporasis: false,
        creaemp: false,
        agdispemp: false,
        editemp: false,
        reghue: false,
        deledispemp: false,
        dept: false,
        creadisp: false,
        opdoor: false,
        editdisp: false,
        exportusrdisp: false,
        mapadisp: false,
        edithrs: false,
        creaparam: false,
        crearusrs: false,
        editusrs: false,
        param_sect:false,
        users_sect:false,
        hors_sect:false,
        btn_editemp:false
    };

    $scope.agregarDispositivo = function () {

        var conta = 0;
        var conta2 = 0;

        angular.forEach($scope.tempDevArray, function (value, key) {
            if (value.IdDevice == $scope.currUsr.selectedDevice) {
                conta += 1;
            }
        });

        angular.forEach($scope.currUsr.devices, function (value, key) {
            if (value.Id_Device == $scope.currUsr.selectedDevice) {
                conta2 += 1;
            }
        });

        if (conta == 0) {
            if (conta2 == 0) {
                angular.forEach($scope.dispositivos, function (value, key) {
                    if (value.IdDevice == $scope.currUsr.selectedDevice) {
                        $scope.newDev = {
                            IdDevice: $scope.currUsr.selectedDevice,
                            description: value.Description
                        };
                    }
                });

                $scope.tempDevArray.push($scope.newDev);
                $scope.newDev = {};
            } else {
                 $('#modal-header').removeClass('alert-danger').addClass('alert-info');
            $('#modal-title').text('¡Atención!');
             $('#error-message').text('Ya tiene asignado este dispositivo.');
            $('#show-modal').click();

            }

        } else {
            $('#modal-header').removeClass('alert-danger').addClass('alert-info');
            $('#modal-title').text('¡Atención!');
             $('#error-message').text('Este dispositivo ya está agregado a la lista.');
            $('#show-modal').click();

        }
    };

    $scope.deleteMate = function (i) {
        $scope.tempDevArray.splice(i, 1);
    }

    $scope.agregarDepartamento = function () {

        var conta = 0;
        var conta2 = 0;

        angular.forEach($scope.tempDeptArray, function (value, key) {
            if (value.Id_department == $scope.currUsr.selectedDept) {
                conta += 1;
            }
        });

        angular.forEach($scope.currUsr.departments, function (value, key) {
            if (value.Id_department == $scope.currUsr.selectedDept) {
                conta2 += 1;
            }
        });

        if (conta == 0) {
            if (conta2 == 0) {
                angular.forEach($scope.departamentos, function (value, key) {
                    if (value.IdDepartment == $scope.currUsr.selectedDept) {
                        $scope.newDept = {
                            Id_department: $scope.currUsr.selectedDept,
                            description: value.Description
                        };
                    }
                });

                $scope.tempDeptArray.push($scope.newDept);
                $scope.newDept = {};
            } else {
                 $('#modal-header').removeClass('alert-danger').addClass('alert-info');
            $('#modal-title').text('¡Atención!');
             $('#error-message').text('Ya tiene asignado este departamento.');
            $('#show-modal').click();

            }

        } else {
             $('#modal-header').removeClass('alert-danger').addClass('alert-info');
            $('#modal-title').text('¡Atención!');
             $('#error-message').text('Este departamento ya está agregado a la lista.');
            $('#show-modal').click();

        }
    };

    $scope.deleteMate1 = function (i) {
        $scope.tempDeptArray.splice(i, 1);
    }

    $scope.deleteDepartment = function(IdDepartment){
        userDelete = {
            'id_user': $rootScope.idUser,
            'id_depto': IdDepartment
        };

        if (confirm('¿Desea eliminar este departamento?')) {
            $http({
                method: "POST",
                url: $rootScope.ipServer + "/public/api/deletedepartments",
                data: $.param(userDelete),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ' + $rootScope.token
                }
            }).then(
                function success(response) {
                     $('#modal-header').removeClass('alert-danger').addClass('alert-success');
            $('#modal-title').text('¡Éxito!');
             $('#error-message').text('Departamento eliminado correctamente.');
            $('#show-modal').click();

                    loadData();
                },
                function error(response) {

             $('#error-message').text('Error al eliminar el departamento.');
            $('#show-modal').click();


                }
            );
        }
    };

    $scope.deleteDevice = function (idDevice) {

        userDelete = {
            'id_user': $rootScope.idUser,
            'id_device': idDevice
        };


        if (confirm('¿Desea eliminar este dispositivo?')) {
            $http({
                method: "POST",
                url: $rootScope.ipServer + "/public/api/borrarpermisosdoor",
                data: $.param(userDelete),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ' + $rootScope.token
                }
            }).then(
                function success(response) {
                     $('#modal-header').removeClass('alert-danger').addClass('alert-success');
            $('#modal-title').text('¡Éxito!');
             $('#error-message').text('Dispositivo eliminado correctamente.');
            $('#show-modal').click();

                    loadData();
                },
                function error(response) {

             $('#error-message').text('Error al eliminar el dispositivo.');
            $('#show-modal').click();



                }
            );
        }
    }


    $http({
        method: "POST",
        url: $rootScope.ipServer + "/public/api/verpermisos",
        data: $.param(data),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + $rootScope.token
        }
    }).then(
        function success(response) {

            if (response.data != "Este usuario no tiene permisos asignados") {
                $scope.permisos = response.data.permisos;

                angular.forEach($scope.permisos, function (value, key) {

                    if (value != 0) {
                        document.getElementById("" + key + "").click();
                    }

                });

            }

        },
        function error(response) {

             $('#error-message').text(response.data);
            $('#show-modal').click();
        }
    );


    $scope.guardarDatos = function (dataForm) {
        $scope.cargar = true;
        dataForm.dispositivos = $scope.tempDevArray;
        dataForm.departamentos= $scope.tempDeptArray;
        $http({
            method: "POST",
            url: $rootScope.ipServer + "/public/api/actplatformuser",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + $rootScope.token
            }
        }).then(
            function success(response) {
                 $('#modal-header').removeClass('alert-danger').addClass('alert-success');
            $('#modal-title').text('¡Éxito!');
             $('#error-message').text('Usuario actualizado con éxito.');
            $('#show-modal').click();

                $scope.tempDevArray=[];
                $scope.tempDeptArray=[];
                loadData();
            },
            function error(response) {

             $('#error-message').text('Error al modificar el usuario.');
            $('#show-modal').click();

                $scope.cargar = false;
            }
        );

    };

    $scope.guardar = function () {
        $scope.cargar = true;
        data1 = {
            'id_user': $rootScope.idUser,
            'permissions': $scope.permisos
        };

        $http({
            method: "POST",
            url: $rootScope.ipServer + "/public/api/guardarpermisos",
            data: $.param(data1),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + $rootScope.token
            }
        }).then(
            function success(response) {
                $scope.cargar = false;
                 $('#modal-header').removeClass('alert-danger').addClass('alert-success');
            $('#modal-title').text('¡Éxito!');
             $('#error-message').text(response.data);
            $('#show-modal').click();

                window.location.href = "";


            },
            function error(response) {
                $scope.cargar = false;

             $('#error-message').text(response.data);
            $('#show-modal').click();

            }
        );


    };


});
