<?php 
include '../connection.php';

$id = $_POST['id'];

$sql = "SELECT * FROM user WHERE `id`=".$id;
$result = $conn->query($sql);

$response = array();

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
} else { $response["get"] = false;
}

echo json_encode($response);
?>
