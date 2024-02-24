<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data
$data = json_decode($rawBody, true);

// Check if required parameters exist and are not empty
if (isset($data["id"], $data["full_desc"], $data["metakey"])) {
    $id = $data["id"];
    $full_desc = $data["full_desc"];
    $metakey = $data["metakey"];

    // Utilisez une requête UPDATE au lieu de INSERT
    $sql = "UPDATE `blog_post` SET `full_desc`=?, `metakey`=? ,`date`=now() WHERE `id`=?";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
        $stmt->bind_param("ssi", $full_desc, $metakey, $id);

        $result = $stmt->execute();

        if ($result) {
            echo json_encode(array("success" => true));
        } else {
            echo json_encode(array("success" => false, "error" => "Échec de l'exécution de la requête : " . $stmt->error));
        }

        $stmt->close(); // Fermez la déclaration après utilisation
    } else {
        echo json_encode(array("success" => false, "error" => "Échec de la préparation de la requête : " . $conn->error));
    }
} else {
    echo json_encode(array("success" => false, "error" => "Paramètres manquants"));
}
?>
