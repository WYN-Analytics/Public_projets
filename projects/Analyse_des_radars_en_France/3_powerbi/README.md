# Power BI

## Fichier principal

dashboard_radars.pbix

---

## Sources utilisées

Le dashboard s’appuie sur les vues SQL suivantes :

- analyse.vue_radar_detaillee
- analyse.vue_radars_par_region
- analyse.vue_radars_par_type
- analyse.vue_radars_par_annee
- analyse.vue_radars_par_departement

---

## Objectif du dashboard

Le dashboard permet de visualiser :

- la répartition des radars en France
- la distribution par région et département
- les types de radars
- les vitesses maximales autorisées (VMA)
- l’évolution du nombre de radars dans le temps
- un indicateur relatif à la population

---

## Structure du dashboard

### Page 1 - Vue globale

- Nombre total de radars
- Nombre de communes concernées
- Nombre de départements concernés
- Nombre de régions concernées
- VMA moyenne

---

### Page 2 - Analyse géographique

- Histogramme des radars par région
- Part des radars par région (%)
- Histogramme des radars par département
- Top communes les plus équipées

---

### Page 3 - Analyse des radars

- Répartition par type de radar
- Répartition par VMA
- Nombre moyen de radars par commune

---

### Page 4 - Analyse temporelle

- Nombre de radars par année
- Évolution des installations
- Analyse des tendances

---

### Page 5 - Analyse population

- Population réelle (corrigée)
- Radars pour 100 000 habitants
- Comparaison entre territoires

---

## Mesures importantes utilisées

- Nombre de radars
- Nombre de communes
- Population réelle (corrigée)
- Radars pour 100 000 habitants
- VMA moyenne
- Part des radars par région

---

## Limite importante

La population est répétée pour chaque radar dans la table enrichie.

Une mesure DAX spécifique est utilisée pour corriger ce problème et éviter les doublons.

---

## Objectif final

Fournir un dashboard clair, lisible et exploitable permettant de comprendre rapidement la répartition des radars en France.

---

## Auteur 

**Wilfried YA. WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 