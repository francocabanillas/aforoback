<?php
require_once './lib/Slim/Slim.php';
require_once 'funciones.php';
require_once 'Conexion.php';

// Autocarga de la librería
\Slim\Slim::registerAutoloader();

// Creando una instancia del Slim
$app = new \Slim\Slim();
$app->response->header('Content-Type', 'application/json');

// obtener Menu
 $app->get('/marcas', function(){  
    $lista = obtenerMarcas();
    echo json_encode($lista);    
});

//obtener pedidos de clientes
 $app->get('/sedes/:id', function($id){  
    $lista = obtenerSedesPorIdMarca($id);
    echo json_encode($lista);    
});


$app->run();