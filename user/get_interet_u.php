<?php 
include '../connection.php';

$id = 1;


$sql = "SELECT * FROM `user` WHERE `id`='$id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $data = $row["phone"];

    // Encode the data with the JSON_UNESCAPED_UNICODE flag
    $dataEncoded = json_decode($data, JSON_UNESCAPED_UNICODE | JSON_HEX_AMP);

    echo json_encode(array("data" => $dataEncoded));
} else {
    echo json_encode(array("get" => false));
}
?>