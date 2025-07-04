<?php
session_start();
header('Content-Type: application/json');

$note = trim($_POST['note'] ?? '');
$topic_id = $_POST['topic_id'] ?? '';
$user_id = $_SESSION['user_id'] ?? '';
$screen_name = $_SESSION['screen_name'] ?? '';
$avatar = $_SESSION['avatar_image'] ?? '';
$created_at = date("Y-m-d H:i:s");
$word_count = str_word_count($note);

if (!$note || !$topic_id || !$user_id) {
    echo json_encode(['success' => false, 'message' => 'Missing required fields']);
    exit;
}

try {
    $conn = new PDO("mysql:host=localhost;dbname=rnb056", "rnb056", "@Sonia7860");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->prepare("INSERT INTO notes (note_decription, topic_id, user_id, word_count, created_at)
                            VALUES (?, ?, ?, ?, ?)");
    if ($stmt->execute([$note, $topic_id, $user_id, $word_count, $created_at])) {
        echo json_encode([
            'success' => true,
            'note' => htmlspecialchars($note),
            'screen_name' => htmlspecialchars($screen_name),
            'avatar' => htmlspecialchars($avatar),
            'created_at' => $created_at,
            'word_count' => $word_count
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Insert failed']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
