<?php 
session_start();
$errors = [];

$dsn = "mysql:host=sql202.infinityfree.com;dbname=if0_39396420_notes_db";
$username = "";
$password = "";

try {
    $conn = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') { 
    $gmail = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $screen_name = htmlspecialchars($_POST['screen_name']);
    $password = $_POST['password'];
    $confirm = $_POST['confirmPassword'];

    $profile_pic = 'default.jpg';
    if (isset($_FILES['avatar_image']) && $_FILES['avatar_image']['error'] === 0) {
        $ext = pathinfo($_FILES['avatar_image']['name'], PATHINFO_EXTENSION);
        $new_name = uniqid() . '.' . $ext;
        $upload_path = 'uploads/' . $new_name;
        if (move_uploaded_file($_FILES['avatar_image']['tmp_name'], $upload_path)) {
            $profile_pic = $new_name;
        }
    }

    if (!filter_var($gmail, FILTER_VALIDATE_EMAIL)) $errors[] = "Invalid Gmail";
    if ($password !== $confirm) $errors[] = "Passwords do not match";
    if (strlen($password) < 6) $errors[] = "Password too short";

    if (empty($errors)) {
        $checkStmt = $conn->prepare("SELECT COUNT(*) FROM users_info WHERE email = ?");
        $checkStmt->execute([$gmail]);
        if ($checkStmt->fetchColumn()) {
            $errors[] = "Email already exists! Please login instead.";
        } else {
            $nameCheckStmt = $conn->prepare("SELECT COUNT(*) FROM users_info WHERE screen_name = ?");
            $nameCheckStmt->execute([$screen_name]);
            if ($nameCheckStmt->fetchColumn()) {
                $errors[] = "Screen name already taken! Please choose another.";
            } else {
                $hashed = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("INSERT INTO users_info (email, screen_name, password, avatar_image) VALUES (?, ?, ?, ?)");
                if ($stmt->execute([$gmail, $screen_name, $hashed, $profile_pic])) {
                    $_SESSION['screen_name'] = $screen_name;
                    $_SESSION['email'] = $gmail;
                    $_SESSION['avatar_image'] = $profile_pic;
                    header("Location: login.php?gmail=" . urlencode($gmail) . "&auto_password=" . urlencode($password));
                    exit();
                } else {
                    $errors[] = "Something went wrong. Please try again.";
                }
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title>Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="w-full max-w-md bg-white p-8 rounded-2xl shadow-lg">
        <h1 class="text-2xl font-bold text-center mb-6 text-gray-800">Create an Account</h1>
        <?php if (!empty($errors)): ?>
            <div class="mb-4 text-sm text-red-600">
                <ul class="list-disc pl-5">
                    <?php foreach ($errors as $e): ?>
                        <li><?= htmlspecialchars($e) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endif; ?>

        <form method="POST" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label for="email" class="block text-sm font-medium">Email:</label>
                <input type="email" id="email" name="email" required
                    value="<?= htmlspecialchars($_POST['email'] ?? '') ?>"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="signupUsername" class="block text-sm font-medium">Screen Name:</label>
                <input type="text" id="signupUsername" name="screen_name" required
                    value="<?= htmlspecialchars($_POST['screen_name'] ?? '') ?>"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="avatar" class="block text-sm font-medium">Avatar Image:</label>
                <input type="file" id="avatar" name="avatar_image" accept="image/*"
                    class="w-full text-sm border border-gray-300 rounded-lg file:px-4 file:py-2 file:bg-gray-200">
            </div>

            <div>
                <label for="signupPassword" class="block text-sm font-medium">Password:</label>
                <input type="password" id="signupPassword" name="password" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="confirmPassword" class="block text-sm font-medium">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <button type="submit"
                class="w-full bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-4 rounded-lg transition">
                Sign Up
            </button>

            <p class="text-center text-sm mt-4">
                Already have an account?
                <a href="login.php" class="text-blue-600 hover:underline">Log in here</a>
            </p>
        </form>
    </div>
</body>
</html>
