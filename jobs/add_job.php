<?php
include '../connection.php';

// Access raw request body
$rawBody = file_get_contents('php://input');

// Decode JSON data
$data = json_decode($rawBody, true);

// Check if the required keys are present in the JSON data
if ($data !== null) {
    // Assuming your JSON structure has the following keys
    $idJob = isset($data['id_job']) ? (int)$data['id_job'] : null;
    
$shortDescription = mysqli_real_escape_string($conn, $data['Short Description']);
$fullDescription = mysqli_real_escape_string($conn, $data['Full Description']);
$jobType = mysqli_real_escape_string($conn, $data['Job Type']);
$jobStatus = mysqli_real_escape_string($conn, $data['Job Status']);
$price = mysqli_real_escape_string($conn, $data['Price']);
$selectedCurrency = mysqli_real_escape_string($conn, $data['Selected Currency']);
$metaKeys = mysqli_real_escape_string($conn, $data['Meta Keys']);

$location = mysqli_real_escape_string($conn, $data['Location']);
$qualifications = mysqli_real_escape_string($conn, $data['Qualifications']);
$domains = mysqli_real_escape_string($conn, $data['Domaines']);
$idPoster = (int)$data["id_u"];
$salary = $price . $selectedCurrency;


    if ($idJob !== null) {
        // If id_job is provided, update the existing record
        $sql = "UPDATE job_post SET 
                `brief_desc` = '$shortDescription',
                `full_desc` = '$fullDescription',
                `qualifications` = '$qualifications',
                `date` = NOW(),
                `salary` = '$salary',
                `location` = '$location',
                `metakey` = '$metaKeys',
                `id_poster` = '$idPoster',
                `job_status` = '$jobStatus',
                `job_type` = '$jobType',
                `domaine` = '$domains'
                WHERE `id` = $idJob";
    } else {
        // If id_job is not provided, insert a new record
        $sql = "INSERT INTO job_post (`brief_desc`, `full_desc`, `qualifications`, `date`, `salary`, `location`, `metakey`, `state`, `id_poster`, `job_status`, `job_type`, `domaine`)
        VALUES ('$shortDescription', '$fullDescription', '$qualifications', NOW(), '$salary', '$location', '$metaKeys', 0, '$idPoster', '$jobStatus', '$jobType', '$domains')";
    }

    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("status" => "success", "message" => "Job post operation successful."));
    } else {
        echo json_encode(array("status" => "error", "message" => "Error performing job post operation: " . $conn->error));
    }

} else {
    // Handle case where required keys are missing
    echo json_encode(array("status" => "error", "message" => "Missing required keys in JSON data."));
}
?>
