/* =========================================================
   03_nettoyage_donnees.sql
   Nettoyage et conversion des données
   ========================================================= */

/* Réinitialisation */
TRUNCATE TABLE dbo.radar;
TRUNCATE TABLE dbo.commune;
GO

/* Insertion des radars dans la table propre */
INSERT INTO dbo.radar (
    id_radar,
    type_radar,
    libelle_type_radar,
    date_mise_en_service,
    annee_mise_en_service,
    vma,
    latitude,
    longitude
)
SELECT
    TRY_CONVERT(INT, LTRIM(RTRIM(numero_de_radar))) AS id_radar,
    LTRIM(RTRIM(type_de_radar)) AS type_radar,
    CASE LTRIM(RTRIM(type_de_radar))
        WHEN 'ETF' THEN 'Radar vitesse fixe classique'
        WHEN 'ETD' THEN 'Radar vitesse fixe discriminant'
        WHEN 'ETT' THEN 'Radar vitesse fixe de nouvelle génération'
        WHEN 'ETU' THEN 'Radar nouvelle génération en milieu urbain'
        WHEN 'ETVM' THEN 'Radar vitesse moyenne'
        WHEN 'ETFR' THEN 'Radar de franchissement de feu rouge'
        WHEN 'ETPN' THEN 'Radar de passage à niveau'
        ELSE 'Type non documenté'
    END AS libelle_type_radar,
    TRY_CONVERT(DATE, LEFT(LTRIM(RTRIM(date_de_mise_en_service)), 10), 103) AS date_mise_en_service,
    YEAR(TRY_CONVERT(DATE, LEFT(LTRIM(RTRIM(date_de_mise_en_service)), 10), 10)) AS annee_mise_en_service,
    TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(vma_brut)), '')) AS vma,
    TRY_CONVERT(DECIMAL(10,6), REPLACE(LTRIM(RTRIM(latitude_brut)), ',', '.')) AS latitude,
    TRY_CONVERT(DECIMAL(10,6), REPLACE(LTRIM(RTRIM(longitude_brut)), ',', '.')) AS longitude
FROM dbo.radar_brut
WHERE TRY_CONVERT(INT, LTRIM(RTRIM(numero_de_radar))) IS NOT NULL;
GO

/* Suppression des radars sans coordonnées ou sans type */
DELETE FROM dbo.radar
WHERE latitude IS NULL
   OR longitude IS NULL
   OR type_radar IS NULL
   OR LTRIM(RTRIM(type_radar)) = '';
GO

/* Insertion des communes dans la table propre */
INSERT INTO dbo.commune (
    code_insee,
    nom_commune,
    code_region,
    nom_region,
    code_departement,
    nom_departement,
    population,
    superficie_km2,
    latitude_centre,
    longitude_centre
)
SELECT
    LTRIM(RTRIM(code_insee)) AS code_insee,
    LTRIM(RTRIM(nom_standard)) AS nom_commune,
    LTRIM(RTRIM(reg_code)) AS code_region,
    LTRIM(RTRIM(reg_nom)) AS nom_region,
    LTRIM(RTRIM(dep_code)) AS code_departement,
    LTRIM(RTRIM(dep_nom)) AS nom_departement,
    TRY_CONVERT(INT, NULLIF(LTRIM(RTRIM(population)), '')) AS population,
    TRY_CONVERT(DECIMAL(12,2), REPLACE(NULLIF(LTRIM(RTRIM(superficie_km2)), ''), ',', '.')) AS superficie_km2,
    TRY_CONVERT(DECIMAL(10,6), REPLACE(NULLIF(LTRIM(RTRIM(latitude_centre)), ''), ',', '.')) AS latitude_centre,
    TRY_CONVERT(DECIMAL(10,6), REPLACE(NULLIF(LTRIM(RTRIM(longitude_centre)), ''), ',', '.')) AS longitude_centre
FROM dbo.commune_brute
WHERE NULLIF(LTRIM(RTRIM(code_insee)), '') IS NOT NULL;
GO

/* Suppression des communes sans coordonnées */
DELETE FROM dbo.commune
WHERE latitude_centre IS NULL
   OR longitude_centre IS NULL;
GO

/* Contrôles de qualité simples */
SELECT COUNT(*) AS nombre_radars_propres FROM dbo.radar;
SELECT COUNT(*) AS nombre_communes_propres FROM dbo.commune;
SELECT COUNT(*) AS nombre_vma_manquantes FROM dbo.radar WHERE vma IS NULL;
GO
