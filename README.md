# MinerGame - MDS Project

## Description

Application réalisée dans le cadre du cours développment natif (Flutter) où nous devions réaliser un jeu de type "clickergame" à l'instar de Cookie Clicker, par exemple.

## Installation

Pour installer l'application, il suffit de cloner le projet et de lancer les commandes `flutter pub get` et `flutter run` dans le dossier du projet.

## Utilisation

L'application est très simple d'utilisation. Il suffit de cliquer sur le bouton "Miner" pour miner des ressources. Ces ressources peuvent ensuite être utilisées pour acheter des améliorations ou des objets. Les améliorations permettent d'augmenter la quantité de ressources minées par clic, tandis que les objets de fabriquer d'autres objets ou débloquer de nouvelles ressources.

## Fonctionnalités

- Minage de ressources
- Charbon à débloquer
- Fabrication d'améliorations et d'objets, les objets fabriqués sont stockés dans l'inventaire.
- Fabrication désactivée si ressources insuffisantes
- Inventaire avec tri par nom/quantité, accès via l'app bar depuis l'écran Recettes.
- [WIP] Widget permettant de miner aléatoirement des ressources en draggant sur l'écran après avoir acheté l'objet correspondant

## Difficultés rencontrées

- Vue d'ensemble sur l'implémentation du jeu, je pense que certains points peuvent être améliorés, nottament concernant la gestion des modèles de ressources/objets dans le provider + beaucoup trop de valeurs en dur dans le code.
- Le widget permettant de miner aléatoirement des ressources en draggant sur l'écran est en cours de développement, mais je n'ai pas réussi à le terminer à temps. Il est donc actuellement inutilisé dans l'application.

## Choix de design / Implémentation

J'ai choisi d'utiliser le package provider pour gérer les données de l'application, car il permet de gérer facilement les changements de données et de les répercuter dans l'application. Cela permet également de séparer les données de la vue, ce qui est un bon point pour la maintenabilité du code. Cependant, je pense que j'aurais pu passer plus de temps à la conception des modèles/interfaces comme précisé au dessus, afin d'éviter ce qu'il s'est passé : beaucoup de valeurs et de répétitions en dur, ce qui retire le bon point de maintenabilité à mon goût.
