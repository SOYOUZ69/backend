<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
$x=0;
if (isset($data['lastId'])||isset($data['rech'])||isset($data['id_u'])) {
    $lastId = (int) $data['lastId'];
    $rech= $data['rech'];  // Ensure lastId is an integer
$id_u=$data['id_u'];
    $sql = "SELECT job_post.*, user.username, user.picture
     FROM job_post
    JOIN user ON job_post.id_poster = user.id
    WHERE job_post.`id` > $lastId AND (job_post.`brief_desc` LIKE '%$rech%' OR job_post.`metakey` LIKE '%$rech%' OR job_post.`full_desc` LIKE '%$rech%') LIMIT 10";

    $result = $conn->query($sql);

    $formations = [];

    while ($row = $result->fetch_assoc()) {
        $x=$x+1;
//like
$id_j=$row['id'];
$sql4 = "SELECT 
    id
FROM 
    favoris
WHERE 
id_object = $id_j AND object_type = 'job' and id_u = $id_u";
$result4 = $conn->query($sql4);

if ($result4) {
    if ($result4->num_rows > 0) {
        $row['save'] = "1";
    } else {
        $row['save'] = "0";
    }
    $result4->free_result();
} else {
    // Gérer l'erreur de requête SQL ici, si nécessaire
    $row['like'] = "0";
}


        $formations[] = $row;
        $lastId = $row['id'];
    }

    echo json_encode(array("recherche" => $formations, "lastId" => $lastId ,"total" => $x));
} else {
    echo json_encode(array("recherche" => false));
}

?>