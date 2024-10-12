CREATE TABLE `users` (
    `id` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `pic_link` VARCHAR(100) NOT NULL,
    `status` VARCHAR(100) NOT NULL,
    `leave` TINYINT(1) NOT NULL DEFAULT 0,
    `signup_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `name` VARCHAR(20) NOT NULL,
    `creator` VARCHAR(20) NOT NULL,
    `link` VARCHAR(100) NOT NULL,
    `capacity` INT NOT NULL,
    `leave` TINYINT(1) NOT NULL DEFAULT 0,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`name`),
    FOREIGN KEY (`creator`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `content` VARCHAR(200) NOT NULL,
    `sender` VARCHAR(20) NOT NULL,
    `channel` VARCHAR(20) NOT NULL,
    `send_date` DATETIME NOT NULL,
    PRIMARY KEY (`channel`, `send_date`),
    FOREIGN KEY (`channel`) REFERENCES `channels`(`name`),
    FOREIGN KEY (`sender`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `blocker` VARCHAR(20) NOT NULL,
    `blockee` VARCHAR(20) NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`blocker`, `blockee`),
    FOREIGN KEY (`blocker`) REFERENCES `users`(`id`),
    FOREIGN KEY (`blockee`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `follower` VARCHAR(20) NOT NULL,
    `followee` VARCHAR(20) NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`follower`, `followee`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`),
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;