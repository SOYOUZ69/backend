<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['lastId'])||isset($data['rech'])) {
    $lastId = (int) $data['lastId'];
    $rech= $data['rech'];  // Ensure lastId is an integer

    $sql = "SELECT * FROM `jobs` WHERE `id` > $lastId AND (`brief_desc` LIKE '%$rech%' OR `metakey` LIKE '%$rech%' OR `full_desc` LIKE '%$rech%') LIMIT 10";

    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
        $lastId = $row['id'];
    }

    echo json_encode(array("recherche" => $formations, "lastId" => $lastId));
} else {
    echo json_encode(array("recherche" => false));
}
