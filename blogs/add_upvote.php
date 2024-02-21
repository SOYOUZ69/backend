<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if (isset($data["id_poster"], $data["object"], $data["id_object"])&&($data["object"]=="comment"||$data["object"]=="blog")) {
    $id_poster = $data["id_poster"];
    $object = $data["object"];
    $id_object = $data["id_object"];
   

    $sql = "INSERT INTO `upvotes` (`type`, `id_o`, `id_u`) VALUES (?, ?, ?)";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
        $stmt->bind_param("sii", $object, $id_object, $id_poster);

        $result = $stmt->execute();

        if ($result) {
            echo json_encode(array("success" => true));
        } else {
            echo json_encode(array("success" => false));
        }

        $stmt->close(); // Fermez la déclaration après utilisation
    }
} else {
    echo json_encode(array("success" => false, "error" => "Paramètres manquants"));
}
?>
