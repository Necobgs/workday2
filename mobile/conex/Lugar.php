<?php
    require_once 'conexao.php';

	$sql 	= "SELECT descricao FROM `tipo_ambiente`;";

	$query 	= $pdo->prepare($sql);
	$query->execute();

	$conexao = mysqli_connect('localhost',$username,$password,'workday2',3307);

	$resultado = mysqli_query($conexao,$sql);

	$registro = mysqli_fetch_array($resultado);
    
    //vai retornar o id do usuário
	if($linha = $query->fetch()){
            echo "$registro[0]";
	}else{
            echo "Sem usuário";	
        }