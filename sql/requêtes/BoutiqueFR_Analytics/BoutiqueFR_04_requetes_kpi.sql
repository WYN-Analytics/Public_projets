/* ==========================================================
   Projet : BoutiqueFR Analytics
   Fichier : 04_requetes_kpi.sql
   Objectif : Fournir des requêtes KPI de validation côté SQL
              avant la construction du dashboard Power BI.
   ========================================================== */

------------------------------------------------------------
-- KPI 1. Chiffre d'affaires total HT et TTC
------------------------------------------------------------

SELECT
    SUM(total_ht) AS ca_total_ht,
    SUM(total_ttc) AS ca_total_ttc
FROM vente.commandes;



------------------------------------------------------------
-- KPI 2. Nombre total de commandes et clients actifs
------------------------------------------------------------

SELECT
    COUNT(DISTINCT id_commande) AS nb_commandes,
    COUNT(DISTINCT id_client) AS nb_clients_actifs
FROM vente.commandes;



------------------------------------------------------------
-- KPI 3. Panier moyen TTC
------------------------------------------------------------

SELECT
    AVG(total_ttc) AS panier_moyen_ttc
FROM vente.commandes;



------------------------------------------------------------
-- KPI 4. Part des commandes avec coupon
------------------------------------------------------------

SELECT
    COUNT(*) AS nb_commandes_total,
    COUNT(id_coupon) AS nb_commandes_avec_coupon,
    CAST(COUNT(id_coupon) * 100.0 / COUNT(*) AS DECIMAL(10,2)) AS pct_commandes_avec_coupon
FROM vente.commandes;



------------------------------------------------------------
-- KPI 5. Top 10 produits par chiffre d'affaires TTC
------------------------------------------------------------

SELECT TOP 10
    p.nom_produit,
    SUM(f.montant_ligne_ttc) AS ca_ttc
FROM bi.Fact_Ventes AS f
INNER JOIN bi.Dim_Produit AS p
    ON p.id_produit = f.id_produit
GROUP BY p.nom_produit
ORDER BY ca_ttc DESC;



------------------------------------------------------------
-- KPI 6. Top catégories par chiffre d'affaires TTC
------------------------------------------------------------

SELECT
    p.nom_categorie,
    SUM(f.montant_ligne_ttc) AS ca_ttc
FROM bi.Fact_Ventes AS f
INNER JOIN bi.Dim_Produit AS p
    ON p.id_produit = f.id_produit
GROUP BY p.nom_categorie
ORDER BY ca_ttc DESC;



------------------------------------------------------------
-- KPI 7. Répartition des commandes par statut
------------------------------------------------------------

SELECT
    statut,
    COUNT(*) AS nb_commandes
FROM vente.commandes
GROUP BY statut
ORDER BY nb_commandes DESC;



------------------------------------------------------------
-- KPI 8. Répartition des paiements par statut
------------------------------------------------------------

SELECT
    statut,
    COUNT(*) AS nb_paiements
FROM vente.paiements
GROUP BY statut
ORDER BY nb_paiements DESC;



------------------------------------------------------------
-- KPI 9. Répartition des paiements par mode de paiement
------------------------------------------------------------

SELECT
    mode_paiement,
    COUNT(*) AS nb_paiements,
    SUM(montant) AS montant_total
FROM vente.paiements
GROUP BY mode_paiement
ORDER BY montant_total DESC;



------------------------------------------------------------
-- KPI 10. Performance logistique par transporteur
------------------------------------------------------------

SELECT
    t.nom_transporteur,
    COUNT(*) AS nb_expeditions,
    AVG(e.frais_port_ttc) AS frais_port_moyen,
    AVG(CAST(e.delai_estime_jours AS FLOAT)) AS delai_moyen_jours
FROM bi.Fact_Expeditions AS e
INNER JOIN bi.Dim_Transporteur AS t
    ON t.id_transporteur = e.id_transporteur
GROUP BY t.nom_transporteur
ORDER BY nb_expeditions DESC;



------------------------------------------------------------
-- KPI 11. Niveaux de stock par produit
------------------------------------------------------------

SELECT
    p.nom_produit,
    s.quantite,
    s.seuil_alerte,
    s.emplacement
FROM bi.Fact_Stock AS s
INNER JOIN bi.Dim_Produit AS p
    ON p.id_produit = s.id_produit
ORDER BY s.quantite ASC;