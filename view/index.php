<?php
$view = $_GET["tpl"];
$file = 'templates/' . $view . '.tpl';
if(file_exists($file)){
	require($file);
}else{
	require('templates/blanco.tpl');
}