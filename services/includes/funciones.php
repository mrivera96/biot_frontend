<?php
   
    function select($sql,$params) {
        include('conexion.php');
        $resultado= $conexion->prepare($sql);
        $resultado->execute($params);
        return $resultado->fetch(PDO::FETCH_ASSOC);
    }
    
    function selectAll($sql,$params) {
        include('conexion.php');
        $resultado= $conexion->prepare($sql);
        $resultado->execute($params);
        return $resultado->fetchAll(PDO::FETCH_ASSOC);
    }
    
    function insert($sql,$params) {
        include('conexion.php');
        $resultado=$conexion->prepare($sql);
        $resultado->execute($params);
        return true;
    } 
    
    function delete($sql,$params) {
        include('conexion.php');
        $resultado= $conexion->prepare($sql);
        $resultado->execute($params);
    }