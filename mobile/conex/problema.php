<?php
    require_once 'conexao.php';
	$lugares = [];
    $posicao = 1;
    $id_tipo_usurio = 1 <= 2 ? 'P' : 'A' ;

	$sql 	= "SELECT problema FROM solicitacao WHERE solicitacao.status = '$id_tipo_usurio';";

	$query 	= $pdo->query($sql);
	$query->execute();

	$conexao = mysqli_connect('localhost',$username,$password,'workday2',3307);

	$resultado = mysqli_query($conexao,$sql);

	$registro = $query->fetchAll(PDO::FETCH_ASSOC);
    
	if(mysqli_num_rows($resultado) != 0){
		foreach($registro as $value){
			array_push($lugares, $value['problema']);
		}
		echo $lugares[$posicao];
	}else{
            echo "Sem Lugares!";	
        }