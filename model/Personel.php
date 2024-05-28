<?php

include_once __DIR__ . "/../Database.php";

class Personel {
    private $table_name = "Personel";
    private $conn;

    public $login;
    public $mot_de_passe;

    public function __construct($conn, $login, $password) {
        $this->conn = $conn;
        $this->login = $login;
        $this->mot_de_passe = $password;
    }

    public function authenticate() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Login = :login AND Mot_de_passe = :mot_de_passe";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':login', $this->login);
        $stmt->bindParam(':mot_de_passe', $this->mot_de_passe);

        $stmt->execute();

        return $stmt->rowCount() === 1;
    }
}
?>
