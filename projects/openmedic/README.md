#  Projet OpenMedic 2019–2024  
Analyse de la consommation d’antibiotiques en France à partir des données **OpenMedic** (Assurance Maladie).

Ce projet combine :
- nettoyage des données (Python / pandas)  
- analyse exploratoire (EDA)  
- visualisations (Seaborn, Matplotlib)  
- extraction d’insights pour la santé publique  

---

## Contenu du dossier

- **open_medic_cleaned.csv**  
  Données nettoyées et prêtes pour l'analyse (période 2019–2024).

- **01_preprocessing_openmedic.ipynb** *(optionnel si tu l’utilises)*  
  Notebook de préparation des données :  
  - import des données brutes  
  - filtrage des antibiotiques  
  - gestion des valeurs manquantes  
  - création de variables dérivées  
  - export du fichier `open_medic_cleaned.csv`

- **02_visualisation_openmedic.ipynb**  
  Notebook de visualisation :  
  - analyses descriptives  
  - courbes d’évolution temporelle  
  - histogrammes / barplots  
  - comparaisons entre classes d’antibiotiques  
  - focus sur certaines périodes (ex. Covid)  

---

## Objectifs du projet

- Étudier l’évolution de la consommation d’antibiotiques entre 2019 et 2024  
- Identifier les classes d’antibiotiques les plus consommées  
- Visualiser les tendances par année, classe thérapeutique, éventuellement région / population  
- Mettre en évidence des ruptures ou tendances (ex : effet Covid, baisses/hausses spécifiques)  
- Produire des visualisations claires pour un public non technique  

---

## Technologies utilisées

- **Langage :** Python 3.x  
- **Librairies principales :**
  - `pandas` (manipulation de données)  
  - `numpy` (calculs numériques)  
  - `matplotlib` (visualisations de base)  
  - `seaborn` (visualisations avancées)  

Les notebooks sont pensés pour être exécutés dans **Jupyter Notebook** ou **JupyterLab**.

---

## Pistes d’amélioration

- Création d’un **dashboard Power BI** à partir du fichier `open_medic_cleaned.csv`  
- Ajout de cartes régionales (si données disponibles)  
- Modélisation simple (prévision de tendances)  
- Intégration d’indicateurs de bon usage des antibiotiques  

---

## Auteur

**Wilfried YA. – WYN-Analytics**  
_Data Analyst • Python • SQL • Power BI • Machine Learning_  
