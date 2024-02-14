<?php
include '../connection.php';

if (isset($_POST["id_poster"], $_POST["full_desc"], $_POST["metakey"])) {
    $id_poster = $_POST["id_poster"];
    $full_desc = $_POST["full_desc"];
    $metakey = $_POST["metakey"];

    $sql = "INSERT INTO `blog_post`(`full_desc`, `metakey`, `id_poster`, `state`) VALUES (?, ?, ?, 1)";

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
