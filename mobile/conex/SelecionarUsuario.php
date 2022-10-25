<?php
    $email 	= $_POST["email"]; 
	$senha	= $_POST["senha"];
    $username = 'root';
	$password = '';
	$connWS = new PDO('mysql:local=localhost;port=3307;dbname=workday2',$username,$password);

	$sql 	= "
		SELECT email,senha
		FROM usuario 
		WHERE UPPER(email) = UPPER('{$email}')
		AND senha = '$senha';
	";
	$query 	= $connWS->prepare($sql);
	$query->bindValue(':email' , $email, PDO::PARAM_STR);
	$query->bindValue(':senha' , $senha, PDO::PARAM_STR);
	$query->execute();
	
	if($linha = $query->fetch()){
            echo 'ON';
	}else{
            echo 'OFF';	
        }