# Mise en place de Iptables dans un Docker Compose 


Il nous est demandé ici de mettre en place un container docker permettant de mettre en place des règles iptables, voici l’architecture de mes fichiers docker.

Avant tout expliquons ce qu’est Docker compose : 

Il s’agit d’un outils qui permet de gérer et de créer plusieurs dockers comme un ensemble de service interconnectés.

Ici, nous allons concevoir une architecture réseau d’entreprise et mettre en place un pare-feu qui va gérer les échanges entres les différents réseaux tout ça avec Docker-Compose.

Qu’elle est la différence entre Docker et Docker compose ?

- Simplement, les commandes docker concernent uniquement un seul container tandis que docker compose gère plusieurs container

Ici, nous allons créer notre propre image Docker, concrètement, un DockerFile définit les étapes pour créer une nouvelle image. Un dockerfile est un simple fichier texte, il contient l’ensemble des instructions et sont exécutées l’une après l’autre.


**_Configuration réseau_**

Sur docker, lorsque l’on créer des containers, ils sont automatiquement mis dans le même réseau qui fonctionne en bridge, ainsi les containers devraient être capable de communiquer entre eux.

![image](https://user-images.githubusercontent.com/82390826/169716906-2f9242ce-5a95-440a-b45c-631fa86a98c1.png)


Vous trouverez dans ce dossier un container Docker permettant de mettre en place des règles iptables et de tester ces règles la à partir d'un client et d'un serveur

Structure du projet :

- Installation Docker
- Installation Docker compose
- Configuration du serveur
- Configuration du client
- Configuration du firewall

_Docker-compose.yml_

![image](https://user-images.githubusercontent.com/82390826/169716135-ae5363ab-e80a-460b-b1c6-fc1043bc71a4.png)


_Index.html_

![image](https://user-images.githubusercontent.com/82390826/169716169-67af176e-df78-4ec2-ad74-6a2a60850a35.png)

_Dockerfile_

![image](https://user-images.githubusercontent.com/82390826/169716259-815f7765-ffa7-466c-a294-3ee63592f329.png)


**_Création du client_**

Arboresence du client : 

  - Client
      a. client.py
      b. Dockerfile
      
  Pour cette partie le plus pratique à était de mettre en œuvre un programme python faisant des requêtes à mon serveur web.
  
![image](https://user-images.githubusercontent.com/82390826/169716460-a5724ee1-8b87-4d9e-ae2a-846a3adbc962.png)


![image](https://user-images.githubusercontent.com/82390826/169716508-3a4c6ffc-f67a-4c71-9eae-f42c495bac6c.png)

Voici maintenant les scripts à créer afin de faire fonctionner iptables comme désirer : 

clean.sh, Ce premier script permet de réinitialiser chacune des règles iptables

![image](https://user-images.githubusercontent.com/82390826/169716819-4892faf5-34de-4574-b9a0-598a07c656f0.png)


firewall.sh

![image](https://user-images.githubusercontent.com/82390826/169717025-0ab75763-152e-4c7f-bb4f-6e6fb08f75ef.png)


Lancement du projet sur Docker :

Afin de lancer le projet sur docker, il faut faire appel à la commande suivante :

_docker-compose build_

      
