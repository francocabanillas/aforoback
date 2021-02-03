	<?php
	//namespace Espacio\De\Nombres;
	class Conexion {

		static private $instance;
		
		/**
		* @return PDO Return a PDO instance representing a connection to a database
		*/
		public static function getConexion() {
			
			if(self::$instance == NULL){           
				$PDOinstance = new PDO("mysql:host=fdb28.awardspace.net;dbname=3504024_aforo;charset=utf8", "3504024_aforo", "./NUG4OZ3XhY;evw");
				$PDOinstance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				self::$instance = $PDOinstance;
			}
			return self::$instance;
			
		}
		
	}
