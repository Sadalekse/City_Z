<?php
session_start();
require_once __DIR__ . '/../../app/require.php';
if (!isset($_SESSION['user'])){
    echo 'Error handle action';
    die();
}
$config = require_once  __DIR__. '/../../config/app.php';
$title = $_POST['title'] ;
$description = $_POST['description'] ;
$image = $_FILES['image'];

$path = __DIR__ .'/../../uploads';
$filename = uniqid() . $image['name'];

if (!is_dir($path)){
    mkdir($path);
}

move_uploaded_file($image['tmp_name'] , "$path/$filename");

$query = $db->prepare("INSERT INTO `tickets` ( `title`, `description`, `image`, `tag_id`, `user_id`) VALUES (:title, :description, :image, :tag_id, :user_id)");
try {
    $query->execute([
            'title'=>$title,
            'description'=>$description,
            'image'=>"uploads/$filename",
            'tag_id'=> $config['default_tickets_tag'],
            'user_id' => $_SESSION['user']
    ]);
    header('Location: /my-tickets.php');
}catch (PDOException $exception){
    echo $exception->getMessage();
}
