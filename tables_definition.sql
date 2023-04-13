CREATE TABLE `Orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `customer_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `address_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Customers` (
    `customer_id` int  NOT NULL ,
    `customer_firstname` varchar(50)  NOT NULL ,
    `customer_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `customer_id`
    )
);

CREATE TABLE `Address` (
    `address_id` int  NOT NULL ,
    `delivery_address` varchar(200)  NOT NULL ,
    `address_city` varchar(50)  NOT NULL ,
    `addres_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `address_id`
    )
);

CREATE TABLE `Menu` (
    `item_id` varchar(10)  NOT NULL ,
    `recipe_id` varchar(20)  NOT NULL ,
    `item_name` varchar(100)  NOT NULL ,
    `item_category` varchar(100)  NOT NULL ,
    `item_size` varchar(10)  NOT NULL ,
    `item_price` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `Recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(20)  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Ingredients` (
    `ing_id` varchar(10)  NOT NULL ,
    `ing_name` varchar(200)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_measure` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `Storage` (
    `st_id` int  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `st_id`
    )
);

CREATE TABLE `Staff` (
    `staff_id` varchar(20)  NOT NULL ,
    `staff_firstname` varchar(50)  NOT NULL ,
    `staff_lastname` varchar(50)  NOT NULL ,
    `staff_position` varchar(100)  NOT NULL ,
    `staff_hourly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `Schedule` (
    `row_id` int  NOT NULL ,
    `sch_id` varchar(20)  NOT NULL ,
    `sch_date` datetime  NOT NULL ,
    `shift_id` varchar(20)  NOT NULL ,
    `staff_id` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Shift` (
    `shift_id` varchar(20)  NOT NULL ,
    `shift_day` varchar(10)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

ALTER TABLE `Customers` ADD CONSTRAINT `fk_Customers_customer_id` FOREIGN KEY(`customer_id`)
REFERENCES `Orders` (`customer_id`);

ALTER TABLE `Address` ADD CONSTRAINT `fk_Address_address_id` FOREIGN KEY(`address_id`)
REFERENCES `Orders` (`address_id`);

ALTER TABLE `Menu` ADD CONSTRAINT `fk_Menu_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Orders` (`item_id`);

ALTER TABLE `Recipe` ADD CONSTRAINT `fk_Recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `Menu` (`recipe_id`);

ALTER TABLE `Ingredients` ADD CONSTRAINT `fk_Ingredients_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `Recipe` (`ing_id`);

ALTER TABLE `Storage` ADD CONSTRAINT `fk_Storage_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Recipe` (`ing_id`);

ALTER TABLE `Staff` ADD CONSTRAINT `fk_Staff_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `Schedule` (`staff_id`);

ALTER TABLE `Schedule` ADD CONSTRAINT `fk_Schedule_sch_date` FOREIGN KEY(`sch_date`)
REFERENCES `Orders` (`created_at`);

ALTER TABLE `Shift` ADD CONSTRAINT `fk_Shift_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `Schedule` (`shift_id`);
