<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['last_id'])&&isset($data['id_user'])) {
    $lastId = (int) $data['last_id'];  // Ensure lastId is an integer
    $id_user =(int) $data['id_user'];
    $sql = "SELECT job_post.*, user.username, user.picture,
    (CASE WHEN favoris.id IS NOT NULL THEN true ELSE false END) AS save
FROM job_post
JOIN user ON job_post.id_poster = user.id
LEFT JOIN favoris ON favoris.object_type = 'job' AND favoris.id_object = job_post.id AND favoris.id_u = $id_user
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
