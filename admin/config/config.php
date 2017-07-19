<?php

$db_username = 'root';   		//Database username
$db_password = '';				//Database password 
$db_name = 'test';				//Database name 
$db_host = 'localhost';			//Database Host
					
//connect to MySql						
$mysqli = new mysqli($db_host, $db_username, $db_password,$db_name);						
if ($mysqli->connect_error) {
    die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}
?>