<#
.SYNOPSIS
    Retrieves an access token for the specified Graph API.

.DESCRIPTION
    The Get-TSxAccessToken function retrieves an access token for the specified Graph API. It supports two Graph APIs: AADGraph and MSGraph.
    The function prompts for user interaction to authenticate and authorize the application.

.PARAMETER GraphApi
    Specifies the Graph API to retrieve the access token for. Valid values are 'AADGraph' and 'MSGraph'.

.EXAMPLE
    Get-TSxAccessToken -GraphApi 'MSGraph'
    Retrieves an access token for the Microsoft Graph API.

.EXAMPLE
    Get-TSxAccessToken -GraphApi 'AADGraph'
    Retrieves an access token for the Azure AD Graph API.

.OUTPUTS
    The function outputs the access token to the global variable $TSxGraphToken.

.NOTES
    Requires the MSAL.PS module to be installed.

.LINK
    https://docs.microsoft.com/powershell/module/msal.ps/

#>


function Get-TSxAccessToken {
    param (
    [Parameter(Position=0,Mandatory)]
        [ValidateSet('AADGraph','MSGraph')]
        [string]$GraphApi,
    [Parameter(Position=1,Mandatory)]
        [string]$DomainName
        )

        $DomainTenantID = Get-TSxTenantId -Domain $DomainName

        if ($GraphApi -eq 'MSGraph'){
                $connectionDetails = @{
                    'TenantId'    = $DomainTenantID
                    'ClientId'    = '04b07795-8ddb-461a-bbee-02f9e1bf7b46' #Azure CLI
                    'Scope'       =  'https://graph.microsoft.com/.default'
                    'Interactive' = $true
                    }
                $TSxMSAccessToken = (Get-MsalToken @connectionDetails).AccessToken
                $Global:TSxMSGraphToken = $TSxMSAccessToken
            }

        else {
            #Write-Error "Invalid Graph API specified. Valid values are 'AADGraph' and 'MSGraph'."
            #Break
        }

        if ($GraphApi -eq 'AADGraph'){

                $connectionDetails = @{
                    'TenantId'    = $DomainTenantID
                    'ClientId'    = '1b730954-1685-4b74-9bfd-dac224a7b894' #Azure AD PowerShell
                    'Scope'       =  'https://graph.windows.net/.default'
                    'Interactive' = $true
                }
                $TSxAADAccessToken = (Get-MsalToken @connectionDetails).AccessToken
                $Global:TSxAADGraphToken = $TSxAADAccessToken
            }

        else {
            #Write-Error "Invalid Graph API specified. Valid values are 'AADGraph' and 'MSGraph'."
            #Break
        }


        
        
        
        
    }