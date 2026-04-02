# BoutiqueFR Analytics : Analyse e-commerce (SQL Server ---> Power BI)

##  Objectif

Ce projet consiste à analyser les données d’un site e-commerce fictif afin de simuler une mission réelle de Data Analyst.

À partir de la base SQL Server BoutiqueFR, le projet couvre :

1. le contrôle qualité des données,
2. la création de vues analytiques,
3. la modélisation BI en schéma étoile,
4. la préparation d’un dashboard Power BI.

---

##  Technologies utilisées

- SQL Server 
- Power BI
- Excel 
- Power Query 

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
```bash
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
│   ├── BoutiqueFR.pbix
│   └── README.md
│
├── 4_documentation/
│   ├── questions_business.md
│   ├── methodologie_analyse.md
│   └── insights_et_recommandations.md
├── 5_images/
│   ├── 01-Vue_onglets.png
│   ├── 02-Vue_d_ensemble_commerciale.png
│   ├── 03-Produits_et_Clients.png
│   └── 04-Logistique_et_Paiements.png
└── README.md

## Travaux réalisés

### 1. Contrôle qualité des données
Des requêtes SQL ont été construites pour :
- compter les volumes par table,
- détecter les doublons potentiels,
- identifier les clés orphelines,
- repérer les incohérences financières,
- contrôler les valeurs nulles critiques et les valeurs impossibles.

### 2. Création d’une couche analytique
Des vues SQL ont été créées dans le schéma `analytics` afin de :
- simplifier les jointures,
- enrichir les données métier,
- préparer proprement les tables destinées à la BI.

### 3. Modélisation BI
Un schéma `bi` a été créé avec :
- des dimensions (`Dim_Client`, `Dim_Produit`, `Dim_Date`, etc.),
- des tables de faits (`Fact_Ventes`, `Fact_Expeditions`, `Fact_Paiements`, `Fact_Stock`).

### 4. Dashboard Power BI
Le dashboard final permet de suivre :
- le chiffre d’affaires,
- les commandes,
- les produits et catégories,
- les paiements,
- la logistique,
- les alertes stock.

---

##  Structure du dashboard

###  Page 1 : Vue d’ensemble commerciale
- Chiffre d’affaires
- Nombre de commandes
- Nombre de clients
- Panier moyen
- Croissance du CA
- Évolution mensuelle du CA
- Répartition du CA par catégorie
- Top produits

**Insight clé :**
Analyse globale des performances avec identification des tendances de croissance ou de baisse.

---

### Page 2 : Produits & Clients
- Top produits les plus vendus
- Chiffre d’affaires par marque
- Top clients
- Panier moyen par catégorie
- Évolution du nombre de clients

**Insight clé :**
Identification des leviers de performance (produits, marques, clients à forte valeur).

---

### Page 3 : Logistique & Paiements
- Répartition des paiements (statut)
- Répartition du CA par mode de paiement
- Performance des transporteurs (délais)
- Produits en alerte de stock
- KPI logistiques (expéditions, frais de port)

**Insight clé :**
Analyse opérationnelle permettant d’identifier les risques (ruptures, paiements refusés, délais).

---

## Auteur 

**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 