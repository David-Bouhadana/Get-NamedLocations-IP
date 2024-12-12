<#
\\\\\!!!!!/////=====================================================================\\\\\!!!!!/////
Name:           M365 Get IP list from Entra Named Locations
Description:    This script export all ip from Entra Named Locations to a csv file.
website:        https://m365journey.blog/
Script by:      David Bouhadana
\\\\\!!!!!/////=====================================================================\\\\\!!!!!/////
#>

param (
    [string]$OutputFilePath = ".\Tenant-NamedLocation.csv"
)

# Fonction pour se connecter à Azure AD (Modern Auth et MFA compatible)
# Function to connect to Azure AD (Modern Auth and MFA compatible)
function Connect-ToAzureAD {
    try {
        Connect-AzureAD -ErrorAction Stop
        Write-Host "Connexion a Azure AD reussie.|Azure AD login successful."
    } catch {
        Write-Error "Echec de la connexion a Azure AD|Azure AD connection failed : $_"
        exit
    }
}

# Fonction pour obtenir les détails du tenant
# Function to get tenant details
function Get-TenantDetails {
    try {
        $tenantDetails = Get-AzureADTenantDetail -ErrorAction Stop
        return $tenantDetails
    } catch {
        Write-Error "Echec de la récupération des details du tenant|Failed to retrieve tenant details : $_"
        exit
    }
}

# Fonction pour obtenir les politiques de localisation nommées
# Function to get named localization policies
function Get-NamedLocationPolicies {
    try {
        $policies = Get-AzureADMSNamedLocationPolicy -ErrorAction Stop
        return $policies
    } catch {
        Write-Error "Echec de la recuperation des politiques de localisation nommees|Failed to retrieve named location policies : $_"
        exit
    }
}

# Fonction principale
# Main function
function Main {
    Connect-ToAzureAD

    $tenantDetails = Get-TenantDetails
    $tenantName = $tenantDetails.DisplayName
    $tenantID = $tenantDetails.ObjectID

    $namedLocationPolicies = Get-NamedLocationPolicies

    foreach ($policy in $namedLocationPolicies) {
        $IPrange = ($policy | Select-Object -ExpandProperty IPranges) | Select-Object -ExpandProperty CidrAddress
        $CountriesAndRegions = $policy | Select-Object -ExpandProperty CountriesAndRegions

        $result = $policy | Select-Object Id, DisplayName, IsTrusted, @{l = "Countries&Regions"; e = { $CountriesAndRegions } }, IncludeUnknownCountriesAndRegions, CidrAddress

        $result | Select-Object *, @{l = "IPAddresses"; e = { $IPrange } }, @{l = "TenantName"; e = { $tenantName } }, @{l = "TenantID"; e = { $tenantID } } | Export-Csv -Path $OutputFilePath -NoTypeInformation -Append
    }

    Write-Host "Exportation des resultats terminee|Exporting results completed : $OutputFilePath"
}

# Exécution de la fonction principale
# Execution of the main function
Main
