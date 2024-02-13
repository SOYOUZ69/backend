<?php
include '../connection.php';

$rawBody = file_get_contents('php://input');
$data = json_decode($rawBody, true);

$msg = false;

if (!isset($data['attribute']) || !isset($data['value'])) {
    echo json_encode(['error' => 'Attribute and value not provided']);
    exit;
}

if (!isset($data['id'])) {
    echo json_encode(['error' => 'User ID not provided']);
    exit;
}

$attribute = $data['attribute'];
$value = $data['value'];
$userId = $data['id'];

$validAttributes = ['username', 'phone', 'picture', 'cv', 'email', 'password', 'parcour', 'interet'];

if (!in_array($attribute, $validAttributes)) {
    echo json_encode(['error' => 'Invalid attribute']);
    exit;
}

if ($attribute == 'picture' || $attribute == 'cv') {

    $sql = "UPDATE `user` SET `$attribute`=? WHERE `id`=?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("si", $logo, $userId);

        $result = $stmt->execute();

        if ($result) {
            $msg = true;
        }
    }
} elseif ($attribute == 'parcour') {
    $op = $data['operation'];

    if ($op == "add") {
        foreach ($data['value'] as $parcours) {

            $msg = true; 
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
