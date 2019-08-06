<?php
    include('includes/funciones.php');
    session_start();

    $sql1="select id from departments where department=?";
    $json=select($sql1,array($_SESSION["data"]["department"]));

    $var = $json["id"];

    $sql = "select * from historyindicators where fk_department=?";
    $json = selectAll($sql,array($var));
    echo json_encode($json);