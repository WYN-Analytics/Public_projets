# Portfolio WYN Analytics  

Bienvenue dans mon espace professionnel dédié aux visualisations, analyses et projets Data.  
Ce dépôt regroupe l’ensemble de mon travail en **SQL**, **Python**, **Power BI**, **visualisation**, et **analyse de données**.

---

## 1. Analyses & Modélisation en SQL  

Conception et exploitation de bases de données relationnelles pour l’analyse métier.

Compétences mises en œuvre :  
- Modélisation relationnelle (schémas en étoile / Snowflake)  
- Création de bases SQL Server et PostgreSQL  
- Jointures complexes (INNER, LEFT, RIGHT)  
- Agrégations & Group By  
- Fonctions analytiques
- Sous-requêtes & CTE  
- Optimisation de requêtes  
- Création de vues & procédures stockées  

**Dossier :** [`sql/`](sql/)

---

##  2. Analyses exploratoires, Data cleaning, Visualisations en Python  
Analyses exploratoires (EDA), data cleaning et visualisations réalisées avec :  
- `pandas`  
- `matplotlib`  
- `seaborn`  
- `numpy`  

 **Dossier :** [`python/`](python/)

---

##  3. Dashboards Power BI  
Création de dashboards interactifs orientés métiers :  
- KPIs  
- storytelling data  
- insights business  
- analyses sectorielles  

 **Dossier :** [`powerbi/`](powerbi/)

---

##  4. Projets Data complets  
Projets incluant :  
- nettoyage et préparation de données  
- analyses statistiques  
- EDA approfondies  
- visualisations avancées  
- interprétations & insights  
- dashboards interactifs (Power BI)  

 **Dossier :** [`projects/`](projects/)

---


## Analyse des radars automatiques en France (SQL Server → Power BI)

Projet d’analyse décisionnelle basé sur les données open data des radars fixes en France (data.gouv), enrichies avec des données géographiques des communes.
L’objectif est de simuler une mission de Data Analyst dans un contexte de **pilotage de la sécurité routière et de la couverture territoriale des dispositifs de contrôle**.

Le projet couvre l’ensemble de la chaîne analytique :

- Import et structuration des données brutes (radars + communes)  
- Nettoyage et normalisation des données (types, dates, coordonnées)  
- Enrichissement des données en associant chaque radar à une commune à partir de ses coordonnées GPS (coordonnées GPS -> commune la plus proche)  
- Création d’une table analytique consolidée  
- Construction de requêtes analytiques métier (répartition, tendances, indicateurs)  
- Création de vues SQL dédiées à Power BI  
- Modélisation BI et conception d’un dashboard décisionnel  

#### Analyses réalisées

- Analyse de la répartition des radars par région, département et commune  
- Analyse des types de radars (vitesse, feu rouge, vitesse moyenne, etc.)  
- Analyse des vitesses maximales autorisées (VMA) contrôlées  
- Analyse temporelle des mises en service des radars  
- Identification des zones les plus équipées  
- Calcul d’indicateurs de densité (ex : radars par zone géographique)  
- Exploration de la couverture territoriale des dispositifs de contrôle  

#### Technologies utilisées

- SQL Server (T-SQL)  
- Power BI  
- Excel

#### Limites du projet

- Le fichier source des radars ne contient pas directement la commune  
- L’enrichissement repose sur une **approximation géographique (commune la plus proche)**  
- Certaines valeurs sont manquantes ou non exploitables (ex : VMA)  
- Les correspondances géographiques ne sont pas garanties à 100 %

#### Compétences démontrées

- Manipulation de données open data  
- Nettoyage de données réelles imparfaites  
- Enrichissement des données via une logique de rapprochement géographique  
- Construction d’un flux de transformation des données (import, nettoyage, enrichissement, analyse)
- Transformation de données brutes en outil décisionnel  


**Projet :** [`projects/Analyse_des_radars_en_France/`](projects/Analyse_des_radars_en_France/)

## BoutiqueFR Analytics, Analyse e-commerce de bout en bout (SQL Server ---> Power BI)

Projet d’analyse décisionnelle construit à partir d’une base e-commerce fictive BoutiqueFR, dans le but de simuler une mission réelle de Data Analyst en entreprise.

Le projet couvre l’ensemble de la chaîne analytique :

- Contrôle qualité des données en SQL
- Vérification de cohérence métier
- Création de vues analytiques
- Modélisation BI basée sur un **Star Schema étendu**, avec une table de faits principale (ventes) et plusieurs tables de faits complémentaires (paiements, expéditions, stock).
- Construction d’un modèle BI prêt pour Power BI
- Création de KPIs business
- Conception d’un dashboard décisionnel

#### Analyses réalisées :
- Analyse du chiffre d’affaires et de l’activité commerciale
- Analyse des produits et catégories les plus performants
- Analyse de l’utilisation des coupons promotionnels
- Analyse des paiements et des statuts de transaction
- Analyse logistique (transporteurs, frais de port, délais estimés)
- Détection des produits en risque de rupture de stock

#### Technologies utilisées :
- SQL Server (T-SQL)
- Power BI
- Modélisation BI (Star Schema)

**Projet** : [`projects/BoutiqueFR_Analytics/`](projects/BoutiqueFR_Analytics/)

##  OpenMedic (2019–2024), Analyse de la consommation d’antibiotiques  
Analyse complète de la consommation d’antibiotiques en France à partir des données OpenMedic.  
Inclut : nettoyage, EDA, visualisations avancées, tendances annuelles et insights métiers.

**Projet :** [`projects/openmedic/`](projects/openmedic/)  

##  Call Center Performance Analysis  
Analyse décisionnelle de la performance d’un centre d’appels externalisé (2018–2021).  

Inclut :  
- Nettoyage et transformation des données (Power Query)  
- Modélisation relationnelle (schéma en étoile)  
- Création de KPIs et mesures DAX  
- Analyse du SLA (Service Level Agreement)  
- Analyse des revenus par appel  
- Évaluation de la performance des managers et équipes  
- Dashboard exécutif orienté pilotage stratégique 

**Projet :** [`projects/Call_Center_Performance_Analysis/`](projects/Call_Center_Performance_Analysis/)  

---

## Auteur  
**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 
