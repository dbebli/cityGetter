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


	


function getByAttribut($pdo){


if (empty($_GET['tmp']) && empty($_GET['ville']) && empty($_GET['continent']) && empty($_GET['budget']) && empty($_GET['activite']) && empty($_GET['mois'])){

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
    	(Select idVille,tempMin, tempMax,budgMin,budgMax from tempBudg)tb
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


  ?>