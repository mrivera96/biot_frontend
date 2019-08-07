var app = angular.module('Aplicacion', ["ngRoute"]);
app.run(function($rootScope, $http) {
    $rootScope.ipServer = "http://10.203.101.98:8080/biometriciot";
	$rootScope.titulo = "Inicio";
	$rootScope.token = '<?php echo $_SESSION["token"];?>';
	$rootScope.IdUsr = '<?php echo $_SESSION["id_usr"];?>';
	
	$http({
        method: "POST",
        url: $rootScope.ipServer+"/public/api/verpermisos",
        data: $.param({'id_user':$rootScope.IdUsr}),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
            'Accept':'application/json',
            'Authorization':'Bearer '+$rootScope.token
        }
    }).then(
        function success(response) {
            
			$rootScope.permissions=response.data.permisos;
			
        },
        function error(response) {
            alert('Se produjo un error al cargar permisos del usuario');
        }
	);

	

	
	
	$('.side-bar ul li').click(function(){	
		$('.side-bar ul li').removeClass('activo');	
		$(this).addClass('activo');
	});
	
	$rootScope.cargar = function(fn){
    	//if($rootScope.data == undefined){
    	//var param = {nombre:localStorage['cuenta'], clave : localStorage['clave']};
    	$http({
    		method : "POST",
    		url : "services/alumno.php",
    	//	data:$.param(param),
    		headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'} 
    	}).then(
    		function success(response) {
    		    $rootScope.data = response.data;
    		    fn($rootScope.data);
    		}, 
    		function error(response) {
    			
    		}
    	);
	}

	$rootScope.pagination = function(tam,sizePag){
		$rootScope.tama = tam;
		$rootScope.currentPage = 0; 
		$rootScope.pageSize = sizePag; 
		$rootScope.pages = [];
		$rootScope.pages.length = 0;
		
		var ini = $rootScope.currentPage - 4;
		var fin = $rootScope.currentPage + 5;
		if (ini < 1) {
			ini = 1;
			fin = Math.ceil($rootScope.tama/$rootScope.pageSize);
			/*if (Math.ceil($scope.tama/$scope.pageSize) > 6)
			fin = Math.ceil($scope.tama/$scope.pageSize);
			else
			fin = Math.ceil($scope.tama/$scope.pageSize);*/
		} else {
			if (ini >= Math.ceil($rootScope.tama/$rootScope.pageSize) - 50) {
			ini = Math.ceil($rooScope.tama/$rootScope.pageSize) - 50;
			fin = Math.ceil($rootScope.tama/$rootScope.pageSize);
			}
		}
		if (ini < 1) ini = 1;
		for (var i = ini; i <= fin; i++) {
			$rootScope.pages.push({
			no: i
			});
		}

		if ($rootScope.currentPage >= $rootScope.pages.length)
			$rootScope.currentPage = $rootScope.pages.length - 1;
		

		$rootScope.setPage = function(index) {
		$rootScope.currentPage = index - 1;
		};
	}
		
}).filter('startFromGrid', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    }
});