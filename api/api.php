<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type:application/json");
require "../inc/init.inc.php";
require "../inc/methods.inc.php";


if (isset($_GET['search'])) {
    $result = getByAttributes($pdo);
    echo json_encode(["cities"=>$result]);
}
else{
    //at the beginning get all cities
    $allCities = getCities($pdo);
    $allMonths= getMonths($pdo);
    $allActivite = getActivite($pdo);
    $allContinent = getContinent($pdo);
    $tab=["cities"=>$allCities,"months"=>$allMonths,"activite"=>$allActivite,"continent"=>$allContinent];
  echo json_encode($tab);
}

?>