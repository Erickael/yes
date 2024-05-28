<?php

include __DIR__ . "/../model/Personel.php";


$database = new Database();
$conn = $database->getConnection();
if (isset($_POST['submit'])) {

    if (isset($_POST['username']) && isset($_POST['password'])) {
        $personnel = new Personel($conn, $_POST['username'], $_POST['password']);

        if ($personnel->authenticate()) {
            header("Location: /dashboard.php");
            
        } else {
            echo "<script>alert('Login ou Mot de passe incorrect')</script>";
        }
    } else {
        echo "<script>alert('Veuillez remplir tous les champs.')</script>";
    }
}

?>

