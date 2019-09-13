<?php


class Ville
{
	private $pdo;

	function __construct(\PDO $pdo){
		$this->pdo = $pdo;
	}

	
	public function getCities(){
		$query = $this->pdo->query("SELECT distinct nomVille,image,tempMin,budgMin,tempMax
		FROM (select idVille, nomVille,image from `ville`)v
		inner join
		(select  idVille,tempMin,tempMax,budgMin,mois from `tempbudg`)tb
		on v.idVille=tb.idVille
        where mois='octobre'");
		$res = $query->fetchAll();
		return $res;
	}
	
	public function getContinent(){
		$query = $this->pdo->query("SELECT * FROM `continent`");
		$res = $query->fetchAll();
		return $res;
	}

	public function getActivite(){
		$query = $this->pdo->query("SELECT * FROM `activite`");
		$res = $query->fetchAll();
		return $res;
	}
	public function getMonths(){
		$query = $this->pdo->query("SELECT distinct mois FROM `tempbudg`");
		$res = $query->fetchAll();
		return $res;
	}

	public function getByAttributes(){
		if (!isset($_GET['temperature']) && !isset($_GET['nomCont']) && !isset($_GET['distance']) && !isset($_GET['budget']) && !isset($_GET['nomAct']) && !isset($_GET['mois'])){
			echo "Aucun champs rempli";
			return false;
		}

		// set field list
		$fields = array('tb' => array('temperature','budget','mois'), 'v' => array('ville','distance'), 'c' => array('nomCont'), 'a' => array('nomAct'));
		$conditions = array();
		$joinActivities = array();

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
						$conditions[] = "$key.budgMin < $_GET[$subfield]";
					}
					elseif ($subfield=="nomAct") {
						$i=0;
						$tabActivite = explode(",", $_GET[$subfield]);
						//add join for each activities
						foreach($tabActivite as $activite){
							$i++;		
							if($i>1){
								$eval= $i-1;
								$joinActivities[] = "(SELECT idVille,av.IdAct 
								from(Select idAct,idVille from actville)av
								INNER JOIN 
								(Select idAct,nomAct from activite WHERE nomAct LIKE '%{$activite}%')a
								on av.idAct=a.idAct)$key$i on a$eval.idVille = a$i.idVille";
							}
							else{
								$joinActivities[] = "(SELECT idVille,av.IdAct 
								from(Select idAct,idVille from actville)av
								INNER JOIN 
								(Select idAct,nomAct from activite WHERE nomAct LIKE '%{$activite}%')a
								on av.idAct=a.idAct)$key$i";
							}
						}
					}
					else{
						$conditions[] = "$key.$subfield LIKE '%{$_GET[$subfield]}%'";
					}
				}
			}
		}

		// build querie
		$querie="SELECT distinct nomVille,image,tempMin,budgMin,tempMax
		FROM(Select idCont,idVille, nomVille,image,distance from ville)v
		inner join
		(Select idVille,tempMin,mois, tempMax,budgMin,budgMax from tempbudg)tb
		on tb.idVille=v.idVille
		inner join
		(Select idCont,nomCont from continent)c
		on v.idCont=c.idCont";

		if(count($joinActivities) > 0) {
			// add where clause to the querie
			$querie .= " inner join (SELECT distinct a1.idVille as idVille FROM ".implode (" INNER JOIN ", $joinActivities). ")act on act.idVille=v.idVille";
		}
		// if at least on conditions is defined
		if(count($conditions) > 0) {
			// add where clause to the querie
			$querie .= " WHERE " . implode (' AND ', $conditions);
		}
		$performQuerie =  $this->pdo->query($querie);
		//var_dump($conditions);
		//echo $querie;

		$results = $performQuerie->fetchAll();
		$nbResults = $performQuerie->rowCount($results);


		if($nbResults == 0){
			$nope= "";
			return $nope;
		}
		else{
			return $results;
		}
	}		


}
  ?>