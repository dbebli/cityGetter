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


if (empty($_GET['tmp']) && empty($_GET['continent']) && empty($_GET['budget']) && empty($_GET['activite']) && empty($_GET['mois'])){

echo "Aucun champs rempli";
return false;
}

// definit la liste des champs
$champs = array('tmp', 'ville', 'continent', 'budget', 'activite', 'mois');
$conditions = array();

// boucle à travers tout les champs définis
foreach($champs as $champs){
// si le champ n'est pas vide
if(isset($_GET[$champs]) && $_GET[$champs] != '') {
// crée une nouvelle condition
$conditions[] = "`$champs` LIKE '%" . $pdo->quote($pdo, $_GET[$champs]) . "%'";
}
    }


    // construit la requête
    $requete =  $pdo->query("SELECT *
    	FROM(Select idCont,idVille, nomVille,image,distance from ville)v
    	inner join
    	(Select idActivite,idVille from actville)av
    	on v.idVille=av.idVille
    	inner join
    	(Select idActivite,nomAct from activite)a
    	on av.idActivite=a.idActivite
    	inner join
    	(Select idVille,tempMin, tempMax,budgMin,budgMax from tempbsudg)tb
    	on tb.idVille=v.idVille
    	inner join
    	(Select idCont,nomCont from continent)c
    	on v.idCont=c.idCont");
    
		return $res;
    // si des conditions sont définies
    if(count($conditions) > 0) {
        // ajoute les conditions à la suite
        $requete .= "WHERE " . implode (' AND ', $conditions); //
    }

    $resultat = $requete->fetchAll();
$nbResultats = $requete->rowCount($resultat);

if($nbResultats == 0)
	echo "Aucune correspondance";


return resultat;

}
  ?>