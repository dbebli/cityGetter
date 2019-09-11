<?php
	
	/* [USER FUNCTIONS] */
	function getAll($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}
	function getByParamaters($pdo){
		$query = $pdo->query("SELECT * 
		FROM(select ville FROM `ville`)v
		inner join
		(select ville FROM `ville`)a
		on a.idVille=v.idVille
		
		");
		$res = $query->fetchAll();
		return $res;
	}
	function getByParamaters2($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}
	function getByParamaters3($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}
	function getByParamaters4($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}


	

?>
