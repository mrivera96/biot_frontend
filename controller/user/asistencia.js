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
            $('#error-message').text('Se produjo un error al cargar los departamentos');
            $('#show-modal').click();

        }
    );

    $scope.mostrar = function(paramAsisten) {
        if((paramAsisten['IdDepartment']==null && $rootScope.IdUsr!=1) || ($rootScope.IdUsr!=1 && paramAsisten['IdDepartment']=="")){
            //alert('Seleccione un departamento');
            $('#error-message').text('Debe seleccionar un departamento.');
            $('#show-modal').click();
        }else{
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
                        if(response.data.respuesta){
                            var reporte =  response.data.respuesta;

                            $scope.tarde=0;
                            for(var i=0;i<reporte.length;i++){
                                if(reporte[i].asis==="SÍ"){
                                    $scope.tarde+=1;
                                }

                                reporte[i].horaEntraExcel= reporte[i].hora_entrada+":"+ reporte[i].minutos_entrada;
                                reporte[i].horaSaliExcel= reporte[i].hora_salida+":"+ reporte[i].minutos_salida;
                            }
                            $rootScope.reporte =  reporte;

                            $rootScope.pagination($rootScope.reporte.length, 50);
                            $scope.carga = false;
                        }

                        $scope.carga = false;

                    },
                    function error(response) {
                        $('#error-message').text('Se produjo un error al cargar el reporte. Por favor intente de nuevo.');
                        $('#show-modal').click();
                        //alert('Se produjo un error.');
                    }
                );

            } else {
                 $('#error-message').text('Lo sentimos, el día que está solicitando no es parte de los horarios de contratos.');
                $('#show-modal').click();
                //alert('Lo sentimos, el día que está solicitando no es parte de los horarios de contratos.');
                $scope.carga = false;
            }
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
                { columnid: 'asis', title: '¿Llegó tarde?' },
                { columnid: 'horastrabajadas', title: 'Horas teóricas trabajadas' },
                { columnid: 'horasrealestrabajadas', title: 'Horas reales trabajadas' },
                { columnid: 'salioantes', title: 'Tiempo de salida' },
                { columnid: 'extras', title: 'Horas Extras' }
            ]
        };

        $scope.result = $filter('filter')($rootScope.reporte, $scope.filters.search);
        alasql('SELECT * INTO XLS("Reporte asistencia '+fecha+'.xls",?) FROM ?', [mystyle, $scope.result]);
    };


});