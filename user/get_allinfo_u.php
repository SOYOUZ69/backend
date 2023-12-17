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
    
    // Create an array for liste_parcour
    $formattedListeParcour = array();
    foreach ($experienceEncoded as $key => $value) {
        // Check if the value is an array (nested experience) or not
        if (is_array($value)) {
            $formattedListeParcour[] = $value;
        }
    }
    
    $response["phone"] = $phoneEncoded;
    $response["liste_parcoure"] = $formattedListeParcour;
    $response["interet"] = $row["interet"];
    $response["competence"] = json_decode($row["competence"], true);
    $response["bac"] = $row["bac"];

    $response["cv"] = $row["cv"] ? $row["cv"] : false;
    $response["photo"] = $row["picture"] ? $row["picture"] : false;
} else {
    $response["get"] = false;
}

echo json_encode($response);
?>