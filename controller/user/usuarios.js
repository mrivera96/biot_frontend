app.controller('usuarios', function($scope, $rootScope, $http, $location) {
    $rootScope.token = '<?php echo $_SESSION["token"];?>'
    
    $scope.carga = true;
    $scope.filters = {};
    $scope.filters.search = "";
    $rootScope.titulo = "Usuarios";
    $scope.admin = false;
    $scope.mostrar = function() {
        $scope.admin = true;
        document.getElementById('btnusuario').style.display = "none";
    }

    $scope.ocultar = function() {
        $scope.crear = false;
    }

    $scope.usuario = false;
    $scope.mostrar2 = function() {
        $scope.usuario = true;
        document.getElementById('btnadmin').style.display = "none";
    }

    $scope.ocultar2 = function() {
        $scope.usuario = false;
        document.getElementById('btnadmin').style.display = "block";
    }

    $http({
        method: "GET",
        url: $rootScope.ipServer+"/public/api/usuariosplataforma",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept':'application/json',
            'Authorization':'Bearer '+$rootScope.token
        }
    }).then(
        function success(response) {
            $scope.usuarios = response.data.respuesta;
            $scope.carga = false;
        },
        function error(response) {
            $scope.carga = false;
            alert(response.data.respuesta);
        }
    );

    $scope.verDetail = function (idUser) {
        $rootScope.idUser = idUser;
        
        $location.path('permisosusuarios');
    }

   /* $scope.crearusuario=function(dataForm) {

        dataForm.rol = 2;

      

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/register",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                alert('Usuario creado con éxito.');
            },
            function error(response) {
                if (response.data.fatalerror) {
                    alert(response.data.fatalerror);    
                }else
                    alert('Error al crear el usuario.');
            }
        );
    }
*/


$scope.crearUsuario=function(){
    $scope.crear = true;
}
    $scope.crearadmin=function(dataForm) {

        dataForm.rol = 1;
   

        $http({
            method: "POST",
            url: $rootScope.ipServer+"/public/api/register",
            data: $.param(dataForm),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
                'Accept':'application/json',
                'Authorization':'Bearer '+$rootScope.token
            }
        }).then(
            function success(response) {
                alert('Usuario creado con éxito.');
            },
            function error(response) {
                if (response.data.fatalerror) {
                    alert(response.data.fatalerror);    
                }else
                    alert('Error al crear el usuario.');
            }
        );
    }

});