CREATE DATABASE IF NOT EXISTS mydb; #create database
USE mydb;
#create table
CREATE TABLE IF NOT EXISTS Traffic (
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Date DATE NOT NULL,
	Source VARCHAR(20) NOT NULL,
	SourceType VARCHAR(20) NOT NULL,
	Count INT DEFAULT 0
);
SHOW WARNINGS;
INSERT Traffic(Date, Source, SourceType, Count) 
VALUES
('2023-07-06', 'yandex', 'cpc', 10),
('2023-07-06', 'yandex', 'organic', 1),
('2023-07-06', 'google', 'cpc', 2),
('2023-07-05', 'yandex', 'cpc', 9),
('2023-07-05', 'google', 'cpc', 2),
('2023-07-05', 'yandex', 'organic', 2),
('2023-07-04', 'google', 'cpc', 4),
('2023-07-04', 'yandex', 'cpc', 8),
('2023-07-04', 'yandex', 'organic', 3),
('2023-07-03', 'google', 'cpc', 6),
('2023-07-03', 'yandex', 'cpc', 7),
('2023-07-03', 'yandex', 'organic', 4),
('2023-07-02', 'yandex', 'cpc', 6),
('2023-07-02', 'yandex', 'organic', 5),
('2023-07-01', 'yandex', 'cpc', 5),
('2023-07-01', 'yandex', 'organic', 6),
('2023-06-30', 'yandex', 'cpc', 4),
('2023-06-30', 'yandex', 'organic', 7),
('2023-06-29', 'yandex', 'cpc', 3),
('2023-06-29', 'yandex', 'organic', 8),
('2023-06-28', 'yandex', 'cpc', 2),
('2023-06-28', 'yandex', 'organic', 9),
('2023-06-27', 'yandex', 'cpc', 1),
('2023-06-27', 'yandex', 'organic', 10);

SELECT * FROM Traffic;

SELECT Source, SUM(Count) AS SUM
FROM Traffic
WHERE Source = 'yandex' AND MONTH(Date) = 7 AND SourceType = 'cpc'
UNION
SELECT Source, SUM(Count)
FROM Traffic WHERE Source = 'google' AND MONTH(Date) = 7 AND SourceType = 'cpc';
