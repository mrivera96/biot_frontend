<?php
    session_start();
    
   
	if(isset($_POST['rol'])){
        $_SESSION['acceso'] = $_POST['rol'];
    }

    if(isset($_POST['token'])){
        $_SESSION['token'] = $_POST['token'];
    }
   
    if(isset($_POST['id'])){
        $_SESSION['id_usr'] = $_POST['id'];
    }

    if(isset($_POST['uname'])){
        $_SESSION['uname'] = $_POST['uname'];
    }

    if(isset($_POST['lname'])){
        $_SESSION['lname'] = $_POST['lname'];
    }

    if(isset($_POST['ugenero'])){
        $_SESSION['ugenero'] = $_POST['ugenero'];
    }

    if(isset($_POST['uidentidad'])){
        $_SESSION['uidentidad'] = $_POST['uidentidad'];
    }

    if(isset($_POST['umail'])){
        $_SESSION['umail'] = $_POST['umail'];
    }

    if(isset($_POST['utel'])){
        $_SESSION['utel'] = $_POST['utel'];
    }

    if(isset($_SESSION['acceso']) && $_SESSION['acceso'] == 1){
        require('index/user.tpl');
    }else{
        session_destroy();
        header("Location: login.php");
    }


    

