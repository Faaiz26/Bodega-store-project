Create database grocery_store;
Use grocery_store;
create table Products(
product_id INT Auto_Increment Not NUll ,
product_name VArchar(45) NOt Null,
uom_id INT  NOt NUll,
price_per_unit  Double Not Null,
Primary key(product_id)
);

create table uom (
uom_id INT Auto_Increment Not null ,
uom_name varchar(45) Not null,
Primary key (uom_id)
);
Insert into uom (uom_id,uom_name) VAlues (1 , 'each');
insert into uom (uom_id,uom_name) Values (2 , 'Kg');
ALTER TABLE `grocery_store`.`products` 
ADD INDEX `fk_uom_id_idx` (`uom_id` ASC) VISIBLE;
;
ALTER TABLE `grocery_store`.`products` 
ADD CONSTRAINT `fk_uom_id`
  FOREIGN KEY (`uom_id`)
  REFERENCES `grocery_store`.`uom` (`uom_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT;




CREATE TABLE `grocery_store`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `Quantity` DOUBLE NOT NULL,
  `Total_Price` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `grocery_store`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `grocery_store`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT);