<?php
session_start();
require_once __DIR__ . '/../../app/require.php';
if (!isset($_SESSION['user'])){
    echo 'Error handle action';
    die();
}
$config = require __DIR__ .'/../../config/app.php';
$id =$_POST['id'];
$tag =$_POST['tag'];

$q = $db->prepare("SELECT * FROM `tags` WHERE `id` = :id");
$q->execute(['id'=>$tag]);
$tagExists = $q->fetch();
if (!$tagExists){
    echo 'Error handle action';
    die();
}

$query = $db->prepare("SELECT * FROM `users` WHERE `id` = :id" ) ;
$query->execute(['id'=>$_SESSION['user']]);
$user =$query->fetch(PDO::FETCH_ASSOC);

if ((int)$user['group_id'] === $config['admin_user_group']){
    $q = $db->prepare("UPDATE `tickets` SET `tag_id` = :tag WHERE `id` = :id");
    $q->execute([
        'tag'=>$tag,
        'id'=> $id
    ]);
}
header('Location: /tickets-control.php');