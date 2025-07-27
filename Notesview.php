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
    $dsn = "mysql:host=sql202.infinityfree.com;dbname=if0_39396420_notes_db";
    $username = "if0_39396420";
    $password = "phHzpwzBO45Gi";
    $conn = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

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
    <title>Selected Topic</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-screen bg-gray-100">

<header class="flex items-center justify-between p-4 bg-orange-400">
    <div class="flex items-center">
        <img src="images/Diarylogo.jpg" class="h-12 w-12 mr-3 rounded-full" alt="logo" />
        <h1 class="text-white text-xl font-semibold">Selected Topic Overview</h1>
    </div>
    <a href="logout.php" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded">Logout</a>
</header>

<main class="flex-grow w-full px-12 py-6">
    <div class="flex items-center bg-blue-100 p-4 rounded-lg mb-6 w-full">
        <img src="uploads/<?= htmlspecialchars($avatar) ?>" class="w-14 h-14 rounded-full mr-5" />
        <p class="text-gray-700 text-xl">Welcome, <strong><?= htmlspecialchars($screen_name) ?></strong>!</p>
    </div>

    <div id="existingNotes" class="space-y-6 w-full">
        <?php if (count($notes) === 0): ?>
            <p id="no-notes-msg" class="text-gray-500">No notes created yet.</p>
        <?php else: ?>
            <?php foreach ($notes as $note): ?>
                <div class="bg-white p-6 rounded-lg shadow w-full">
                    <div class="flex items-center mb-3">
                        <img src="uploads/<?= htmlspecialchars($note['avatar_image']) ?>" class="w-11 h-11 rounded-full mr-4" alt="Avatar">
                        <strong class="text-lg"><?= htmlspecialchars($note['screen_name']) ?></strong>
                    </div>
                    <p class="text-gray-800 text-base mb-2"><?= nl2br(htmlspecialchars($note['note_decription'])) ?></p>
                    <small class="text-gray-500"><?= $note['created_at'] ?> | Words: <?= $note['word_count'] ?></small>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>

    <div class="flex justify-between items-center mt-8">
        <button onclick="window.location.href='index.php'" class="bg-gray-600 text-white px-5 py-3 rounded">Go Back</button>
        <button id="addNotesBtn" class="bg-blue-600 text-white px-5 py-3 rounded">Add Notes</button>
    </div>

    <div id="note-Form" class="mt-8 hidden transition-all duration-300 ease-in-out w-full">
        <textarea id="user-text" rows="10"
                  class="w-full p-5 text-lg border border-gray-300 rounded-md resize-none"
                  placeholder="Add your notes here."></textarea>
        <p id="charaCount" class="text-sm text-gray-600 mt-2">Total number of Characters : 0</p>
        <p id="limitMessage" class="text-sm text-red-600 hidden">Characters limit exceeded! (1500 max)</p>
        <button id="save-Button" class="mt-4 bg-green-600 text-white px-5 py-3 rounded">Save</button>
    </div>
</main>




<footer class="bg-orange-400 text-white p-4">
    <div class="flex flex-col sm:flex-row justify-between items-center text-sm space-y-2 sm:space-y-0">
        <div>CS 215: Web & Database Programming</div>
        <a href="https://validator.w3.org/check?uri=referer" class="underline hover:text-white">XHTML 1.1 Validation</a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer">
            <img src="http://jigsaw.w3.org/css-validator/images/vcss" class="h-6 sm:h-7" alt="Valid CSS!"/>
        </a>
    </div>
</footer>

<script> 
          document.addEventListener("DOMContentLoaded", function () {
    const addNotesBtn = document.getElementById("addNotesBtn");
    const noteForm = document.getElementById("note-Form");
    const saveBtn = document.getElementById("save-Button");
    const charCount = document.getElementById("charaCount");
    const limitMsg = document.getElementById("limitMessage");
    const noteInput = document.getElementById("user-text");
    const existingNotes = document.getElementById("existingNotes");
    const noNotesMsg = document.getElementById("no-notes-msg");

    // Toggle note form
    if (addNotesBtn && noteForm) {
        addNotesBtn.addEventListener("click", function () {
            noteForm.style.display = noteForm.style.display === "block" ? "none" : "block";
        });
    }

    // Live character count
    if (noteInput && charCount && limitMsg) {
        noteInput.addEventListener("input", function () {
            const len = this.value.length;
            charCount.textContent = "Total number of Characters : " + len;
            limitMsg.style.display = len > 1500 ? "block" : "none";
        });
    }

    // Save note via AJAX
    if (saveBtn && noteInput) {
        saveBtn.addEventListener("click", function () {
            const note = noteInput.value.trim();
            const topicId = new URLSearchParams(window.location.search).get("topic_id");

            if (!note || !topicId) {
                alert("Please enter a note and ensure topic ID is available.");
                return;
            }

            const xhr = new XMLHttpRequest();
            xhr.open("POST", "addnote.php", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onload = function () {
                const res = JSON.parse(this.responseText);

                if (res.success) {
                    // Remove "No notes created yet." message if exists
                    const noNotes = document.getElementById("no-notes-msg");
                    if (noNotes) {
                        noNotes.remove();
                    }

                    // Convert note text to HTML with <br> for new lines
                    const formattedNote = res.note.replace(/\n/g, "<br>");

                    // Create new note element
                    const noteContainer = document.createElement("div");
                    noteContainer.className = "bg-white p-4 rounded shadow mt-4";
                    noteContainer.style.opacity = 0; // For animation

                    noteContainer.innerHTML = `
                        <div class="flex items-center mb-2">
                            <img src="uploads/${res.avatar}" class="w-10 h-10 rounded-full mr-3" alt="Avatar">
                            <strong>${res.screen_name}</strong>
                        </div>
                        <p class="text-gray-700 mb-1">${formattedNote}</p>
                        <small class="text-gray-500 block">${res.created_at} | Words: ${res.word_count}</small>
                    `;

                    // Prepend to the top
                    existingNotes.prepend(noteContainer);

                    // Animate fade-in
                    setTimeout(() => {
                        noteContainer.style.transition = "opacity 0.5s ease";
                        noteContainer.style.opacity = 1;
                    }, 10);

                    // Reset the form
                    noteInput.value = "";
                    charCount.textContent = "Total number of Characters : 0";
                    noteForm.style.display = "none";
                } else {
                    alert("❌ Failed to save note: " + res.message);
                }
            };

            const data = "note=" + encodeURIComponent(note) + "&topic_id=" + encodeURIComponent(topicId);
            xhr.send(data);
        });
    }
});

    
</script>

</body>
</html>
