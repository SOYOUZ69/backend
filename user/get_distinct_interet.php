<?php
include '../connection.php';

$sql = "SELECT interet FROM user WHERE id = 0";
$result = $conn->query($sql);

// Vérifier s'il y a des résultats
if ($result->num_rows > 0) {
    // Initialiser le tableau pour stocker les valeurs uniques
    $valeursUniques = array();

    // Parcourir chaque ligne résultante
    while ($row = $result->fetch_assoc()) {
        // Diviser la chaîne en valeurs individuelles
        $valeurs = explode(",", $row["interet"]);

        // Stocker les valeurs uniques dans le tableau
        foreach ($valeurs as $valeur) {
            $valeur = trim($valeur); // Supprimer les espaces autour de la valeur
            if (!in_array($valeur, $valeursUniques)) {
                $valeursUniques[] = $valeur;
            }
        }
    }

    $jsonResult = json_encode(array("interet" => $valeursUniques));
    echo $jsonResult;
} else {
    $jsonResult = json_encode(array("interet" =>false));
    echo $jsonResult;
}
?>

