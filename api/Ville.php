<?php


class Ville
{
	private $pdo="";
	function __construct(\PDO $pdo){
		$pdo = $pdo;
	}

	public function getCities($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	}
	
	public function getContinent($pdo){
		$query = $pdo->query("SELECT * FROM `continent`");
		$res = $query->fetchAll();
		return $res;
	}

	public function getActivite($pdo){
		$query = $pdo->query("SELECT * FROM `activite`");
		$res = $query->fetchAll();
		return $res;
	}
	public function getMonths($pdo){
		$query = $pdo->query("SELECT distinct mois FROM `tempbudg`");
		$res = $query->fetchAll();
		return $res;
	}

	public function getByAttributes($pdo){
		if (!isset($_GET['temperature']) && !isset($_GET['nomCont']) && !isset($_GET['distance']) && !isset($_GET['budget']) && !isset($_GET['activite']) && !isset($_GET['mois'])){
			echo "Aucun champs rempli";
			return false;
		}

		// set field list
		$fields = array('tb' => array('temperature','budget','mois'), 'v' => array('ville','distance'), 'c' => array('nomCont'), 'a' => array('activite'));
		$conditions = array();
		// loop through define field
		foreach($fields as $key => $field){
			// if not nullable
			foreach($field as $subfield){
				if(isset($_GET[$subfield]) && $_GET[$subfield] != '') {
					$key = strval($key);
					// add new condition
					if ($subfield=="distance") {
						$conditions[] = "$key.$subfield < $_GET[$subfield]";
					}
					elseif ($subfield=="temperature") {
						$conditions[] = "$key.tempMin <= $_GET[$subfield] AND $key.tempMax >= $_GET[$subfield]";
					}
					elseif ($subfield=="budget") {
						$conditions[] = "$key.budgMax >= $_GET[$subfield]";
					}
					else{
						$conditions[] = "$key.$subfield LIKE '%{$_GET[$subfield]}%'";
					}
				}
			}
		}


		/*$sql = "select * from table where col = :value";
		$query = $pdo->prepare($sql);
		$query->execute([
			'value' => 'tutu'
		])*/;


		// build querie
		$querie="SELECT distinct nomVille,image,tempMin,tempMax
		FROM(Select idCont,idVille, nomVille,image,distance from ville)v
		inner join
		(Select idAct,idVille from actville)av
		on v.idVille=av.idVille
		inner join
		(Select idAct,nomAct from activite)a
		on av.idAct=a.idAct
		inner join
		(Select idVille,tempMin,mois, tempMax,budgMin,budgMax from tempbudg)tb
		on tb.idVille=v.idVille
		inner join
		(Select idCont,nomCont from continent)c
		on v.idCont=c.idCont";

		// if at least on conditions is defined
		if(count($conditions) > 0) {
			// add where clause to the querie
			$querie .= " WHERE " . implode (' AND ', $conditions);
		}
		$performQuerie =  $pdo->query($querie);
		//var_dump($conditions);
		//echo $querie;

		$results = $performQuerie->fetchAll();
		$nbResults = $performQuerie->rowCount($results);


		if($nbResults == 0){
			$nope= "Aucune correspondance";
			return $nope;
		}
		else{
			return $results;
		}
	}		


}
  ?>