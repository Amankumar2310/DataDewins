<?php

$host = 'database';
$username = 'root';
$password = 'root';

$connection = new mysqli($host, $username, $password);

if($connection->connect_error){
	die("Connection failed: " . $connection->connect_error);
} else {
	echo "MySQL version: ",$connection->server_info;
}

?>
