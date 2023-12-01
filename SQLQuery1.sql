DROP TABLE VEHICLE;
DROP TABLE MODEL;
DROP TABLE BRAND;
DROP TABLE BODY;
DROP TABLE COUNTRY;
DROP TABLE CONTINENT;



CREATE TABLE CONTINENT 
( 
    ContinentID INT NOT NULL,
    Continent_name VARCHAR(64), 
    PRIMARY KEY(ContinentID) 
);

CREATE TABLE COUNTRY
(
  CountryID INT NOT NULL,
  ISO3 VARCHAR(3) NOT NULL,
  ISONumber INT NOT NULL,
  CountryName VARCHAR(64) NOT NULL,
  Capital VARCHAR(64) NOT NULL,
  Currency VARCHAR(64),
  ContinentID INT NOT NULL,
  FOREIGN KEY (ContinentID) REFERENCES CONTINENT(ContinentID) ON DELETE CASCADE,
  PRIMARY KEY (CountryID)
);

CREATE TABLE BODY
(
  BodyID INT NOT NULL,
  Type VARCHAR(64) NOT NULL,
  Doors INT NOT NULL,
  Contruction VARCHAR(64) NOT NULL,
  PRIMARY KEY (BodyID)
);

CREATE TABLE BRAND
(
  BrandID INT NOT NULL,
  BrandName VARCHAR(64) NOT NULL,
  Company VARCHAR(64) NOT NULL,
  CountryID INT NOT NULL,
  FOREIGN KEY (CountryID) REFERENCES COUNTRY(CountryID) ON DELETE CASCADE,
  PRIMARY KEY (BrandID)
);

CREATE TABLE MODEL
(
  ModelID INT NOT NULL,
  Maker INT NOT NULL,
  Model VARCHAR(64) NOT NULL,
  BrandID INT NOT NULL,
  FOREIGN KEY (BrandID) REFERENCES BRAND(BrandID) ON DELETE CASCADE,
  PRIMARY KEY (ModelID)
);

CREATE TABLE VEHICLE
(
  VehicleID INT NOT NULL,
  Year INT NOT NULL,
  Weight INT NOT NULL,
  KwPower INT NOT NULL,
  Seats INT NOT NULL,
  Mileage INT NOT NULL,
  EngineVolume FLOAT,
  FuelType VARCHAR(20) NOT NULL,
  Color VARCHAR(20) NOT NULL,
  Price INT NOT NULL, 
  BodyID INT NOT NULL,
  ModelID INT NOT NULL,
  FOREIGN KEY (BodyID) REFERENCES BODY(BodyID) ON DELETE CASCADE,
  FOREIGN KEY (ModelID) REFERENCES MODEL(ModelID) ON DELETE CASCADE,
  PRIMARY KEY (VehicleID)
);

INSERT INTO CONTINENT(ContinentID, Continent_name)
VALUES
  (1, 'Africa'),
  (2, 'Antarctica'),
  (3, 'Asia'),
  (4, 'Europe'),
  (5, 'North America'),
  (6, 'Oceania'),
  (7, 'South America');

-- Insert data into COUNTRY table
INSERT INTO COUNTRY (CountryID, ISO3, ISONumber, CountryName, Capital, Currency,  ContinentID)
VALUES
  (1, 'USA', 840, 'United States', 'Washington, D.C.', 'USD',  5),
  (2, 'CAN', 124, 'Canada', 'Ottawa', 'CAD', 5),
  (3, 'GBR', 826, 'United Kingdom', 'London', 'GBP ', 4),
  (5, 'AUS', 36, 'Australia', 'Canberra', 'AUD', 6),
  (6, 'BRA', 76, 'Brazil', 'Brasilia', 'BRL', 7),
  (7, 'CHN', 156, 'China', 'Beijing', 'CNY', 3),
  (8, 'IND', 356, 'India', 'New Delhi', 'INR', 2),
  (9, 'JPN', 392, 'Japan', 'Tokyo', 'JPY', 3),
  (10, 'RUS', 643, 'Russia', 'Moscow', 'RUB', 4),
  (11, 'ZAF', 710, 'South Africa', 'Pretoria', 'ZAR', 1),
  (12, 'FRA', 250, 'France', 'Paris', 'Euro', 4),
  (13, 'DEU', 276, 'Germany', 'Berlin', 'Euro', 4),
  (14, 'ITA', 380, 'Italy', 'Rome', 'Euro', 4),
  (15, 'TWN', 158, 'Taiwan', 'Taipei', 'New Taiwan Dollar', 3),
  (16, 'NLD', 528, 'Netherlands', 'Amsterdam', 'Euro', 4),
  (17, 'SWE', 752, 'Sweden', 'Stockholm', 'Swedish Krona', 4),
  (18, 'KOR', 410, 'South Korea', 'Seoul', 'South Korean Won', 3),
  (19, 'ESP', 724, 'Spain', 'Madrid', 'Euro', 4),
  (20, 'AUT', 40, 'Austria', 'Vienna', 'Euro', 4);


-- Insert data into BODY table
INSERT INTO BODY (BodyID, Type, Doors, Contruction)
VALUES
  (1, 'Sedan', 4, 'Steel'),
  (2, 'SUV', 5, 'Aluminum'),
  (3, 'Truck', 2, 'Fiberglass'),
  (4, 'Hatchback', 5, 'Aluminum'),
  (5, 'Convertible', 2, 'Steel'),
  (6, 'Minivan', 4, 'Fiberglass'),
  (7, 'Coupe', 2, 'Carbon Fiber'),
  (8, 'Wagon', 5, 'Aluminum'),
  (9, 'Pickup Truck', 4, 'Steel'),
  (10, 'Crossover', 5, 'Aluminum'),
  (11, 'Roadster', 2, 'Carbon Fiber'),
  (12, 'Compact SUV', 4, 'Fiberglass'),
  (13, 'Luxury Sedan', 4, 'Aluminum'),
  (14, 'Electric Hatchback', 5, 'Carbon Fiber'),
  (15, 'Off-road SUV', 5, 'Steel'),
  (16, 'Sports Coupe', 2, 'Aluminum'),
  (17, 'Family Van', 4, 'Fiberglass'),
  (18, 'Compact Pickup', 4, 'Steel'),
  (19, 'City Car', 2, 'Fiberglass'),
  (20, 'Performance Sedan', 4, 'Carbon Fiber');

-- Insert data into BRAND table
INSERT INTO BRAND (BrandID, BrandName, Company, CountryID)
VALUES
  (1, 'Chevrolet', 'General Motors', 1),
  (2, 'Toyota', 'Toyota Motor Corporation', 9),
  (3, 'Jaguar', 'Jaguar Land Rover', 3),
  (4, 'Ford', 'Ford Motor Company', 1),
  (5, 'Honda', 'Honda Motor Co., Ltd.', 9),
  (6, 'Nissan', 'Nissan Motor Co., Ltd.', 9),
  (7, 'Mercedes-Benz', 'Daimler AG', 13),
  (8, 'Volkswagen', 'Volkswagen Group', 13),
  (9, 'Hyundai', 'Hyundai Motor Company', 18),
  (10, 'Volvo', 'Volvo Car Corporation', 17),
  (11, 'Kia', 'Kia Corporation', 18),
  (12, 'SEAT', 'SEAT, S.A.', 19),
  (13, 'BMW', 'Bayerische Motoren Werke AG', 13),
  (14, 'Tesla', 'Tesla, Inc.', 1),
  (15, 'Audi', 'Audi AG', 13),
  (16, 'Mazda', 'Mazda Motor Corporation', 9),
  (17, 'Lexus', 'Lexus International', 9),
  (18, 'Subaru', 'Subaru Corporation', 9),
  (19, 'Fiat', 'Fiat Chrysler Automobiles', 14),
  (20, 'Porsche', 'Porsche AG', 13);

-- Insert data into MODEL table
INSERT INTO MODEL (ModelID, Maker, Model, BrandID)
VALUES
  (1, 2010, 'Civic', 5),
  (2, 2020, 'Camry', 2),
  (3, 2018, 'F-Type', 3),
  (4, 2012, 'Focus', 4),
  (5, 2019, 'Civic Type R', 5),
  (6, 2015, 'GT-R', 6),
  (7, 2017, 'C-Class', 7),
  (8, 2019, 'Golf', 8),
  (9, 2021, 'Tucson', 9),
  (10, 2022, 'XC90', 10),
  (11, 2021, 'Telluride', 11),
  (12, 2020, 'Leon', 12),
  (13, 2022, 'iX3', 13),
  (14, 2021, 'Model S', 14),
  (15, 2022, 'A3', 15),
  (16, 2020, 'MX-5', 16),
  (17, 2021, 'UX', 17),
  (18, 2022, 'RS 6', 15),
  (19, 2020, '500', 19),
  (20, 2022, '911', 20),
  (21, 2022, 'XC40', 10),
  (22, 2021, 'Sportage', 11),
  (23, 2020, 'Ateca', 12),
  (24, 2022, 'i4', 13),
  (25, 2021, 'Model Y', 14),
  (26, 2022, 'A6', 15),
  (27, 2020, 'CX-9', 16),
  (28, 2021, 'RX', 17),
  (29, 2022, 'Forester', 18),
  (30, 2020, '500X', 19);

-- Insert data into VEHICLE table
INSERT INTO VEHICLE (VehicleID, Year, Weight, KwPower, Seats, Mileage, EngineVolume, FuelType, Color, Price,  BodyID, ModelID)
VALUES
  (1, 2015, 3500, 200, 5, 150000, 2.0, 'diesel', 'Blue', 18990, 1, 10),
  (2, 2019, 4000, 250, 7, 30000, 3.5, 'petrol', 'Black', 24690, 2, 2),
  (3, 2017, 5000, 300, 2, 40000, 5.0, 'petrol', 'Red', 79890, 3, 3),
  (4, 2018, 3200, 180, 5, 35000, 1.9, 'diesel', 'Silver', 10990, 4, 4),
  (5, 2020, 2900, 306, 4, 120000, 2.0, 'plugin-hybrid', 'White',39500 , 5, 5),
  (6, 2016, 3800, 565, 2, 115000, 3.8, 'petrol', 'Black', 88490, 6, 6),
  (7, 2018, 3500, 250, 4, 130000, 2.5, 'diesel', 'Gray', 56800, 7, 7),
  (8, 2020, 2900, 180, 5, 25000, null, 'electric', 'Silver', 28290, 8, 8),
  (9, 2022, 4000, 200, 5, 115000, 2.0, 'hybrid', 'White', 39600, 9, 9),
  (10, 2021, 3800, 220, 5, 140000, 2.3, 'diesel', 'Green', 21990, 10, 10),
  (11, 2020, 3500, 280, 7, 125000, 3.5, 'petrol', 'Blue', 36990, 2, 22),
  (12, 2019, 4500, 350, 2, 130000, 5.0, 'petrol', 'Red', 59890, 12, 12),
  (13, 2022, 3200, 200, 5, 135000, 2.0, 'diesel', 'Black', 15990, 13, 13),
  (14, 2018, 3100, 305, 4, 120000, 2.0, 'plugin-hybrid', 'White', 43500, 14, 14),
  (15, 2017, 3600, 600, 2, 15000, 4.0, 'petrol', 'Black', 98490, 15, 15),
  (16, 2020, 3200, 200, 4, 30000, 2.5, 'diesel', 'Silver', 67800, 16, 16),
  (17, 2021, 3000, 180, 5, 25000, null, 'electric', 'Blue', 32290, 17, 28),
  (18, 2019, 4000, 220, 5, 15000, 2.0, 'hybrid', 'White', 44600, 18, 18),
  (19, 2022, 4200, 240, 7, 120000, 3.0, 'petrol', 'Gray', 28990, 19, 19),
  (20, 2018, 3800, 200, 5, 140000, 2.0, 'diesel', 'Black', 22990, 20, 20),
  (21, 2021, 3500, 280, 7, 25000, 3.5, 'petrol', 'Red', 37990, 1, 1),
  (22, 2019, 4500, 350, 2, 30000, 5.0, 'petrol', 'Silver', 61890, 2, 2),
  (23, 2022, 3200, 200, 5, 135000, 2.0, 'diesel', 'White', 16990, 3, 3),
  (24, 2018, 3100, 305, 4, 20000, 2.0, 'plugin-hybrid', 'Blue', 45500, 4, 14),
  (25, 2017, 3600, 600, 2, 15000, 4.0, 'petrol', 'Black', 100490, 5, 13),
  (26, 2020, 3200, 200, 4, 130000, 2.5, 'diesel', 'Silver', 73800, 2, 22),
  (27, 2021, 3000, 180, 5, 25000, null, 'electric', 'Red', 36290, 19, 30),
  (28, 2019, 4000, 220, 5, 15000, 2.0, 'hybrid', 'White', 48600, 8, 9),
  (29, 2022, 4200, 240, 7, 20000, 3.0, 'petrol', 'Black', 32990, 9, 17),
  (30, 2018, 3800, 200, 5, 40000, 2.0, 'diesel', 'Blue', 26990, 3, 26),
  (31, 2021, 3500, 280, 7, 25000, 3.5, 'petrol', 'Red', 41990, 12, 20),
  (32, 2019, 4500, 350, 2, 30000, 5.0, 'petrol', 'Silver', 65890, 5, 7),
  (33, 2022, 3200, 200, 5, 35000, 2.0, 'diesel', 'Black', 17990, 2, 8),
  (34, 2018, 3100, 305, 4, 20000, 2.0, 'plugin-hybrid', 'White', 49500, 3, 6),
  (35, 2017, 3600, 600, 2, 115000, 4.0, 'petrol', 'Black', 104490, 8, 1),
  (36, 2020, 3200, 200, 4, 30000, 2.5, 'diesel', 'Silver', 78800, 6, 11),
  (37, 2021, 3000, 180, 5, 25000, null, 'electric', 'Blue', 40290, 12, 12),
  (38, 2019, 4000, 220, 5, 15000, 2.0, 'hybrid', 'White', 52600, 2, 16),
  (39, 2022, 4200, 240, 7, 20000, 3.0, 'petrol', 'Black', 36990, 9, 15),
  (40, 2018, 3800, 200, 5, 140000, 2.0, 'diesel', 'Red', 30990, 8, 17);



-- 1) Auta znacky honda, ich cena a rok vyroby a farba
SELECT BrandName + ' - ' + Model AS VehicleType, Price, Color, Year From VEHICLE 
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
INNER JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
WHERE BRAND.BrandName = 'Honda';

-- 2) Zobrazeni aut starsich ako rok 2018
SELECT BrandName + ' - ' + Model AS VehicleType, Price, Color, Year From VEHICLE
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
INNER JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
WHERE Year < 2018;

-- 3) Zobrazeni 5 najlacnejsich aut
SELECT TOP 5 BrandName, Model , Price, Color, Year, Mileage FROM VEHICLE
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
INNER JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
ORDER BY Price ASC;

-- 4) Zobrazeni aut vyrobenych mimo europy
SELECT BrandName + ' - ' + Model AS VehicleType, Price, Color, Year From VEHICLE 
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
INNER JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
INNER JOIN COUNTRY ON BRAND.CountryID = COUNTRY.CountryID
INNER JOIN CONTINENT ON COUNTRY.ContinentID = CONTINENT.ContinentID
WHERE Continent_name != 'Europe';

-- 5) Pocet aut a ich priemerna cena ku kazdej znacke
SELECT BrandName, COUNT(VEHICLE.ModelID) AS Count, AVG(VEHICLE.Price) AS AveragePrice
FROM BRAND
LEFT JOIN MODEL ON BRAND.BrandID = MODEL.BrandID
LEFT JOIN VEHICLE ON MODEL.ModelID = VEHICLE.ModelID
GROUP BY BRAND.BrandName;



-- 6) Vsetky vozidla, ktorych model zacina pismenom 'C'
SELECT 
	MODEL.Model,
	VEHICLE.Year, 
	VEHICLE.KwPower, 
	VEHICLE.Seats, 
	VEHICLE.Mileage, 
	VEHICLE.EngineVolume, 
	VEHICLE.FuelType, 
	VEHICLE.color
FROM VEHICLE 
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
WHERE Model like 'C%'

-- 7) Zvysenie cien vsetkych aut znacky audi o 10%
SELECT BrandName, Model, Price AS OldPrice, Price * 1.1 AS Increased_Price FROM VEHICLE
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
INNER JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
WHERE BrandName = 'Audi';

-- 8) Pocet kusov k modelom aut 
SELECT MODEL.Model, COUNT(VEHICLE.ModelID) AS ModelCount, BRAND.BrandName
FROM MODEL
LEFT JOIN VEHICLE ON MODEL.ModelID = VEHICLE.ModelID
LEFT JOIN BRAND ON MODEL.BrandID = BRAND.BrandID
GROUP BY MODEL.Model, BRAND.BrandName;


-- 9) Zoznam modelov a k nim najnovsie dostupne kusky
SELECT Model, (SELECT MAX(Year) FROM VEHICLE WHERE VEHICLE.ModelID = MODEL.ModelID) AS Year From MODEL


-- 10) Zoznam farieb a pocet aut v tychto farbach
SELECT color, COUNT(color) AS count FROM VEHICLE  
LEFT JOIN MODEL ON VEHICLE.ModelID = Model.ModelID
Group by color

-- 11) Zoznam modelov, ktore maju benzinovy pohon
SELECT Model AS 'Models with petrol fuel' FROM MODEL 
WHERE EXISTS(SELECT * FROM VEHICLE WHERE FuelType = 'petrol' AND MODEL.ModelID = VEHICLE.ModelID)

 -- 12) Vsetky znacky, ktore niesu v tabulke vehicles
SELECT BRAND.BrandName FROM BRAND 
WHERE NOT EXISTS (SELECT * FROM MODEL INNER JOIN VEHICLE ON MODEL.ModelID = VEHICLE.ModelID WHERE MODEL.BrandID = BRAND.BrandID);

-- 13) Vozidla, ktorych cena je medzi 30000 a 40000
select * from VEHICLE
where PRICE between 30000 and 40000

-- 14) Vsetky vozidla, kotrych cena je nizsia ako priemer cien vsetkych aut
SELECT Price, MODEL.Model, Year FROM VEHICLE
INNER JOIN MODEL ON VEHICLE.ModelID = MODEL.ModelID
WHERE Price < (SELECT AVG(Price) FROM VEHICLE);

-- 15) Priemerna vaha vozidiel pre kazdu znacku
SELECT BrandName, AVG(Weight) AS AverageWeight FROM BRAND 
JOIN MODEL ON BRAND.BrandID = MODEL.BrandID
JOIN VEHICLE ON MODEL.ModelID = VEHICLE.ModelID
GROUP BY BRAND.BrandName;

SELECT * FROM MODEL

-- 16) Zmaze vsetky modely, ktore niesu v tabulke vehicles
DELETE FROM MODEL 
WHERE ModelID not in (SELECT ModelID FROM VEHICLE)

SELECT * FROM MODEL

-- 17) Vlozenie tychto modelov spat
 INSERT INTO MODEL (ModelID, Maker, Model, BrandID) VALUES
  (21, 2022, 'XC40', 10),
  (23, 2020, 'Ateca', 12),
  (24, 2022, 'i4', 13),
  (25, 2021, 'Model Y', 14),
  (27, 2020, 'CX-9', 16),
  (29, 2022, 'Forester', 18);

-- 18) Zvysenie cien vsetkych SUV a Pickupov o 30%
UPDATE VEHICLE set Price = Price*1.3 FROM VEHICLE
INNER JOIN BODY ON VEHICLE.BodyID = BODY.BodyID
WHERE Type like 'SUV' or Type like 'Pickup Truck'
SELECT * FROM VEHICLE;