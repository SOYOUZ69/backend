<?php
include '../connection.php';
$name = $_POST['username'];
$email = $_POST['email'];
$password = md5($_POST['password']);

$sql="INSERT INTO `user`(`username`,`email`,`password` )values('$name','$email','$password')";
$result=$conn->query($sql);
if($result){
    echo json_encode(array("success" => true));

}else{echo json_encode(array("success" => false));
  }
?>