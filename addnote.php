<?php
session_start();
header("Content-Type: application/json");

$note = trim($_POST['note'] ?? '');
$topic_id = $_POST['topic_id'] ?? null;
$user_id = $_SESSION['user_id'] ?? '';
$screen_name = $_SESSION['screen_name'] ?? '';
$avatar = $_SESSION['avatar_image'] ?? '';

if (!$note || !$topic_id || !$user_id) {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
    exit;
}

try {
    $dsn = "mysql:host=sql202.infinityfree.com;dbname=if0_39396420_notes_db";
    $username = "";
    $password = "";
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);

    $word_count = str_word_count($note);
    $stmt = $pdo->prepare("INSERT INTO notes (topic_id, user_id, note_decription, created_at, word_count) VALUES (?, ?, ?, NOW(), ?)");
    $stmt->execute([$topic_id, $user_id, $note, $word_count]);

    echo json_encode([
        'success' => true,
        'screen_name' => $screen_name,
        'avatar' => $avatar,
        'note' => htmlspecialchars($note),
        'created_at' => date('Y-m-d H:i:s'),
        'word_count' => $word_count
    ]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
