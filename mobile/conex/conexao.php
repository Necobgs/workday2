<?php

$endereco = 'localhost';
$banco = 'workday2';
$username = 'root';
$password = '';

try {

	$pdo = new PDO('mysql:local=localhost;port=3307;dbname=workday2',$username,$password,[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);


} catch (PDOException $e) {
  echo "Falha ao conectar ao banco de dados. <br/>";
  die($e->getMessage());
}

?>