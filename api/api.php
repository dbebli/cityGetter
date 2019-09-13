<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type:application/json");
require "inc/init.inc.php";
require "Ville.php";

$ville = new Ville($pdo);

if (isset($_GET['search'])) {
    $result = $ville->getByAttributes();
    echo json_encode(["cities"=>$result]);
}
else{
    $allCities =  $ville->getCities();
    $allMonths=  $ville->getMonths();
    $allActivite =  $ville->getActivite();
    $allContinent =  $ville->getContinent();
    $tab=["cities"=>$allCities,"months"=>$allMonths,"activite"=>$allActivite,"continent"=>$allContinent];
  echo json_encode($tab);
}

?>