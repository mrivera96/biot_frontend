app.controller('asistencia', function($scope, $rootScope, $http, $location, $filter) {

    $rootScope.token = '<?php echo $_SESSION["token"];?>';
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

    $scope.mostrar = function(paramAsisten) {
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
                    $rootScope.reporte =  response.data.respuesta;


                    $scope.tarde=0;
                    for(var i=0;i<$rootScope.reporte.length;i++){
                        if($rootScope.reporte[i].asis==="SÍ"){
                            $scope.tarde+=1;
                        }
                    }

                    $rootScope.pagination($rootScope.reporte.length, 50);
                    $scope.carga = false;

                },
                function error(response) {
                    alert('Se produjo un error');
                }
            );

        } else {
            alert('Lo sentimos, el día que está solicitando no es parte de los horarios de contratos');
            $scope.carga = false;
        }
    };




    $scope.filterData = function(data) {
        tama = $filter('filter')($rootScope.reporte, data);
        $rootScope.pagination(tama.length, 50);
    };

    $scope.exportData = function() {
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
            ]
        };

        $scope.result = $filter('filter')($rootScope.reporte, $scope.filters.search);
        alasql('SELECT * INTO XLS("Reporte asistencia.xls",?) FROM ?', [mystyle, $scope.result]);
    };


});