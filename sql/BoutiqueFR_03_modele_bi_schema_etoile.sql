/* ==========================================================
   Projet : BoutiqueFR Analytics
   Fichier : 03_modele_bi_schema_etoile.sql
   Objectif : Créer un modèle BI simple pour Power BI
              à partir des vues du schéma analytics.
   ========================================================== */

------------------------------------------------------------
-- 1. Création du schéma bi
------------------------------------------------------------

CREATE SCHEMA bi;
GO

------------------------------------------------------------
-- 2. Dimension Client
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Dim_Client AS
SELECT
    id_client,
    prenom,
    nom,
    email,
    telephone,
    date_creation,
    actif
FROM client.clients;
GO

------------------------------------------------------------
-- 3. Dimension Produit
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Dim_Produit AS
SELECT
    id_produit,
    nom_produit,
    marque,
    reference_sku,
    prix_ht,
    tva,
    actif,
    date_ajout,
    id_categorie,
    nom_categorie
FROM analytics.vue_produits_categories;
GO

------------------------------------------------------------
-- 4. Dimension Transporteur
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Dim_Transporteur AS
SELECT
    id_transporteur,
    nom_transporteur
FROM reference.transporteurs;
GO

------------------------------------------------------------
-- 5. Dimension Coupon
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Dim_Coupon AS
SELECT
    id_coupon,
    code,
    description,
    type_remise,
    valeur,
    date_debut,
    date_fin,
    actif
FROM vente.coupons;
GO

------------------------------------------------------------
-- 6. Dimension Date
-- Objectif : créer une dimension date simple à partir
--            des dates de commande
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Dim_Date AS
SELECT DISTINCT
    CAST(date_commande AS DATE) AS date_commande,
    YEAR(date_commande) AS annee,
    MONTH(date_commande) AS mois,
    DATENAME(MONTH, date_commande) AS nom_mois,
    DATEPART(QUARTER, date_commande) AS trimestre
FROM vente.commandes
WHERE date_commande IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Faits de ventes
-- Grain : une ligne de commande
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Fact_Ventes AS
SELECT
    id_commande,
    id_client,
    id_coupon,
    id_ligne,
    id_produit,
    CAST(date_commande AS DATE) AS date_commande,
    statut,
    quantite,
    prix_unitaire_ht,
    tva,
    montant_ligne_ht,
    montant_ligne_ttc
FROM analytics.vue_commandes_details;
GO

------------------------------------------------------------
-- 8. Faits de paiements
-- Grain : un paiement
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Fact_Paiements AS
SELECT
    id_paiement,
    id_commande,
    id_client,
    CAST(date_paiement AS DATE) AS date_paiement,
    montant,
    mode_paiement,
    statut_paiement
FROM analytics.vue_paiements_commandes;
GO

------------------------------------------------------------
-- 9. Faits d'expéditions
-- Grain : une expédition
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Fact_Expeditions AS
SELECT
    id_expedition,
    id_commande,
    id_client,
    id_transporteur,
    CAST(date_expedition AS DATE) AS date_expedition,
    CAST(date_livraison_estimee AS DATE) AS date_livraison_estimee,
    frais_port_ttc,
    delai_estime_jours
FROM analytics.vue_expeditions_commandes;
GO

------------------------------------------------------------
-- 10. Faits de stock
-- Grain : un produit
------------------------------------------------------------

CREATE OR ALTER VIEW bi.Fact_Stock AS
SELECT
    id_produit,
    quantite,
    seuil_alerte,
    emplacement
FROM stock.stocks;
GO