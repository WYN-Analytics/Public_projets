# Dictionnaire des données

## Table : vente.commandes

| Colonne | Description |
|------|------|
| id_commande | identifiant unique de commande |
| id_client | client ayant passé la commande |
| date_commande | date de la commande |
| total_ht | montant HT |
| total_tva | montant TVA |
| total_ttc | montant TTC |

---

## Table : vente.lignes_commande

| Colonne | Description |
|------|------|
| id_ligne | identifiant ligne |
| id_commande | commande associée |
| id_produit | produit |
| quantite | quantité commandée |
| prix_unitaire_ht | prix HT |

---

## Table : stock.produits

| Colonne | Description |
|------|------|
| id_produit | identifiant produit |
| nom_produit | nom du produit |
| marque | marque |
| prix_ht | prix HT |
| tva | TVA |

---

## Auteur 

**Wilfried YA. WYN-Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 