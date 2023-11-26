<?php
include '../connection.php';
$email = "omarmsaad4@gmail.com";

$to = $email;
$subject = "Modification mot de pass smartapp";
$message = "voici votre nouveau mot de passe x11 ";
$headers = "De :smarttap";

// Utilisation de la fonction mail() pour envoyer l'e-mail
mail($to, $subject, $message, $headers);

echo "E-mail envoyé avec succès.";



?>