<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];

    $sql = "SELECT * FROM `jobs` WHERE `id` in (SELECT * FROM `favoris` WHERE `id_u`=$Id and `object_type` ='job')";

    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
        $lastId = $row['id'];
    }

    echo json_encode(array("saved" => $formations));
} else {
    echo json_encode(array("saved" => false));
}
