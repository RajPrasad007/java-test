CREATE DATABASE tour;

CREATE TABLE `tour`.`users` (
    `id` varchar(36) not null,
   `name` VARCHAR( 50 ) NOT NULL ,
   `password` VARCHAR( 120 ) NOT NULL ,
   `mobile` VARCHAR( 10 ) ,
   `email` VARCHAR( 120 ) NOT NULL ,
   `role` ENUM('user', 'admin') NOT NULL,
   PRIMARY KEY ( `id` )
) ENGINE = InnoDB;

CREATE TABLE `tour`.`admin_users` (
    `id` varchar(36) not null,
   `name` VARCHAR( 50 ) NOT NULL ,
   `password` VARCHAR( 120 ) NOT NULL ,
   `email` VARCHAR( 120 ) NOT NULL ,
   `notes` LONGTEXT,
   `role` ENUM('admin') NOT NULL,
   `avatar` LONGBLOB,
   PRIMARY KEY ( `id` )
) ENGINE = InnoDB;

CREATE TABLE `tour`.`booking` (
    `id` varchar(36) not null,
    `booking_data` BLOB,
   PRIMARY KEY ( `id` )
) ENGINE = InnoDB;

CREATE TABLE `tour`.`package_details` (
    `id` varchar(36) not null,
   `package_data` BLOB,
   PRIMARY KEY ( `id` )
) ENGINE = InnoDB;

CREATE TABLE `tour`.`holiday_packages` (
   `id` varchar(36) not null,
   `reason` VARCHAR( 250 ) NOT NULL ,
   `dated` date not null ,
   PRIMARY KEY ( `id` )
) ENGINE = InnoDB;