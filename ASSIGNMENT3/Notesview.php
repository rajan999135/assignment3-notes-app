<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$topic_id = $_GET['topic_id'] ?? null;
$user_id = $_SESSION['user_id'] ?? '';
$screen_name = $_SESSION['screen_name'] ?? '';
$avatar = $_SESSION['avatar_image'] ?? '';
$notes = [];

try {
    $conn = new PDO("mysql:host=localhost;dbname=rnb056", "rnb056", "@Sonia7860");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($topic_id) {
        $stmt = $conn->prepare("SELECT n.note_decription, n.created_at, n.word_count, u.screen_name, u.avatar_image
                                FROM notes n
                                JOIN users_info u ON n.user_id = u.user_id
                                WHERE n.topic_id = ? ORDER BY n.created_at DESC");
        $stmt->execute([$topic_id]);
        $notes = $stmt->fetchAll();
    }
} catch (PDOException $e) {
    die("DB error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selected Topic</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/design.css">
</head>
<body class="bg-gray-100">
    <header class="flex items-center justify-between p-4 bg-orange-400">
        <div class="flex items-center">
            <img src="images/Diarylogo.jpg" alt="Diarylogo" class="h-12 w-12 mr-3 rounded-full" />
            <h1 class="text-white text-xl font-semibold">Selected Topic Overview</h1>
        </div>
        <div class="flex gap-3">
        <a href="logout.php" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded transition duration-200">
            Logout
        </a>
    </div>
    </header>

    <main class="max-w-4xl mx-auto px-4 py-6">
        <div class="flex items-center bg-blue-100 p-4 rounded-lg mb-6">
            <img src="uploads/<?= htmlspecialchars($avatar) ?>" alt="Profile Picture" class="w-12 h-12 rounded-full mr-4">
            <p class="text-gray-700 text-lg">Welcome, <strong><?= htmlspecialchars($screen_name) ?></strong>!</p>
        </div>

        <div id="existingNotes" class="space-y-4">
            <?php if (count($notes) === 0): ?>
                <p class="text-gray-500">No notes created yet.</p>
            <?php else: ?>
                <?php foreach ($notes as $note): ?>
                    <div class="bg-white p-4 rounded shadow">
                        <div class="flex items-center mb-2">
                            <img src="<?= htmlspecialchars($note['avatar_image']) ?>" class="w-8 h-8 rounded-full mr-2" alt="Avatar">
                            <strong><?= htmlspecialchars($note['screen_name']) ?></strong>
                        </div>
                        <p class="text-gray-700 mb-1"><?= nl2br(htmlspecialchars($note['note_decription'])) ?></p>
                        <small class="text-gray-500 block"><?= $note['created_at'] ?> | Words: <?= $note['word_count'] ?></small>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <div class="flex justify-between items-center mt-6">
            <button type="button" onclick="window.location.href='index.php'" class="bg-gray-500 text-white px-4 py-2 rounded">Go Back</button>
            <button type="button" id="addNotesBtn" class="bg-blue-600 text-white px-4 py-2 rounded">Add Notes</button>
        </div>

        <div id="note-Form" class="mt-6 hidden">
            <textarea id="user-text" rows="6" class="w-full p-3 border rounded mb-2" placeholder="Add your notes here."></textarea>
            <p id="charaCount" class="text-sm text-gray-600">Total number of Characters : 0</p>
            <p id="limitMessage" class="text-sm text-red-500 hidden">Characters limit exceeded! (1500 max)</p>
            <button id="save-Button" type="button" class="bg-green-600 text-white px-4 py-2 rounded">Save</button>
        </div>
    </main>

    <footer class="bg-orange-400 text-white py-4 text-center mt-10">
        <div>CS 215: Web & Database Programming</div>
        <div><a href="https://validator.w3.org/check?uri=referer" class="underline">XHTML 1.1 Validation</a></div>
        <div>
            <a href="http://jigsaw.w3.org/css-validator/check/referer">
                <img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS!" />
            </a>
        </div>
    </footer>

    <script src="code2.js"></script>
</body>
</html>
