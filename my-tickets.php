<?php session_start(); ?>
<!doctype html>
<html lang="ru">
<head>
    <?php require_once  __DIR__ .'/components/head.php' ?>
    <title>Заявки</title>
</head>
<body>
<?php require_once  __DIR__ .'/components/header.php' ?>
<section class="main">
    <div class="container">
        <div class="row">
            <h2 class="display-6 mb-3">Мои заявки</h2>
        </div>
        <div class="row">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Изображение</th>
                    <th scope="col">Название</th>
                    <th scope="col">Описание</th>
                    <th scope="col">Статус</th>
                    <th scope="col">Действия</th>
                </tr>
                </thead>
                <tbody>
                <?php
                if (empty($_SESSION['user'])){
                ?>
                <div class="alert alert-danger" role="alert">
                    Вы не авторизованы
                </div>
                <?php
                    die();
                }

                $tags= $db->query("SELECT * FROM `tags` ")->fetchAll(PDO::FETCH_ASSOC);

                $query= $db->prepare("SELECT * FROM `tickets` WHERE `user_id` = :user_id");
                $query->execute(['user_id'=>$_SESSION['user']]);
                $tickets = $query->fetchAll(PDO::FETCH_ASSOC);
                foreach ($tickets as $ticket){
                    $tagId = $ticket['tag_id'];
                    $tag =array_filter($tags,function($tag) use ($tagId){
                        return (int)$tag['id'] === (int)$tagId;

                    });
                    $tag =array_pop($tag);
                    ?>
                    <tr>
                        <td>
                            <img src=" <?=$ticket['image'] ?> " width="200" alt="">
                        </td>
                        <td><?=$ticket['title'] ?></td>
                        <td><?=$ticket['description'] ?></td>
                        <td>
                            <span class="badge rounded-pill "
                                  style="background: <?=$tag['background'] ?>; color:<?= $tag['color']?>; ">
                                <?= $tag['lable'] ?>
                            </span>
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    Действия
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li>
                                        <form action="/actions/ticket/remove.php" method="post">
                                            <input type="hidden" name="id" value="<?= $ticket['id'] ?>">
                                            <button type="submit" class="dropdown-item" href="#">Удалить</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php  require_once __DIR__.'/components/scripts.php' ?>
</body>
</html>