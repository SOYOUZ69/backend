<?php
include '../connection.php';

$email = $_POST['email'];

$sql = "SELECT * FROM `user` WHERE `email`='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode(array("emailFound" => true));
    
} else {
    echo json_encode(array("emailFound" => false));
    
}
?>