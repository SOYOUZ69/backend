<?php
include '../connection.php';
if($_POST["nom"]){
$nom = $_POST["nom"];
$description = $_POST["description"];

$link = $_POST["link"];
$trailer = $_POST["trailer"];
$price = $_POST["price"];
$date = $_POST["date"];
$company_url = $_POST["company_url"];
$metakey = $_POST["metakey"];
$id_poster = $_POST["id_poster"];

$logo = "";
if (!empty($_FILES['logo']['name'])) {
    $errors = array();
    $file_name = mysqli_real_escape_string($conn, $_FILES['logo']['name']);
    $file_size = $_FILES['logo']['size'];
    $file_tmp = $_FILES['logo']['tmp_name'];
    $file_type = $_FILES['logo']['type'];
    $exp = explode('.', $_FILES['logo']['name']);
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

$sql="INSERT INTO `formation`( `nom`, `description`, `cover`, `link`, `trailer`, `price`, `date`, `company_url`, `metakey`, `id_poster`) VALUES ( $nom, $description, $logo, $link, $trailer, $price, $date, $company_url, $metakey, $id_poster)";
$result=$conn->query($sql);
if($result){
  $insertedID = mysqli_insert_id($conn);
  echo json_encode(array("success" => true, "id" => $insertedID));

}else{echo json_encode(array("success" => false));
}}
?>