<?php 
include '../connection.php';

$id = $_POST['id'];


$sql = "SELECT * FROM `user` WHERE `id`='$id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $phone = $row["phone"];
    $phoneEncoded = json_decode($phone, JSON_UNESCAPED_UNICODE | JSON_HEX_AMP);
    
    $experience = $row["experience"];
    $experienceEncoded = json_decode($experience, JSON_UNESCAPED_UNICODE | JSON_HEX_AMP);
    
    $interet = $row["interet"];
    $interetEncoded = json_decode($interet, JSON_UNESCAPED_UNICODE | JSON_HEX_AMP);
    
    echo json_encode(array("phone" => $phoneEncoded,"experience" => $experienceEncoded,"interet" => $interetEncoded));
} else {
    echo json_encode(array("get" => false));
}
?>