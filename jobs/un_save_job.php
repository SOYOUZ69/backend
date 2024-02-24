<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if (isset($data["job_id"], $data["id_u"], $data["state"]) && ($data["state"] == "save" || $data["state"] == "unsave")) {
    $type = "job"; // Add a semicolon here
    $id_u = $data["id_u"];
    $job_id = $data["job_id"];
    if ($data["state"] == "save") {
        $sql = "INSERT INTO `favoris`(`object_type`, `id_object`,`id_u`, `date`) VALUES (?, ?, ? , NOW())";

        $stmt = $conn->prepare($sql);

        if ($stmt) {
            // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
            $stmt->bind_param("sii", $type, $job_id, $id_u);

            $result = $stmt->execute();

            if ($result) {
                echo json_encode(array("success" => true));
            } else {
                echo json_encode(array("success" => false));
            }

            $stmt->close(); // Fermez la déclaration après utilisation
        }
    } else {
        $sql = "DELETE FROM `favoris` WHERE `id_object`= ? AND `id_u`= ? and `object_type`=?";

        $stmt = $conn->prepare($sql);

        if ($stmt) {
            // Assurez-vous que les types dans bind_param correspondent aux types réels dans la base de données
            $stmt->bind_param("iis", $job_id, $id_u,$type);

            $result = $stmt->execute();

            if ($result) {
                echo json_encode(array("success" => true));
            } else {
                echo json_encode(array("success" => false));
            }

            $stmt->close(); // Fermez la déclaration après utilisation
        }
    }
} else {
    echo json_encode(array("success" => false, "erreur" => "erreur de parametre "));
}
?>
