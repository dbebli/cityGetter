<?php
	
	function getCities($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}
	
	function getContinent($pdo){
		$query = $pdo->query("SELECT * FROM `continent`");
		$res = $query->fetchAll();
		return $res;
	}

	function getActivite($pdo){
		$query = $pdo->query("SELECT * FROM `activite`");
		$res = $query->fetchAll();
		return $res;
	}
	function getMonths($pdo){
		$query = $pdo->query("SELECT mois FROM `tempbudg`");
		$res = $query->fetchAll();
		return $res;
	}

function getByAttributes($pdo){
	if (!isset($_GET['tmp']) && !isset($_GET['nomCont']) && !isset($_GET['budget']) && !isset($_GET['activite']) && !isset($_GET['mois'])){
		echo "Aucun champs rempli";
		return false;
	}

	// set field list
	$champs = array('tb' => 'tmp', 'v' => 'ville', 'c' => 'nomCont', 'tb' => 'budget', 'a' => 'activite', 'tb' => 'mois');
	$conditions = array();

	// loop through define field
	foreach($champs as $key => $champs){
		// if not nullable
		if(isset($_GET[$champs]) && $_GET[$champs] != '') {
			$key = strval($key);
			// add new condition
			$conditions[] = "$key.$champs LIKE '%{$_GET[$champs]}%'";
		}
	}

    // build querie
	$querie="SELECT distinct nomVille,image
	FROM(Select idCont,idVille, nomVille,image,distance from ville)v
	inner join
	(Select idAct,idVille from actville)av
	on v.idVille=av.idVille
	inner join
	(Select idAct,nomAct from activite)a
	on av.idAct=a.idAct
	inner join
	(Select idVille,tempMin, tempMax,budgMin,budgMax from tempbudg)tb
	on tb.idVille=v.idVille
	inner join
	(Select idCont,nomCont from continent)c
	on v.idCont=c.idCont";

    // if at least on conditions is defined
    if(count($conditions) > 0) {
        // add where clause to the querie
		$querie .= " WHERE " . implode (' AND ', $conditions);
	}
	$requete =  $pdo->query($querie);
	// var_dump($conditions);
	// echo $querie;

    $resultat = $requete->fetchAll();
	$nbResultats = $requete->rowCount($resultat);


	if($nbResultats == 0){
		$nope= "Aucune correspondance";
		return $nope;
	}
	else{
		return $resultat;
	}
		


}
  ?>