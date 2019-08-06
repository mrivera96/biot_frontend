app.controller('index', function($scope, $rootScope, $http, $location) {

    //$rootScope.token = '<?php echo $_SESSION["token"];?>';
    
    
  
  
    token = $rootScope.token;

    $scope.asistencia = function () {

        $location.path('asistencia');


    }

    $scope.mapadispositivos = function () {

        $location.path('mapadispositivos');


    }

    $scope.empleados = function () {

        $location.path('empleados');


    }

    $scope.dispositivos = function () {

        $location.path('dispositivos');

    }

    $scope.usuariospordispositivo = function(idDispositivo) {

        $location.path('usuariospordispositivo');

    }

    $scope.departamentos = function () {

        $location.path('departamentos');

    }

    $scope.usuarios = function () {

        $location.path('usuarios');

    }

    $scope.horarios = function () {

        $location.path('horarios');

    }

    $scope.parametros = function () {

        $location.path('parametros');

    }

    $scope.depurar = function () {

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/depurarUser",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json'
            }
        }).then(
            function success(response) {
                console.log(""+response.respuesta);
            },
            function error(response) {
                alert('Se produjo un error al depurar los usuarios');
            }
        );
        /*var user = [
            1,
            3,
            5,
            7,
            9,
            30,
            33,
            37,
            45,
            60,
            71,
            78,
            84,
            253,
            255,
            256,
            258,
            259,
            260,
            261,
            262,
            263,
            264,
            265,
            341,
            350,
            503,
            504,
            521,
            522,
            526,
            528,
            532,
            537,
            543,
            549,
            555,
            557,
            572,
            574,
            577,
            581,
            586,
            592,
            602,
            623,
            630,
            654,
            659,
            678,
            696,
            719,
            721,
            725,
            726,
            729,
            732,
            734,
            737,
            740,
            741,
            745,
            747,
            749,
            753,
            754,
            755,
            756,
            757,
            758,
            771,
            772,
            776,
            778,
            781,
            783,
            784,
            785,
            787,
            788,
            839,
            891,
            928,
            938,
            939,
            949,
            953,
            965,
            967,
            985,
            993,
            994,
            1007,
            1011,
            1017,
            1036,
            1045,
            1057,
            1072,
            1073,
            1075,
            1089,
            1090,
            1094,
            1101,
            8000,
            8004,
            8005,
            8008,
            8011,
            8012,
            8013,
            8014,
            8015,
            8016,
            8017,
            8018,
            9005,
            9006,
            9008,
            9009,
            1234567
        ]
        var cont = 0;
        for(i=0;i<user.length;i++){
            cont++;
            param = {
                'IdUser':user[i]
            }
            $http({
                method: "POST",
                url: $rootScope.ipServer+"/public/api/depurarUser",
                data: $.param(param),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                    'Accept':'application/json'
                }
            }).then(
                function success(response) {
                    console.log(""+response.respuesta);
                },
                function error(response) {
                    alert('Se produjo un error al depurar los usuarios');
                }
            );
        }

        if (cont == user.length){
            alert('Todos los usarios eliminados');
        }*/
        

    }
	/*$rootScope.titulo = "Variables iniciales";
    $scope.showGrap=false;
    $scope.formData = {};

    var listVaria;

    cargarData();
    function cargarData(){
        $http({
            method: "POST",
            url: "services/selectData.php",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.dataResult = response.data;
            },
            function error(response) {
                alert('Se produjo un error');
            }
        );
    }


    $http({
        method: "POST",
        url: "services/selectVaria.php",
        //data:$.param(formData),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
    }).then(
        function success(response) {
            $scope.variables= response.data;
            $rootScope.listVaria= response.data;
        },
        function error(response) {
            alert('Se produjo un error al cargar las variables');
        }
    );

    $scope.submitForm = function (formDat){
        mostrar=formDat['resp2'];
        $http({
            method: "POST",
            url: "services/insertVaria.php",
            data:$.param(formDat),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                alert('Datos guardados correctamente');
                cargarData();
            },
            function error(response) {
                alert('Se produjo un error al cargar las variables');
            }
        );
    }

    var tap=0;
    $scope.madeGraph=function (var1,var2,var3,ideal,meta) {
        $scope.showGrap=true;

        if(tap==0){
            tap=1;
        }

        var densityCanvas = document.getElementById("grafico");


        var satisData = {
            label: 'Linea base',
            data: [var1,var2,var3],
            backgroundColor: 'gray',
            borderWidth: 0,
            yAxisID: "y-axis-satis"
        };

        var resulData = {
            label: 'Resultado ideal',
            data: [ideal,ideal,ideal],
            backgroundColor: 'blue',
            borderWidth: 0,
            yAxisID: "y-axis-resul"
        };

        var metaData = {
            label: 'Meta',
            data: [meta,meta,meta],
            backgroundColor: 'green',
            borderWidth: 0,
            yAxisID: "y-axis-meta"
        };

        var planetData = {
            labels: ["Satisfacción cliente interno", "Tiempos de entrega", "Indice de satisfacción laboral"],
            datasets: [satisData, resulData,metaData]
        };

        var chartOptions = {
            scales: {
                xAxes: [{
                    barPercentage: 1,
                    categoryPercentage: 0.6
                }],
                yAxes: [{
                    id: "y-axis-meta"
                }, {
                    id: "y-axis-resul"
                }, {
                    id: "y-axis-satis"
                }]
            }
        };


        if(tap!=1){
            chart.destroy();
        }
        chart = new Chart(densityCanvas, {
            type: 'bar',
            data: planetData,
            options: chartOptions
        });
        tap+=1;
    }*/



});

