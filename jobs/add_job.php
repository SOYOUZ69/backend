<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data
$data = json_decode($rawBody, true);

// Check if the required keys are present in the JSON data
if ($data !== null) {
    // Assuming your JSON structure has the following keys
    $shortDescription = $data['Short Description'];
    $fullDescription = $data['Full Description'];
    $jobType = $data['Job Type'];
    $jobStatus = $data['Job Status'];
    $price = $data['Price'];
    $selectedCurrency = $data['Selected Currency'];
    $metaKeys = $data['Meta Keys'];
    
    $location = $data['Location'];
    $qualifications = $data['Qualifications'];
    $domains = $data['Domaines'];
    $idPoster= (int)$data["id_u"];
    $salary=$price.$selectedCurrency;

    $sql="INSERT INTO job_post ( `brief_desc`, `full_desc`, `qualifications`, `date`, `salary`, `location`, `metakey`, `state`, `id_poster`, `job_status`, `job_type`, `domaine`)
    VALUES       ('$shortDescription', '$fullDescription', '$qualifications', NOW(), '$salary', '$location', '$metakeys',0, '$idPoster',  '$jobStatus', '$jobType','$domains');
    ";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("status" => "success", "message" => "Job post inserted successfully."));
    } else {
        echo json_encode(array("status" => "error", "message" => "Error inserting job post: " . $conn->error));
    }

} else {
    // Handle case where required keys are missing
    echo json_encode(array("status" => "error", "message" => "Missing required keys in JSON data."));
}
?>