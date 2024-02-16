<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['last_id'])) {
    $lastId = (int) $data['last_id'];  // Ensure lastId is an integer

    $sql = "SELECT job_post.*, user.username,user.picture
FROM job_post
JOIN user ON job_post.id_poster = user.id
WHERE job_post.id > $lastId
LIMIT 10;
";

    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $formations[] = $row;
        $lastId = $row['id'];
    }

    echo json_encode(array("jobs_b" => $formations,"jobs_m" => $formations, "last_id" => $lastId));
} else {
    echo json_encode(array("jobs" => false));
}
