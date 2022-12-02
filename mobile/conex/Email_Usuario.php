<?php
    require_once 'conexao.php';
	
    $email 	= $_POST["email"]; 
	$senha	= $_POST["senha"];

	$sql 	= "
		SELECT * FROM usuario 
		WHERE UPPER(email) = UPPER('{$email}')
		AND senha = '$senha';";

	$query 	= $pdo->prepare($sql);
	$query->bindValue(':email' , $email, PDO::PARAM_STR);
	$query->bindValue(':senha' , $senha, PDO::PARAM_STR);
	$query->execute();

	$conexao = mysqli_connect('localhost',$username,$password,'workday2',3307);

	$resultado = mysqli_query($conexao,$sql);

	$registro = mysqli_fetch_array($resultado);
    
    //vai retornar o email do usuário
	if($linha = $query->fetch()){
            echo "$registro[2]";
	}else{
            echo "Sem usuário";	
        }