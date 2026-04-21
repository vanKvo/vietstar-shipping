<?php
// Function to load .env variables manually if they exist
if (!function_exists('loadEnv')) {
    function loadEnv($path) {
        if (file_exists($path)) {
            $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($lines as $line) {
                if (strpos(trim($line), '#') === 0) continue;
                list($name, $value) = explode('=', $line, 2);
                $name = trim($name);
                $value = trim($value);
                putenv(sprintf('%s=%s', $name, $value));
                $_ENV[$name] = $value;
            }
        }
    }
}

// Load .env from business_portal root
loadEnv(__DIR__ . '/../.env');

// Initialize Sentry for PHP Error & Crash Tracking
if (file_exists(__DIR__ . '/../vendor/autoload.php')) {
    require_once __DIR__ . '/../vendor/autoload.php';
    if (!empty($_ENV['SENTRY_DSN'])) {
        \Sentry\init([
            'dsn' => $_ENV['SENTRY_DSN'],
            // Enable performance monitoring
            'traces_sample_rate' => 1.0,
            // Set a sampling rate for profiling - this is relative to traces_sample_rate
            'profiles_sample_rate' => 1.0,
            // Enable logs to be sent to Sentry
            'enable_logs' => true,
        ]);
    }
}

$db_host = $_ENV['DB_HOST'] ?? 'localhost';
$db_user = $_ENV['DB_USER'] ?? 'root';
$db_pass = $_ENV['DB_PASSWORD'] ?? 'root';
$db_name = $_ENV['DB_NAME'] ?? 'vietstar_shipping';

// DSN for PDO
$dsn = "mysql:host=$db_host;dbname=$db_name;charset=utf8mb4";

// $con is used for php webpages in customers and sales_reports folder
$con = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if (!$con) {
    die("Database Connection failed: " . mysqli_connect_error());
}

/**  Create DB Connection (PDO) **/
try {
    $db = new PDO($dsn, $db_user, $db_pass);
    // Best practice: Ensure PDO throws exceptions on error
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    $error = "Database Error: " . $e->getMessage();
    exit($error);
}
?>
