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
    $sql = "SELECT
    bp.id,
    bp.bief_desc,
    bp.full_desc,
    bp.metakey,
    u.username,
    u.picture,
    bp.state,
    bp.date,
    COUNT(DISTINCT c.id) AS comment_count,
    COUNT(DISTINCT up.id) AS upvote_count,
    CASE WHEN up.id_u = $id_u THEN 1 ELSE 0 END AS `like`
FROM
    blog_post bp
LEFT JOIN
    comment c ON bp.id = c.id_object AND c.object_type = 'blog'
LEFT JOIN
    upvotes up ON bp.id = up.id_o AND up.type = 'blog'
JOIN
    user u ON bp.id_poster = u.id
GROUP BY
    bp.id, bp.bief_desc, bp.full_desc, bp.metakey, u.username, u.picture, bp.state, bp.date
ORDER BY
    upvote_count DESC, bp.date DESC
LIMIT
    $lastId, 10
";  // Limit the result to 10 rows

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
