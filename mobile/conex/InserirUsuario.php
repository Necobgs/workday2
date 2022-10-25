<?php
require_once 'conexao.php';

if (!empty($_POST)) {

  try {
      $sql = "INSERT INTO usuario
                (nome, email, senha, celular,id_tipo_usuario)
              VALUES
                (:nome, :email, :senha, '',1)";

      $stmt = $pdo->prepare($sql);

      // Definir/organizar os dados p/ SQL
      $dados = array(
        ':nome' => $_POST['nome'],
        ':email' => $_POST['email'],
        ':senha' => ($_POST['senha'])
      );

      if ($stmt->execute($dados)) {
        echo 'ON';
      }
  } catch (PDOException $e) {
      echo 'OFF';
  }
}
die();

 ?>