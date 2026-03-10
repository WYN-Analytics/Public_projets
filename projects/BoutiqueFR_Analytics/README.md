# BoutiqueFR Analytics — SQL Server → Power BI

## 🎯 Objectif du projet

Ce projet consiste à analyser les données d’un site e-commerce fictif afin de simuler une mission réelle de Data Analyst à partir de la base SQL Server BoutiqueFR:

1. Contrôler la qualité et la cohérence des données
2. Préparer une couche analytique en SQL
3. Construire un modèle dimensionnel en étoile
4. Alimenter un dashboard Power BI orienté décisionnel

---

## Technologies utilisées

- SQL Server (T-SQL)
- Power BI
- Modélisation dimensionnelle

---

##  Organisation de la base de données

La base BoutiqueFR est organisée par schémas métier :

| Schéma | Description |
|--------|-------------|
| `client` | données clients, adresses, avis |
| `reference` | catégories et transporteurs |
| `stock` | produits et niveaux de stock |
| `vente` | commandes, lignes de commande, paiements, expéditions, coupons |

---

##  Tables utilisées

### Schéma client
- client.clients
- client.adresses
- client.avis

### Schéma reference
- reference.categories
- reference.transporteurs

### Schéma stock
- stock.produits
- stock.stocks

### Schéma vente
- vente.commandes
- vente.lignes_commande
- vente.paiements
- vente.expeditions
- vente.coupons

---

## Problématiques business traitées

- Quel est le chiffre d’affaires total ?
- Combien de commandes ont été passées ?
- Quel est le panier moyen ?
- Quels produits et catégories performent le mieux ?
- Quelle est la part des commandes utilisant un coupon ?
- Quels modes de paiement sont les plus utilisés ?
- Quels transporteurs sont les plus sollicités ?
- Quels produits présentent un risque de rupture de stock ?

---

##  Structure du projet

BoutiqueFR_Analytics/
│
├── 1_data/
│   ├── schema_diagram.png
│   └── data_dictionary.md
│
├── 2_sql/
│   ├── 01_quality_checks.sql
│   ├── 02_analytics_views.sql
│   ├── 03_star_schema.sql
│   └── 04_kpi_queries.sql
│
├── 3_powerbi/
│   ├── dax_measures.md
│   └── dashboard_structure.md
│
├── 4_docs/
│   ├── Questions_business.md
│   ├── Methodologie.md
│   └── Insights_recommendations.md
│
└── README.md

---

## Auteur 

**Wilfried YA. WYN-Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 