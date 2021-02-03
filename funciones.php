<?php
    
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
	
	function obtenerSedesPorIdMarca($idmarca){	
		try { 	
			$db = Conexion::getConexion();
	
			$stmt = $db->prepare("SELECT p.id, p.nombre, p.direccion, p.latitud, p.longitud, p.aforo, p.id_marca, c.imagen FROM marcas c LEFT JOIN sedes p ON c.id=p.id_marca WHERE p.id_marca=?");
			$stmt->bindValue(1, $idmarca, PDO::PARAM_STR);
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		
			$arreglo = array();
			
			foreach($filas as $fila) {			
				$elemento = array();
				$elemento['id'] = $fila['id'];
				$elemento['precio_total'] = $fila['precio_total'];
				$elemento['fecha'] = $fila['fecha'];
				$elemento['cliente_nombre'] = $fila['cliente_nombre'];
				$elemento['celular'] = $fila['celular'];
				$elemento['cliente_id'] = $fila['cliente_id'];
				$elemento['estado'] = $fila['estado']	
				$arreglo[] = $elemento;
			}
			return $arreglo;
			
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
			die($mensaje);
		}		
	}
	


?>