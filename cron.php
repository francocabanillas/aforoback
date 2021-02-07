<?php

    try { 	
        $db = Conexion::getConexion();
        $stmt = $db->prepare("select a.id from sedes a");
        $stmt->execute();
        $filas = $stmt->fetchAll(PDO::FETCH_ASSOC);		

        foreach($filas as $fila) {			

            $stmt2 = $db->prepare("UPDATE sedes SET aforo = ? WHERE id = ?");
            $datos = array($fila['id'], rand(0,500));
            $db->beginTransaction();
            $stmt2->execute($datos);
            $db->commit();
            
        }
        
    } catch (PDOException $e) {
        $db->rollback();
        $mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . "<br/>";
        die($mensaje);
    }	

?>