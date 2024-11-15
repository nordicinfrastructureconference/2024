Break

#To prevent accidental execution


Get-TSxAccessToken -GraphApi AADGraph -DomainName domain.com
  
#Set the required variables
    $ApiVersion = "1.61-internal"

    if ($null -eq $Headers) {
        $Headers = @{}
    }
    $Headers["Authorization"] = "Bearer $global:TSxAADGraphToken"



$response = Invoke-RestMethod -UseBasicParsing -Uri "https://graph.windows.net/$Global:TSxTenantId/users?api-version=$ApiVersion" -ContentType "application/json; charset=utf-8; odata.metadata=none" -Method Get -Body $Body -Headers $Headers -ErrorAction SilentlyContinue
$users = $response.value
$users | Select-Object UserPrincipalName,DisplayName

$response = Invoke-RestMethod -UseBasicParsing -Uri "https://graph.windows.net/$Global:TSxTenantId/authorizationPolicy?api-version=$ApiVersion" -ContentType "application/json; charset=utf-8; odata.metadata=none" -Method Get -Body $Body -Headers $Headers -ErrorAction SilentlyContinue
$authorizationPolicy = $response.value
$authorizationPolicy

$response = Invoke-RestMethod -UseBasicParsing -Uri "https://graph.windows.net/$Global:TSxTenantId/policies?api-version=$ApiVersion" -ContentType "application/json; charset=utf-8; odata.metadata=none" -Method Get -Body $Body -Headers $Headers -ErrorAction SilentlyContinue
$CAPolicies = $response.value
$CAPolicies | Where-Object policyType -EQ "18" | Where-Object displayName -ne "Default Policy"

