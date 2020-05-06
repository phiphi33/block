Clip & block est un kit de construction libre (CC By‑SA 4.0) qui permet de créer des structures solides avec une imprimante 3D pour les projets électroniques basés sur Arduino. Il se compose de pièces qu’il est possible d’assembler et de démonter facilement pour ajouter et retirer différents composants. Bien qu’il soit utilisable, c’est la première fois que je documente ce projet, il est donc en développement. Vous pouvez voir quelques exemples de réalisations à la fin de cette dépêche.

----

[Sources du projet sur GitLab](https://gitlab.com/tedour/clip-and-block/)

----

# Démarrer avec Clip & block en une heure
## Imprimer votre premier Clip & block
J’ai conçu Clip & block pour que ce soit simple à imprimer (pas de support, possibilité de l’imprimer dans tous les sens, pas trop de précision nécessaire, car les formes sont simples). Commencez par cloner le projet sur [GitLab](https://gitlab.com/tedour/clip-and-block/).


Première étape, vous allez imprimer vos deux premières pièces, un clip et un bloqueur.

### Pour les pièces :
- aller dans le répertoire [`basic`](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/basic) ;
- récupérer une pièce [`I-3.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-3.stl) ;
- récupérer une pièce [`I-4.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-4.stl).
    
_`I-3.stl` → la lettre I désigne la forme de la pièce, le chiffre 3 indique le nombre de trous._

### Pour le clip et le bloqueur :
- aller dans le répertoire [`clips`](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/clips) ;
- récupérer un [`blocker-2.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/clips/blocker-2.stl) (de préférence, le mettre à plat, cela se fait très bien avec Cura) ;
- récupérer un [`clip-2.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/clips/clip-2.stl) (comme pour le bloqueur, le mettre à plat, en le tournant à 90°).
    
_Le chiffre 2 indique la hauteur du clip (assemblage de deux pièces). Le `blocker-2.stl` va fonctionner avec le `clip-2.stl`._

![Première impression](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/first-plate.png)


Notez qu’il ne faut pas beaucoup de plastique pour ces pièces de base (2 g et 0,83 m avec mes réglages pour ces quatre pièces). Après plusieurs essais, cette taille (9,6 mm × 9,6 mm × 4,8 mm) m’a paru être un bon compromis. Plus petit, les manipulations deviennent difficiles (mais peut‑être qu’il faudrait que je teste à nouveau en 6,4 mm × 6,4 mm × 3,2 mm).
    
Vous pouvez maintenant assembler ces pièces ! Pour démonter, il faut pousser le bloqueur par l’autre côté à l’aide d’un petit outil pointu. Si vous imprimez un deuxième clip et un deuxième bloqueur, vous pourrez apprécier la solidité du montage !



# Les différentes pièces
## Pièces existantes
Dans le répertoire `basic`, vous trouverez un grand nombre de pièces générées (75 à ce jour). Elles sont classées en fonction de leur forme et du nombre de trous qu’elles comportent (en une, deux ou trois dimensions). Pour s’y retrouver, voici quelques exemples :
    
|     Nom |         Image          | Description                                                  |
| ------ | -------------------- | ----------------------------------------------------------- |
|     I-3 |   ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/I-3.png)   | I : en long, 3 trous en longueur                       |
|  LF-3-2 | ![LF](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/LF-3-2.png) | LF : en L à plat, 3 en longueur, 2 de l’autre côté     |
| L-2-1-1 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/L-2-1-1.png) | L : en L, 2 en longueur, 1 en hauteur, 1 en largeur     |
| L-2-2-3 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/L-2-2-3.png) | L : en L, 2 en longueur, 2 en hauteur, 3 en largeur     |
| U-2-2-2 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/U-2-2-2.png) | U : en U                                               |
|   P-2-2 |  ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/P-2-2.png)  | P : pièce à plat                                      |
| C-2-2-1 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/C-2-2-1.png) | C : cube, 2 en longueur, 2 en hauteur, 1 en largeur     |
|    IR-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IR-3.png)   | IR : en long, bouts arrondis, (pour des pièces en rotation) |
|    IH-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IH-3.png)   | IH : en long, demi‑hauteur                                  |
|   IHR-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IHR-3.png)  | IHR : en long, demi‑hauteur, bouts arrondis                  |

_Il y a certaines redondances (C et P, par exemple), il faudrait que je fasse le ménage…_

## Créer ses pièces sur mesure
Si vous ne trouvez pas votre bonheur dans ces fichiers STL, il est possible de créer, avec [OpenSCAD](https://www.openscad.org/), vos propres pièces assez simplement. Voici par exemple comment créer une pièce P‑2‑3 (pièce à plat en 2 × 3) :
    
- ouvrez le fichier [clip_and_block.scad](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad)
- modifiez le paramètre `model` pour le type de pièce à **P** ;
- modifiez le paramètre `length1` pour la longueur à **2** ;
- modifiez le paramètre `length2` pour la largeur à **3** ;
- vous pouvez ensuite faire un rendu avec la touche `F6` ;
- et exportez en STL depuis OpenSCAD.
    
![OpenSCAD](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/openscad-plate.png)

## Le fichier `list-plates.txt` et le script `generate-plates.py`
Pour automatiser la génération des fichiers STL, j’ai créé le fichier [`list-plates.txt`](https://gitlab.com/tedour/clip-and-block/-/blob/master/list-plates.txt) qui liste toutes les pièces. Le script [`generate-plates.py`](https://gitlab.com/tedour/clip-and-block/-/blob/master/generate-plates.py) lit ce fichier et lance les commandes OpenSCAD avec les paramètres qui vont bien.


# Les pièces pour composants électroniques
C’est ici la partie intéressante du projet : pouvoir intégrer des composants électroniques dans vos montages.


## Les composants pris en charge
J’ai créé un certain nombre de pièces qui permettent d’inclure des composants. Elles se trouvent dans le répertoire [`stl/electronic`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/electronic).
    
Voici par exemple les deux pièces qui permettent d’inclure un [NodeMCU](https://fr.wikipedia.org/wiki/NodeMCU) (j’utilise beaucoup cette carte) :
![NodeMCU](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/nodemcu.png)
    
Il existe bien d’autres variantes de ces pièces, avec plus ou moins de trous, des trous d’un seul côté, etc. Voici la liste des composants pris en charge dans Clip & block, cette liste pourra (assez) facilement être étendue :
    
|  Nom | Image | Description |
| ---: | :----: | :-----------|
|18650x2 Batterie holder | ![18650](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/18650x2.jpg) | Alimentation 7,4 V |
|18650 Batterie shield V3 | ![18650](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/shield_v3.jpg) | Alimentation USB + 3,3 V + 5 V + recharge |
| BME 280 | ![BME280](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/bme280.jpg) | Température + pression |
| Breadboard 25 trous | ![breadboard25](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/breadboard-25.jpg) | Connexion |
| Bouton 14 × 20 | ![button](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/button14_20.jpg) | Bouton |
| D1 Mini | ![D1-mini](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/D1-mini.jpg) | Carte  de développement |
| DC Motor with gearbox | ![DC-motor](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/dc-geared.jpg) | Moteur à courant continu démultiplié |
| L9110s Driver motor | ![l9110S](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/l9110s.jpg) | Driver moteur à courant continu
| NodeMCU | ![nodemcu](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/esp8266.jpg) | Carte de développement |
| OLED 128 × 64 | ![Afficheur OLED](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/oled128x64.jpg) | Afficheur OLED |
| SG90 (une seule variante, à améliorer) | ![oled](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/sg90.jpg) | Servomoteur |
| Simple switch | ![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/interrupteur.jpg) | Interrupteur
| Afficheur TM1637 | ![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/tm1637.jpg) | Afficheur 4 × 7 segments |
    
Il existe plusieurs variantes pour chaque composant, je vous laisse les découvrir.

## Créer ses pièces pour ses composants
Vous pouvez créer des pièces pour vos composants. Pour cela, vous devez modéliser la pièce sans trous avec votre modeleur préféré. Ensuite, pour pouvoir ajouter des trous Clip & Block autour, il faut veiller à ce que longueur et largeur soient des multiples de 9,6 mm et que la hauteur soit de 4,8 mm.
    
Vous pouvez ensuite ajouter les trous grâce à OpenSCAD.



### Créer le fichier STL de son composant
Voici par exemple comment j’ai procédé pour l’afficheur TM1637 :
    
- j’ai créé une pièce pour le dessus et une pour le dessous pour prendre l’afficheur « en sandwich » ;
- puis, j’ai créé des bords autour du composant pour obtenir un multiple de 9,6 (ici, 48 mm : 5 trous × 28,8 mm et 3 trous × 4,8 mm).
    
Dessous :
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-bottom.png)
    
Dessus :
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-top.png)

### Ajouter les trous avec OpenSCAD
Ensuite, il est possible d’ajouter les trous autour de votre montage grâce à OpenSCAD :
    
- ouvrez le fichier [`clip_and_block.scad`](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad) ;
- déposez votre fichier STL dans le dossier [`import`](https://gitlab.com/tedour/clip-and-block/-/blob/master/import) ;
- modifiez le paramètre `model` pour le type de pièce à **F** (_Filename_) — pour des trous de demi‐hauteur, choisissez **FH** ;
- dans le tableau **holeArray**, entrez les coordonnées de vos trous (il faut tester pour trouver les bons) ;
- dans le tableau **finalRotate**, vous pouvez tourner votre modèle final pour qu’il soit à plat ;
- dans le tableau **finalMirror**, vous pouvez faire une rotation de votre modèle.
    
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-openscad.png)



### Utiliser le fichier `list-elec.csv` le script `generate-elec.py`
J’ai également automatisé la génération des fichiers STL. J’ai créé le fichier [`list-elec.csv`](https://gitlab.com/tedour/clip-and-block/-/blob/master/list-elec.csv) qui liste toutes les pièces pour composants. Vous pouvez voir dans ce fichier que vous pouvez indiquer toutes les options OpenSCAD.
    
![list-elec](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/list-elec-csv.png)
    
Le script [`generate-plates.py`](https://gitlab.com/tedour/clip-and-block/-/blob/master/generate-plates.py) lit ce fichier et lance la commande OpenSCAD avec les paramètres. Je vais peut‑être fusionner les fichiers `list-plates.txt` et `list-elec.csv` prochainement.



# Mes réalisations
Voici ce que j’ai réalisé avec les Clip & blocks — je pourrai, si vous me le demandez, détailler ces projets :
    
- [Virtual Wall Roomba](https://www.thingiverse.com/thing:3413412) (mur virtuel pour aspirateur automatique) :
![Virtual Wall](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/virtual_wall1.jpg)
![Virtual Wall](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/virtual_wall2.jpg)
    
- [sablier électronique](https://www.thingiverse.com/thing:3413412) (pour ne pas avoir à rappeler l’heure le matin à mes enfants :)) :
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier1.jpg)
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier2.jpg)
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier3.jpg)
    
- micro‑tracteur télécommandé (basé sur le projet [FF RC-Car](https://www.thingiverse.com/thing:3133996)) :
![Tracteur](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/tracteur1.jpg)
![Tracteur](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/tracteur2.jpg)
<iframe width="1194" height="672" src="https://www.youtube.com/embed/LYvnh63f8S4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




Ces projets fonctionnent plutôt bien, et je m’en sers régulièrement. Voici pour moi les qualités et les défauts de Clip & block :
    
- qualités :
    - solidité,
    - facile de faire des modifications,
    - pas besoin de réimprimer l’ensemble pour les modifications ;
- défauts :
    - manque de pièces « esthétiques » ou de finition, ou même de sécurité (caches, couvercles, etc.),
    - sécurisation des connecteurs Dupont par des pièces spéciales,
    - organisation des fils.



# La suite ?
J’ai aujourd’hui un peu moins de temps pour m’occuper de ce projet. Cependant, je trouve dommage de le laisser à l’abandon, c’est pourquoi je vous demande de l’aide. Alors, de quoi ai‑je besoin ?



## Tester
La première chose que j’aimerais savoir c’est si ce projet fonctionne chez vous, si cela peut répondre à un besoin (ou le créer ?). Donc, merci de tester en suivant la première partie de cet article !



## Quelques idées d’évolutions
- ajouter des composants (selon vos besoins) ;
- sécuriser les connecteurs ou créer des passe‑fils ;
- créer des pièces *décoratives* ou de *finition* pour que les produits finals soient plus esthétiques et/ou sécuritaire ;
- ajouter des éléments de types roue (j’ai déjà travaillé dessus) et engrenage ;
- faire des manuels avec [LDCad](http://www.melkert.net/LDCad) ;
- créer d’autres projets basés sur ce kit.

## Créer une communauté
Jusqu’à maintenant, je n’ai que mon [GitLab](https://gitlab.com/tedour/clip-and-block). Mais je viens de créer un [compte Mastodon](https://mastodon.social/web/accounts/918095) pour discuter et échanger, si l’on pouvait être deux ou trois, cela dynamiserait les choses. :)
