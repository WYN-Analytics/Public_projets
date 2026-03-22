# 📊 Mesures DAX — Projet Radars France

Ce document présente l’ensemble des mesures DAX utilisées dans le dashboard Power BI du projet d’analyse des radars automatiques en France.

---

#  Indicateurs principaux

### Nombre de radars

```DAX
Nombre de radars =
COUNTROWS('vue_radars_detaillee')
```

> Compte le nombre total de radars présents dans la base.

---

### Nombre de communes

```DAX
Nombre de communes =
DISTINCTCOUNT('vue_radars_detaillee'[nom_commune])
```

> Compte le nombre de communes distinctes dans lesquelles au moins un radar est présent.

---

### Nombre de départements

```DAX
Nombre de départements =
DISTINCTCOUNT('vue_radars_detaillee'[nom_departement])
```

> Compte le nombre de départements distincts.

---

### Nombre de régions

```DAX
Nombre de régions =
DISTINCTCOUNT('vue_radars_detaillee'[nom_region])
```

> Compte le nombre de régions distinctes.

---

# Analyse des radars

### Nombre de radars feu rouge

```DAX
Nombre de radars feu rouge =
CALCULATE(
    [Nombre de radars],
    'vue_radars_detaillee'[type_radar] = "ETFR"
)
```

> Compte le nombre de radars de type feu rouge.

---

### Nombre de radars vitesse moyenne

```DAX
Nombre de radars vitesse moyenne =
CALCULATE(
    [Nombre de radars],
    'vue_radars_detaillee'[type_radar] = "ETVM"
)
```

> Compte le nombre de radars de type vitesse moyenne.

---

### Nombre de radars sans VMA

```DAX
Nombre de radars sans VMA =
CALCULATE(
    [Nombre de radars],
    ISBLANK('vue_radars_detaillee'[vma])
)
```

> Compte le nombre de radars dont la vitesse maximale autorisée est manquante.

---

### VMA moyenne

```DAX
VMA moyenne =
AVERAGE('vue_radars_detaillee'[vma])
```

> Calcule la vitesse maximale autorisée moyenne (hors valeurs manquantes).

---

#  Indicateurs de qualité des données

### Taux de VMA manquante (%)

```DAX
Taux de VMA manquante (%) =
DIVIDE(
    [Nombre de radars sans VMA],
    [Nombre de radars],
    0
)
```

> Permet d’évaluer la qualité de la donnée VMA.

---

### Message qualité des données

```DAX
Message qualité des données =
"Le rattachement radar-commune est une approximation géographique. La population a été retraitée pour éviter les doubles comptes dans les indicateurs."
```

> Message informatif affiché dans le dashboard pour expliciter les limites du projet.

---

# Indicateurs démographiques

### Population réelle

```DAX
Population réelle =
SUMX(
    VALUES('vue_radars_detaillee'[nom_commune]),
    MAX('vue_radars_detaillee'[population])
)
```

> La population est répétée pour chaque radar dans une même commune.  
> Cette mesure permet d’éviter les doubles comptes en ne prenant qu’une seule valeur par commune.

---

### Radars pour 100 000 habitants

```DAX
Radars pour 100 000 habitants =
DIVIDE(
    [Nombre de radars],
    [Population réelle],
    0
) * 100000
```

> Indicateur clé permettant de comparer la densité de radars entre territoires.

---

### Nombre moyen de radars par commune

```DAX
Nombre moyen de radars par commune =
DIVIDE(
    [Nombre de radars],
    [Nombre de communes],
    0
)
```

> Permet d’évaluer la concentration moyenne des radars.

---

# Indicateurs de répartition

### Part des radars par région (%)

```DAX
Part des radars par région (%) =
DIVIDE(
    [Nombre de radars],
    CALCULATE(
        [Nombre de radars],
        ALL('vue_radars_detaillee')
    ),
    0
)
```

> Calcule la part des radars d’une région par rapport au total national, indépendamment des filtres actifs.

---

# Remarque importante

La table `vue_radars_detaillee` contient une ligne par radar.  
La population étant associée à chaque radar lors de l’enrichissement géographique, elle est donc répétée plusieurs fois.

 Une mesure spécifique (`Population réelle`) a été créée pour corriger ce biais.

---

# Conclusion

Ces mesures permettent :

- d’analyser la répartition géographique des radars
- de comprendre leur typologie
- d’évaluer la qualité des données
- de produire des indicateurs comparables entre territoires

---

## Auteur 

** WYN Analytics**  
Data Analyst • SQL • Python • Excel • Power BI 
