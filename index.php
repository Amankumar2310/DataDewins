<?php

$host = 'db';
$user = 'root';
$password = 'root';

$conn = new mysqli($host, $user, $password);

if($conn->connect_error){
	die('Connection failed: ' . $conn->connect_error);
}

printf("MySQL server version : %s\n", $conn -> server_info);

?>
