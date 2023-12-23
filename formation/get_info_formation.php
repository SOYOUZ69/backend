<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];  // Ensure lastId is an integer

    $sql = "SELECT * FROM `formation` WHERE id = $Id LIMIT 10";

    $result = $conn->query($sql);
    $formations = $result->fetch_assoc();
 

   

    echo json_encode(array("formations" => $formations));
} else {
    echo json_encode(array("formations" => false));
}


?>