/* ==========================================================
   Projet : BoutiqueFR Analytics
   Fichier : 02_vues_analytiques.sql
   Objectif : Créer quelques vues analytiques simples
              pour faciliter les analyses SQL et Power BI.
   ========================================================== */

------------------------------------------------------------
-- 1. Création du schéma analytics
------------------------------------------------------------

CREATE SCHEMA analytics;
GO

------------------------------------------------------------
-- 2. Vue des produits avec leur catégorie
-- Objectif : éviter de refaire la jointure entre produits
--            et catégories
------------------------------------------------------------

CREATE OR ALTER VIEW analytics.vue_produits_categories AS
SELECT
    p.id_produit,
    p.nom_produit,
    p.marque,
    p.reference_sku,
    p.prix_ht,
    p.tva,
    p.actif,
    p.date_ajout,
    p.id_categorie,
    c.nom_categorie
FROM stock.produits AS p
LEFT JOIN reference.categories AS c
    ON p.id_categorie = c.id_categorie;
GO

------------------------------------------------------------
-- 3. Vue des commandes détaillées
-- Objectif : regrouper les commandes et les lignes de commande
------------------------------------------------------------

CREATE OR ALTER VIEW analytics.vue_commandes_details AS
SELECT
    c.id_commande,
    c.id_client,
    c.date_commande,
    c.statut,
    c.total_ht,
    c.total_tva,
    c.total_ttc,
    c.id_coupon,
    lc.id_ligne,
    lc.id_produit,
    lc.quantite,
    lc.prix_unitaire_ht,
    lc.tva,

    -- Calcul du montant HT de la ligne
    CAST(lc.quantite * lc.prix_unitaire_ht AS DECIMAL(18,2)) AS montant_ligne_ht,

    -- Calcul du montant TTC de la ligne
    CAST(lc.quantite * lc.prix_unitaire_ht * (1 + lc.tva / 100.0) AS DECIMAL(18,2)) AS montant_ligne_ttc
FROM vente.commandes AS c
INNER JOIN vente.lignes_commande AS lc
    ON c.id_commande = lc.id_commande;
GO

------------------------------------------------------------
-- 4. Vue des paiements avec les commandes
-- Objectif : analyser les paiements en lien avec les commandes
------------------------------------------------------------

CREATE OR ALTER VIEW analytics.vue_paiements_commandes AS
SELECT
    p.id_paiement,
    p.id_commande,
    c.id_client,
    c.date_commande,
    c.statut AS statut_commande,
    p.montant,
    p.mode_paiement,
    p.date_paiement,
    p.statut AS statut_paiement,
    p.reference
FROM vente.paiements AS p
LEFT JOIN vente.commandes AS c
    ON p.id_commande = c.id_commande;
GO

------------------------------------------------------------
-- 5. Vue des expéditions avec les commandes
-- Objectif : analyser la logistique à partir des expéditions
------------------------------------------------------------

CREATE OR ALTER VIEW analytics.vue_expeditions_commandes AS
SELECT
    e.id_expedition,
    e.id_commande,
    c.id_client,
    c.date_commande,
    e.id_transporteur,
    e.numero_suivi,
    e.date_expedition,
    e.date_livraison_estimee,
    e.frais_port_ttc,

    -- Délai estimé entre l'expédition et la livraison prévue
    DATEDIFF(DAY, e.date_expedition, e.date_livraison_estimee) AS delai_estime_jours
FROM vente.expeditions AS e
LEFT JOIN vente.commandes AS c
    ON e.id_commande = c.id_commande;
GO