/* =========================================================
   04_enrichissement_geographique.sql
   Association des radars à la commune la plus proche
   ========================================================= */

/* Réinitialisation */
TRUNCATE TABLE dbo.radar_enrichi;
GO

/* Pour chaque radar, on récupère la commune la plus proche.
   La distance utilisée est une distance euclidienne simplifiée
   sur latitude/longitude. C'est une approximation.
*/
INSERT INTO dbo.radar_enrichi (
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
)
SELECT
    r.id_radar,
    r.type_radar,
    r.libelle_type_radar,
    r.date_mise_en_service,
    r.annee_mise_en_service,
    r.vma,
    r.latitude,
    r.longitude,
    c_proche.code_insee,
    c_proche.nom_commune,
    c_proche.code_departement,
    c_proche.nom_departement,
    c_proche.code_region,
    c_proche.nom_region,
    c_proche.population,
    c_proche.superficie_km2,
    c_proche.distance_carre_approx
FROM dbo.radar r
CROSS APPLY (
    SELECT TOP 1
        c.code_insee,
        c.nom_commune,
        c.code_departement,
        c.nom_departement,
        c.code_region,
        c.nom_region,
        c.population,
        c.superficie_km2,
        CAST(
            POWER(r.latitude - c.latitude_centre, 2) +
            POWER(r.longitude - c.longitude_centre, 2)
            AS DECIMAL(18,10)
        ) AS distance_carre_approx
    FROM dbo.commune c
    ORDER BY
        POWER(r.latitude - c.latitude_centre, 2) +
        POWER(r.longitude - c.longitude_centre, 2)
) c_proche;
GO

/* Contrôle rapide */
SELECT TOP 20 *
FROM dbo.radar_enrichi
ORDER BY id_radar;
GO
