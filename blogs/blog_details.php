<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id'])) {
    $Id = (int) $data['id'];  // Ensure lastId is an integer

    
    $sql = "SELECT comment.id, comment.object_type, comment.id_object, comment.id_u, comment.message, comment.date, user.username, user.picture, COUNT(upvotes.id) AS upvote_count
    FROM comment
    JOIN user ON comment.id_u = user.id
    LEFT JOIN upvotes ON comment.id_object = upvotes.id_o AND upvotes.type = 'comment'
    WHERE comment.id_object = $Id
    GROUP BY comment.id, comment.object_type, comment.id_object, comment.id_u, comment.message, comment.date, user.username, user.picture;
    ";

    $result = $conn->query($sql);

    $comments = [];

    while ($row = $result->fetch_assoc()) {
        $comments[] = $row;
        $lastId = $row['id'];
    }
 

   

    echo json_encode(array("comments" => $comments));
} else {
    echo json_encode(array("comments" => false));
}



?>