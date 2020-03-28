# Clip and block
Clip & block est un projet pour vos montages électroniques à partir d'Arduino et de composants populaires autour d'Arduino. Il permet d'imprimer des support avec une imprimante 3D pour vos montages.

Image d'exemple

## Démarrer avec Clip & block en une heure

### Imprimer vos premier Clip & block
J'ai concu Clip & blocks pour que ce soit simple à imprimer (Pas de support, possibilité de l'imprimer dans tous les sens, pas trop de précision nécessaire).
Le principe et d'imprimer des plaques de base, de les assembler avec des clips et de bloquer ces clips avec des bloqueurs.

Pour commencer, vous aller imprimer vos premières plaques, clips et bloqueurs : 

#### Pour les plaques
- aller dans le répertoire [basic](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/basic),
- imprimer une plaque [I-3.stl](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-3.stl),
- imprimer une plaque [I-4.stl](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-4.stl).

> I-2.stl => La lettre I désigne la forme de la plaque, le chiffre 2 indique le nombre de trous


#### Pour le clip et bloqueur
- aller dans le répertoire [clips](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/clips),
- imprimer un [blocker-2.stl](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/clips/blocker-2.stl) (de préférence, le mettre à plat, cela se fait très bien avec Cura),
- imprimer un [clip-2.stl]() (comme pour le bloqueur, le mettre à plat, en le tournant à 90°).

> Le blocker-2.stl va fonctionner avec le clip-2.stl. Le chiffre 2 indique la hauteur du clip (2 trous)

![Première plaque](docs/first-plate.png)

Notez qu'il ne faut pas beaucoup de plastique pour ces plaques de base (2g et 0.83m avec mes réglages pour ces 4 pièces). Après plusieurs essais, je suis parti sur une taille, pour un trou de 9.6mm x 9.6mm x 4.8mm. Plus petit, les manipulations deviennent difficiles.

Vous pouvez maintenant assembler ces pièces !

> Pour démonter, il faut pousser le bloqueur par l'aute côté à l'aide d'un petit outil pointu

> Si vous imprimez un deuxième clip et un deuxième bloqueur, vous pouvez aprécier la solidité du montage !

## Les différentes plaques

### Plaques existantes
Dans le répertoire Basic vous trouverez un grand nombres de plaques prédéfinies (75 à ce jour). Ils sont classés en fonction de leur forme et du nombre de trous qu'ils comportent (en une, deux ou trois dimensions).
Pour s'y retrouver, voici quelques exemples :

|     Nom |         Image          | Description                                                  |
| ------: | :--------------------: | :----------------------------------------------------------- |
|     I-3 |   ![I](docs/I-3.png)   | I => En long <br/> 3 trous en longueur                       |
|  LF-3-2 | ![LF](docs/LF-3-2.png) | LF => En L à plat <br/> 3 en longueur, 2 de l'autre côté     |
| L-2-1-1 | ![L](docs/L-2-1-1.png) | L => En L<br/> 2 en longueur, 1 en hauteur, 1 en largeur     |
| L-2-1-1 | ![L](docs/L-2-2-3.png) | L => En L<br/> 2 en longueur, 2 en hauteur, 3 en largeur     |
| U-2-2-2 | ![L](docs/U-2-2-2.png) | U => En U<br/>                                               |
|   P-2-2 |  ![L](docs/P-2-2.png)  | P => Plaque à plat<br/>                                      |
| C-2-2-1 | ![L](docs/C-2-2-1.png) | C => Cube<br/> 2 en longueur, 2 en hauteur, 1 en largeur     |
|    IR-3 |  ![I](docs/IR-3.png)   | IR => En long, bouts arrondis, (pour des pièces en rotation) |
|    IH-3 |  ![I](docs/IH-3.png)   | IH => En long, demi hauteur                                  |
|   IHR-3 |  ![I](docs/IHR-3.png)  | IH => En long, demi hauteur, bouts arrondis                  |

> Il y a certaines redondances (C et P par exemple), il faudrait que je fasse le ménage...

### Créer ses plaques sur mesure

Si vous ne trouvez pas votre bonheur dans ces fichiers STL, il est possible de créer, avec openscad, vos propres plaques assez simplement.

Voici par exemple comment créer une plaque P-2-3 (Plaque à plat en 2x3).
- Ouvrez le fichier [clip_and_block.scad](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad)
- Modifiez le paramètre **model** pour le type de plaque à **P**
- Modifiez le paramètre **length1** pour la longueur à **2**
- Modifiez le paramètre **length2** pour la largeur à **3**
- Vous pouvez ensuite faire un rendu avec la touche **F6**
- Et exporter en STL depuis OpenSCAD

![OpenSCAD](docs/openscad-plate.png)

### Le fichier list-plates.txt et le script generate-plates.py
Pour automtiser la génération des fichiers STL, j'ai créé le fichier *list-plates.txt* qui liste toutes les plaques. 

Le fichier *generate-plates.py* lit ce fichier et lance la commande OpenSCAD avec les paramètres qui vont bien.

## Les plaques pour composants électroniques


### Les composants pris en charge

### Créer ses plaques pour ses composants

#### Créer son .stl

#### Ajouter ses blocs avec openscad

#### Utiliser list-elec.csv

## Mes réalisations

## La suite ?
- Tester
- Sécuriser les connecteurs
- Créer des plaques *décoratives*

### Comment aider ?
