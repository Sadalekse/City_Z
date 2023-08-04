<?php
session_start();
require_once __DIR__ . '/../../app/require.php';
if (!isset($_SESSION['user'])){
    echo 'Error handle action';
    die();
}
$config = require __DIR__ .'/../../config/app.php';
$id =$_POST['id'];
$query = $db->prepare("SELECT * FROM `tickets` WHERE `id` = :id");
$query->execute(['id' => $id]);
$ticket = $query->fetch(PDO::FETCH_ASSOC);

$query = $db->prepare("SELECT * FROM `users` WHERE `id` = :id" ) ;
$query->execute(['id'=>$_SESSION['user']]);
$user =$query->fetch(PDO::FETCH_ASSOC);

$filename= __DIR__.'/../../'.$ticket['image'];

if ($ticket['user_id'] !== $_SESSION['user'] && (int)$user['group_id'] !== $config['admin_user_group'] ){
    echo 'Error handle action';
    die();

}
$query = $db->prepare("DELETE FROM `tickets` WHERE `id` = :id");
$query->execute(['id' => $id]);
unlink($filename);
header('Location: /my-tickets.php');