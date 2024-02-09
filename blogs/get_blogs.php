<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['bp'])) {
    // Ensure lastId is an integer
    $sql = "SELECT blog_post.*, COUNT(upvotes.id) AS upvote_count
    FROM blog_post
    LEFT JOIN upvotes ON blog_post.id = upvotes.id_object AND upvotes.type = 'blog'
    WHERE blog_post.state = 1
    GROUP BY blog_post.id
    ORDER BY upvote_count DESC";

$result = $conn->query($sql);

if ($result) {

$blogs = [];

    while ($row = $result->fetch_assoc()) {
        $blogs[] = $row;
       
    }

    echo json_encode(array("blogs" => $blogs));
} else {
    echo json_encode(array("blogs" => false));
}
}else{ echo json_encode(array("blogs" => false,"erreur" => "demande incorrecte"));}