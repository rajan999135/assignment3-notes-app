<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}
$current_user_id = $_SESSION['user_id'];

try {
    $conn = new PDO("mysql:host=localhost;dbname=rnb056", "rnb056", "@Sonia7860");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("PDO Error >> " . $e->getMessage());
}

// Fetch personal topics
$stmt = $conn->prepare("
    SELECT t.topic_id, t.topic_name, t.created_at, t.last_updation, u.screen_name, u.avatar_image
    FROM topics t
    JOIN users_info u ON t.user_id = u.user_id
    WHERE t.user_id = :user_id
    ORDER BY t.created_at DESC
");
$stmt->execute(['user_id' => $current_user_id]);
$myTopics = $stmt->fetchAll();

// Fetch shared topics
$stmt = $conn->prepare("
    SELECT t.topic_id, t.topic_name, t.created_at, t.last_updation, u.screen_name, u.avatar_image
    FROM topics t
    JOIN users_info u ON t.user_id = u.user_id
    JOIN access_control a ON t.topic_id = a.topic_id
    WHERE a.viewer_id = :viewer_id AND a.access_status = 1
    ORDER BY t.created_at DESC
");
$stmt->execute(['viewer_id' => $current_user_id]);
$sharedTopics = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8" />
    <title>Topic List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" type="text/css" href="css/design.css" />
</head>

<body class="bg-gray-100 text-gray-800">
    <header class="flex items-center justify-between p-4 bg-orange-400">
        <div class="flex items-center">
            <img src="images/Diarylogo.jpg" alt="Diarylogo" class="h-12 w-12 mr-3" />
            <h1 class="text-xl font-bold text-white">Personal & Shared Topics Overview</h1>
        </div>

        <div class="flex gap-3">
    <a href="createtopic.php" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg font-semibold shadow-md transition duration-200">
        ➕ Create Topic
    </a>
    <a href="logout.php" class="bg-red-600 hover:bg-red-700 text-white px-5 py-2 rounded-lg font-semibold shadow-md transition duration-200">
        Logout
    </a>
</div>

    </div>
    </header>

    <main class="p-6">
        <section>
            <h2 class="text-2xl font-bold mb-4 border-b pb-2 text-gray-800">My Personal Topics: </h2>
            <?php foreach($myTopics as $topic): ?>
                <div class="bg-yellow-400 shadow-md rounded-lg p-4 mb-4 border border-black">
                    <p class="text-lg font-semibold text-gray-800 mb-1">
                        <span class="text-black">Topic:</span> <?= htmlspecialchars($topic['topic_name']); ?>
                    </p>
                    <p class="text-sm text-gray-700"><span class="font-medium">Posted by:</span> <?= htmlspecialchars($topic['screen_name']); ?></p>
                    <p class="text-sm text-gray-600"><span class="font-medium">Created at:</span> <?= $topic['created_at']; ?></p>
                    <img src="uploads/<?= htmlspecialchars($topic['avatar_image']); ?>" alt="avatar_picture" width="30" height="30" class="mt-2 mb-2">
                    <p class="text-sm text-gray-600 italic"><span class="font-medium">Last Update:</span> <?= $topic['last_updation']; ?></p>
                    <div class="mt-2">
                        <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 mr-2" onclick="window.location.href='Notesview.php?topic_id=<?= $topic['topic_id'] ?>'">View Notes</button>
                        <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700" onclick="window.location.href='Accesspage.php?topic_id=<?= $topic['topic_id'] ?>'">Give Access</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </section>

        <section class="mt-8">
            <h2 class="text-2xl font-bold mb-4 border-b pb-2 text-gray-800">Shared Topics: </h2>
            <?php foreach($sharedTopics as $topic): ?>
                <div class="bg-yellow-200 shadow-md rounded-lg p-4 mb-4 border border-black">
                    <p class="text-lg font-semibold text-gray-800 mb-1">
                        <span class="text-black">Topic:</span> <?= htmlspecialchars($topic['topic_name']); ?>
                    </p>
                    <p class="text-sm text-gray-700"><span class="font-medium">Posted by:</span> <?= htmlspecialchars($topic['screen_name']); ?></p>
                    <p class="text-sm text-gray-600"><span class="font-medium">Created at:</span> <?= $topic['created_at']; ?></p>
                    <img src="uploads/<?= htmlspecialchars($topic['avatar_image']); ?>" alt="avatar_picture" width="30" height="30" class="mt-2 mb-2">
                    <p class="text-sm text-gray-600 italic"><span class="font-medium">Last Update:</span> <?= $topic['last_updation']; ?></p>
                    <div class="mt-2">
                        <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700" onclick="window.location.href='Notesview.php?topic_id=<?= $topic['topic_id'] ?>'">View Notes</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </section>
    </main>

    <footer class="bg-orange-400 text-white p-4 flex justify-between items-center">
        <div>CS 215: Web &amp; Database Programming</div>
        <div><a href="https://validator.w3.org/check?uri=referer" class="underline">XHTML 1.1 Validation</a></div>
        <div>
            <a href="http://jigsaw.w3.org/css-validator/check/referer">
                <img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS!" />
            </a>
        </div>
    </footer>

</body>
<script src="code4.js"></script>
</html>