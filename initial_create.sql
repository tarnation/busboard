CREATE TABLE `member` (
member_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
email VARCHAR(64) NOT NULL,
password CHAR(40) NOT NULL,
added_on DATETIME,
updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
ENGINE=InnoDB
CHARSET=utf8
COLLATE=utf8_bin
;

CREATE TABLE `stop` (
stop_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
abbr VARCHAR(16) NOT NULL,
name VARCHAR(64) NOT NULL,
updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
ENGINE=InnoDB
CHARSET=utf8
COLLATE=utf8_bin
;

CREATE TABLE `route` (
route_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
number CHAR(4),
name VARCHAR(64),
updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
ENGINE=InnoDB
CHARSET=utf8
COLLATE=utf8_bin
;

CREATE TABLE `hotstop` (
hotstop_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
member_id INT UNSIGNED NOT NULL,
route_id INT UNSIGNED NOT NULL,
stop_id INT UNSIGNED NOT NULL,
direction TINYINT NOT NULL,
dashboard TINYINT NOT NULL,
added_on DATETIME,
updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
INDEX member_id ( `member_id` ),
FOREIGN KEY ( `member_id` ) REFERENCES `member` ( `member_id` ),
FOREIGN KEY ( `stop_id` ) REFERENCES `stop` ( `stop_id` ),
FOREIGN KEY ( `route_id`) REFERENCES `route` ( `route_id` )
)
ENGINE=InnoDB
CHARSET=utf8
COLLATE=utf8_bin
;