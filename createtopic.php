<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$dsn = "mysql:host=sql202.infinityfree.com;dbname=if0_39396420_notes_db";
$username = "if0_39396420";
$password = "phHzpwzBO45Gi";

try {
    $conn = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $topicTitle = trim($_POST['topic-name']);
    $createdDate = date("Y-m-d H:i:s");
    $user_id = $_SESSION['user_id'] ?? null;

    if (!empty($topicTitle) && $user_id) {
        $stmt = $conn->prepare("INSERT INTO topics (topic_name, created_at, user_id, last_updation) VALUES (?, ?, ?, ?)");
        $stmt->execute([$topicTitle, $createdDate, $user_id, $createdDate]);

        header("Location: index.php");
        exit();
    } else {
        echo "Topic title or user session missing.";
    }
}
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create A New Topic</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" type="text/css" href="css/design.css" />
</head>
<body class="bg-gray-100 font-sans flex flex-col min-h-screen">

    <header class="bg-orange-400 p-4 flex items-center justify-between shadow-md">
        <div class="flex items-center">
            <img src="images/Diarylogo.jpg" alt="Diarylogo" class="h-12 w-12 rounded-full mr-3">
            <h1 class="text-white text-xl font-bold">Create a Topic Page</h1>
        </div>
        <a href="index.php" class="bg-gray-800 hover:bg-gray-700 text-white px-4 py-2 rounded transition duration-200">
            Back to Home
        </a>
    </header>

    <!-- Main Content -->
    <main class="flex-grow flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
            <form id="topic-form" method="POST" action="createtopic.php">
                <label for="topic-name" class="block text-gray-700 text-lg font-semibold mb-2">Topic Name:</label>
                <input type="text" id="topic-name" name="topic-name" placeholder="Write topic name" required 
                       class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <div id="topic-error" class="text-red-500 mt-1"></div>
                <div id="word-count" class="text-sm text-gray-500 mt-1">0 words</div>
                <input type="submit" id="submit-button" value="Submit" 
                       class="w-full mt-4 bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded transition duration-200 cursor-pointer">
            </form>
        </div>
    </main>


    <footer class="bg-orange-400 text-white py-4 text-center">
        <div>CS 215: Web &amp; Database Programming</div>
        <div><a href="https://validator.w3.org/check?uri=referer" class="underline">XHTML 1.1 Validation</a></div>
        <div>
            <a href="http://jigsaw.w3.org/css-validator/check/referer">
                <img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS!" />
            </a>
        </div>
    </footer>

    <script src="code3.js"></script>
</body>
</html>
