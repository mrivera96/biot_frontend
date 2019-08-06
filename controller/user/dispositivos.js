app.controller('dispositivos', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>';

    
    $scope.carga = true;
    $scope.filters = {};
    $scope.filters.search = "";
    $rootScope.titulo = "Dispositivos Biométricos";

    $scope.formato = false;
    $scope.mostrar = function() {
        $scope.formato = true; // no queremos que se despliegue por los momentos
    }

    $scope.ocultar = function() {
        $scope.formato = false;
    }

    $scope.pordispositivo=function(IdDevice, IP, Type) {
        $rootScope.IdDevice=IdDevice;
        $rootScope.IP=IP;
        if (Type == 11) {
           $rootScope.Type= "bw";
        }else{
           $rootScope.Type= "bioface";
        }
        
        $location.path('usuariospordispositivo');      
    }

    $scope.getDoorPer=function(MN){
        
        /*if($rootScope.doors["'"+MN+"'"]==1)
            return true*/
            console.log(MN);
        
    }
    $scope.openDoor=function openDoor(Type, IP){
        $scope.carga = true;
        if(Type=="11"){
            type="bw";
        }else{
            type="bioface";
        }
        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/abrirpuerta",
            data:{"IP":IP,"Type":type},
            headers: {
                'Content-Type': 'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {  
               alert('Puerta Abierta');
               $scope.carga = false;
            },
            function error(response) {
                alert('Error al abrir la puerta. \nIntente de nuevo')
                $scope.carga = false;
            }
        );
    }

    cargarDispositivo();
    function cargarDispositivo(){
        $scope.carga = true;
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
                $scope.dispositivos = response.data.data;
               
                $scope.carga = false;

                $scope.tama = $scope.dispositivos.length;
                $scope.currentPage = 0; 
                $scope.pageSize = 20; 
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
                    if (ini >= Math.ceil($scope.tama/$scope.pageSize) - 20) {
                    ini = Math.ceil($scope.tama/$scope.pageSize) - 20;
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
                alert('Error al cargar los dispositivos');
            }
        );
    }

     $scope.creardispositivo=function(dataForm) {

        

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/creardispositivo",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
				alert("Dispositivo agregado con éxito");
				document.getElementById("upload").reset();	
                cargarDispositivo();
            },
            function error(response) {
                alert(response.data.message);
				document.getElementById("upload").reset();	
            }
        );
    }
});