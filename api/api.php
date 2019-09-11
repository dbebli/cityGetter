<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type:application/json");
require "../inc/init.inc.php";
require "../inc/methods.inc.php";

//at the beginning get all cities
$allCities = getCities($pdo);
$allMonths= getMonths($pdo);
$allActivite = getActivite($pdo);
$allContinent = getContinent($pdo);
$tab=["cities"=>$allCities,"months"=>$allMonths,"activite"=>$allActivite,"continent"=>$allContinent];
  echo json_encode($tab);
if (isset($_GET['req'])) {
  // INIT

  // PROCESS REQUEST
  if ($_GET['search']) {
    $getAll = getByAttributes($pdo);
     echo json_encode($allCities,$allMonths,$allActivite,$allContinent);
    }
}
?>