<?php
include '../connection.php';
if($_POST["username"]){
$name = $_POST["username"];
$email = $_POST["email"];
$password = $_POST["password"];

$sql="INSERT INTO `user`(`username`,`email`,`password` )values('$name','$email','$password')";
$result=$conn->query($sql);
if($result){
  $insertedID = mysqli_insert_id($conn);
  echo json_encode(array("success" => true, "id" => $insertedID));

}else{echo json_encode(array("success" => false));
}}
?>