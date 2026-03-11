# BoutiqueFR Analytics — Analyse e-commerce (SQL Server → Power BI)

## 🎯 Objectif

Ce projet consiste à analyser les données d’un site e-commerce fictif afin de simuler une mission réelle de Data Analyst.

À partir de la base SQL Server BoutiqueFR, le projet couvre :

1. le contrôle qualité des données,
2. la création de vues analytiques,
3. la modélisation BI en schéma étoile,
4. la préparation d’un dashboard Power BI.

---

##  Technologies utilisées

- SQL Server (T-SQL)
- Power BI
- Modélisation dimensionnelle
- Analyse de données

---

##  Organisation de la base

La base BoutiqueFR est organisée par schémas métier :

| Schéma | Description |
|--------|-------------|
| `client` | clients, adresses, avis |
| `reference` | catégories, transporteurs |
| `stock` | produits, stocks |
| `vente` | commandes, lignes de commande, paiements, expéditions, coupons |

---

##  Questions métier analysées

- Quel est le chiffre d’affaires total ?
- Combien de commandes ont été passées ?
- Quel est le panier moyen ?
- Quels produits se vendent le mieux ?
- Quels transporteurs sont les plus utilisés ?
- Quels produits présentent un risque de rupture de stock ?
- Quelle est la répartition des paiements par statut et par mode ?
- Quelle est la part des commandes avec coupon ?


##  Structure du projet

BoutiqueFR_Analytics/
│
├── 1_donnees/
│   ├── base_de_donnees_BoutiqueFR_full.sql
│   └── dictionnaire_des_donnees.md
│
├── 2_sql/
│   ├── 01_controle_qualite_donnees.sql
│   ├── 02_vues_analytiques.sql
│   ├── 03_modele_bi_schema_etoile.sql
│   └── 04_requetes_kpi.sql
│
├── 3_powerbi/
│   ├── mesures_dax.md
│   └── structure_dashboard.md
│
├── 4_documentation/
│   ├── questions_business.md
│   ├── methodologie_analyse.md
│   └── insights_et_recommandations.md
│
└── README.md

##  Travaux réalisés

### 1. Contrôle qualité des données
Des requêtes SQL ont été construites pour :
- compter les volumes par table,
- détecter les clés orphelines,
- identifier les incohérences financières,
- repérer les valeurs négatives ou nulles critiques.

### 2. Création d’une couche analytique
Des vues SQL ont été créées pour :
- enrichir les produits avec leurs catégories,
- enrichir les lignes de vente avec les informations de commande,
- préparer des jeux de données propres pour la BI.

### 3. Modélisation BI
Un schéma `bi` a été créé avec :
- des dimensions (`Dim_Client`, `Dim_Produit`, `Dim_Date`, `Dim_Transporteur`, `Dim_Coupon`),
- des tables de faits (`Fact_Ventes`, `Fact_Expeditions`, `Fact_Paiements`, `Fact_Stock`).

### 4. Dashboard Power BI
Le dashboard a été conçu pour permettre de suivre :
- le chiffre d’affaires,
- les commandes,
- les produits et catégories,
- les paiements,
- la logistique,
- les alertes stock.

---

## Pages du dashboard Power BI

### Page 1 — Sales Overview
- CA TTC
- Nombre de commandes
- Panier moyen
- Nombre de clients
- Évolution mensuelle du CA
- CA par catégorie
- Top produits

### Page 2 — Produits & Clients
- Produits les plus vendus
- Répartition par marque
- Top clients
- Utilisation des coupons

### Page 3 — Logistique & Paiements
- Répartition des paiements par statut
- Répartition par mode de paiement
- Performance des transporteurs
- Frais de port moyens
- Produits en alerte stock

---

## Auteur 

**Wilfried YA. WYN-Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 