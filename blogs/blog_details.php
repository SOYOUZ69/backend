<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id']) && isset($data['id_u'])) {
    $Id = (int) $data['id'];
    $id_u = $data['id_u']; // Ensure lastId is an integer

    $sql = "
    SELECT 
        comment.id, 
        comment.object_type, 
        comment.id_object, 
        comment.id_u, 
        comment.message, 
        comment.date, 
        user.username, 
        user.picture, 
        COUNT(upvotes.id) AS upvote_count,
        CASE WHEN comment.id_u = ? THEN true ELSE false END AS comentu,
        CASE WHEN upvotes.id_u = ? THEN true ELSE false END AS like_u
    FROM comment
    JOIN user ON comment.id_u = user.id
    LEFT JOIN upvotes ON comment.id_object = upvotes.id_o AND upvotes.type = 'comment'
    WHERE comment.id_object = ?
    GROUP BY comment.id, comment.object_type, comment.id_object, comment.id_u, comment.message, comment.date, user.username, user.picture;
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sss', $id_u, $id_u, $Id); // sss represents three string parameters, adjust if needed
    $stmt->execute();

    $result = $stmt->get_result();

    $comments = [];

    while ($row = $result->fetch_assoc()) {
        $comments[] = $row;
    }

    echo json_encode(array("comments" => $comments));
} else {
    echo json_encode(array("comments" => false));
}
?>
