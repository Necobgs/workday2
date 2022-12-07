<?php
   

    date_default_timezone_set('America/Sao_Paulo');


if (!empty($_POST)) {

  try {

    require_once 'conexao.php';
    $problema   = $_POST["problema"]; 
	$lugar	    = $_POST["lugar"];
    $descricao  = $_POST["descricao"];
    $id_usuario = $_POST["id_usuario"];
    $status     = "P";

      $sql = "INSERT INTO solicitacao
                      (data,hora,descricao,status,problema,id_usuario,id_grau)
              VALUES
              (CURRENT_DATE, CURRENT_TIME, :descricao,:statuss,:problema,:id_usuario,1);";

      $stmt = $pdo->prepare($sql);

      // Definir/organizar os dados p/ SQL
      $dados = array(
        ':descricao' => $descricao,
        ':statuss' => $status,
        ':problema' => $problema,
        ':id_usuario' => (int)$id_usuario
      );
    
      if ($stmt->execute($dados)) {
        echo 'ON';
      }
  } catch (PDOException $e) {
      echo $e;
  }
  
}
die();