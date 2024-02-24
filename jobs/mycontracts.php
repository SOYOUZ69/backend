<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id_user'])) {
    $id = $data['id_user'];
    $sql = "SELECT 
    job_post.*,
    COUNT(job_application.id) AS application_count,
    GROUP_CONCAT(user.id) AS user_ids,
    GROUP_CONCAT(user.username) AS usernames
FROM job_post
LEFT JOIN job_application ON job_post.id = job_application.job_id
LEFT JOIN user ON job_application.id_u = user.id
WHERE job_post.id_poster = $id
GROUP BY job_post.id;
";
    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        // Extraire la partie numérique et la devise du salaire
        preg_match('/(\d+)([a-zA-Z]+)/', $row['salary'], $matches);
        $row['salary'] = $matches[1];
        $row['currency'] = isset($matches[2]) ? $matches[2] : '';

        $formations[] = $row;
    }

    echo json_encode(array("job_applications" => $formations));
} else {
    echo json_encode(array("job_applications" => false));
}
?>
