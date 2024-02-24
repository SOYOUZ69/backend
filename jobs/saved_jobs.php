<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];

    $sql = "
    SELECT job_post.*, user.username AS username, user.picture AS poster_picture
    FROM job_post
    JOIN favoris ON job_post.id IN (favoris.id_object)
    JOIN user ON job_post.id_poster = user.id
    WHERE favoris.id_u = $Id AND favoris.object_type = 'job';
    ";

    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
        
    }

    echo json_encode(array("saved" => $formations));
} else {
    echo json_encode(array("saved" => false));
}
