-- AGRIBUSINESS PERFORMANCE ANALYSIS - SYNTHETIC DATASET
-- Hypothetical data for academic/analytical demonstration only.
-- Run this script after creating the tables from schema.sql.

INSERT INTO Farm VALUES
(1,'Green Valley Farms','Lucknow, Uttar Pradesh',42,'Rakesh Verma','2018-04-10'),
(2,'Sunrise Agro Farm','Kanpur, Uttar Pradesh',55,'Amit Singh','2016-07-15'),
(3,'Shivam Organic Farms','Unnao, Uttar Pradesh',36,'Neeraj Kumar','2020-02-20');

INSERT INTO Field VALUES
(1,1,'GVF North Field',12,'Loamy'),(2,1,'GVF South Field',10,'Alluvial'),
(3,2,'SAF East Field',15,'Loamy'),(4,2,'SAF West Field',13,'Clay'),
(5,3,'SOF Organic Field A',8,'Alluvial'),(6,3,'SOF Organic Field B',6,'Loamy');

INSERT INTO Crop VALUES
(1,'Wheat','Cereal','Rabi'),(2,'Rice','Cereal','Kharif'),
(3,'Potato','Tuber','Rabi'),(4,'Tomato','Vegetable','Zaid'),
(5,'Mustard','Oilseed','Rabi'),(6,'Maize','Cereal','Kharif');

INSERT INTO Employee VALUES
(1,1,'Rajesh Yadav','Field Worker','2021-06-01',420),
(2,1,'Pooja Sharma','Field Supervisor','2020-03-12',600),
(3,2,'Suresh Pal','Field Worker','2019-08-20',400),
(4,2,'Kavita Singh','Field Worker','2022-01-10',430),
(5,3,'Deepak Gupta','Field Worker','2021-09-05',410),
(6,3,'Anjali Verma','Field Supervisor','2020-11-18',580);

INSERT INTO Equipment VALUES
(1,1,'GVF Tractor','Tractor','2019-05-10'),(2,1,'GVF Water Pump','Irrigation','2020-06-15'),
(3,2,'SAF Tractor','Tractor','2018-03-22'),(4,2,'SAF Harvester','Harvester','2021-10-08'),
(5,3,'SOF Mini Tractor','Tractor','2021-04-17');

INSERT INTO Supplier VALUES
(1,'Agro Seeds India','Seeds','contact@agroseeds.example'),
(2,'Kisan Fertilizers','Fertilizer','contact@kisanfert.example'),
(3,'Green Crop Chemicals','Crop Protection','contact@greencrop.example'),
(4,'Farm Tools Supply','Equipment','contact@farmtools.example');

INSERT INTO Market VALUES
(1,'Lucknow Mandi','Lucknow, Uttar Pradesh'),(2,'Kanpur Mandi','Kanpur, Uttar Pradesh'),
(3,'Unnao Market','Unnao, Uttar Pradesh');

INSERT INTO Planting VALUES
(1,1,1,'2024-11-10','2025-03-20',180),(2,2,3,'2024-11-18','2025-03-05',220),
(3,3,2,'2024-06-15','2024-10-05',150),(4,4,6,'2024-06-20','2024-09-25',95),
(5,5,5,'2024-11-05','2025-03-15',90),(6,6,4,'2025-02-10','2025-05-20',35),
(7,1,1,'2025-11-12','2026-03-22',185),(8,2,3,'2025-11-20','2026-03-08',225),
(9,3,2,'2025-06-18','2025-10-08',155),(10,4,6,'2025-06-22','2025-09-28',98),
(11,5,5,'2025-11-07','2026-03-17',92),(12,6,4,'2026-02-12','2026-05-22',36);

INSERT INTO Harvest VALUES
(1,1,'2025-03-18',5400,'A'),(2,2,'2025-03-03',7200,'A'),
(3,3,'2024-10-02',8100,'B'),(4,4,'2024-09-22',6200,'A'),
(5,5,'2025-03-12',2100,'A'),(6,6,'2025-05-18',3600,'A'),
(7,7,'2026-03-20',5750,'A'),(8,8,'2026-03-06',6850,'B'),
(9,9,'2025-10-05',7600,'B'),(10,10,'2025-09-25',5900,'A'),
(11,11,'2026-03-15',2250,'A'),(12,12,'2026-05-20',3900,'A'),
(13,7,'2026-03-22',400,'A'),(14,8,'2026-03-08',350,'B');

INSERT INTO Labor VALUES
(1,1,1,'2024-12-05',32,'Sowing'),(2,2,1,'2025-02-10',18,'Supervision'),
(3,1,2,'2024-12-08',45,'Planting'),(4,2,2,'2025-02-15',20,'Supervision'),
(5,3,3,'2024-07-05',48,'Planting'),(6,4,3,'2024-08-12',42,'Irrigation'),
(7,3,4,'2024-07-08',40,'Sowing'),(8,4,4,'2024-08-20',36,'Weeding'),
(9,5,5,'2024-12-01',28,'Sowing'),(10,6,5,'2025-02-20',16,'Supervision'),
(11,5,6,'2025-03-01',30,'Transplanting'),(12,6,6,'2025-04-10',22,'Supervision'),
(13,1,7,'2025-12-05',35,'Sowing'),(14,2,7,'2026-02-12',20,'Supervision'),
(15,1,8,'2025-12-10',48,'Planting'),(16,2,8,'2026-02-18',20,'Supervision'),
(17,3,9,'2025-07-05',50,'Planting'),(18,4,9,'2025-08-15',40,'Irrigation'),
(19,3,10,'2025-07-10',42,'Sowing'),(20,4,10,'2025-08-22',38,'Weeding'),
(21,5,11,'2025-12-03',30,'Sowing'),(22,6,11,'2026-02-22',18,'Supervision'),
(23,5,12,'2026-03-02',32,'Transplanting'),(24,6,12,'2026-04-12',24,'Supervision');

INSERT INTO Equipment_Usage VALUES
(1,1,1,'2024-11-12',18),(2,2,1,'2025-02-05',14),(3,1,2,'2024-11-20',22),
(4,3,3,'2024-06-18',26),(5,4,3,'2024-09-15',20),(6,3,4,'2024-06-22',24),
(7,5,5,'2024-11-07',16),(8,5,6,'2025-02-12',12),(9,1,7,'2025-11-14',20),
(10,2,7,'2026-02-08',16),(11,1,8,'2025-11-22',24),(12,3,9,'2025-06-20',28),
(13,4,9,'2025-09-18',22),(14,3,10,'2025-06-24',26),(15,5,11,'2025-11-09',18),
(16,5,12,'2026-02-14',14);

INSERT INTO Input_Purchase VALUES
(1,1,1,'Wheat Seeds','Seeds',200,52,'2024-10-20'),
(2,2,1,'NPK Fertilizer','Fertilizer',850,28,'2024-11-01'),
(3,3,1,'Crop Protection','Pesticide',60,320,'2025-01-10'),
(4,1,2,'Rice Seeds','Seeds',180,58,'2024-05-20'),
(5,2,2,'Urea','Fertilizer',950,25,'2024-06-05'),
(6,3,2,'Pest Control','Pesticide',75,300,'2024-08-10'),
(7,1,3,'Mustard Seeds','Seeds',100,48,'2024-10-18'),
(8,2,3,'Organic Fertilizer','Fertilizer',600,30,'2024-11-02'),
(9,1,1,'Wheat Seeds','Seeds',210,55,'2025-10-22'),
(10,2,1,'NPK Fertilizer','Fertilizer',900,30,'2025-11-02'),
(11,3,2,'Crop Protection','Pesticide',80,330,'2025-08-12'),
(12,1,2,'Rice Seeds','Seeds',185,61,'2025-05-22'),
(13,2,3,'Organic Fertilizer','Fertilizer',650,32,'2025-11-03');

INSERT INTO Sale VALUES
(1,1,1,'2025-03-19',3000,25,'Sharma Grain Traders'),
(2,1,1,'2025-03-20',2400,26,'UP Agro Wholesale'),
(3,2,1,'2025-03-04',4000,30,'Lucknow Fresh Mart'),
(4,2,2,'2025-03-05',3200,31,'Kanpur Food Traders'),
(5,3,2,'2024-10-03',5000,22,'Kanpur Rice Buyers'),
(6,3,1,'2024-10-04',3100,23,'UP Agro Wholesale'),
(7,4,2,'2024-09-23',3500,20,'Kanpur Food Traders'),
(8,4,1,'2024-09-24',2700,21,'Lucknow Fresh Mart'),
(9,5,3,'2025-03-13',2100,48,'Unnao Oil Traders'),
(10,6,1,'2025-05-19',2000,42,'Lucknow Fresh Mart'),
(11,6,3,'2025-05-20',1600,44,'Unnao Vegetable Hub'),
(12,7,1,'2026-03-21',3200,28,'Sharma Grain Traders'),
(13,7,2,'2026-03-22',2550,29,'Kanpur Food Traders'),
(14,8,1,'2026-03-07',3500,32,'Lucknow Fresh Mart'),
(15,8,2,'2026-03-08',3000,33,'Kanpur Food Traders'),
(16,9,2,'2025-10-06',4200,24,'Kanpur Rice Buyers'),
(17,9,1,'2025-10-07',3000,25,'UP Agro Wholesale'),
(18,10,2,'2025-09-26',3200,22,'Kanpur Food Traders'),
(19,10,1,'2025-09-27',2700,23,'Lucknow Fresh Mart'),
(20,11,3,'2026-03-16',2250,52,'Unnao Oil Traders'),
(21,12,1,'2026-05-21',2100,45,'Lucknow Fresh Mart'),
(22,12,3,'2026-05-22',1800,47,'Unnao Vegetable Hub'),
(23,13,1,'2026-03-23',400,28,'Sharma Grain Traders'),
(24,14,2,'2026-03-09',350,33,'Kanpur Food Traders');

-- Price history: monthly observations for trend analysis.
INSERT INTO Price_History VALUES
(1,1,1,'2024-11-01',23),(2,1,1,'2024-12-01',24),(3,1,1,'2025-01-01',25),
(4,1,1,'2025-02-01',24.5),(5,1,1,'2025-03-01',26),(6,1,1,'2025-11-01',26),
(7,1,1,'2025-12-01',27),(8,1,1,'2026-01-01',27.5),(9,1,1,'2026-02-01',28),(10,1,1,'2026-03-01',29),
(11,2,1,'2024-06-01',20),(12,2,1,'2024-07-01',21),(13,2,1,'2024-08-01',22),
(14,2,1,'2024-09-01',23),(15,2,1,'2024-10-01',22),(16,2,1,'2025-06-01',23),
(17,2,1,'2025-07-01',24),(18,2,1,'2025-08-01',25),(19,2,1,'2025-09-01',24),(20,2,1,'2025-10-01',25),
(21,3,1,'2024-11-01',28),(22,3,1,'2024-12-01',30),(23,3,1,'2025-01-01',32),
(24,3,1,'2025-02-01',34),(25,3,1,'2025-03-01',36),(26,3,1,'2025-11-01',35),
(27,3,1,'2025-12-01',37),(28,3,1,'2026-01-01',39),(29,3,1,'2026-02-01',41),(30,3,1,'2026-03-01',43),
(31,4,1,'2025-02-01',38),(32,4,1,'2025-03-01',40),(33,4,1,'2025-04-01',42),(34,4,1,'2025-05-01',44),
(35,4,1,'2026-02-01',42),(36,4,1,'2026-03-01',44),(37,4,1,'2026-04-01',46),(38,4,1,'2026-05-01',48),
(39,5,3,'2024-11-01',44),(40,5,3,'2024-12-01',45),(41,5,3,'2025-01-01',46),(42,5,3,'2025-02-01',47),(43,5,3,'2025-03-01',48),
(44,5,3,'2025-11-01',48),(45,5,3,'2025-12-01',50),(46,5,3,'2026-01-01',51),(47,5,3,'2026-02-01',52),(48,5,3,'2026-03-01',53);

-- Weather observations aligned with crop-cycle periods.
INSERT INTO Weather_Log VALUES
(1,1,'2024-11-15',22,4),(2,1,'2024-12-15',18.5,6),(3,1,'2025-01-15',16,2),(4,1,'2025-02-15',19,8),(5,1,'2025-03-15',24,3),
(6,1,'2025-11-15',21,5),(7,1,'2025-12-15',17.5,7),(8,1,'2026-01-15',15.5,3),(9,1,'2026-02-15',20,9),(10,1,'2026-03-15',25,4),
(11,2,'2024-06-20',31,45),(12,2,'2024-07-20',30,85),(13,2,'2024-08-20',29,110),(14,2,'2024-09-20',28,70),(15,2,'2024-10-01',26,35),
(16,2,'2025-06-20',32,40),(17,2,'2025-07-20',31,72),(18,2,'2025-08-20',30,95),(19,2,'2025-09-20',28.5,60),(20,2,'2025-10-01',27,30),
(21,3,'2024-11-15',22,5),(22,3,'2024-12-15',18,8),(23,3,'2025-01-15',16.5,3),(24,3,'2025-02-15',20,10),(25,3,'2025-03-15',24.5,4),
(26,3,'2025-11-15',21.5,6),(27,3,'2025-12-15',17,7),(28,3,'2026-01-15',16,3),(29,3,'2026-02-15',21,9),(30,3,'2026-03-15',25,5);

INSERT INTO Expense VALUES
(1,1,'Fuel',18500,'2024-12-20','Tractor and transport fuel'),
(2,1,'Utilities',12000,'2025-02-28','Electricity and irrigation'),
(3,1,'Maintenance',9500,'2025-03-25','Machinery maintenance'),
(4,2,'Fuel',24000,'2024-08-25','Tractor and harvester fuel'),
(5,2,'Utilities',15000,'2024-09-30','Electricity and water pumping'),
(6,2,'Maintenance',12500,'2025-01-15','Equipment maintenance'),
(7,3,'Fuel',11000,'2024-12-18','Farm transport and tractor fuel'),
(8,3,'Utilities',8500,'2025-02-25','Irrigation and electricity'),
(9,3,'Organic Certification',7000,'2025-03-20','Annual certification expense'),
(10,1,'Fuel',20500,'2025-12-20','Tractor and transport fuel'),
(11,1,'Utilities',13500,'2026-02-28','Electricity and irrigation'),
(12,2,'Fuel',25500,'2025-08-25','Tractor and harvester fuel'),
(13,2,'Maintenance',14000,'2026-01-15','Equipment maintenance'),
(14,3,'Fuel',12000,'2025-12-18','Farm transport and tractor fuel'),
(15,3,'Utilities',9000,'2026-02-25','Irrigation and electricity');