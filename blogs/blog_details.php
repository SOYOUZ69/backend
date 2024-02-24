<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);

if (isset($data['id']) && isset($data['id_u'])) {
    $Id = (int) $data['id'];
    $id_u = $data['id_u'];

    
    $sql = "
  SELECT
    c.id,
    c.message,
    c.date,
    c.id_u,
    CASE WHEN c.id_u = ? THEN 1 ELSE 0 END AS comentu,
    (
      SELECT COUNT(*)
      FROM upvotes u
      WHERE u.id_o = c.id AND u.type = 'comment'
    ) AS upvote_count,
    CASE WHEN EXISTS (
      SELECT *
      FROM upvotes u
      WHERE u.id_o = c.id AND u.type = 'comment' AND u.id_u = ?
    ) THEN 1 ELSE 0 END AS like_u,
    u.username,
    u.picture
  FROM comment c
  INNER JOIN user u ON
    c.id_u = u.id
  WHERE
    c.id_object = ? AND
    c.object_type = 'blog'
  ORDER BY c.date DESC
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
