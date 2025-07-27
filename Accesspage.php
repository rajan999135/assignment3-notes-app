<?php
require 'db_conn.php';
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$currentUserId = $_SESSION['user_id'];
$topicId = $_GET['topic_id'] ?? null;
if (!$topicId) {
    die("Missing topic ID");
}

// Fetch users except current user
$stmt = $conn->prepare("SELECT user_id, screen_name, avatar_image FROM users_info WHERE user_id != ?");
$stmt->execute([$currentUserId]);
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch access control map for this topic
$accessMap = [];
$accessStmt = $conn->prepare("SELECT viewer_id, access_status FROM access_control WHERE owner_id = ? AND topic_id = ?");
$accessStmt->execute([$currentUserId, $topicId]);
foreach ($accessStmt->fetchAll() as $row) {
  $accessMap[$row['viewer_id']] = $row['access_status'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Access Page</title>
  <!-- <script src="https://cdn.tailwindcss.com"></script> -->
  <link rel="stylesheet" href="css/design.css">
  <style>
    .search-bar {
      text-align: center;
      margin: 20px auto;
    }
    .search-bar input {
      padding: 8px;
      width: 40%;
      font-size: 16px;
    }
    .topic-access {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .ucard {
      background-color: orange;
      border: 1px solid black;
      border-radius: 6px;
      width: 180px;
      padding: 10px;
      text-align: center;
    }
    .userlogo {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
    }
    .logout-btn {
    background-color: #e53935;  /* Bright red */
    color: white;
    padding: 10px 18px;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    font-family: Arial, sans-serif;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.logout-btn:hover {
    background-color: #c62828;  /* Darker red */
    transform: translateY(-1px); /* Slight lift effect */
}



  </style>
</head>
<body >
<div class="page-wrapperss">
  <header class="box">
    <h1>Access page view</h1>

    <div class="header-buttons">
    <a href="logout.php" class="logout-btn" >Logout</a>
    </div>

  </header>

  <div class="search-bar">
    <input type="text" id="searchInput" placeholder="Search screen name...">
  </div>

  <div class="topic-access" id="userContainer">
    <?php foreach ($users as $user): ?>
      <div class="ucard" data-screen-name="<?= strtolower($user['screen_name']) ?>">
        <img src="uploads/<?= htmlspecialchars($user['avatar_image']) ?>" class="userlogo" alt="User logo">
        <p><strong><?= htmlspecialchars($user['screen_name']) ?></strong></p>
        <label>
          <input type="checkbox" class="accessBox" data-viewer-id="<?= $user['user_id'] ?>" <?= isset($accessMap[$user['user_id']]) && $accessMap[$user['user_id']] == 1 ? 'checked' : '' ?>>
          Grant access to user
        </label>
      </div>
    <?php endforeach; ?>
  </div>
  <!-- Add Go Back Button Here -->
<div style="text-align:center; margin-top: 30px;">
  <button onclick="window.location.href='index.php'" 
          class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition">
    ⬅️ Go Back to Topic List
  </button>
</div>
</div>

  <footer class="sticky-footerss" >
        <div>CS 215: Web &amp; Database Programming</div>
        <div><a href="https://validator.w3.org/check?uri=referer" class="underline">XHTML 1.1 Validation</a></div>
        <div>
            <a href="http://jigsaw.w3.org/css-validator/check/referer">
                <img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS!" />
            </a>
        </div>
    </footer>

  <script>
    // Search bar filter
    document.getElementById("searchInput").addEventListener("keyup", function() {
      const query = this.value.toLowerCase();
      document.querySelectorAll(".ucard").forEach(card => {
        const name = card.getAttribute("data-screen-name");
        card.style.display = name.includes(query) ? "block" : "none";
      });
    });

    // Checkbox AJAX
    document.querySelectorAll(".accessBox").forEach(box => {
      box.addEventListener("change", function() {
        const status = this.checked ? 1 : 0;
        const viewerId = this.dataset.viewerId;
        const ownerId = <?= json_encode($currentUserId) ?>;
        const topicId = <?= json_encode($topicId) ?>;

        fetch("update_access_control.php", {
          method: "POST",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: `owner_id=${ownerId}&viewer_id=${viewerId}&topic_id=${topicId}&status=${status}`
        });
      });
    });
  </script>
</body>
</html>
