<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if (isset($data["id_poster"], $data["comment"], $data["id_blog"])) {
    $id_poster = $data["id_poster"];
    $comment = $data["comment"];
    $id_blog = $data["id_blog"];
    $object_type ="comment";

    $sql = "INSERT INTO `comment` (`object_type`, `id_object`, `id_u`, `message`, `date`) VALUES (?, ?, ?, ?, NOW())";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
        $stmt->bind_param("siis", $object_type, $id_blog, $id_poster, $comment);

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
