/* =========================================================
   02_import_donnees.sql
   Import des fichiers CSV
   Adapter les chemins selon ton ordinateur
   ========================================================= */

/* Important :
   - le fichier des radars est séparé par point-virgule et encodé en Latin-1 ;
   - le fichier des communes est séparé par virgule et encodé en UTF-8.
*/

/* Vidage préalable */
TRUNCATE TABLE dbo.radar_brut;
TRUNCATE TABLE dbo.commune_brute;
GO

/* Import du fichier des radars
   Le CSV source contient exactement 6 colonnes utiles.
*/
BULK INSERT dbo.radar_brut
FROM 'C:\data\jeu-de-donnees-liste-des-radars-fixes-en-france-12-2025.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = 'ACP',
    TABLOCK
);
GO

/* Pour le fichier des communes, le CSV complet contient plus de colonnes que nécessaire.
   Recommandation : créer au préalable un fichier extrait limité aux 10 colonnes utiles,
   ou passer par un outil d'import SQL Server / SSIS / Python pour sélectionner les colonnes.

   Exemple de fichier recommandé : communes-france-2025-extrait.csv
   avec les colonnes suivantes dans cet ordre :
   code_insee, nom_standard, reg_code, reg_nom, dep_code, dep_nom,
   population, superficie_km2, latitude_centre, longitude_centre
*/

BULK INSERT dbo.commune_brute
FROM 'C:\data\communes-france-2025-extrait.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO
