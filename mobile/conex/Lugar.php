<?php
    require_once 'conexao.php';
	$lugares = [];
    $posicao = $_POST["num"];
	$sql 	= "SELECT descricao FROM tipo_ambiente;";

	$query 	= $pdo->query($sql);
	$query->execute();

	$conexao = mysqli_connect('localhost',$username,$password,'workday2',3307);

	$resultado = mysqli_query($conexao,$sql);

	$registro = $query->fetchAll(PDO::FETCH_ASSOC);
    
	if(mysqli_num_rows($resultado) != 0){
		foreach($registro as $value){
			array_push($lugares, $value['descricao']);
		}
		echo $lugares[$posicao];
	}else{
            echo "Sem Lugares!";	
        }