
/*RESTAURANT DATABASE*/

drop database if exists `restaurant`;
create database `restaurant`;
use `restaurant`;

drop table if exists `USER`;
create table `USER`(
	`User_Id` int NOT NULL AUTO_INCREMENT,   --ID OF USER
    `Fname` varchar(50) NOT NULL, --FIRST NAME  
	`Lname` varchar(50) NOT NULL, --LAST NAME
	`Password` varchar(50) NOT NULL, --PASSWORD FOR USER
	PRIMARY KEY (`User_Id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `RESTAURANT`; -- RESTAURANT TABLE
create table `RESTAURANT`(
	`Name` varchar(100) NOT NULL,					--RESTAURANT NAME 
	`Location` varchar(100) NOT NULL,				--LOCATION OF RESTAURANT
	`Contact` varchar(100) NOT NULL,				--CONTACT NUMBER
	`Opening_Closing_Time` varchar(100) NOT NULL,	--OPENING AND CLOSING TIME
	`Details` varchar(500) default NULL,			--DETAILS OF RESTAURANT
	PRIMARY KEY (`Name`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `OWNER`; -- OWNER TABLE
create table `OWNER`(
	`Fname` varchar(15) NOT NULL,					--FIRST NAME
	`Lname` varchar(15) NOT NULL,					--LAST NAME
	`Contact` varchar(100) NOT NULL,				--CONTACT NUMBER
	`Rest_Name` varchar(100) NOT NULL,				--RESTAURNAT NUMBER
	PRIMARY KEY (`Fname`,`Lname`,`Contact`),
	FOREIGN KEY (`Rest_Name`) REFERENCES `RESTAURANT`(`Name`)
	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `BILL`;	-- BILL TABLE
create table `BILL`(
	`Order_Id` int NOT NULL AUTO_INCREMENT,			--ORDER ID
	`Customer_Fname` varchar (20) NOT NULL,			--CUSTOMER FIRST NAME
	`Customer_Lname` varchar (20) NOT NULL,			--CUSTOMER LAST NAME
	`Customer_id` int NOT NULL,						--CUSTOMER ID	
	`Total_Amount` double NOT NULL,					--AMOUNT
	PRIMARY KEY (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MENU_BILL`;					--MENU BILL TABLE
create table `MENU_BILL`(
	`Order_Id` int NOT NULL,						--ORDER ID
	`Name` varchar(100) NOT NULL,					--NAME
	`Quantity` varchar(20) NOT NULL,				--QUANTITY
	`Price` varchar(20) NOT NULL,					--PRICE
	FOREIGN KEY(`Order_Id`) REFERENCES `BILL`(`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `CUSTOMER`;
create table `CUSTOMER`(
	`Customer_Id` int NOT NULL AUTO_INCREMENT,		--CUSTOMER-ID
	`Fname` varchar(15) NOT NULL,					--FIRST NAME
	`Lname` varchar(15) NOT NULL,					--LAST NAME
	`Contact` varchar(20) DEFAULT NULL,				--CONTACT NUMBER
	`Email_Id` varchar(50) DEFAULT NULL,			--EMAIL-ID 
	PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MANAGER`;
create table `MANAGER`(								--MANAGER TABLE
	`Manager_Id` int NOT NULL AUTO_INCREMENT,       --MANAGER ID
	`Fname` varchar(15) NOT NULL,					--FIRST NAME
	`Lname` varchar(15) NOT NULL,					--LAST NAME
	`Contact` varchar(20) NOT NULL,					--CONTACT NUMBER
 	`Address` varchar(30) DEFAULT NULL,				--ADDRESS
  	`Salary` varchar(30) DEFAULT NULL,				--SALARY
	`Sex` char(1) DEFAULT NULL,						--GENDER
	`Bdate` date DEFAULT NULL,						--BIRTH-DATE
	`Join_Date` date NOT NULL,						--JOINING DATE
	PRIMARY KEY (`Manager_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `STAFF`;
create table `STAFF`(								--STAFF TABLE
	`Staff_Id` int NOT NULL AUTO_INCREMENT,		    --STAFF ID
	`Fname` varchar(15) NOT NULL,					--FIRST NAME
	`Lname` varchar(15) NOT NULL,					--LAST NAME	
	`Contact` varchar(20) NOT NULL,					--CONTACT NUMBER
 	`Address` varchar(30) DEFAULT NULL,             --ADDRESS
  	`Salary` varchar(30) DEFAULT NULL, 				--SALARY OF STAFF
	`Sex` char(1) DEFAULT NULL,						--GENDER
	`Bdate` date DEFAULT NULL,						--BIRTHDATE 
	`Join_Date` date NOT NULL,						--JOIN DATE
	PRIMARY KEY (`Waiter_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



drop table if exists `COOK`;						--COOK TABLE
create table `COOK`(
	`Cook_Id` int NOT NULL AUTO_INCREMENT,			--COOK ID
	`Fname` varchar(15) NOT NULL,					--FIRST NAME
	`Lname` varchar(15) NOT NULL,					--LAST NAME
	`Contact` varchar(20) NOT NULL,					--CONTACT
 	`Address` varchar(30) DEFAULT NULL,				--ADDRESS
  	`Salary` varchar(30) DEFAULT NULL,				--SALARY
	`Sex` char(1) DEFAULT NULL,						--SEX
	`Bdate` date DEFAULT NULL,						--BIRTHDATE
	`Join_Date` date NOT NULL,						--JOINING DATE
	`Specialization` varchar(50) DEFAULT NULL,		--SPECIALIZATION	
	PRIMARY KEY (`Cook_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `HOME_DELIVERY`;				--HOME DELIVERY
create table `HOME_DELIVERY`(
	`Delivery_Id` int NOT NULL AUTO_INCREMENT,		--ID OF DELIVERY	
	`Address` varchar(50) NOT NULL,					--ADDRESS
	`Contact` varchar(20) NOT NULL,					--CONTACT NUMBER
	`Cust_Id` int NOT NULL,							--CUSTOMER-ID
	`Order_Id` int NOT NULL,						--ORDER-ID
	PRIMARY KEY(`Delivery_Id`),
	FOREIGN KEY (`Cust_Id`) REFERENCES `CUSTOMER`(`Customer_Id`),
	FOREIGN KEY (`Order_Id`) REFERENCES `BILL`(`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



drop table if exists `MENU`;
create table `MENU`(								--MENU TABLE
	`Menu_Id` int NOT NULL AUTO_INCREMENT,			--MENU ID
	`Name` varchar(100) NOT NULL,					--NAME
	`Price` varchar(20) NOT NULL,					--PRICE
	`Type` varchar(20) DEFAULT NULL,				--TYPE
	`Category` varchar(30) NOT NULL,				--CATEGORY
	PRIMARY KEY(`Menu_Id`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


drop table if exists `SUPPLIER`;
create table `SUPPLIER`(                 -- SUPPLIER TABLE
	`Fname` varchar(15) NOT NULL,			--FIRST NAME
	`Lname` varchar(15) NOT NULL,			--LAST NAME
	`Address` varchar(30) NOT NULL,			--ADDRESS
	`Contact` varchar(20) NOT NULL,			--CONTACT NUMBER
	`Details` varchar(500) DEFAULT NULL,	--DETAILS
	PRIMARY KEY (`Fname`,`Lname`,`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `TABLES`;
create table `TABLES`(
	`Table_Number` varchar(9) NOT NULL,
	`Details` varchar(200) DEFAULT NULL,
	PRIMARY KEY (`Table_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `BOOKING`;		--BOOKING TABLE
create table `BOOKING`(
	`Booking_Id` int NOT NULL AUTO_INCREMENT,		--ID OF BOOKING
	`Table_Num` varchar(30) NOT NULL,				--TABLE NUMBER
	`Date` varchar(30) NOT NULL,					--DATE OF BOOKING
	`Time` varchar(30) NOT NULL,					--TIME OF BOOKING
	`Cust_Id` int NOT NULL,							--CUSTOMER ID
	PRIMARY KEY (`Booking_Id`),
	FOREIGN KEY (`Cust_Id`) REFERENCES `CUSTOMER`(`Customer_Id`),
	FOREIGN KEY (`Table_Num`) REFERENCES `TABLES`(`Table_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


