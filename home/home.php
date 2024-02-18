<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

$response = array();

if (isset($data['id'])) {
    $id = $data['id'];
    $sql = "
    SELECT 
        (SUM(CASE WHEN bac IS NOT NULL THEN 1 ELSE 0 END) +
        SUM(CASE WHEN phone IS NOT NULL THEN 1 ELSE 0 END) +
         SUM(CASE WHEN interet IS NOT NULL THEN 1 ELSE 0 END) +
         SUM(CASE WHEN competence IS NOT NULL THEN 1 ELSE 0 END) +
         SUM(CASE WHEN cv IS NOT NULL THEN 1 ELSE 0 END)) AS fill_percentage
    FROM user 
    WHERE id = $id;
    ";

    $result = $conn->query($sql);

    if ($result) {
        $row = $result->fetch_assoc();
        $fillPercentage = $row['fill_percentage'];
        echo json_encode(array("fill_percentage" => $fillPercentage));
        exit(); // Exit to avoid further output
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Query failed: ' . $conn->error;
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Missing user ID';
}

echo json_encode($response);
?>
