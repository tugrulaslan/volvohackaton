INSERT INTO kpicategory (name) VALUES ('Safety');
INSERT INTO kpicategory (name) VALUES ('Cost');
INSERT INTO kpicategory (name) VALUES ('Delivery');
INSERT INTO kpicategory (name) VALUES ('Environment');
INSERT INTO kpicategory (name) VALUES ('People');
INSERT INTO kpicategory (name) VALUES ('Quality');
COMMIT;

INSERT INTO metric (name) VALUES ('Buses'); /*% of Buses*/
INSERT INTO metric (name) VALUES ('P OK'); /*% of P OK*/
INSERT INTO metric (name) VALUES ('people'); /*People*/
INSERT INTO metric (name) VALUES ('worked hours'); /*% of worked hours*/
INSERT INTO metric (name) VALUES ('accidents/hours worked x 200000'); /*accidents/hours worked x 200000*/
INSERT INTO metric (name) VALUES ('Days'); /*Average Days*/
INSERT INTO metric (name) VALUES ('Average Points / Average Remarks'); /*Average Points / Average Remarks*/
INSERT INTO metric (name) VALUES ('Hours/Unit'); /*Hours/Unit*/
INSERT INTO metric (name) VALUES ('PLN/Unit'); /*Local Curr/Unit*/
INSERT INTO metric (name) VALUES ('MWh/Lay Down'); /*MWh/Lay Down*/
INSERT INTO metric (name) VALUES ('Part Number/Norm LD'); /*Part Number/Norm LD*/
INSERT INTO metric (name) VALUES ('Points based on VBC Criteria'); /*Points based on VBC Criteria*/
INSERT INTO metric (name) VALUES ('Volume/Capacity'); /*Volume/Capacity*/
COMMIT;



INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Lost Time Accident Rate', 1, 5);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Conversion Cost YTD', 2, 9);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Days Inventory Outstanding', 2, 6);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Total Hours/Normalized Laydown', 2, 8);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Capacity Utilization', 2, 13);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Customer Delivery OK', 3, 1);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Production Delivery Precision', 3, 1);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Number of Production GOK', 3, 1);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Order to Delivery Lead Time', 3, 6);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Missing parts per Unit', 3, 11);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Throughput time', 3, 6);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Energy Efficiency', 4, 10);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('OD Participation', 5, 3);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Direct Runners', 6,2);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('0-3 month Warranty', 6, 9);
INSERT INTO kpisubcategory (name, kpiCategory_Id, metric_Id) VALUES ('Product Audit', 6,7);
COMMIT;


INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (5,NOW(),'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (3,NOW() + INTERVAL 1 DAY,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (2,NOW() + INTERVAL 3 DAY,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (4,NOW() + INTERVAL 5 DAY,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (3,NOW() - INTERVAL 1 YEAR ,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (2,NOW() - INTERVAL 1 YEAR ,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (4,NOW() - INTERVAL 1 YEAR ,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (3,NOW() - INTERVAL 2 YEAR ,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (2,NOW() - INTERVAL 2 YEAR ,'Standard','Wroclaw',1,1);
INSERT INTO keyperformanceindicator (amount, date, kpiType, plantName, kpiCategory_Id, kpiSubCategory_Id) VALUES (4,NOW() - INTERVAL 2 YEAR ,'Standard','Wroclaw',1,1);
COMMIT;


INSERT INTO target (targetAmount, kpiSubCategory_Id, Year) VALUES (2.4,1,'2017');
INSERT INTO target (targetAmount, kpiSubCategory_Id, Year) VALUES (3.2,1,'2016');
INSERT INTO target (targetAmount, kpiSubCategory_Id, Year) VALUES (3.6,1,'2015');
INSERT INTO target (targetAmount, kpiSubCategory_Id, Year) VALUES (4.0,1,'2014');
INSERT INTO target (targetAmount, kpiSubCategory_Id, Year) VALUES (4.3,1,'2013');
COMMIT;
