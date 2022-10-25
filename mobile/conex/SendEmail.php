<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

$mail = new PHPMailer(true);
$emailDestinatario = $_POST['emailDestinatario'];
$nomeDestinatario = $_POST['nomeDestinatario'];

//conexao com banco de dados e encontrando a senha do usuário
//ps: definir quais os requisitos de informações a serem buscadas no where
//mudar, adicionar ou remover tudo que tiver '-->' 

$username = 'root';
	$password = '';
	$connWS = new PDO('mysql:local=localhost;port=3307;dbname=workday2',$username,$password);

	$sql 	= "
		SELECT email
		FROM usuario 
		WHERE UPPER(email) = UPPER('{$email}');
-->		AND ...;
	";
	$query 	= $connWS->prepare($sql);
	$query->bindValue(':email' , $email, PDO::PARAM_STR);
-->	$query->bindValue(':...' , $, PDO::PARAM_STR);
	$query->execute();


if (isset($_POST['enviar'])){

try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;                     
    $mail->isSMTP();                                          
    $mail->Host       = 'smtp.gmail.com';                       
    $mail->SMTPAuth   = true;                                  
    $mail->Username   = 'workdayenterprises@gmail.com';            
    $mail->Password   = 'Workday2022cedup';                             
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            
    $mail->Port       = 465;                                    

    //Recipients
    $mail->setFrom('workdayenterprises@gmail.com', 'Mailer');
    $mail->addAddress($emailDestinatario, $nomeDestinatario);                                                                       
    $mail->addReplyTo('workdayenterprises@gmail.com', 'Workday');

    //Content
    $mail->isHTML(true);            
    $mail->Subject = 'Mudança de senha  ';
    $mail->Body    = "Essa mensagem foi enviada pelo aplicativo Workday, <br>
                      segue abaixo as informações do solicitante: <br>
                      Nome: $_POST[nomeDestinatario] <br>
                      E-mail: $_POST[emailDestinatario] <br> ";


    $mail->send();
    echo 'E-mail enviado com sucesso!';
} catch (Exception $e) {
    echo "A mensagem não pode ser enviada. Mailer Erro: {$mail->ErrorInfo}";
}

};