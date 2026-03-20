#  Analyse des performances d’une boutique e-commerce (Power BI)

##  Objectif du projet

Ce projet a pour objectif d’analyser les performances commerciales, le comportement client et les opérations logistiques d’une boutique e-commerce à l’aide de Power BI.

L’objectif est de fournir une vision claire et actionnable des données afin d’aider à la prise de décision.

---

##  Problématiques métier

- Comment évolue le chiffre d’affaires dans le temps ?
- Quels sont les produits et catégories les plus performants ?
- Qui sont les clients les plus rentables ?
- Quel est l’impact des coupons sur les ventes ?
- Comment optimiser les paiements et la logistique ?
- Quels produits présentent un risque de rupture de stock ?

---

##  Modélisation des données

Le modèle suit une architecture en étoile avec :

### Tables de faits :
- `Fact_Ventes` : ventes, chiffre d’affaires, quantités
- `Fact_Paiements` : statut et mode de paiement
- `Fact_Expeditions` : délais et transporteurs
- `Fact_Stock` : niveaux de stock et seuils d’alerte

### Tables de dimensions :
- `Dim_Produit`
- `Dim_Client`
- `Dim_Date`
- `Dim_Coupon`
- `Dim_Transporteur`

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

## Outils utilisés

- Power BI
- DAX (mesures, KPIs)
- Modélisation de données (schéma en étoile)
- Data visualisation

---

## Compétences mobilisées

- Analyse de données
- Data visualisation
- Modélisation BI
- Création de KPIs
- Storytelling data

---

## Résultats & valeur ajoutée

Ce dashboard permet :

- Une vision globale et détaillée de l’activité
- L’identification rapide des produits performants
- La détection des risques de rupture de stock
- L’analyse des paiements et des délais logistiques
- Une aide à la prise de décision stratégique


---

## Améliorations possibles

- Ajout de KPI avancés (taux de conversion, churn client)
- Analyse prédictive des ventes
- Alertes automatiques sur les ruptures de stock
- Segmentation client 

---

## Auteur 

**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 