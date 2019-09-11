<?php

	//INIT VERSION ONLINE


	//connexion à la base données
	//configuration de base :
	$bddOptions= array(
		PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",  //on force l'encodage en utf8
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, //on récupère les résultat sous forme de tableau associatif
		PDO::ATTR_ERRMODE			 => PDO::ERRMODE_WARNING //on affiche les erreurs de type warning. Cette instruction sera à commenter en prod
	);

	define('TYPEBDD', 'mysql');//type de BDD
	define('HOST', 'localhost'); //domaine du serveur
	define('USER', 'root');//nom de l'utilisateur
	define('PASSWORD', '');
	define('DBNAME', 'voyage'); //nom de la bdd

	try{//on essaie de se connecetr à la base de données
		$pdo = new PDO(TYPEBDD . ':host=' . HOST . ';dbname=' . DBNAME,USER,PASSWORD, $bddOptions);

	}
	catch(Exception $e){//sinon
		die('Erreur BDD: '.$e->getMessage());
	}

	//constantes :
	define('RACINE', $_SERVER['DOCUMENT_ROOT'] . '/');

	//variable d'affichage:
	$content="";



?>
