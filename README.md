# Exercice C# : Création d'un Web Service REST avec Singleton et Connexion à une BDD MySQL

Ce projet est un exercice de création d'un web service REST en C# à partir de zéro. Il inclut l'utilisation d'un Singleton pour gérer la connexion à une base de données MySQL.

## Prérequis

- .NET Core SDK
- MySQL Server

## Installation

1. **Cloner le repository :**
   ```sh
   git clone https://github.com/votre-utilisateur/votre-repo.git
   cd votre-repo
   ```

2. **Installer les dépendances :**
   Le projet utilise le package NuGet `MySQL.Data` pour se connecter à la base de données MySQL.
   ```sh
   dotnet add package MySql.Data
   ```

3. **Configurer la base de données :**
   Exécutez le script de création de la base de données fourni dans le fichier [script_creation_bdd.sql](lien-vers-le-fichier) pour configurer votre base de données MySQL.

## Utilisation

1. **Configurer la chaîne de connexion :**
   Mettez à jour les informations de connexion à la base de données dans `DB.cs` avec vos informations de connexion MySQL.
   ```C#
        private static string host = "localhost";
        private static string user = "root";
        private static string pwd = "";
        private static string db = "gestion_agricole";
   ```

2. **Lancer l'application :**
   ```sh
   dotnet run
   ```

3. **Accéder à l'API :**
   Une fois l'application lancée, vous pouvez accéder à l'API via `http://localhost:8080/votre_endpoint`.

## Exemples de Requêtes

- **GET** : `http://localhost:8080/Req1`
- **GET** : `http://localhost:8080/Req2`

## Ressources

- [Documentation .NET](https://docs.microsoft.com/fr-fr/dotnet/)
- [MySQL.Data sur NuGet](https://www.nuget.org/packages/MySql.Data/)

## Contribuer

Les contributions sont les bienvenues ! Veuillez soumettre une pull request ou ouvrir une issue pour discuter des changements que vous souhaitez apporter.

## Auteurs

- Nahim BENBAHLOULI

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
