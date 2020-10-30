CREATE SCHEMA `world` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE `world`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
INSERT INTO `world`.`country` (`name`) VALUES ('Czech');
INSERT INTO `world`.`country` (`name`) VALUES ('Germany');
INSERT INTO `world`.`country` (`name`) VALUES ('Russia');
  
  CREATE TABLE `world`.`region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
INSERT INTO `world`.`region` (`name`) VALUES ('Kemerovskaya');
INSERT INTO `world`.`region` (`name`) VALUES ('Moskovskaya');
INSERT INTO `world`.`region` (`name`) VALUES ('Novosibirskaya');
  
  CREATE TABLE `world`.`district` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`));
  INSERT INTO `world`.`district` (`name`) VALUES ('not indetified');
  
  CREATE TABLE `world`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `district_id` INT NULL,
  `region_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
  ALTER TABLE `world`.`city` 
ADD INDEX `fk_district_city_idx` (`district_id` ASC) VISIBLE,
ADD INDEX `fk_region_city_idx` (`region_id` ASC) VISIBLE,
ADD INDEX `fk_country_city_idx` (`country_id` ASC) VISIBLE;
;
ALTER TABLE `world`.`city` 
ADD CONSTRAINT `fk_district_city`
  FOREIGN KEY (`district_id`)
  REFERENCES `world`.`district` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_region_city`
  FOREIGN KEY (`region_id`)
  REFERENCES `world`.`region` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_country_city`
  FOREIGN KEY (`country_id`)
  REFERENCES `world`.`country` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  INSERT INTO `world`.`city` (`name`, `region_id`, `country_id`) VALUES ('Novosibirsk', '3', '3');