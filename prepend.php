<?php
$nonce = base64_encode(random_bytes(16));
header("Content-Security-Policy: default-src 'none'; style-src 'self' 'unsafe-inline' 'nonce-$nonce'; script-src 'self' 'unsafe-inline' https://www.recaptcha.net 'nonce-$nonce' 'strict-dynamic'; img-src 'self' blob: data: https://www.recaptcha.net https://www.gstatic.com; media-src 'self'; frame-src 'self' https://www.recaptcha.net https://www.gstatic.com; manifest-src 'self'; connect-src 'self' https://www.recaptcha.net; font-src 'self'; form-action 'self' https://accounts.google.com; frame-ancestors 'self' https://www.recaptcha.net; base-uri 'none'; require-trusted-types-for 'script'; trusted-types default goog#html; upgrade-insecure-requests;");
$GLOBALS['csp_nonce'] = $nonce;
$GLOBALS['integrity01'] = 'sha384-' . base64_encode(hash_file('sha384', '/srv/www/html/style.css', true));
$GLOBALS['redis'] = new Redis();
try {
  $GLOBALS['redis']->pconnect('/dev/shm/redis/redis-server.sock', 0, 2.5);
  $auth_success = $GLOBALS['redis']->auth([
    'user' => getEnv('REDIS_USER'),
    'pass' => getEnv('REDIS_PASS')
  ]);
  if (empty($_SESSION['visited'])) {
    $_SESSION['visited'] = 'true';
    session_write_close();
    $count = $GLOBALS['redis']->incr("visit_count");
  }
} catch (Exception $e) {}
$current_host = $_SERVER['HTTP_HOST'] ?? 'miikun95.net';
$host_parts = explode('.', $current_host);
if (count($host_parts) >= 3) {
  array_shift($host_parts);
  $GLOBALS['domain'] = implode('.', $host_parts);
} else {
  $GLOBALS['domain'] = $current_host;
}
/* $pdo = new PDO("mysql:host=localhost;dbname=miikun_world_db", getenv('DB_USER'), getenv('DB_PASS'), [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
]);
$user_data = null;
$token = $_SESSION['credential'] ?? null;
if ($token) {
  try {
    $stmt = $pdo->prepare("SELECT miikun_world_id.uuid, miikun_world_id.username FROM mwid_sessions JOIN miikun_world_id ON mwid_sessions.user_uuid = miikun_world_id.uuid WHERE mwid_sessions.token = ? AND mwid_sessions.expires_at > NOW()");
    $stmt->execute([$token]);
    $user_data = $stmt->fetch();
    $GLOBALS['is_loggedin'] = true;
    if ($user_data) {
      $GLOBALS['user'] = $user_data;
    } else {
      unset($_SESSION['credential'], $_SESSION['user_uuid']);
    }
  } catch (Exception $e) {
    unset($_SESSION['credential'], $_SESSION['user_uuid']);
  }
} else {
  $GLOBALS['is_loggedin'] = false;
} */
