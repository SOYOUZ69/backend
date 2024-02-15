<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
$response = array();
if (isset($data['id'])) {
$id = $data['id'];

$sql = "SELECT * FROM user WHERE `id`=".$id;
$result = $conn->query($sql);



if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $phone = $row["phone"];
    $phoneEncoded = json_decode($phone, true);
    
    
    
    $interet = $row["interet"];
    
    
    $bac = $row["bac"];
    
    $competence = $row["competence"];
    $competenceEncoded = json_decode($competence, true);
    
    $response["phone"] = $phoneEncoded;
    $sql2 = "SELECT * FROM `parcour` WHERE `id_u`=".$id;

$result1 = $conn->query($sql2);

$parcour = [];

    while ($row1 = $result1->fetch_assoc()) {
        $parcour[] = $row1;
       
    }
    $response["liste_parcoure"] = $parcour;
    $response["interet"] = $row["interet"];
    $response["competence"] = $competence;
    $response["bac"] = $bac;

    if ($row["cv"]) {
    $cv = $row["cv"];
    $response["cv"] = $cv;
    } else {
    $response["cv"] = false;
    }

    if ($row["picture"]) {
    $picture = $row["picture"];
    $response["photo"] = $picture;
    } else {
    $response["photo"] = false;
    }
    $sql11 = "SELECT interet FROM user WHERE `id`=1";
$result11 = $conn->query($sql11);

if ($result11->num_rows > 0) {
    $row11 = $result11->fetch_assoc();
    $interet_all= [];
    $interet_all=$row11["interet"];

    $response["interet_all"] =$interet_all;
}
} else { $response["get"] = false;
}}else{ $response["get"] = false;}

echo json_encode($response);
?>
