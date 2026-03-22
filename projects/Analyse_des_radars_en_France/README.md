# Analyse des radars en France

# Analyse des radars en France

## Objectif

Ce projet a pour objectif d’analyser la répartition des radars fixes en France à partir de données open data.

## Technologies utilisées

- SQL Server
- T-SQL
- Power BI

## Organisation de la base

Le projet utilise deux schémas :

- `brut` : données importées sans transformation
- `analyse` : données nettoyées, enrichies et prêtes à être analysées

Tables principales :

- `analyse.radars`
- `analyse.communes`
- `analyse.radar_enrichi`

## Questions métier analysées

- Combien y a-t-il de radars fixes en France ?
- Quels types de radars sont les plus présents ?
- Quelles régions concentrent le plus de radars ?
- Quels départements sont les plus équipés ?
- Quelle est la répartition des VMA ?
- Comment évoluent les installations dans le temps ?
- Quel est le niveau d’équipement rapporté à la population ?

## Structure du projet


Analyse_des_radars_en_France
│
├── README.md
│
├── 1_donnees
│   ├── jeu-de-donnees-liste-des-radars-fixes-en-france-12-2025.csv
│   ├── communes-france-2025.csv
│   └── README.md
│
├── 2_sql
│   ├── 01_creation_base.sql
│   ├── 02_import_donnees.sql
│   ├── 03_nettoyage.sql
│   ├── 04_enrichissement_geographique.sql
│   ├── 05_requetes_analytiques.sql
│   ├── 06_vues_powerbi.sql
│   └── README.md
│
├── 3_powerbi
│   ├── dashboard_radars.pbix
│   ├── README.md
│   └── mesures_dax.md
│
├── 4_documentation
│   ├── dictionnaire_donnees.md
│   └── methodologie.md
│
└── 5_images
    └── dashboard.png


## Limite importante

- Le fichier des radars ne contient pas directement la commune, l’enrichissement géographique va donc reposer sur la commune dont le centre est le plus proche des coordonnées du radar. C’est une approximation raisonnable ce n’est pas un géocodage administratif officiel, chaque radar est associé à la commune dont le centroïde est le plus proche.
- Le champ `VMA ` contient des valeurs manquantes : **678 lignes**.
- Le projet analyse la **répartition** des radars, pas leur efficacité réelle sur l’accidentologie, car aucune donnée d’accident n’est fournie ici.
- Le dataset des radars contient une date maximale observée de **2025-12-30**. Cela correspond au fichier fourni et doit être présenté comme une observation du jeu de données, sans surinterprétation.

---

## Étapes du projet

1. Import des données brutes  
2. Nettoyage des données  
3. Enrichissement géographique  
4. Requêtes analytiques SQL  
5. Création de vues pour Power BI  
6. Création d’un dashboard interactif  

---

## Travaux réalisés

1. Import des fichiers CSV dans SQL Server  
2. Création des tables brutes et des tables d’analyse  
3. Conversion des dates, nombres et coordonnées  
4. Sélection des colonnes utiles du dataset communes  
5. Rattachement de chaque radar à la commune la plus proche via `CROSS APPLY`  
6. Création de requêtes analytiques simples et lisibles  
7. Création de vues SQL dédiées à Power BI  
8. Création de mesures DAX pour le dashboard  
9. Correction du problème de population dupliquée dans les indicateurs  
10. Création d’un dashboard interactif  

---

## Structure du dashboard

### Page 1 - Vue globale
- Nombre total de radars  
- Nombre de communes concernées  
- Nombre de départements concernés  
- Nombre de régions concernées  
- VMA moyenne  

### Page 2 - Analyse géographique
- Radars par région  
- Part des radars par région  
- Radars par département  
- Top communes les plus équipées  

### Page 3 - Analyse des radars
- Répartition par type de radar  
- Répartition par VMA  
- Nombre moyen de radars par commune  

### Page 4 - Analyse temporelle
- Nombre de radars par année  
- Analyse des installations récentes  
- Comparaison des évolutions  

### Page 5 - Analyse population
- Population réelle corrigée  
- Radars pour 100 000 habitants  
- Lecture territoriale relative  

---

## Compétences démontrées

- Import de fichiers CSV  
- Nettoyage de données  
- Conversion de types en SQL  
- Requêtes analytiques simples  
- Utilisation de `CROSS APPLY`  
- Enrichissement géographique  
- Création de vues SQL  
- Création de mesures DAX  
- Construction d’un dashboard Power BI  
- Documentation d’un projet data  

---

## Résultat attendu

Le projet permet d’identifier :

- les régions les plus équipées  
- les départements les plus équipés  
- les types de radars les plus fréquents  
- les VMA (vitesse maximale autorisée) les plus présentes  
- la répartition des radars dans le temps  
- un niveau d’équipement relatif à la population  

---

## Auteur 

**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 