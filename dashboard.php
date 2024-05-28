<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">BanqueApp</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">Déconnexion</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="d-flex">
        <div id="sidebar" class="bg-light border-right">
            <div class="sidebar-heading">Menu</div>
            <div class="list-group list-group-flush">
                <a href="?section=dashboard" class="list-group-item list-group-item-action">Accueil</a>
                <a href="?section=retrait" class="list-group-item list-group-item-action">Retrait</a>
                <a href="?section=versement" class="list-group-item list-group-item-action">Versement</a>
                <a href="?section=transfert" class="list-group-item list-group-item-action">Transfert</a>
                <a href="?section=charte" class="list-group-item list-group-item-action">Charte Graphique</a>
            </div>
        </div>
        <div class="container-fluid" id="content">
            <?php
            $section = isset($_GET['section']) ? $_GET['section'] : 'dashboard';
            switch ($section) {
                case 'retrait':
                    include 'views/retrait.php';
                    break;
                case 'versement':
                    include 'views/versement.php';
                    break;
                case 'transfert':
                    include 'views/transfert.php';
                    break;
                case 'charte':
                    include 'views/charte.php';
                    break;
                case 'dashboard':
                default:
                    include 'views/dashboard.php';
                    break;
            }
            ?>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
