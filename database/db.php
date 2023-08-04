<?php
try {

    $config = require_once  __DIR__ .'/../config/database.php' ;
    $db = new PDO("{$config['driver']}:host={$config['host']};dbname={$config['dbname']};port={$config['port']};","{$config['user']}");

}catch (\PDOException $exception) {
   require_once __DIR__ . '/../components/db-connect-error.php';
   die();
}