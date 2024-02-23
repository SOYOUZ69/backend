<?php

include '../connection.php';

$rawBody = file_get_contents('php://input');
$data = json_decode($rawBody, true);

$msg = false;

if (!isset($data['attribute'])&&!isset($_POST['attribute'])) {
    echo json_encode(['error' => 'Attribute not provided']);
    exit;
}

if (!isset($data['id'])&&!isset($_POST['id'])) {
    echo json_encode(['error' => 'User ID not provided']);
    exit;
}
if (isset($data['attribute'])){
    $attribute=$data['attribute'];
}else{$attribute=$_POST['attribute'];}
if (isset($data['id'])){
    $userId=$data['id'];
}else{$userId=$_POST['id'];}



$validAttributes = ['username','bac','genre', 'phone', 'picture','date_birth', 'cv', 'parcour','competence', 'interet'];

if (!in_array($attribute, $validAttributes)) {
    echo json_encode(['error' => 'Invalid attribute']);
    exit;
}

if ($attribute == 'picture' || $attribute == 'cv') {
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

        $expensions = array("jpeg", "jpg", "png","pdf");

        if (in_array($file_ext, $expensions) === false) {
            $errors[] = "extension not allowed, please choose a JPEG or PNG file.";
        }

        $logo = time() . '_' . $file_name;

        if (empty($errors)) {
            move_uploaded_file($file_tmp, "../uploads/user/" . $logo);

            $sql = "UPDATE `user` SET `$attribute`=? WHERE `id`=?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("si", $logo, $userId);

        $result = $stmt->execute();

        if ($result) {
            $msg = true;
        }
    }
        } else {
            print_r($errors);
        }
    }

    
} elseif ($attribute == 'parcour') {
    if (!isset($data['operation'])) {
        echo json_encode(['error' => 'operation manquante']);
        exit;
    }
    $op = $data['operation'];

    if ($op == "add") {
        

// Décode la liste JSON
$listeParcours = $data['value'];
foreach ($listeParcours['liste_parcoure'] as $parcours) {
    // Stocke chaque donnée dans une variable
    $nomEtablissement = $parcours['nom_etablissement'];
    $dateDebut = $parcours['date_debut'];
    $dateFin = $parcours['date_fin'];
    $diplome = $parcours['diplome'];
    $domaine = $parcours['domaine'];
    $sql = "INSERT INTO `parcour` (`id_u`, `nom_etablissement`, `date_debut`, `date_fin`, `diplome`, `domaine`) VALUES (?, ?, ?, ?, ?, ?)";

    // Préparation de la requête
    $stmt = $conn->prepare($sql);
    
    // Liaison des paramètres
    $stmt->bind_param("isssss", $userId, $nomEtablissement, $dateDebut, $dateFin, $diplome, $domaine);
    if ($stmt->execute()) {
        $msg=true;
        
    }
}
        



    } elseif ($op == "delete") {
        $parcoursId = $data['value'];

        $sql = "DELETE FROM `parcour` WHERE `id`=?";
        $stmt = $conn->prepare($sql);

        $stmt->bind_param("i", $parcoursId);

        if ($stmt->execute()) {
            $msg = true;
        }
    }
} else {
    $value = $data['value'];

    $sql = "UPDATE `user` SET `$attribute`=? WHERE `id`=?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("si", $value, $userId);

        $result = $stmt->execute();

        if ($result) {
            $msg = true;
        }
    }
}

echo json_encode(['msg' => $msg]);

?>
