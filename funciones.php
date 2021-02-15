<?php
    
	function login($usuario, $clave){
	
		try { 	
			$db = Conexion::getConexion();
			$stmt = $db->prepare("select c.id, c.nombre from usuarios c where c.usuario = ? and c.clave = ? ");
            $stmt->bindValue(1, $usuario, PDO::PARAM_STR);
			$stmt->bindValue(2, $clave, PDO::PARAM_STR);
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		
			$arreglo = array();
			foreach($filas as $fila) {			
				$elemento = array();
                                $elemento['id'] = $fila['id'];
				$elemento['nombre'] = $fila['nombre'];
                                $arreglo[] = $elemento;
			}
			return $arreglo;
			
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}
        
    function obtenerMarcas(){	
		try { 	
			$db = Conexion::getConexion();
			$stmt = $db->prepare("select a.id, a.nombre, a.imagen from marcas a");
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		
			$arreglo = array();
			foreach($filas as $fila) {			
				$elemento = array();
				$elemento['id'] = $fila['id'];
				$elemento['nombre'] = $fila['nombre'];
				$elemento['imagen'] = $fila['imagen'];
				$arreglo[] = $elemento;
			}
			return $arreglo;
			
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}

	function guardarMarca($nombre, $imagen){	
		try { 	
			$db = Conexion::getConexion();			
			$stmt = $db->prepare("insert into marcas (nombre, imagen) values ( ?, ?)");
			$datos = array($nombre, $imagen);
			$db->beginTransaction();
			$stmt->execute($datos);
			$db->commit();

			return obtenerMarcas();
	
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}

	function eliminarMarca($id){	
		try { 	
			$db = Conexion::getConexion();			 
			$stmt = $db->prepare("delete from marcas where id = ? ");
			$stmt->bindValue(1, $id, PDO::PARAM_STR);
			$db->beginTransaction();
			$stmt->execute();
			$db->commit();

			return obtenerMarcas();
	
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}
	
	function obtenerSedes($idmarca){	
		try { 	
			$db = Conexion::getConexion();
	
			$stmt = $db->prepare("select p.id, p.nombre, p.direccion, p.latitud, p.longitud, p.aforo, p.id_marca, c.imagen FROM marcas c LEFT JOIN sedes p ON c.id=p.id_marca WHERE p.id_marca=?");
			$stmt->bindValue(1, $idmarca, PDO::PARAM_STR);
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		
			$arreglo = array();
			
			foreach($filas as $fila) {			
				$elemento = array();
                                $elemento['id'] = $fila['id'];
				$elemento['nombre'] = $fila['nombre'];
				$elemento['direccion'] = $fila['direccion'];
				$elemento['latitud'] = $fila['latitud'];
				$elemento['longitud'] = $fila['longitud'];
				$elemento['aforo'] = rand($fila['aforo']-10,$fila['aforo']+10);
				$elemento['id_marca'] = $fila['id_marca'];
				$elemento['imagen'] = $fila['imagen'];
				$arreglo[] = $elemento;
			}
			return $arreglo;
			
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}

	function guardarSede($nombre,$direccion,$aforo,$latitud,$longitud,$idmarca){	
		try { 	
			$db = Conexion::getConexion();			
			$stmt = $db->prepare("insert into sedes (nombre,direccion,aforo,latitud,longitud,id_marca) values ( ?, ?, ?, ?, ?, ?) ");
			$datos = array($nombre,$direccion,$aforo,$latitud,$longitud,$idmarca);
			$db->beginTransaction();
			$stmt->execute($datos);
			$db->commit();

			return obtenerSedes($idmarca);
	
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}

	function actualizarMarca($id,$nombre,$direccion,$aforo,$latitud,$longitud,$idmarca){	
		try { 	
			$db = Conexion::getConexion();			
			$stmt = $db->prepare("UPDATE sedes SET nombre = ?, direccion = ?, aforo = ?, latitud = ?, longitud = ? WHERE id = ? ");
			$datos = array($nombre,$direccion,$aforo,$latitud,$longitud,$id);
			$db->beginTransaction();
			$stmt->execute($datos);
			$db->commit();

			return obtenerSedes($idmarca);

		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}

	function eliminarSede($id){	
		try { 	
			$db = Conexion::getConexion();		
			$db->beginTransaction();

			$stmt = $db->prepare("select c.id_marca from sedes c where c.id = ? ");
			$stmt->bindValue(1, $id, PDO::PARAM_STR);
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		
			$idmarca = 0;

			foreach($filas as $fila) {			
				$idmarca = $fila['id_marca'];				
			}

			$stmt2 = $db->prepare("delete from sedes where id = ? ");
			$stmt2->bindValue(1, $id, PDO::PARAM_STR);
			
			$stmt2->execute();
			$db->commit();

			return obtenerSedes($idmarca);
	
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}


?>