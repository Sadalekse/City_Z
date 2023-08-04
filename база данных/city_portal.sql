-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 04 2023 г., 18:04
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `city_portal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `lable` varchar(255) DEFAULT NULL,
  `background` varchar(50) DEFAULT '#000',
  `color` varchar(50) NOT NULL DEFAULT '#fff',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `lable`, `background`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Выполнено', '#198754', '#fff', '2023-07-22 12:42:38', '2023-07-22 12:42:38'),
(2, 'В процессе', '#ffc107', '#fff', '2023-07-22 12:46:04', '2023-07-22 12:46:04'),
(3, 'Создано', '#0dcaf0', '#fff', '2023-07-22 12:46:40', '2023-07-22 12:46:40'),
(4, 'Отклонено', '#842029', '#fff', '2023-08-04 10:37:50', '2023-08-04 10:37:50');

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `tag_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tickets`
--

INSERT INTO `tickets` (`id`, `title`, `description`, `image`, `tag_id`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'Убрать снег', 'Провести работы по очистки улицы x.', 'uploads/64cd105b384be1638987536_8-almode-ru-p-zimnyaya-ulitsa-11.jpg', 3, 4, '2023-08-04 14:51:07', '2023-08-04 14:51:07'),
(6, 'Убрать мусор', 'Вывести мусор с улицы y.', 'uploads/64cd10f4cd275f1393e1202aa510b4f29baab2d13bf3b.jpg', 2, 4, '2023-08-04 14:53:40', '2023-08-04 14:53:40');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `created_ad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `dob`, `password`, `group_id`, `created_ad`, `updated_at`) VALUES
(4, 'test@gmail.com', 'Алексей Вячеславович Демин', '2022-10-23', '$2y$10$skpWb30hjxSZtoBXym142.qJf0tJx5abM74fNGUAcSgYDjFw3Stf2', 1, '2023-07-31 12:25:29', '2023-07-31 12:25:29');

-- --------------------------------------------------------

--
-- Структура таблицы `users_grops`
--

CREATE TABLE `users_grops` (
  `id` bigint UNSIGNED NOT NULL,
  `lable` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users_grops`
--

INSERT INTO `users_grops` (`id`, `lable`, `created_at`, `updated_at`) VALUES
(1, 'Администратор', '2023-07-22 10:31:59', '2023-07-22 10:31:59'),
(2, 'Гражданин', '2023-07-22 10:32:40', '2023-07-22 10:32:40');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `users_grops`
--
ALTER TABLE `users_grops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users_grops`
--
ALTER TABLE `users_grops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `users_grops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
