<?php

// Connexion à la base de données
include '../connection.php';

// Récupération de l'ID de l'utilisateur
if ( $_POST["id"]) {
    
// Informations de l'' expérience
$nom_etablissement = $_POST["nom_etablissement"];
$date_debut = $_POST["date_debut"];
$date_fin = $_POST["date_fin"];
$diplome = $_POST["diplome"];
$domaine = $_POST["domaine"];

// Récupérer la valeur actuelle de l'attribut experience
$sql = "SELECT lsitparcour FROM user WHERE id = ?";
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $user_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$experience_json = json_decode(mysqli_fetch_assoc($result)["lsitparcour"], true);

// Ajouter la deuxième expérience à la valeur actuelle
$experience_json[] = [
    "nom_etablissement" => $nom_etablissement,
    "date_debut" => $date_debut,
    "date_fin" => $date_dfin,
    "diplome" => $diplome,
    "domaine" => $domaine,
];

// Encoder la valeur de la nouvelle liste d'expériences
$experience_json_encoded = json_encode($experience_json);

// Mettre à jour la valeur de l'attribut experience
$sql = "UPDATE user SET lsitparcour = ? WHERE id = ?";
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "si", $experience_json_encoded, $user_id);
$result = mysqli_stmt_execute($stmt);

// Vérification de la mise à jour
if ($result) {
    echo json_encode(array("lsitparcour" => true));
} else {
     echo json_encode(array("lsitparcour" => false));
}

// Fermeture de la connexion à la base de données
mysqli_close($conn);
}
?>
