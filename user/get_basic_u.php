<?php 
include '../connection.php';

$id = $_POST['id'];


$sql = "SELECT  `username`,`email`,`picture`,`country`,`genre`,`type`,`date_birth`,`points` FROM `user` WHERE `id`='$id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    //$data = $row["experience"];

    // Encode the data with the JSON_UNESCAPED_UNICODE flag
   // $dataEncoded = json_decode($data, JSON_UNESCAPED_UNICODE | JSON_HEX_AMP);

    echo json_encode(array("data" => $row));
} else {
    echo json_encode(array("get" => false));
}
?>