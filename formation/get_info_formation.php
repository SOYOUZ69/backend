<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];  // Ensure lastId is an integer

    $sql = "SELECT * FROM `formation` WHERE id = $Id ";

    $result = $conn->query($sql);
    $formations = $result->fetch_assoc();
    $use=$formations['id_poster'];
    $sql = "SELECT username,picture FROM `user` WHERE id = $use";

    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
 

   

    echo json_encode(array("formations" => $formations,"user" => $user));
} else {
    echo json_encode(array("formations" => false));
}



?>