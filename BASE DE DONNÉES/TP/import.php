<?php
// CONNEXION BDD
$pdo = new PDO(
    "mysql:host=localhost;dbname=info306_tp_info_gr3;charset=utf8",
    "info_gr3",
    "bL3",
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]
);

// OUVERTURE DU CSV
$fichier = __DIR__ . "/fichier.csv";

if (!file_exists($fichier)) {
    die("CSV introuvable");
}

$handle = fopen($fichier, "r");

if (!$handle) {
    die("Impossible d’ouvrir le CSV");
}

// OPTIONNEL : vider la table
// $pdo->exec("TRUNCATE TABLE users");

// SAUTER L’EN-TÊTE SI IL Y EN A UNE
// fgetcsv($handle, 0, ";");

// PRÉPARER LA REQUÊTE
$sql = "INSERT INTO users
(nom, prenom, email, active, password, role)
VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $pdo->prepare($sql);

// LECTURE LIGNE PAR LIGNE
while (($data = fgetcsv($handle, 0, ";")) !== false) {
    if (count($data) !== 6) {
        continue; // ligne bancale -> ignorée
    }
    $stmt->execute($data);
}

fclose($handle);

echo "✅ Import terminé";
