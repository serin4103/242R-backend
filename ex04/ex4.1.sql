CREATE TABLE `students` (
    `name` VARCHAR(20) NOT NULL,
    `admission_year` INT NOT NULL,
    `major_code` INT NOT NULL,
    `individual_code` INT NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `total_credit` INT NOT NULL DEFAULT 0,
    `average_score` FLOAT NOT NULL DEFAULT 0.0,
    `is_enrolled` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`admission_year`, `major_code`, `individual_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;