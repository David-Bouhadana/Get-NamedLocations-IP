# Get-NamedLocations-IP

# M365 Get IP List from Entra Named Locations

## Description
This PowerShell script extracts and exports all IP addresses from **Named Locations** in **Entra** (formerly Azure AD) to a CSV file.

It is a useful tool for administrators who want an overview of the named location policies and associated IP addresses within their Microsoft 365 environment.

## Features
- Connect to Azure AD with modern authentication (MFA supported).
- Extract tenant details (Name, ID).
- Retrieve named location policies.
- Export IP addresses and other details to a CSV file.
- Compatible with M365 environments.

## Usage
### Prerequisites
- The **AzureAD** module must be installed to run the script. You can install it using the following command:

    ```powershell
    Install-Module -Name AzureAD
    ```

### Parameters
- **OutputFilePath** (optional): Path to the CSV file where the results will be exported. By default, the file will be named `Tenant-NamedLocation.csv` and saved in the current directory.

### Example of Execution
Run the script with the following command in PowerShell:

```powershell
.\Get-EntraNamedLocationIPs.ps1 -OutputFilePath "C:\Path\To\File\Tenant-NamedLocation.csv"
```
The script will connect to Azure AD, extract the IP addresses from the Named Locations, and save them in the specified file.

## Export

The generated CSV file will contain the following columns:

- **Id**: Identifier of the named location policy.
- **DisplayName**: Name of the policy.
- **IsTrusted**: Indicates if the location is trusted.
- **Countries&Regions**: Countries or regions covered by the policy.
- **IncludeUnknownCountriesAndRegions**: Whether unknown countries are included.
- **IPAddresses**: List of associated IP ranges.
- **TenantName**: Name of the tenant.
- **TenantID**: Identifier of the tenant.

## Author

Script written by **David Bouhadana**.

- Blog: [Oghma Site](https://oghmasite.wordpress.com/)

## License

This project is licensed under **GNU GPL 3**. You are free to use, modify, and distribute this code as long as the modifications and derived versions are also licensed under GNU GPL 3. For more information, please refer to the full license text [GNU GPL 3](https://www.gnu.org/licenses/gpl-3.0.html).
