/* ==========================================================
   Projet : BoutiqueFR Analytics
   Fichier : 01_controle_qualite_donnees.sql
   Objectif : Réaliser les contrôles de qualité et de cohérence
              sur la base e-commerce BoutiqueFR.
   ========================================================== */

------------------------------------------------------------
-- 1. Compter le nombre de lignes par table principale
-- Objectif : obtenir une vue rapide des volumes de données
------------------------------------------------------------

SELECT 'client.clients' AS Nom_table, COUNT(*) AS nombre_lignes
FROM client.clients

UNION ALL

SELECT 'client.adresses' AS Nom_table, COUNT(*) AS nombre_lignes
FROM client.adresses

UNION ALL

SELECT 'client.avis' AS Nom_table, COUNT(*) AS nombre_lignes
FROM client.avis

UNION ALL

SELECT 'reference.categories' AS Nom_table, COUNT(*) AS nombre_lignes
FROM reference.categories

UNION ALL

SELECT 'reference.transporteurs' AS Nom_table, COUNT(*) AS nombre_lignes
FROM reference.transporteurs

UNION ALL

SELECT 'stock.produits' AS Nom_table, COUNT(*) AS nombre_lignes
FROM stock.produits

UNION ALL

SELECT 'stock.stocks' AS Nom_table, COUNT(*) AS nombre_lignes
FROM stock.stocks

UNION ALL

SELECT 'vente.commandes' AS Nom_table, COUNT(*) AS nombre_lignes
FROM vente.commandes

UNION ALL

SELECT 'vente.lignes_commande' AS Nom_table, COUNT(*) AS nombre_lignes
FROM vente.lignes_commande

UNION ALL

SELECT 'vente.paiements' AS Nom_table, COUNT(*) AS nombre_lignes
FROM vente.paiements

UNION ALL

SELECT 'vente.expeditions' AS Nom_table, COUNT(*) AS nombre_lignes
FROM vente.expeditions

UNION ALL

SELECT 'vente.coupons' AS Nom_table, COUNT(*) AS nombre_lignes
FROM vente.coupons;



------------------------------------------------------------
-- 2. Vérifier les doublons potentiels sur les identifiants
-- Objectif : détecter si certaines clés censées être uniques
--            apparaissent plusieurs fois
------------------------------------------------------------

SELECT id_client, COUNT(*) AS nb_occurrences
FROM client.clients
GROUP BY id_client
HAVING COUNT(*) > 1;

SELECT id_commande, COUNT(*) AS nb_occurrences
FROM vente.commandes
GROUP BY id_commande
HAVING COUNT(*) > 1;

SELECT id_produit, COUNT(*) AS nb_occurrences
FROM stock.produits
GROUP BY id_produit
HAVING COUNT(*) > 1;



------------------------------------------------------------
-- 3. Vérifier les valeurs nulles critiques
-- Objectif : identifier les champs indispensables manquants
------------------------------------------------------------

SELECT COUNT(*) AS nb_commandes_sans_date
FROM vente.commandes
WHERE date_commande IS NULL;

SELECT COUNT(*) AS nb_commandes_sans_total_ttc
FROM vente.commandes
WHERE total_ttc IS NULL;

SELECT COUNT(*) AS nb_clients_sans_email
FROM client.clients
WHERE email IS NULL
   OR LTRIM(RTRIM(email)) = '';



------------------------------------------------------------
-- 4. Vérifier les valeurs négatives ou impossibles
-- Objectif : repérer des montants ou quantités incohérents
------------------------------------------------------------

SELECT *
FROM vente.commandes
WHERE total_ht < 0
   OR total_tva < 0
   OR total_ttc < 0;

SELECT *
FROM vente.lignes_commande
WHERE quantite <= 0
   OR prix_unitaire_ht < 0
   OR tva < 0;

SELECT *
FROM stock.stocks
WHERE quantite < 0
   OR seuil_alerte < 0;



------------------------------------------------------------
-- 5. Vérifier la cohérence du calcul TTC
-- Objectif : s'assurer que total_ttc = total_ht + total_tva
-- Remarque : une tolérance de 0.05 est utilisée pour éviter
--            les faux positifs liés aux arrondis
------------------------------------------------------------

SELECT
    id_commande,
    total_ht,
    total_tva,
    total_ttc,
    (total_ht + total_tva) AS total_recalcule,
    total_ttc - (total_ht + total_tva) AS ecart
FROM vente.commandes
WHERE ABS(total_ttc - (total_ht + total_tva)) > 0.05
ORDER BY ABS(total_ttc - (total_ht + total_tva)) DESC;



------------------------------------------------------------
-- 6. Vérifier les clés orphelines
-- Objectif : détecter les enregistrements sans correspondance
------------------------------------------------------------

-- 6.1 Commandes sans client

SELECT c.*
FROM vente.commandes AS c
LEFT JOIN client.clients AS cl
    ON cl.id_client = c.id_client
WHERE cl.id_client IS NULL;

-- 6.2 Lignes de commande sans commande

SELECT lc.*
FROM vente.lignes_commande AS lc
LEFT JOIN vente.commandes AS c
    ON c.id_commande = lc.id_commande
WHERE c.id_commande IS NULL;

-- 6.3 Lignes de commande sans produit

SELECT lc.*
FROM vente.lignes_commande AS lc
LEFT JOIN stock.produits AS p
    ON p.id_produit = lc.id_produit
WHERE p.id_produit IS NULL;

-- 6.4 Produits sans catégorie valide

SELECT p.*
FROM stock.produits AS p
LEFT JOIN reference.categories AS cat
    ON cat.id_categorie = p.id_categorie
WHERE cat.id_categorie IS NULL;

-- 6.5 Expéditions sans commande

SELECT e.*
FROM vente.expeditions AS e
LEFT JOIN vente.commandes AS c
    ON c.id_commande = e.id_commande
WHERE c.id_commande IS NULL;

-- 6.6 Expéditions sans transporteur

SELECT e.*
FROM vente.expeditions AS e
LEFT JOIN reference.transporteurs AS t
    ON t.id_transporteur = e.id_transporteur
WHERE t.id_transporteur IS NULL;

-- 6.7 Paiements sans commande

SELECT p.*
FROM vente.paiements AS p
LEFT JOIN vente.commandes AS c
    ON c.id_commande = p.id_commande
WHERE c.id_commande IS NULL;

-- 6.8 Commandes avec coupon invalide

SELECT c.*
FROM vente.commandes AS c
LEFT JOIN vente.coupons AS co
    ON co.id_coupon = c.id_coupon
WHERE c.id_coupon IS NOT NULL
  AND co.id_coupon IS NULL;



------------------------------------------------------------
-- 7. Vérifier la cohérence entre commandes et paiements
-- Objectif : comparer le total TTC d'une commande avec la
--            somme des paiements associés
------------------------------------------------------------

SELECT
    c.id_commande,
    c.total_ttc,
    COALESCE(SUM(p.montant), 0) AS total_paye,
    c.total_ttc - COALESCE(SUM(p.montant), 0) AS ecart,
    c.statut AS statut_commande
FROM vente.commandes AS c
LEFT JOIN vente.paiements AS p
    ON c.id_commande = p.id_commande
GROUP BY
    c.id_commande,
    c.total_ttc,
    c.statut
HAVING c.total_ttc <> COALESCE(SUM(p.montant), 0)
ORDER BY c.id_commande;