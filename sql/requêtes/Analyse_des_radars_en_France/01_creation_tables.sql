/* =========================================================
   01_creation_tables.sql
   Création des tables du projet
   ========================================================= */

/* Nettoyage préalable si les tables existent déjà */
IF OBJECT_ID('dbo.radar_enrichi', 'U') IS NOT NULL DROP TABLE dbo.radar_enrichi;
IF OBJECT_ID('dbo.radar', 'U') IS NOT NULL DROP TABLE dbo.radar;
IF OBJECT_ID('dbo.commune', 'U') IS NOT NULL DROP TABLE dbo.commune;
IF OBJECT_ID('dbo.radar_brut', 'U') IS NOT NULL DROP TABLE dbo.radar_brut;
IF OBJECT_ID('dbo.commune_brute', 'U') IS NOT NULL DROP TABLE dbo.commune_brute;
GO

/* Table brute des radars */
CREATE TABLE dbo.radar_brut (
    numero_de_radar NVARCHAR(50),
    type_de_radar NVARCHAR(20),
    date_de_mise_en_service NVARCHAR(50),
    vma_brut NVARCHAR(20),
    latitude_brut NVARCHAR(50),
    longitude_brut NVARCHAR(50)
);
GO

/* Table brute des communes */
CREATE TABLE dbo.commune_brute (
    code_insee NVARCHAR(10),
    nom_standard NVARCHAR(255),
    reg_code NVARCHAR(10),
    reg_nom NVARCHAR(255),
    dep_code NVARCHAR(10),
    dep_nom NVARCHAR(255),
    population NVARCHAR(50),
    superficie_km2 NVARCHAR(50),
    latitude_centre NVARCHAR(50),
    longitude_centre NVARCHAR(50)
);
GO

/* Table nettoyée des radars */
CREATE TABLE dbo.radar (
    id_radar INT PRIMARY KEY,
    type_radar NVARCHAR(20),
    libelle_type_radar NVARCHAR(100),
    date_mise_en_service DATE,
    annee_mise_en_service INT,
    vma INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6)
);
GO

/* Table nettoyée des communes */
CREATE TABLE dbo.commune (
    code_insee NVARCHAR(10) PRIMARY KEY,
    nom_commune NVARCHAR(255),
    code_region NVARCHAR(10),
    nom_region NVARCHAR(255),
    code_departement NVARCHAR(10),
    nom_departement NVARCHAR(255),
    population INT,
    superficie_km2 DECIMAL(12,2),
    latitude_centre DECIMAL(10,6),
    longitude_centre DECIMAL(10,6)
);
GO

/* Table finale enrichie */
CREATE TABLE dbo.radar_enrichi (
    id_radar INT PRIMARY KEY,
    type_radar NVARCHAR(20),
    libelle_type_radar NVARCHAR(100),
    date_mise_en_service DATE,
    annee_mise_en_service INT,
    vma INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    code_insee NVARCHAR(10),
    nom_commune NVARCHAR(255),
    code_departement NVARCHAR(10),
    nom_departement NVARCHAR(255),
    code_region NVARCHAR(10),
    nom_region NVARCHAR(255),
    population_commune INT,
    superficie_km2 DECIMAL(12,2),
    distance_carre_approx DECIMAL(18,10)
);
GO
