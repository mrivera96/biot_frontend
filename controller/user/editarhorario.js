app.controller('editarhorario', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'

    var param = {
        ShiftId: $rootScope.ShiftId
    };

    $scope.ocultar = function() {
        $scope.admin = false;
    }
    $rootScope.titulo = "Editar Horario";
    cargarHorario();
    function cargarHorario(){
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/horariodetalles",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                var detalleHorario = response.data.respuesta;
                $scope.editarhorario = detalleHorario;
                var entradaH = detalleHorario.hora_entrada;
                var entradaM = detalleHorario.minutos_entrada;
                var salidaH = detalleHorario.hora_salida;
                var salidaM = detalleHorario.minutos_salida;

                var entradaHr, entradaMr, salidaHr, salidaMr;
                if ((entradaH).length==1){
                    entradaHr = "0"+ entradaH;
                }else
                    entradaHr = entradaH;

                if ((entradaM).length==1){
                    entradaMr = "0"+ entradaM;
                }else
                    entradaMr = entradaM;

                if ((salidaH).length==1){
                    salidaHr = "0"+ salidaH;
                }else
                    salidaHr = salidaH;

                if ((salidaM).length==1){
                    salidaMr = "0"+ salidaM;
                }else
                    salidaMr = salidaM;

                document.getElementById("EntradaL").value = entradaHr +":"+ entradaMr;
                document.getElementById("SalidaL").value = salidaHr +":"+ salidaMr;
            },
            function error(response) {
                alert('Error al cargar el horario seleccionado.');
            }
        );
    }


    $scope.editarnombrehorario=function(dataForm) {  

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/editarhorario",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                alert('Nombre del horario editado con éxito.');
                cargarHorario();
            },
            function error(response) {
                alert('Error al cargar los usuarios por dispositivo.');
            }
        );
    }

    $scope.editarhorariodetalle=function(dataForm) {
        var entradal, salidal, entradam, salidam, entradami, salidami,
            entradaj, salidaj, entradav, salidav, entradas, salidas, paramForm;
        if (dataForm.tipo) {
            /*LUNES*/
            entradal = document.getElementById("EntradaL").value;
            salidal = document.getElementById("SalidaL").value;
            /*MARTES*/
            entradam = document.getElementById("EntradaM").value;
            salidam = document.getElementById("SalidaM").value;
            /*MIERCOLES*/
            entradami = document.getElementById("EntradaMi").value;
            salidami = document.getElementById("SalidaMi").value;
            /*JUEVES*/
            entradaj = document.getElementById("EntradaJ").value;
            salidaj = document.getElementById("SalidaJ").value;
            /*VIERNES*/
            entradav = document.getElementById("EntradaV").value;
            salidav = document.getElementById("SalidaV").value;
            /*SABADO*/
            entradas = document.getElementById("EntradaS").value;
            salidas = document.getElementById("SalidaS").value;

            

            var horaEntradaL, horaEntradaM, horaEntradaMi, horaEntradaJ, horaEntradaV, horaEntradaS;
            /*LUNES*/
            if (entradal.substring(0, 1)=="0"){
                horaEntradaL = entradal.substring(1, 2)
            }else
                horaEntradaL = entradal.substring(0, 2)

            /*MARTES*/
            if (entradam.substring(0, 1)=="0"){
                horaEntradaM = entradam.substring(1, 2)
            }else
                horaEntradaM = entradam.substring(0, 2)

            /*MIERCOLES*/
            if (entradami.substring(0, 1)=="0"){
                horaEntradaMi = entradami.substring(1, 2)
            }else
                horaEntradaMi = entradami.substring(0, 2)

            /*JUEVES*/
            if (entradaj.substring(0, 1)=="0"){
                horaEntradaJ = entradaj.substring(1, 2)
            }else
                horaEntradaJ = entradaj.substring(0, 2)

            /*VIERNES*/
            if (entradav.substring(0, 1)=="0"){
                horaEntradaV = entradav.substring(1, 2)
            }else
                horaEntradaV = entradav.substring(0, 2)

            /*SABADO*/
            if (entradas.substring(0, 1)=="0"){
                horaEntradaS = entradas.substring(1, 2)
            }else
                horaEntradaS = entradas.substring(0, 2)

            paramForm = {
                ShiftId: $rootScope.ShiftId,
                T2InHour: [horaEntradaL, horaEntradaM, horaEntradaMi, horaEntradaJ, horaEntradaV, horaEntradaS],
                T2InMinute: [entradal.substring(3, 5),entradam.substring(3, 5),entradami.substring(3, 5),
                             entradaj.substring(3, 5),entradav.substring(3, 5),entradas.substring(3, 5)],
                T2OutHour: [salidal.substring(0, 2),salidam.substring(0, 2),salidami.substring(0, 2),
                            salidaj.substring(0, 2),salidav.substring(0, 2),salidas.substring(0, 2)],
                T2OutMinute: [entradal.substring(3, 5),entradam.substring(3, 5),entradami.substring(3, 5),
                              entradaj.substring(3, 5),entradav.substring(3, 5),entradas.substring(3, 5)]
            };

            peticionEditarHorarioDetalle(paramForm);
        }else{
            /*SEMANA*/
            entradal = document.getElementById("EntradaL").value;
            salidal = document.getElementById("SalidaL").value;


            var horaEntrada;
            if (entradal.substring(0, 1)=="0"){
                horaEntrada = entradal.substring(1, 2)
            }else
                horaEntrada = entradal.substring(0, 2)

            paramForm = {
                ShiftId: $rootScope.ShiftId,
                T2InHour: [horaEntrada],
                T2InMinute: [entradal.substring(3, 5)],
                T2OutHour: [salidal.substring(0, 2)],
                T2OutMinute: [salidal.substring(3, 5)]
            };
         
            peticionEditarHorarioDetalle(paramForm);
        }
    }

    function peticionEditarHorarioDetalle(argument) {
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/editarhorariodetalle",
            data: $.param(argument),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                alert('Horario actualizado con éxito.');
                cargarHorario();
            },
            function error(response) {
                alert('Error al actualizar el tiempo de horario.');
            }
        );
    }
});