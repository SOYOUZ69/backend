<?php 
include '../connection.php';

$id = $_POST['id'];

$sql = "SELECT * FROM user WHERE `id`='$id'";
$result = $conn->query($sql);

$response = array();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $phone = $row["phone"];
    $phoneEncoded = json_decode($phone, true);
    
    $experience = $row["listparcour"];
    $experienceEncoded = json_decode($experience, true);
    
    $interet = $row["interet"];
    
    
    $bac = $row["bac"];
    
    $competence = $row["competence"];
    $competenceEncoded = json_decode($competence, true);
    
    $response["phone"] = $phoneEncoded;
    $response["liste_parcoure"] = $experienceEncoded;
    $response["interet"] = $row["interet"];
    $response["competence"] = $competenceEncoded;
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
