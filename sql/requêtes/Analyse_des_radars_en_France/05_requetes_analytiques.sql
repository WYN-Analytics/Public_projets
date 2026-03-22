/* =========================================================
   05_requetes_analytiques.sql
   Requêtes analytiques
   ========================================================= */

/* 1. Nombre total de radars */
SELECT COUNT(*) AS nombre_total_radars
FROM dbo.radar_enrichi;
GO

/* 2. Types de radars observés */
SELECT DISTINCT
    type_radar,
    libelle_type_radar
FROM dbo.radar_enrichi
ORDER BY type_radar;
GO

/* 3. Nombre de radars par type */
SELECT
    type_radar,
    libelle_type_radar,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY type_radar, libelle_type_radar
ORDER BY nombre_radars DESC;
GO

/* 4. Répartition des VMA */
SELECT
    vma,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY vma
ORDER BY vma;
GO

/* 5. Part des radars sans VMA renseignée */
SELECT
    CAST(100.0 * SUM(CASE WHEN vma IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(10,2)) AS pourcentage_vma_manquante
FROM dbo.radar_enrichi;
GO

/* 6. Nombre de radars par région */
SELECT
    nom_region,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY nom_region
ORDER BY nombre_radars DESC;
GO

/* 7. Top 10 des départements avec le plus de radars */
SELECT TOP 10
    nom_departement,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY nom_departement
ORDER BY nombre_radars DESC, nom_departement;
GO

/* 8. Top 20 des communes avec le plus de radars */
SELECT TOP 20
    nom_commune,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY nom_commune
ORDER BY nombre_radars DESC, nom_commune;
GO

/* 9. Mises en service par année */
SELECT
    annee_mise_en_service,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
WHERE annee_mise_en_service IS NOT NULL
GROUP BY annee_mise_en_service
ORDER BY annee_mise_en_service;
GO

/* 10. Vitesse moyenne surveillée */
SELECT CAST(AVG(CAST(vma AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS vitesse_moyenne
FROM dbo.radar_enrichi
WHERE vma IS NOT NULL;
GO

/* 11. Nombre de radars de feu rouge */
SELECT COUNT(*) AS nombre_radars_feu_rouge
FROM dbo.radar_enrichi
WHERE type_radar = 'ETFR';
GO

/* 12. Nombre de radars de vitesse moyenne */
SELECT COUNT(*) AS nombre_radars_vitesse_moyenne
FROM dbo.radar_enrichi
WHERE type_radar = 'ETVM';
GO

/* 13. Analyse d'une région précise */
SELECT *
FROM dbo.radar_enrichi
WHERE nom_region = 'Île-de-France';
GO

/* 14. Radars avec VMA élevée */
SELECT *
FROM dbo.radar_enrichi
WHERE vma >= 110
ORDER BY vma DESC, id_radar;
GO

/* 15. Nombre moyen de radars par département */
SELECT CAST(AVG(nombre_radars * 1.0) AS DECIMAL(10,2)) AS moyenne_radars_par_departement
FROM (
    SELECT
        nom_departement,
        COUNT(*) AS nombre_radars
    FROM dbo.radar_enrichi
    GROUP BY nom_departement
) AS x;
GO

/* 16. Densité simple : nombre de radars par commune enrichie dans chaque département
   Cet indicateur n'est pas une densité géographique officielle.
*/
SELECT TOP 20
    nom_departement,
    COUNT(*) AS nombre_radars,
    COUNT(DISTINCT nom_commune) AS nombre_communes_concernees,
    CAST(COUNT(*) * 1.0 / NULLIF(COUNT(DISTINCT nom_commune), 0) AS DECIMAL(10,2)) AS radars_par_commune_concernee
FROM dbo.radar_enrichi
GROUP BY nom_departement
ORDER BY radars_par_commune_concernee DESC, nombre_radars DESC;
GO

/* 17. Répartition des types par région */
SELECT
    nom_region,
    type_radar,
    COUNT(*) AS nombre_radars
FROM dbo.radar_enrichi
GROUP BY nom_region, type_radar
ORDER BY nom_region, nombre_radars DESC;
GO
