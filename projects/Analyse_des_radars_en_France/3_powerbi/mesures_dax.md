# Mesures DAX

## Nombre de radars

```DAX
Nombre de radars =
COUNTROWS('vue_radar_detaillee')
```

## Nombre de communes

```DAX
Nombre de communes =
DISTINCTCOUNT('vue_radar_detaillee'[nom_commune])
```

## Nombre de départements

```DAX
Nombre de départements =
DISTINCTCOUNT('vue_radar_detaillee'[nom_departement])
```

## Nombre de régions

```DAX
Nombre de régions =
DISTINCTCOUNT('vue_radar_detaillee'[nom_region])
```

## VMA moyenne

```DAX
VMA moyenne =
AVERAGE('vue_radar_detaillee'[vma])
```

## Population réelle

```DAX
Population réelle =
SUMX(
    VALUES('vue_radar_detaillee'[nom_commune]),
    MAX('vue_radar_detaillee'[population])
)
```

## Radars pour 100 000 habitants

```DAX
Radars pour 100 000 habitants =
DIVIDE(
    [Nombre de radars],
    [Population réelle],
    0
) * 100000
```

## Part des radars par région (%)

```DAX
Part des radars par région (%) =
DIVIDE(
    COUNTROWS('vue_radar_detaillee'),
    CALCULATE(
        COUNTROWS('vue_radar_detaillee'),
        ALL('vue_radar_detaillee'[nom_region])
    ),
    0
)
```

## Nombre moyen de radars par commune

```DAX
Nombre moyen de radars par commune =
DIVIDE(
    [Nombre de radars],
    [Nombre de communes],
    0
)
```

## Message qualité des données

```DAX
Message qualité des données =
"Le rattachement radar-commune est une approximation géographique. La population est retraitée pour éviter les doublons."
```
