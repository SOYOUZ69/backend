<?php
include '../connection.php';

$email = $_POST['email'];
$password =$_POST['password'];

$sql = "SELECT * FROM `user` WHERE `email`='$email' and password ='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $id = $row['id'];
    echo json_encode(array("login" => true, "id" => $id));
    
} else {
    echo json_encode(array("login" => false));
    
}
?>