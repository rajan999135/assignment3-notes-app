
<?php

session_start();
$errors = [];
$prefill_email = isset($_GET['gmail']) ? $_GET['gmail'] : '';
$prefill_password = isset($_GET['auto_password']) ? $_GET['auto_password'] : '';

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


if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // Validate input
    if (empty($email)) {
        $errors['email'] = "Email is required.";
    }
    if (empty($password)) {
        $errors['password'] = "Password is required.";
    }

    // If no input errors, proceed with authentication
    if (empty($errors)) {
        $stmt = $conn->prepare("SELECT * FROM users_info WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if ($user && $password === $user['password']) { // use password_verify() if hashed
    $_SESSION['user_id'] = $user['user_id'];
    $_SESSION['screen_name'] = $user['screen_name'];
    $_SESSION['avatar_image'] = $user['avatar_image'];
    

    header("Location: Accesspage.php"); // or your main homepage
    exit;
} else {
    $errors['login'] = "Invalid email or password.";
}

        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if (!$user) {
            $errors['email'] = "Email not found.";
        } else {
            if (!password_verify($password, $user['password'])) {
                $errors['password'] = "Incorrect password.";
            } else {
                // Successful login
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['screen_name'] = $user['screen_name'];
                $_SESSION['avatar_image'] = $user['avatar_image'];
                // Grant access automatically
                $stmt = $conn->prepare("UPDATE users_info SET access_status = 1 WHERE user_id = ?");
                $stmt->execute([$user_id]);
                
                session_regenerate_id(true); // ✅ recommended for security

                header("Location: index.php");
                exit();
            }
        }
    }
}
?>





<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8" />

    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/design.css">
    <style>
</style>

</head>

<body class="min-h-screen flex items-center justify-center bg-gray-100">
    <form method="POST" class="w-full max-w-md bg-white p-8 rounded-2xl shadow-lg space-y-4">
        <div class="flex justify-center">
            <img src="images/Diarylogo.jpg" alt="Diary Life Logo" class="w-24 h-24 rounded">
        </div>

        <h2 class="text-2xl font-bold text-center text-gray-800">Login</h2>

        <?php if (!empty($errors['login'])): ?>
            <div class="text-red-600 text-sm text-center"><?= htmlspecialchars($errors['login']) ?></div>
        <?php endif; ?>

        <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email:</label>
            <input type="email" id="email" name="email" required
                   value="<?= htmlspecialchars($prefill_email) ?>"
                   class="w-full px-4 py-2 mt-1 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
            <?php if (!empty($errors['email'])): ?>
                <p class="text-red-500 text-sm mt-1"><?= htmlspecialchars($errors['email']) ?></p>
            <?php endif; ?>
        </div>

        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password:</label>
            <input type="password" id="password" name="password" required
                   value="<?= htmlspecialchars($prefill_password) ?>"
                   class="w-full px-4 py-2 mt-1 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
            <div class="flex items-center mt-1">
                <input type="checkbox" id="showPassword" onclick="togglePassword()" class="mr-2">
                <label for="showPassword" class="text-sm text-gray-600">Show Password</label>
            </div>
            <?php if (!empty($errors['password'])): ?>
                <p class="text-red-500 text-sm mt-1"><?= htmlspecialchars($errors['password']) ?></p>
            <?php endif; ?>
        </div>

        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg transition">
            Log In
        </button>

        <!-- <p class="text-center text-sm mt-4 text-gray-600">
            No account?
            <a href="signup.php" class="text-blue-600 hover:underline">Sign up</a>
        </p> -->
        <div class="relative my-6">
    <div class="absolute inset-0 flex items-center">
        <div class="w-full border-t border-gray-300"></div>
    </div>
    <div class="relative flex justify-center text-sm">
        <span class="bg-white px-2 text-gray-500">Don't have an account?</span>
    </div>
</div>
<div class="text-center">
    <a href="signup.php"
       class="text-blue-600 font-semibold hover:underline">Sign up here</a>
</div>

    </form>

    <script>
        function togglePassword() {
            const field = document.getElementById("password");
            field.type = field.type === "password" ? "text" : "password";
        }
    </script>
</body>
