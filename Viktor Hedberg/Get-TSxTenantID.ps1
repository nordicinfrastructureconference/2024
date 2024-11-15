<#
.SYNOPSIS
Retrieves the Tenant ID for a given domain.

.DESCRIPTION
The Get-TSxTenantID function retrieves the Tenant ID for a specified domain by making a request to the Microsoft Azure Active Directory endpoint. It then extracts the Tenant ID from the response and assigns it to the global variable $Global:TSxTenantID.

.PARAMETER Domain
The domain for which the Tenant ID needs to be retrieved.

.EXAMPLE
Get-TSxTenantID -Domain "contoso.com"

This example retrieves the Tenant ID for the domain "contoso.com" and assigns it to the global variable $Global:TSxTenantID.

#>
function Get-TSxTenantID {
    param (
        [parameter(Position=0,Mandatory)]
        [string]$Domain
        )
            $tid = Invoke-WebRequest -Uri https://login.microsoftonline.com/$domain/.well-known/openid-configuration
            $idwithslash = (($tid.Content | ConvertFrom-Json).issuer).Replace('https://sts.windows.net/','')
            $TenantId = $idwithslash.replace('/','')

        $Global:TSxTenantID = $TenantID
    }
