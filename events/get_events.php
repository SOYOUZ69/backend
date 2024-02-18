<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['ev'])) {
    // Ensure lastId is an integer
$date_n=date("Y-m-d H:i:s");
$sql = "SELECT * FROM `formation` WHERE `date` >= '$date_n' and state=1 ORDER BY `date` ASC";

$result = $conn->query($sql);

$formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
       
    }

    echo json_encode(array("formations" => $formations));
} else {
    echo json_encode(array("formations" => false));
}
