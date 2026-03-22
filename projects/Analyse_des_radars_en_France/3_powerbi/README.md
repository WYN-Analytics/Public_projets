# Power BI
---

## Objectif du dashboard

Ce dashboard Power BI a pour objectif de :

- visualiser la répartition des radars en France  
- analyser leur typologie (vitesse, feu rouge, etc.)  
- comprendre leur distribution géographique  
- mettre en perspective les données avec la population  
- identifier des indicateurs exploitables pour la sécurité routière  

## Source des données

Le dashboard repose sur des vues SQL préparées en amont issues de la base `Analyse_radars`.

Principales vues utilisées :

- analyse.vue_radars_detaillee  
- analyse.vue_radars_par_region  
- analyse.vue_radars_par_departement  
- analyse.vue_radars_par_type  
- analyse.vue_radars_par_annee  

## Modélisation Power BI

- Table principale : vue_radars_detaillee (1 ligne = 1 radar)
- Modèle volontairement simple 
- Calculs réalisés via DAX + SQL


##  Structure du dashboard

### Page 1 - Vue globale
- KPI : radars, communes, départements, régions
- Carte des radars
- Radars par région

### Page 2 - Analyse géographique
- Radars par département
- Top 10 départements
- Radars pour 100 000 habitants

### Page 3 - Typologie
- Types de radars
- Radars feu rouge / vitesse moyenne
- Analyse VMA

### Page 4 - Évolution
- Radars par année
- Courbe temporelle

### Page 5 - Qualité des données
- Taux de VMA manquante
- Message qualité

---

##  Mesures DAX

Voir fichier : mesures_dax.md

##  Limites

- Rattachement commune approximatif (distance)
- Population dupliquée (corrigée en DAX)
- Données VMA manquantes

##  Apports

- Indicateurs métiers pertinents
- Analyse géographique
- Transparence sur les limites


##  Améliorations

- Ajout données accidents
- Modèle en étoile
- Calcul distance avancé

---

## Auteur 

**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 
