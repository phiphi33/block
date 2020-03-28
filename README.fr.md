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

Notez qu'il ne faut pas beaucoup de plastique pour ces plaques de base (2g et 0.83m avec mes réglages pour ces 4 pièces). Après plusieurs essais, je suis parti sur une taille, pour un trou de 9.6mm x 9.6mm x 4.8mm. Plus petit, les manipulations deviennent difficiles (mais peut-être qu'il faudrait que je teste à nouveau en 6.4mm x 6.4mm x 3.2mm).

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
C'est ici la partie intéressante du projet : pouvoir intégrer des composants electroniques, des leds, dans nos montages.

### Les composants pris en charge
Comme pour les plaques, j'ai créé un certain nombre de plaques qui permettent d'inclure des composants. Ils se trouvent dans le répertoir [stl/electronic](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/electronic).

Voici par exemple les deux plaques qui permettent d'inclure un NodeMCU (J'utilise beaucoup ce composant) :
![NodeMCU](docs/nodemcu.png)

Il existe bien d'autres variantes de ces plaques, avec plus ou moins de trous, des trous d'un seul côté, etc.

TODO: Photo en réél

Voici la liste des composants que j'ai intégré dans mes montages :

|  Nom | Image | Description |
| ---: | :----: | :-----------|
|18650x2 Batterie holder | ![18650](docs/electronics/18650x2.jpg) | Alimentation 7.4v |
|18650 Batterie shield V3 | ![18650](docs/electronics/shield_v3.jpg) | Alimentation USB + 3.3V + 5V + Recharge |
| BME 280 | ![BME280](docs/electronics/bme280.jpg) | Température + Pression |
| Breadboard 25 trous | ![breadboard25](docs/electronics/breadboard-25.jpg) | Connexion |
| Button 14x20 | ![button](docs/electronics/button14_20.jpg) | Boutton |
| D1 Mini | ![D1-mini](docs/electronics/D1-mini.jpg) | Carte développement |
| DC Motor with gearbox | ![DC-motor](docs/electronics/dc-geared.jpg) | Moteur démultiplié |
| L9110s Driver motor | ![l9110S](docs/electronics/l9110s.jpg) | Driver moteur DC
| NodeMCU | ![nodemcu](docs/electronics/esp8266.jpg) | Carte développement |
| Oled 128x64 | ![oled](docs/electronics/oled128x64.jpg) | Afficheur OLED |
| SG90 (Une seule variante, à améliorer) | ![oled](docs/electronics/sg90.jpg) | Servo moteur |
| Simple switch | ![TM1637](docs/electronics/interrupteur.jpg) | interrupteur
| Afficheur TM1637 | ![TM1637](docs/electronics/tm1637.jpg) | Afficheur 4x7 segments |

> Il existe plusieurs variantes pour chaque composant, je vous laisse les découvrir.

### Créer ses plaques pour ses composants
Comme pour les plaques, vous pouvez créer vos propres plaques pour vos composants. Pour cela, vous devez modéliser une pièce autour de votre composant avec votre modeleur préféré.

Vous pourrez ensuite ajouter des trous grâce à OpenSCAD.

#### Créer son .stl pour son composant

Voici par exemple comment j'ai procédé pour l'afficheur TM1637 :
- Pris en compte des dimenssions de l'afficheur
- Création d'une "boîte" autour du composant qui est un multiple de 9.6 (Ici, 48mm x 28.8mm x 4.8mm)
- Si cela n'est pas possible autrement, faire un dessus et un dessous pour le composant

Dessous :

![TM1637](docs/tm1637-bottom.png)

Dessus :

![TM1637](docs/tm1637-top.png)

#### Ajouter ses blocs avec openscad

Ensuite, il est possible d'ajouter les trous autour de votre montage grâce à OpenSCAD :
- Ouvrez le fichier [clip_and_block.scad](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad)
- Déposez votre fichier STL dans le dossier [import](https://gitlab.com/tedour/clip-and-block/-/blob/master/import)
- Modifiez le paramètre **model** pour le type de plaque à **F** (Filename). Pour des trous de demi hauteur, choisissez **FH**.
- Dans le tableau **holeArray**, entrez les coordonées de vos trous (Il faut tester pour trouver les bons)
- Dans le tableau **finalRotate** vous pouvez tourner votre model final pour qu'il soit à plat
- Dans le tableau **finalMirror** vous pouvez faire un flip de votre modèle

#### Utiliser le fichier list-elec.csv le script generate-elec.py

## Mes réalisations

## La suite ?
- Tester
- Sécuriser les connecteurs / passe fils
- Créer des plaques *décoratives*

### Comment aider ?
