--1--
CREATE DATABASE s298240;
--2--
CREATE SCHEMA firma;
--3--
CREATE ROLE ksiegowosc;
GRANT SELECT ON ALL TABLES IN SCHEMA firma TO ksiegowosc;