<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if (isset($data["id_poster"], $data["full_desc"], $data["metakey"])) {
    $id_poster = $data["id_poster"];
    $full_desc = $data["full_desc"];
    $metakey = $data["metakey"];

    $sql = "INSERT INTO `blog_post`(`full_desc`, `metakey`, `id_poster`, `state`) VALUES (?, ?, ?, 0)";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
        $stmt->bind_param("ssi", $full_desc, $metakey, $id_poster);

        $result = $stmt->execute();

        if ($result) {
            $insertedID = mysqli_insert_id($conn);
            echo json_encode(array("success" => true, "id" => $insertedID));
        } else {
            echo json_encode(array("success" => false));
        }

        $stmt->close(); // Fermez la déclaration après utilisation
    }
} else {
    echo json_encode(array("success" => false, "error" => "Paramètres manquants"));
}
?>
