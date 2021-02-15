<?php
require_once './lib/Slim/Slim.php';
require_once 'funciones.php';
require_once 'Conexion.php';

// Autocarga de la librería
\Slim\Slim::registerAutoloader();

// Creando una instancia del Slim
$app = new \Slim\Slim();
$app->response->header('Content-Type', 'application/json');

// Login
$app->post('/login', function() use ($app) {  
    $usuario = $app->request()->post('usuario');
    $clave   = $app->request()->post('clave');
    $lista   = login($usuario, $clave);
    echo json_encode($lista);    
});


// obtener marca
 $app->get('/marcas', function(){  
    $lista = obtenerMarcas();
    echo json_encode($lista);    
});

// guardar marca
$app->post('/marcas', function() use ($app) {
    $nombre = $app->request()->post('nombre');
    $imagen = $app->request()->post('imagen');
    $lista = guardarMarca($nombre, $imagen);
    echo json_encode($lista);    
});

// eliminar marca
$app->delete('/marcas/:id', function($id){  
    $lista = eliminarMarca($id);
    echo json_encode($lista);    
});


//obtener sedes
 $app->get('/sedes/:id', function($id){  
    $lista = obtenerSedes($id);
    echo json_encode($lista);    
});

//actualizar sedes
$app->put('/sedes/:id', function ($id) use ($app) {    
    $nombre = $app->request()->post('nombre'); 
    $direccion = $app->request()->post('direccion'); 
    $aforo = $app->request()->post('aforo'); 
    $latitud = $app->request()->post('latitud'); 
    $longitud = "0"; 
    $idmarca = $app->request()->post('id_marca');
    $lista = actualizarMarca($id,$nombre,$direccion,$aforo,$latitud,$longitud,$idmarca);
    echo json_encode($lista);
 });

 
 
 
 
 

// guardar sedes
$app->post('/sedes/:id', function($id) use ($app) {
    $nombre = $app->request()->post('nombre');
    $direccion = $app->request()->post('direccion');
    $aforo = $app->request()->post('aforo');
    $latitud = $app->request()->post('latitud');
    $longitud = $app->request()->post('longitud');
    $lista = guardarSede($nombre,$direccion,$aforo,$latitud,$longitud,$id);
    echo json_encode($lista);    
});


// eliminar sede
$app->delete('/sedes/:id', function($id) use ($app) {  
    $lista = eliminarSede($id);
    echo json_encode($lista);    
});

$app->run();