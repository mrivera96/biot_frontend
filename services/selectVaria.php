<?php
    include('includes/funciones.php');
    session_start();

    $sql="select id from departments where department=?";
    $json=select($sql,array($_SESSION["data"]["department"]));

    $sql="select nameVariable from listvaria where fk_department=?";
    $json2=selectAll($sql,array($json["id"]));
    echo json_encode($json2);