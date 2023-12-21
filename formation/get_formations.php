<?php
include '../connection.php';

if (isset($_POST['lastId'])){
    $lastId = $_POST['lastId'];
    $sql = "SELECT * FROM `formation` where id > $lastId LIMIT 10";

$result = $conn->query($sql);

$formations = [];


while ($row = $result->fetch_assoc()) {
    $formations[] = $row;
    $lastId = $row['id'];
}

echo json_encode(array("formations" => $formations, "lastId" => $lastId));}
else{echo json_encode(array("formations" =>false));}
