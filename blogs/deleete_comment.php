<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];
    $sql = "DELETE FROM `comment` WHERE `id`=?";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
        $stmt->bind_param("i", $Id);

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
