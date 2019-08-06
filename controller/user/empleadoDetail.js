app.controller('empleadoDetail', function($scope, $rootScope, $http, $location, $filter) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>';
    userInfo = {
        'IdUser':$rootScope.idUser
    };

    $rootScope.titulo = "Detalle de Empleado";
    $rootScope.deviceList = 0
    
    $scope.empleado ={};
    $scope.product = {};
    $rootScope.tempProduct = [];

    $scope.ver = false;
    $scope.carga = true;
    $scope.carga2 = true;
    $scope.carga3 = false;
    $scope.rango = true;

    $scope.filters = {};
    $scope.filters.search = "";

    $scope.filters2 = {};
    $scope.filters2.search = "";

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

    $scope.asistencia = {
        'fechaF':new Date(),
        'fechaI': new Date(),
        'rango':true};

    $scope.deleteDevice = function(ip,idDevice,Type){

        $scope.carga2 = true;

        if(Type == 11){
            type = "bw";
        }else{
            type = "bioface";
        }
        userDelete = {
            'IdUser':$rootScope.idUser,
            'IP':ip,
            'IdDevice':idDevice,
            'Type':type

        };
    

        if (confirm('¿Desea eliminar este dispositivo?')){
            $http({
                method: "POST",
                url: $rootScope.ipServer+"/public/api/borrarusuariodeldispositivo",
                data: $.param(userDelete),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept':'application/json',
                    'Authorization':'Bearer '+$rootScope.token
                }
            }).then(
                function success(response) {
                    alert('Dispositivo eliminado correctamente')
                    deviceList();
                },
                function error(response) {
                    
                    alert('Error al eliminar el dispositivo');
                    
                }
            );
        }
    }

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
        method: "POST",
        url: $rootScope.ipServer+"/public/api/usuario",
        data: $.param(userInfo),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept':'application/json',
            'Authorization':'Bearer '+$rootScope.token
        }
    }).then(
        function success(response) {
            var e = response.data.respuesta;
            $scope.empleado = {
                'IdUser':e.IdUser,
                'IdentificationNumber':e.IdentificationNumber,
                'Name':e.Name,
                'IdDepartment':e.IdDepartment,
                'Birthday':new Date(e.Birthday),
                'ShiftId':e.ShiftId,
                'Active':e.Active
            };
            respuesta = response.data.respuesta;
            horario = e.UseShift;
        },
        function error(response) {
            alert('Error al cargar los empleados');
        }
    );

    deviceList();
    function deviceList(){
        $scope.carga2 = true;
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/dispositivosporusuario",
            data: $.param(userInfo),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                $rootScope.deviceList = response.data.respuesta;
                $rootScope.tieneHuellas = response.data.tieneHuellas;
                $scope.carga2 = false;
   
            },
            function error(response) {
                $scope.carga2 = false;
                alert(response.data.respuesta);
                
            }
        );
    }

    $scope.agregarDispositivo = function(){
        
        var conta = 0;
        var conta2 = 0;
        
        angular.forEach($rootScope.tempProduct, function(value, key) {
            if (value.IdDevice == $scope.empleado['IdDispositivo']) {
                conta += 1;
            }
        });

        angular.forEach($rootScope.deviceList, function(value, key) {
            if (value.IdDevice == $scope.empleado['IdDispositivo']) {
                conta2 += 1;
            }
        });


        if (conta == 0) {
            if(!Array.isArray($rootScope.tieneHuellas) && $scope.deviceList != 0){
                
                alert('Sin huellas dactilares, no puede agregar otro dispositivo');
                
            }else if(!Array.isArray($rootScope.tieneHuellas) && $rootScope.tempProduct != 0){

                alert('Sin huellas dactilares, no puede agregar otro dispositivo');

            }else if  (!Array.isArray($rootScope.tieneHuellas) && $scope.deviceList == 0){
                
                if (conta2 == 0){
                    angular.forEach($rootScope.dispositivos, function(value, key){
                        if(value.IdDevice == $scope.empleado['IdDispositivo']){
                            type="bw"
                            if(value.Type!=11){
                                type="bioface";
                            }
                            $scope.product = {
                                IdDevice:$scope.empleado['IdDispositivo'],
                                IP:value.IP,
                                Type: type,
                                MachineNumber:value.MachineNumber,
                                Description:value.Description
                            };
                            $rootScope.tempProduct.push($scope.product);
                            $scope.product = {};
                            
                        }
                    });

                    
                }
                
            }else if(Array.isArray($rootScope.tieneHuellas) && $scope.deviceList != 0){
                if (conta2 == 0){
                    angular.forEach($rootScope.dispositivos, function(value, key){
                        if(value.IdDevice == $scope.empleado['IdDispositivo']){
                            type="bw"
                            if(value.Type!=11){
                                type="bioface";
                            }
                            $scope.product = {
                                IdDevice:$scope.empleado['IdDispositivo'],
                                IP:value.IP,
                                Type:type,
                                MachineNumber:value.MachineNumber,
                                Description:value.Description
                            };
                            $rootScope.tempProduct.push($scope.product);
                            $scope.product = {};
                            
                        }
                    });
                    
                } else {
                    alert('Ya tiene asignado este dispositivo')
                }
            }else if(Array.isArray($rootScope.tieneHuellas) && $scope.deviceList == 0){
                if (conta2 == 0){
                    angular.forEach($rootScope.dispositivos, function(value, key){
                        if(value.IdDevice == $scope.empleado['IdDispositivo']){
                            type="bw"
                            if(value.Type!=11){
                                type="bioface";
                            }
                            $scope.product = {
                                IdDevice:$scope.empleado['IdDispositivo'],
                                IP:value.IP,
                                Type:type,
                                MachineNumber:value.MachineNumber,
                                Description:value.Description
                            };
                            $rootScope.tempProduct.push($scope.product);
                            $scope.product = {};
                            
                        }
                    });
                    
                }
            }    
           
        }else {
            alert('Este dispositivo ya esta agregado a la lista')
        }
        
    }

    $scope.deleteMate = function(i){
        $rootScope.tempProduct.splice(i,1);
    }

    $scope.modificarEmpleados = function (userInfo) {
        /*if ($rootScope.tempProduct.length == 0){
            alert('Debe tener asignado al menos un dispositivo');
        }else if($rootScope.tieneHuellas[0] == "No"){
            alert('Se requiere que el usuario tenga por lo menos 1 huella registrada.');
        }else{*/
            $scope.carga3 = true;
            var dateObj = new Date(userInfo["Birthday"]);
            var month = dateObj.getUTCMonth() + 1; //months from 1-12
            var day = dateObj.getUTCDate();
            var year = dateObj.getUTCFullYear();
            var hora = dateObj.getHours()
            var minuto = dateObj.getMinutes()
            var segundo = dateObj.getSeconds()

            userInfo['Birthday'] = year + "-" + month + "-" + day + " " + hora + ":" + minuto + ":" + segundo;
            userInfo['listaDispositivos'] = $rootScope.tempProduct;

            angular.forEach($rootScope.tieneHuellas, function(value, key){
                $rootScope.fingers[value.FingerNumber]=value.FingerPrint;
            });
            
            userInfo['fingerprints'] = $rootScope.fingers;
            

            $scope.carga = false;

            $http({
                method: "POST",
                url: $rootScope.ipServer+"/public/api/editarusuario",
                data: $.param(userInfo),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept':'application/json',
                    'Authorization':'Bearer '+$rootScope.token
                }
            }).then(
                function success(response) {
                    $scope.carga = true;
                    $scope.carga3 = false;
                   
                    alert(''+response.data.respuesta);
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
                    deviceList();
                },
                function error(response) {
                    $scope.carga3 = false;
                 
                    alert('Error al modificar el usuario');
                }
            );
        //}
    }

     $scope.mostrar = function (paramAsisten) {
        $scope.carga = true;
        $scope.ver = true;
        $scope.tarde = 0;
        paramAsisten["IdUser"] = userInfo['IdUser'];
        var dateObj = new Date(paramAsisten["fechaF"]);
        var month = dateObj.getUTCMonth() + 1; //months from 1-12
        var day = dateObj.getUTCDate();
        var year = dateObj.getUTCFullYear();
        var numDia = dateObj.getUTCDay();

        var dateObj1 = new Date(paramAsisten["fechaI"]);
        var month1 = dateObj1.getUTCMonth() + 1; //months from 1-12
        var day1 = dateObj1.getUTCDate();
        var year1 = dateObj1.getUTCFullYear();
        var numDia1 = dateObj1.getUTCDay(); 

        mostrar = year + "-" + month + "-" + day;
        mostrar1 = year1 + "-" + month1 + "-" + day1;

        if (paramAsisten['tipo']){
            paramAsisten['fecha'] = mostrar1+","+mostrar;

        } else {
            paramAsisten['fecha'] = mostrar;
        }

        fecha = paramAsisten['fecha'];

        

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/reporteporusuario",
            data:$.param(paramAsisten),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                var reporte = response.data.respuesta;
                if (reporte) {
                    for (var i = 0; i < reporte.length; i++) {
                        /**
                         * Abreviaturas
                         * heo = hora entrada oficial
                         * meo = minutos entrada oficial
                         * hem = hora entrada marcado
                         * mem = minutos entrada marcado
                         */
                        var heo = reporte[i].hora_entrada;
                        var meo = reporte[i].minutos_entrada;
                        var hem = reporte[i].fecha_y_hora_marco_min.substring(0, 2);
                        var mem = reporte[i].fecha_y_hora_marco_min.substring(3, 5);
                        reporte[i].calculo = calculoMarcadoAtrasado(heo,meo,hem,mem);

                        /**
                         * Abreviaturas
                         * hso = hora salida oficial
                         * mso = minutos salida oficial
                         * hsm = hora salida marcado
                         * msm = minutos salida marcado
                         */
                        var hso = reporte[i].hora_salida;
                        var mso = reporte[i].minutos_salida;
                        var hsm = reporte[i].fecha_y_hora_marco_max.substring(0, 2);
                        var msm = reporte[i].fecha_y_hora_marco_max.substring(3, 5);

                        if (calculoMarcadoAdelantado(hsm,msm,hso,mso).substring(0, 1)=='-') {
                            reporte[i].salioantes = calculoMarcadoAdelantado(hsm,msm,hso,mso);
                            reporte[i].horasExtra = 'Ningunas';
                        } else {
                            reporte[i].salioantes = 'Horario cumplido';
                            reporte[i].horasExtra = horasExtras(calculoMarcadoAdelantado(hsm,msm,hso,mso));
                        }

                        var fechaMenor = new Date();
                        var fechaMayor = new Date();

                        fechaMayor.setHours(heo,meo,00,000);
                        fechaMenor.setHours(hem,mem,00,000);

                        var resta = (fechaMayor - fechaMenor);

                        if (resta < 0) {
                            if ((resta*-1)>300000) {
                                reporte[i].asis = 'Sí';
                                $scope.tarde +=1;
                            }else {
                                reporte[i].asis = 'No';
                            }
                        }else {
                            reporte[i].asis = 'No';
                        }

                        reporte[i].horaEntraExcel = reporte[i].hora_entrada+":"+reporte[i].minutos_entrada
                        reporte[i].horaSaliExcel = reporte[i].hora_salida+":"+reporte[i].minutos_salida

                    }
                    
                    $rootScope.reporteporusuario = reporte;
                    $rootScope.department = $rootScope.department
                    $rootScope.totalTeoricoFinal = response.data.totalTeoricoFinal;
                    $rootScope.totalRealTeoricoFinal = response.data.totalRealTeoricoFinal;
                    $scope.carga = false;

                    $scope.tama = $rootScope.reporteporusuario.length;
                    $scope.currentPage = 0; 
                    $scope.pageSize = 5; 
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
                }else{
                    $scope.carga = false;
                    $rootScope.reporteporusuario = {};
                    alert(response.data.message);
                }
            },
            function error(response) {
                $scope.carga = false;
               
                alert('Se produjo un error');
            }
        );
    }

    /**
     * Abreviaturas
     * hem = hora entrada marcar
     * mem = minutos entrada marcar
     * hsm = hora salida marcar
     * msm = minutos salida marcar
     */
    function calculoMarcadoAtrasado(hem,mem,hsm,msm){

        var fechaMenor = new Date();
        var fechaMayor = new Date();
        fechaMayor.setHours(hem,mem,00,000);
        fechaMenor.setHours(hsm,msm,00,000);

        var resta = (fechaMayor - fechaMenor);

        var ms = resta%1000;
            resta = (resta - ms)/1000;
        
        var secs = resta % 60;
            resta = (resta - secs) / 60;
        
        var mins = resta % 60;
        
        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs>=0 && hrs<10){
            horas = "0"+ hrs;
        }else
            horas = hrs;

        if (mins>=0 && mins<10){
            minutos = "0"+ mins;
        }else
            minutos = mins;

        if (secs>=0 && secs<10){
            segundos = "0"+ secs;
        }else
            segundos = secs;

        //0-1:0-44:00
        var tiempo = horas+":"+minutos+":"+segundos;

        var horaRetraso;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio    = "";
            horaRetraso = "-" + tiempo.replace(menos, porVacio);
        }else
            horaRetraso = tiempo;

        return horaRetraso;
    }

    /**
     * Abreviaturas
     * hso = hora salida oficial
     * mso = minutos salida oficial
     * hsm = hora salida marcado
     * msm = minutos salida marcado
     */
    function calculoMarcadoAdelantado(hsm,msm,hso,mso){

        var fechaMenor = new Date();
        var fechaMayor = new Date();
        fechaMayor.setHours(hsm,msm,00,000);
        fechaMenor.setHours(hso,mso,00,000);

        var resta = (fechaMayor - fechaMenor);

        if (resta < 0) {
            if ((resta*-1)>300000){

            }
        }

        var ms = resta%1000;
            resta = (resta - ms)/1000;
        
        var secs = resta % 60;
            resta = (resta - secs) / 60;
        
        var mins = resta % 60;
        
        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs>=0 && hrs<10){
            horas = "0"+ hrs;
        }else
            horas = hrs;

        if (mins>=0 && mins<10){
            minutos = "0"+ mins;
        }else
            minutos = mins;

        if (secs>=0 && secs<10){
            segundos = "0"+ secs;
        }else
            segundos = secs;

        //resultado 0-1:0-44:00
        var tiempo = horas+":"+minutos+":"+segundos;

        //formateo -01:44:00
        var horaAdelantada;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio    = "";
            horaAdelantada = "-" + tiempo.replace(menos, porVacio);
        }else
            horaAdelantada = tiempo;

        return horaAdelantada;
    }

    function horasExtras(tiempo) {
        if (tiempo > "00:30:00") {
            return tiempo;
        }else{
            return 'Ningunas';
        }
    }

     var mystyle = {
        sheetid: 'My Big Table Sheet',
        headers: true,
        caption: {
            title: 'Reporte de asistencia',
            style: 'font-size: 50px; color:blue;' // Sorry, styles do not works
        },
        style: '',
        column: {
            style: 'font-size:30px'
        },
        columns: [
            {columnid: 'nombre', title: 'Nombre', style:'background:#00FF00'},
            {columnid: 'departamento', title: 'Departamento', width: 300},
            {columnid: 'fecha_y_hora_marco_min', title: 'Hora marcó (entrada)'},
            {columnid: 'fecha_y_hora_marco_max', title: 'Hora marcó (salida)'},
            {columnid: 'fecha', title: 'Fecha'},
            {columnid: 'dia', title: 'Día'},
            {columnid: 'asis', title: '¿Llegó tarde?'}
        ],
    };

    $scope.exportData = function () {
        var dateObj = new Date($scope.asistencia["fechaF"]);
        var month = dateObj.getUTCMonth() + 1; //months from 1-12
        var day = dateObj.getUTCDate();
        var year = dateObj.getUTCFullYear();

        var dateObj1 = new Date($scope.asistencia["fechaI"]);
        var month1 = dateObj1.getUTCMonth() + 1; //months from 1-12
        var day1 = dateObj1.getUTCDate();
        var year1 = dateObj1.getUTCFullYear();

        mostrar = day+"/"+month+"/"+year;
        mostrar1 = day1+"/"+month1+"/"+year1;

        var fecha;

        if ($scope.asistencia.tipo){
            fecha = "del "+mostrar1+" al "+mostrar;
        }else{
            fecha = mostrar;
        }

        var mystyle = {
            sheetid: 'Asistencia',
            headers: true,
            caption: {
                title: 'Reporte de asistencia '+fecha,
                style: 'font-size: 50px; color:blue;' // Sorry, styles do not works
            },
            style: '',
            column: {
                style: 'font-size:30px'
            },
            columns: [
                {columnid: 'nombre', title: 'Nombre'},
                {columnid: 'departamento', title: 'Departamento'},
                {columnid: 'nombre_horario', title: 'Horario'},
                {columnid: 'horaEntraExcel', title: 'Hora entrada'},
                {columnid: 'fecha_y_hora_marco_min', title: 'Hora marcó (entrada)'},
                {columnid: 'horaSaliExcel', title: 'Hora salida'},
                {columnid: 'fecha_y_hora_marco_max', title: 'Hora marcó (salida)'},
                {columnid: 'fecha', title: 'Fecha'},
                {columnid: 'dia', title: 'Día'},
                {columnid: 'asis', title: '¿Llegó tarde?'},
                {columnid: 'salioantes', title: 'Salida'},
                {columnid: 'horasExtra', title: 'Horas Extras'}
            ],
        };

        $scope.result = $filter('filter')($rootScope.reporteporusuario, $scope.filters.search);
        alasql('SELECT * INTO XLS("Reporte asistencia.xls",?) FROM ?',[mystyle,$scope.result]);
    };
});

