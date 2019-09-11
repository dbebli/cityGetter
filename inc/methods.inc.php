<?php
	// $query=$pdo->query("SELECT * FROM `activite`");
	// $content="";
	// while($res=$query-> fetch()){

	// 	$content.="<tr>
	// 	<td>{$res['activite']}</td>
	// 	</tr>
	// 	";
	// }
	// echo "<table>".$content."</table>"; 
	
	  /* [USER FUNCTIONS] */
	  function getAll($pdo){
		$query = $pdo->query("SELECT * FROM `ville`");
		$res = $query->fetchAll();
		return $res;
	  }



?>
