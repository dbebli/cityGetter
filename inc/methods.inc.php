<?php
	
	/* [USER FUNCTIONS] */
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

	// definit la liste des champs
	$champs = array('tmp', 'ville', 'nomCont', 'budget', 'activite', 'mois');
	$conditions = array();

	// boucle à travers tout les champs définis
	foreach($champs as $champs){
		// si le champ n'est pas vide
		if(isset($_GET[$champs]) && $_GET[$champs] != '') {
			// crée une nouvelle condition
			$conditions[] = "c.$champs LIKE '%{$_GET[$champs]}%'";
		}
	}


    // construit la requête
   
	
	$test="SELECT distinct nomVille,image
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

    // si des conditions sont définies
    if(count($conditions) > 0) {
        // ajoute les conditions à la suite
		$test .= " WHERE " . implode (' AND ', $conditions);
	}
	$requete =  $pdo->query($test);
	// var_dump($conditions);
	// echo $test;

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