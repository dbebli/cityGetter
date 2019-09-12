<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type:application/json");
require "inc/init.inc.php";
require "Ville.php";

$ville = new Ville($pdo);


if (isset($_GET['search'])) {
    $result = $ville->getByAttributes($pdo);
    echo json_encode(["cities"=>$result]);
}
else{
    //at the beginning get all cities
    $allCities =  $ville->getCities($pdo);
    $allMonths=  $ville->getMonths($pdo);
    $allActivite =  $ville->getActivite($pdo);
    $allContinent =  $ville->getContinent($pdo);
    $tab=["cities"=>$allCities,"months"=>$allMonths,"activite"=>$allActivite,"continent"=>$allContinent];
  echo json_encode($tab);
}

?>