<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

$data = json_decode($rawBody, true);

if (isset($data['last_id']) && isset($data['id_u'])) {

    $lastId = isset($data['last_id']) ? (int)$data['last_id'] : 0;
    $id_u = $data['id_u'];

    $blogs = [];

    $sql = "SELECT 
        bp.id,
        bp.bief_desc,
        bp.full_desc,
        bp.metakey,
        u.username,
        u.picture,
        bp.state,
        bp.date
    FROM 
        blog_post bp
    JOIN 
        user u ON bp.id_poster = u.id
    WHERE 
        bp.state = 1
    LIMIT
        $lastId, 10";

    $result = $conn->query($sql);

    if ($result) {

        while ($row = $result->fetch_assoc()) {
            $blog_id = $row['id'];
            $row['comment_count'] = 0; // initialisation à 0
            $row['upvote_count'] = 0; // initialisation à 0
            $row['like'] = 0; // initialisation à 0

            //comments
            $sql2 = "SELECT 
                COUNT(*) AS comment_count
            FROM 
                comment
            WHERE 
                id_object = $blog_id AND object_type = 'blog'";
            $result2 = $conn->query($sql2);

            if ($result2 && $result2->num_rows > 0) {
                $row_result2 = $result2->fetch_assoc();
                $row['comment_count'] = $row_result2['comment_count'];
            }
            $result2->free_result();
            //upvotes
            $sql3 = "SELECT 
                COUNT(*) AS upvote_count
            FROM 
                upvotes
            WHERE 
                id_o = $blog_id AND type = 'blog'";
            $result3 = $conn->query($sql3);

            if ($result3 && $result3->num_rows > 0) {
                $row_result3 = $result3->fetch_assoc();
                $row['upvote_count'] = $row_result3['upvote_count'];
            }
            $result3->free_result();
            //like
            $sql4 = "SELECT 
                id
            FROM 
                upvotes
            WHERE 
                id_o = $blog_id AND type = 'blog' and id_u = $id_u";
            $result4 = $conn->query($sql4);

            if ($result4 && $result4->num_rows > 0) {
                $row['like'] = 1;
            }
            $result4->free_result();

            $blogs[] = $row;
            $lastId = $row['id'];
        }
    }

    echo json_encode(array("blogs" => $blogs, "last_id" => $lastId));

} else {
    echo json_encode(array("blogs" => false, "erreur" => "demande incorrecte"));
}
