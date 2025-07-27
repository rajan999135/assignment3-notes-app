<?php
$host = 'sql202.infinityfree.com';         // or your database server
$db   = 'if0_39396420_notes_db'; // 🔁 replace with your actual DB name
$user = 'if0_39396420';       // 🔁 replace with your DB username
$pass = 'phHzpwzBO45Gi';   // 🔁 replace with your DB password
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // for error reporting
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // fetch assoc arrays
    PDO::ATTR_EMULATE_PREPARES   => false,                  // security
];

try {
    $conn = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
