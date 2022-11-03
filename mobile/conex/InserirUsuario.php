<?php
require_once 'conexao.php';

if (!empty($_POST)) {

  try {

    $email 	= $_POST["email"]; 

    $sql 	= "
		SELECT email
		FROM usuario 
		WHERE UPPER(email) = UPPER('{$email}');";

   	$query 	= $pdo->prepare($sql);
   	$query->bindValue(':email' , $email, PDO::PARAM_STR);
    $query->execute();
	
	if($linha = $query->fetch()){
            echo 'OFF';
            die();
	}else{

      $sql = "INSERT INTO usuario
                (nome, email, senha, celular,id_tipo_usuario)
              VALUES
                (:nome, :email, :senha, '',4)";

      $stmt = $pdo->prepare($sql);

      // Definir/organizar os dados p/ SQL
      $dados = array(
        ':nome' => $_POST['nome'],
        ':email' => $_POST['email'],
        ':senha' => ($_POST['senha'])
      );
    } 
      if ($stmt->execute($dados)) {
        echo 'ON';
      }
  } catch (PDOException $e) {
      echo 'OFF';
  }
  
}
die();

 ?>