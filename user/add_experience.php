<?php

include '../connection.php';

if ($_POST["experience"] && $_POST["id"]) {
    $experience = $_POST["experience"];
    $experienceString = json_encode($experience);
    
    $id = $_POST["id"];
    

    // Update the experience column
    $sql = "UPDATE user
            SET experience = $experienceString
            WHERE id = $id";
            

$result = $conn->query($sql);

    // Check if the query was successful
    if ($result) {
        echo json_encode(array("experience" => true));
    } else {
        echo json_encode(array("experience" => false));
    }
} else {
    echo json_encode(array("experience" => false));
}
?>
