<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id_poster'])) {
    $Id = (int) $data['id_poster'];  // Ensure lastId is an integer

    
    $sql = "SELECT username,picture FROM `user` WHERE id = $Id";

    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
 

   

    echo json_encode(array("user" => $user));
} else {
    echo json_encode(array("user" => false));
}



?>