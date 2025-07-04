<?php
require 'db_conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $owner_id = $_POST['owner_id'] ?? null;
    $viewer_id = $_POST['viewer_id'] ?? null;
    $topic_id = $_POST['topic_id'] ?? null;
    $status = $_POST['status'] ?? null;

    if ($owner_id !== null && $viewer_id !== null && $topic_id !== null && $status !== null) {
        // Check if entry exists
        $checkStmt = $conn->prepare("SELECT 1 FROM access_control WHERE owner_id = ? AND viewer_id = ? AND topic_id = ?");
        $checkStmt->execute([$owner_id, $viewer_id, $topic_id]);

        if ($checkStmt->fetch()) {
            // Update existing access
            $stmt = $conn->prepare("UPDATE access_control SET access_status = ? WHERE owner_id = ? AND viewer_id = ? AND topic_id = ?");
            $stmt->execute([$status, $owner_id, $viewer_id, $topic_id]);
        } else {
            // Insert new access entry
            $stmt = $conn->prepare("INSERT INTO access_control (owner_id, viewer_id, topic_id, access_status) VALUES (?, ?, ?, ?)");
            $stmt->execute([$owner_id, $viewer_id, $topic_id, $status]);
        }

        echo "Access updated";
    } else {
        echo "Missing fields";
    }
}
?>
