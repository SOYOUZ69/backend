<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['last_id'])&&isset($data['id_u'])) {
    // Ensure lastId is an integer
    $lastId = isset($data['last_id']) ? (int)$data['last_id'] : 0;
$id_u=$data['id_u'];

    // Adjust the SQL query to filter by ID greater than the last ID
    $sql = "
    SELECT 
        blog_post.*, 
        COUNT(upvotes.id) AS upvote_count, 
        COUNT(comment.id) AS comment_count, 
        user.username, 
        user.picture,
        CASE WHEN upvotes.id_u = $id_u THEN true ELSE false END AS `like`
    FROM blog_post
    LEFT JOIN upvotes ON blog_post.id = upvotes.id_o AND upvotes.type = 'blog' AND upvotes.id_u = $id_u
    LEFT JOIN user ON blog_post.id_poster = user.id
    LEFT JOIN comment ON blog_post.id = comment.id_object AND comment.object_type = 'blog'
    WHERE blog_post.state = 1 AND blog_post.id > $lastId
    GROUP BY blog_post.id
    ORDER BY upvote_count DESC
    LIMIT 10";  // Limit the result to 10 rows

    $result = $conn->query($sql);

    if ($result) {
        $blogs = [];

        while ($row = $result->fetch_assoc()) {
            $blogs[] = $row;
            $lastId = $row['id'];  // Update the last ID
        }

        echo json_encode(array("blogs" => $blogs, "last_id" => $lastId));
    } else {
        echo json_encode(array("blogs" => false));
    }
} else {
    echo json_encode(array("blogs" => false, "erreur" => "demande incorrecte"));
}
?>
