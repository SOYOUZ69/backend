<?php
include '../connection.php';
if (isset($_POST['id'])){
$id=$_POST['id'];
$sql = "SELECT * FROM `formation` where id = $id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // No need for json_decode() here

    echo json_encode(array("formations" => $row));
} else {
    echo json_encode(array("formations" => false));
}
}else {
    echo json_encode(array("formations" => false));
}
?>
