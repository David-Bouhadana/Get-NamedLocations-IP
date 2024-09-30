# Get-NamedLocations-IP

# M365 Get IP List from Entra Named Locations

## Description
Ce script PowerShell permet d'extraire et d'exporter toutes les adresses IP des **Named Locations** d'**Entra** (anciennement Azure AD) dans un fichier CSV.

Il s'agit d'un outil utile pour les administrateurs qui souhaitent obtenir une vue d'ensemble des politiques de localisation nommées et des adresses IP associées dans leur environnement Microsoft 365.

## Fonctionnalités
- Connexion à Azure AD avec authentification moderne (MFA supportée).
- Extraction des informations sur le tenant (Nom, ID).
- Récupération des politiques de localisation nommées.
- Exportation des adresses IP et autres détails dans un fichier CSV.
- Compatible avec les environnements M365.

## Utilisation
### Prérequis
- Le module **AzureAD** doit être installé pour exécuter le script. Vous pouvez l'installer avec la commande suivante :

    ```powershell
    Install-Module -Name AzureAD
    ```

### Paramètres
- **OutputFilePath** (optionnel) : Chemin du fichier CSV où les résultats seront exportés. Par défaut, le fichier sera nommé `Tenant-NamedLocation.csv` et sauvegardé dans le répertoire courant.

### Exemple d'exécution
Exécutez le script avec la commande suivante dans PowerShell :

```powershell
.\Get-EntraNamedLocationIPs.ps1 -OutputFilePath "C:\Chemin\Vers\Le\Fichier\Tenant-NamedLocation.csv"
```
Le script se connectera à Azure AD, extraira les adresses IP des Named Locations et les enregistrera dans le fichier spécifié.

## Export

Le fichier CSV généré contiendra les colonnes suivantes :

- **Id** : Identifiant de la politique de localisation nommée.
- **DisplayName** : Nom de la politique.
- **IsTrusted** : Indique si l'emplacement est de confiance.
- **Countries&Regions** : Pays ou régions couverts par la politique.
- **IncludeUnknownCountriesAndRegions** : Si les pays non reconnus sont inclus.
- **IPAddresses** : Liste des plages IP associées.
- **TenantName** : Nom du tenant.
- **TenantID** : Identifiant du tenant.

## Auteur

Script écrit par **David Bouhadana**.

- Blog : [Oghma Site](https://oghmasite.wordpress.com/)

## Licence

Ce projet est sous licence MIT. Veuillez consulter le fichier LICENSE pour plus de détails.
