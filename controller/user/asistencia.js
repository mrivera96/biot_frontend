app.controller('asistencia', function ($scope, $rootScope, $http, $location, $filter) {

    $rootScope.token = '<?php echo $_SESSION["token"];?>'
    $rootScope.titulo = "Reportes de asistencia";
    $scope.ver = false;

    $scope.carga = true;

    $scope.rango = true;

    $scope.filters = {};
    $scope.filters.search = "";

    $scope.asistencia = {
        'fechaF': new Date(),
        'fechaI': new Date(),
        'rango': true
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
            $scope.departments = response.data.respuesta;
        },
        function error(response) {
            alert('Se produjo un error');
        }
    );

    $scope.mostrar = function (paramAsisten) {
        $scope.carga = true;
        $scope.ver = true;
        $scope.tarde = 0;
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

        //paramAsisten['fechaF'] = new Date(mostrar);
        //paramAsisten['fechaI'] = new Date(mostrar1);
        if (paramAsisten['tipo']) {
            paramAsisten['fecha'] = mostrar1 + "," + mostrar;

        } else {
            paramAsisten['fecha'] = mostrar;
        }

        fecha = paramAsisten['fecha'];
        paramAsisten['DayId'] = numDia - 1;

        if (paramAsisten['DayId'] >= 0 && paramAsisten['DayId'] < 5) {
            $http({
                method: "POST",
                url: $rootScope.ipServer + "/public/api/reportes",
                data: $.param(paramAsisten),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ' + $rootScope.token
                }
            }).then(
                function success(response) {
                   
                    var reporte = response.data.respuesta;

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
                        reporte[i].calculo = calculoMarcadoAtrasado(heo, meo, hem, mem);

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

                        if (calculoMarcadoAdelantado(hsm, msm, hso, mso).substring(0, 1) == '-') {
                            reporte[i].salioantes = calculoMarcadoAdelantado(hsm, msm, hso, mso);
                        } else {
                            reporte[i].salioantes = 'Salida correcta';
                        }

                        var fechaMenor = new Date();
                        var fechaMayor = new Date();

                        fechaMayor.setHours(heo, meo, 00, 000);
                        fechaMenor.setHours(hem, mem, 00, 000);
                        if (hsm > hso) {
                            reporte[i].extras = calculoHorasExtrasSalida(hsm, msm, hso, mso);
                        } else {
                            reporte[i].extras = 0;
                        }

                        reporte[i].hreales = calculoHorasReales(hsm, msm, hem, mem);


                        var resta = (fechaMayor - fechaMenor);

                        if (resta < 0) {
                            if ((resta * -1) > 300000) {
                                reporte[i].asis = 'Sí';
                                $scope.tarde += 1;
                            } else {
                                reporte[i].asis = 'No';
                            }
                        } else {
                            reporte[i].asis = 'No';
                        }

                        reporte[i].horaEntraExcel = reporte[i].hora_entrada + ":" + reporte[i].minutos_entrada
                        reporte[i].horaSaliExcel = reporte[i].hora_salida + ":" + reporte[i].minutos_salida

                    }

                    $rootScope.reporte = reporte;
                    $scope.carga = false;

                    /*$scope.tama = $rootScope.reporte.length;
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
                        fin = Math.ceil($scope.tama/$scope.pageSize);
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
                    };*/

                },
                function error(response) {
                    alert('Se produjo un error');
                }
            );

        } else {
            alert('Lo sentimos, el día que está solicitando no es parte de los horarios de contratos');
            $scope.carga = false;
        }
    }

    /**
     * Abreviaturas
     * hem = hora entrada marcar
     * mem = minutos entrada marcar
     * hsm = hora salida marcar
     * msm = minutos salida marcar
     */
    function calculoHorasExtrasSalida(hsm, msm, hso, mso) {
        var fechaMenor = new Date();
        var fechaMayor = new Date();
        fechaMayor.setHours(hsm, msm, 00, 000);
        fechaMenor.setHours(hso, mso, 00, 000);

        var resta = (fechaMayor - fechaMenor);

        var ms = resta % 1000;
        resta = (resta - ms) / 1000;

        var secs = resta % 60;
        resta = (resta - secs) / 60;

        var mins = resta % 60;

        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs >= 0 && hrs < 10) {
            horas = "0" + hrs;
        } else
            horas = hrs;

        if (mins >= 0 && mins < 10) {
            minutos = "0" + mins;
        } else
            minutos = mins;

        if (secs >= 0 && secs < 10) {
            segundos = "0" + secs;
        } else
            segundos = secs;

        //0-1:0-44:00
        var tiempo = horas + ":" + minutos + ":" + segundos;

        var horasEstras;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio = "";
            horasExtras = "-" + tiempo.replace(menos, porVacio);
        } else
            horasExtras = tiempo;

        return horasExtras;

    }


    function calculoHorasReales(hsm, msm, hem, mem) {
        var fechaMenor = new Date();
        var fechaMayor = new Date();
        var fdesa = new Date();
        var fdesa1 = new Date();
        var falm = new Date();
        var falm1 = new Date();

        fdesa1.setHours(8, 35);
        fdesa.setHours(8, 00);

        falm1.setHours(12, 45);
        falm.setHours(12, 00);

        fechaMayor.setHours(hsm, msm, 00, 000);
        fechaMenor.setHours(hem, mem, 00, 000);

        var resta = (fechaMayor - fechaMenor) - (fdesa1 - fdesa) - (falm1 - falm);

        var ms = resta % 1000;
        resta = (resta - ms) / 1000;

        var secs = resta % 60;
        resta = (resta - secs) / 60;

        var mins = resta % 60;

        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs >= 0 && hrs < 10) {
            horas = "0" + hrs;
        } else
            horas = hrs;

        if (mins >= 0 && mins < 10) {
            minutos = "0" + mins;
        } else
            minutos = mins;

        if (secs >= 0 && secs < 10) {
            segundos = "0" + secs;
        } else
            segundos = secs;

        //0-1:0-44:00
        var tiempo = horas + ":" + minutos + ":" + segundos;

        var horasReales;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio = "";
            horasReales = "-" + tiempo.replace(menos, porVacio);
        } else
            horasReales = tiempo;

        var horasRealesSalida;
        if (horasReales.includes("-")) {
            horasRealesSalida = 0;
        } else {
            horasRealesSalida = horasReales.substring(1, 2) + " horas " + horasReales.substring(3, 5) + " minutos";
        }
        return horasRealesSalida;

    }

    function calculoMarcadoAtrasado(hem, mem, hsm, msm) {

        var fechaMenor = new Date();
        var fechaMayor = new Date();
        fechaMayor.setHours(hem, mem, 00, 000);
        fechaMenor.setHours(hsm, msm, 00, 000);

        var resta = (fechaMayor - fechaMenor);

        var ms = resta % 1000;
        resta = (resta - ms) / 1000;

        var secs = resta % 60;
        resta = (resta - secs) / 60;

        var mins = resta % 60;

        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs >= 0 && hrs < 10) {
            horas = "0" + hrs;
        } else
            horas = hrs;

        if (mins >= 0 && mins < 10) {
            minutos = "0" + mins;
        } else
            minutos = mins;

        if (secs >= 0 && secs < 10) {
            segundos = "0" + secs;
        } else
            segundos = secs;

        //0-1:0-44:00
        var tiempo = horas + ":" + minutos + ":" + segundos;

        var horaRetraso;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio = "";
            horaRetraso = "-" + tiempo.replace(menos, porVacio);
        } else
            horaRetraso = tiempo;

        return horaRetraso;

        /*var horas, minutos, segundos;
        if (hrs>=0 && hrs<10){
            horas = "0"+ hrs;
        }else if (hrs > (-10) && hrs < (0)) {
            var menos = "-";
            var porCero    = "-0";
            var hrsReplace = hrs+"";
            horas = hrsReplace.replace(menos, porCero);
        }else
            horas = hrs;

        if (mins>=0 && mins<10){
            minutos = "0"+ mins;
        }else if (mins > (-10) && mins < (0)){
            var menos = "-";
            var porCero    = "0";
            var minsReplace = mins+"";
            minutos = minsReplace.replace(menos, porCero);
        }else
            minutos = mins;

        if (secs>=0 && secs<10){
            segundos = "0"+ secs;
        }else if (secs > (-10) && secs < (0)) {
            var menos = "-";
            var porCero    = "0";
            var secsReplace = secs+"";
            segundos = secsReplace.replace(menos, porCero);
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
            horaRetraso = tiempo;*/
    }

    /**
     * Abreviaturas
     * hso = hora salida oficial
     * mso = minutos salida oficial
     * hsm = hora salida marcado
     * msm = minutos salida marcado
     */
    function calculoMarcadoAdelantado(hsm, msm, hso, mso) {

        var fechaMenor = new Date();
        var fechaMayor = new Date();
        fechaMayor.setHours(hsm, msm, 00, 000);
        fechaMenor.setHours(hso, mso, 00, 000);

        var resta = (fechaMayor - fechaMenor);

        if (resta < 0) {
            if ((resta * -1) > 300000) {

            }
        }

        var ms = resta % 1000;
        resta = (resta - ms) / 1000;

        var secs = resta % 60;
        resta = (resta - secs) / 60;

        var mins = resta % 60;

        var hrs = (resta - mins) / 60;

        var horas, minutos, segundos;
        if (hrs >= 0 && hrs < 10) {
            horas = "0" + hrs;
        } else
            horas = hrs;

        if (mins >= 0 && mins < 10) {
            minutos = "0" + mins;
        } else
            minutos = mins;

        if (secs >= 0 && secs < 10) {
            segundos = "0" + secs;
        } else
            segundos = secs;

        //0-1:0-44:00
        var tiempo = horas + ":" + minutos + ":" + segundos;

        var horaAdelantada;
        if (tiempo.indexOf('-') != -1) {
            var menos = /-/g;
            var porVacio = "";
            horaAdelantada = "-" + tiempo.replace(menos, porVacio);
        } else
            horaAdelantada = tiempo;

        return horaAdelantada;
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
            { columnid: 'nombre', title: 'Nombre', style: 'background:#00FF00' },
            { columnid: 'departamento', title: 'Departamento', width: 300 },
            { columnid: 'fecha_y_hora_marco_min', title: 'Hora marcó (entrada)' },
            { columnid: 'fecha_y_hora_marco_max', title: 'Hora marcó (salida)' },
            { columnid: 'fecha', title: 'Fecha' },
            { columnid: 'dia', title: 'Día' },
            { columnid: 'asis', title: '¿Llegó tarde?' }
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

        mostrar = day + "/" + month + "/" + year;
        mostrar1 = day1 + "/" + month1 + "/" + year1;

        var fecha;

        if ($scope.asistencia.tipo) {
            fecha = "del " + mostrar1 + " al " + mostrar;
        } else {
            fecha = mostrar;
        }

        var mystyle = {
            sheetid: 'Reporte asistencia',
            headers: true,
            caption: {
                title: 'Reporte de asistencia ' + fecha,
                style: 'font-size: 50px; color:blue;' // Sorry, styles do not works
            },
            style: '',
            column: {
                style: 'font-size:30px'
            },
            columns: [
                { columnid: 'nombre', title: 'Nombre' },
                { columnid: 'departamento', title: 'Departamento' },
                { columnid: 'nombre_horario', title: 'Horario' },
                { columnid: 'horaEntraExcel', title: 'Hora entrada' },
                { columnid: 'fecha_y_hora_marco_min', title: 'Hora marcó (entrada)' },
                { columnid: 'horaSaliExcel', title: 'Hora salida' },
                { columnid: 'fecha_y_hora_marco_max', title: 'Hora marcó (salida)' },
                { columnid: 'fecha', title: 'Fecha' },
                { columnid: 'dia', title: 'Día' },
                { columnid: 'asis', title: '¿Llegó tarde?' }
            ],
        };

        $scope.result = $filter('filter')($rootScope.reporte, $scope.filters.search);
        alasql('SELECT * INTO XLS("Reporte asistencia.xls",?) FROM ?', [mystyle, $scope.result]);
    };

    
});
