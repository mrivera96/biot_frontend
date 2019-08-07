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
    
                alert("Error al consultar los datos del usuario.");
    
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
                alert('Error al cargar los dispositivos');
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
            alert('Error al cargar los departamentos');
            
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
                alert('Error al cargar los departamentos del usuario');
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
            alert('Error al cargar los dispositivos');
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
        editusrs: false
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
                alert('Ya tiene asignado este dispositivo')
            }

        } else {
            alert('Este dispositivo ya esta agregado a la lista')
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
                alert('Ya tiene asignado este departamento')
            }

        } else {
            alert('Este departamento ya esta agregado a la lista')
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
                    alert('Departamento eliminado correctamente');
                    loadData();
                },
                function error(response) {

                    alert('Error al eliminar el departamento');

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
                    alert('Dispositivo eliminado correctamente');
                    loadData();
                },
                function error(response) {

                    alert('Error al eliminar el dispositivo');

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

            alert(response.data);
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
                alert('Usuario actualizado con éxito.');
                $scope.tempDevArray=[];
                $scope.tempDeptArray=[];
                loadData();
            },
            function error(response) {
                alert('Error al modificar el usuario.');
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
                alert(response.data);
                window.location.href = "";


            },
            function error(response) {
                $scope.cargar = false;
                alert(response.data);
            }
        );


    };
    

});
