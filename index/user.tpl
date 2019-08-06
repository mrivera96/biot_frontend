<!DOCTYPE html>
<html ng-app="Aplicacion">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb18030">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <!--<link rel="shortcut icon" href="./assets/img/sep.ico" />-->
    <link rel="icon" type="image/png" href="./assets/img/logo_biometric_iot-web.png">
    <link rel="stylesheet" type="text/css" href="./assets/css/estilo.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.css">
    <title>{{titulo}}</title>
    <script src="./assets/js/angularjs/angular.min.js"></script>
    <script src="./assets/js/angularjs/angular-route.min.js"></script>
    <!-- <script src="./assets/js/jquery/jquery.min.js"></script>-->
    <script src="./assets/js/util.js"></script>
    <script src="https://cdn.jsdelivr.net/alasql/0.3/alasql.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min2.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/editable.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/angular-datepicker.css">
    <script src="./assets/js/angular-datepicker.js"></script>

    <?php
  		include './controller/user/controller.php';
  	?>
</head>

<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color: #875A7B;padding-bottom: -10px;">
    
    <!-- Navbar content -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarToggler">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="navbar-brand" href="#!index">Inicio<span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <a class="fa o_menu_toggle fa-th" href="http://10.203.101.39:8069" accesskey="h" style="padding-right:15px;"></a>
        <a style="padding-right:15px;color: white;"> <?php echo $_SESSION['uname']?>  </a>
        <a onclick="cerrar()">
            <i class="fa fa-power-off" title="Cerrar Sesión" style="color:red"></i>
        </a>
    </div>
    
</nav>
<!-- <a class="navbar-brand titulo" href="#!index">Inicio</a>

  <nav class="menu">
    <div class="side-bar show">
      <div class="side-bar-encabezado">
        <img src="./assets/img/logo-unah-azul.png" />
      </div>
      <ul>
        <li class="activo">
          <a href="#!index">
  		        <i class="fa fa-desktop"></i>
  			    <p>Inicio</p>
  		    </a>
        </li>
      </ul>
    </div>
    <div class="encabezado">
      <a class="titulo">{{titulo}}</a>
      <ul class="menu-derecho">
        <li onclick="cerrar()">
          <a>
  		        <i class="fa fa-power-off" title="Cerrar Sesión" style="color:red"></i>
  			</a>
        </li>
        <li class="btn-menu">
          <a>
  		        <i class="fa fa-bars" ></i>
  			</a>
        </li>
      </ul>
    </div>
  </nav>-->
<div class="contenido" ng-view="">
</div>
<!-- Footer -->
<footer class="page-footer font-small mdb-color lighten-3 pt-4 ">

    <!-- Footer Elements -->
    <div class="container">

        <!--Grid row-->
        <div class="row" >

            <!--Grid column-->
            <div class="col-lg-3 col-md-3 mb-3">

                <!--Image-->
                <div class="view overlay z-depth-1-half">
                    <img src="./assets/img/LOGO CAMACHO NUEVO EFECTO.png" class="img-fluid" alt=""/>
                    <a href="">
                        <div class="mask rgba-white-light"></div>
                    </a>
                </div>

            </div>

            <div class="col-lg-3 col-md-3 mb-3">

                <!--Image-->
                <div class="view overlay z-depth-1-half">
                    <img src="./assets/img/LOGO CAMACHO AZUL.jpg" class="img-fluid" alt=""/>
                    <a href="">
                        <div class="mask rgba-white-light"></div>
                    </a>
                </div>

            </div>

            <div class="col-lg-3 col-md-3 mb-3">

                <!--Image-->
                <div class="view overlay z-depth-1-half">
                    <img src="./assets/img/LOGO CAMACHO ROJO.jpg" class="img-fluid" alt=""/>
                    <a href="">
                        <div class="mask rgba-white-light"></div>
                    </a>
                </div>

            </div>

            <div class="col-lg-3 col-md-3 mb-3">

                <!--Image-->
                <div class="view overlay z-depth-1-half">
                    <img src="./assets/img/LOGO CAMACHO PNG ORIGINAL.png" class="img-fluid" alt=""/>
                    <a href="">
                        <div class="mask rgba-white-light"></div>
                    </a>
                </div>

            </div>

        </div>


    </div>
        <!--Grid row-->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3" style="background-color: #875A7B;">© 2019 ICT

    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
<script>
    function cerrar() {
        //if (confirm('¿Desea cerrar sesión?')){
        localStorage.removeItem('cuenta');
        window.location.href = "login.php";
        // }
    }
</script>
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKDUTz8Uq47j1NLhJIvd0DRfD4hREetCA&callback=teEncuentras"></script>-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKDUTz8Uq47j1NLhJIvd0DRfD4hREetCA&libraries=places" async
        defer></script>
<!--<script src="http://maps.googleapis.com/maps/api/js?sensor=false&language=en"></script>-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
</body>

</html>