/* =========================================================
   06_vues_powerbi.sql
   Vues SQL pour Power BI
   ========================================================= */

/* Vue détaillée principale */
CREATE OR ALTER VIEW dbo.vue_radar_detaillee AS
SELECT
    id_radar,
    type_radar,
    libelle_type_radar,
    date_mise_en_service,
    annee_mise_en_service,
    vma,
    latitude,
    longitude,
    code_insee,
    nom_commune,
    code_departement,
    nom_departement,
    code_region,
    nom_region,
    population_commune,
    superficie_km2,
    distance_carre_approx
FROM dbo.radar_enrichi;
GO

/* Vue du nombre de radars par région */
CREATE OR ALTER VIEW dbo.vue_radars_par_region AS
SELECT
    nom_region,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY nom_region;
GO

/* Vue du nombre de radars par type */
CREATE OR ALTER VIEW dbo.vue_radars_par_type AS
SELECT
    type_radar,
    libelle_type_radar,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY type_radar, libelle_type_radar;
GO

/* Vue du nombre de radars par année */
CREATE OR ALTER VIEW dbo.vue_radars_par_annee AS
SELECT
    annee_mise_en_service,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
WHERE annee_mise_en_service IS NOT NULL
GROUP BY annee_mise_en_service;
GO

/* Vue du nombre de radars par département */
CREATE OR ALTER VIEW dbo.vue_radars_par_departement AS
SELECT
    code_departement,
    nom_departement,
    nom_region,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY code_departement, nom_departement, nom_region;
GO

/* Vue des VMA */
CREATE OR ALTER VIEW dbo.vue_radars_par_vma AS
SELECT
    vma,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY vma;
GO
