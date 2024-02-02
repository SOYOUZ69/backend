<?php
include '../connection.php';
$rawBody = file_get_contents('php://input');

// Decode JSON data (assuming the ID is sent as JSON)
$data = json_decode($rawBody, true);
if($data["nom"]){
$nom = $data["nom"];
$description = $data["description"];

$link = $data["link"];

$price = $data["price"];
$date = $data["date"];
$company_url = $data["company_url"];
$metakey = $data["metakey"];
$id_poster = $data["id_poster"];

$logo = "";
if (!empty($_FILES['cover']['name'])) {
    $errors = array();
    $file_name = mysqli_real_escape_string($conn, $_FILES['cover']['name']);
    $file_size = $_FILES['cover']['size'];
    $file_tmp = $_FILES['cover']['tmp_name'];
    $file_type = $_FILES['cover']['type'];
    $exp = explode('.', $_FILES['cover']['name']);
    $end_expl = end($exp);
    $file_ext = strtolower($end_expl);

    $expensions = array("jpeg", "jpg", "png");

    if (in_array($file_ext, $expensions) === false) {
        $errors[] = "extension not allowed, please choose a JPEG or PNG file.";
    }



    $logo = time() . '_' . $file_name;

    if (empty($errors) == true) {
        move_uploaded_file($file_tmp, "../uploads/formations/" . $logo);
        //echo "Success";
    } else {
        print_r($errors);
    }
}

$sql="INSERT INTO `formation`( `nom`, `description`, `cover`, `link`, `price`, `date`, `company_url`, `metakey`, `id_poster`) VALUES ( $nom, $description, $logo, $link, $price, $date, $company_url, $metakey, $id_poster)";
$result=$conn->query($sql);
if($result){
  $insertedID = mysqli_insert_id($conn);
  echo json_encode(array("success" => true, "id" => $insertedID));

}else{echo json_encode(array("success" => false));
}}
?>