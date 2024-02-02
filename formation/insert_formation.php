<?php
include '../connection.php';

if ($_POST["nom"]) {
    $nom = $_POST["nom"];
    $description = $_POST["description"];
    $link = $_POST["link"];
    $price = $_POST["price"];
    $date = $_POST["date"];
    $company_url = $_POST["company_url"];
    $metakey = $_POST["metakey"];
    $id_poster = $_POST["id_poster"];

    $logo = "";
    if (!empty($_FILES['cover']['name'])) {
        $errors = array();
        $file_name = mysqli_real_escape_string($conn, $_FILES['cover']['name']);
        $file_size = $_FILES['cover']['size'];
        $file_tmp = $_FILES['cover']['tmp_name'];
        $file_type = $_FILES['cover']['type'];
        $exp = explode('.', $_FILES['cover']['name']);
        $end_expl = end($exp);
        $file_ext = strtolower($end_expl);

        $expensions = array("jpeg", "jpg", "png");

        if (in_array($file_ext, $expensions) === false) {
            $errors[] = "extension not allowed, please choose a JPEG or PNG file.";
        }

        $logo = time() . '_' . $file_name;

        if (empty($errors)) {
            move_uploaded_file($file_tmp, "../uploads/formation/" . $logo);
        } else {
            print_r($errors);
        }
    }

    $sql = "INSERT INTO `formation`(`nom`, `description`, `cover`, `link`, `price`, `date`, `company_url`, `metakey`, `id_poster`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    
    if ($stmt) {
        $stmt->bind_param("ssssdsssi", $nom, $description, $logo, $link, $price, $date, $company_url, $metakey, $id_poster);
        
        $result = $stmt->execute();
        
        if ($result) {
            $insertedID = mysqli_insert_id($conn);
            echo json_encode(array("success" => true, "id" => $insertedID));
        } else {
            echo json_encode(array("success" => false));
        }
        
        $stmt->close();
    } else {
        echo json_encode(array("success" => false, "error" => $conn->error));
    }
}
?>
