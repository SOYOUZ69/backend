<?php
include '../connection.php';

$sql = "SELECT * FROM `formation`";
$result = $conn->query($sql);

$formations = [];

while ($row = $result->fetch_assoc()) {
    $formations[] = $row;
}

echo json_encode(array("formations" => $formations));
