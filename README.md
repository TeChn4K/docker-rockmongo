# Présenation

Ce repository contient le nécessaire pour builder une image Docker de Rockmongo 1.1.7.

Le fichier de configuration Rockmongo est modifié afin de donner la possibilité de paramétrer les serveurs auxquels se connecter via des variables d'environnement.


# Build

Clonez le repository :

```
git clone https://github.com/TeChn4K/docker-rockmongo.git
```

Placez vous dans le dossier et buildez l'image :

```
docker build -t docker-rockmongo .
```

# Run

Il est possible de passer un ou plusieurs serveurs auxquels Rockmongo pourra se connecter.

Exemple avec un seul serveur : 

`docker run --name rockmongo -p 80:80 -e "MONGO_NAME=localhost" -e "MONGO_HOST=127.0.0.1" docker-rockmongo`

Exemple avec plusieurs serveurs, séparées par des pipe (|) :

`docker run --name rockmongo -p 80:80 -e "MONGO_NAME=localhost|server2" -e "MONGO_HOST=127.0.0.1|192.168.1.100" docker-rockmongo`
