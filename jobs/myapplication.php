<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id_user'])) {
    $id=$data['id_user'];
    $sql="SELECT job_post.*, job_application.date AS application_date
    FROM job_post
    JOIN job_application ON job_post.id = job_application.job_id
    WHERE job_application.id_u = $id";
    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
        
    }

    echo json_encode(array("job_applications" => $formations));
} else {
    echo json_encode(array("job_applications" => false));
}
    