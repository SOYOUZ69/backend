<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if (isset($data['email']) ) {
$email = $data['email'];
$password =$data['password'];

$sql = "SELECT * FROM `user` WHERE `email`='$email' and `password` ='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $id = $row['id'];
    echo json_encode(array("login" => true, "id" => $id));
    
} else {
    echo json_encode(array("login" => false, "error" => "Identifiants incorrects"));    
}} else {
    echo json_encode(array("login" => false));
    
}
?>