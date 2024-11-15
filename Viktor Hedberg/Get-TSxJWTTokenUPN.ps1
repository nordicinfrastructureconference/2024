function Get-TSxJWTTokenUPN {
    [cmdletbinding()]
    param([Parameter(Mandatory=$true)]
    [string]$AccessToken
    )
 
        #Validate as per https://tools.ietf.org/html/rfc7519
        #Access and ID tokens are fine, Refresh tokens will not work
        if (!$AccessToken.Contains(".") -or !$AccessToken.StartsWith("eyJ")) { Write-Error "Invalid token" -ErrorAction Stop }
 
            <#Header
            $Tokenheader = $AccessToken.Split(".")[0].Replace('-', '+').Replace('_', '/')
            #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
            while ($Tokenheader.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $Tokenheader += "=" }
            Write-Verbose "Base64 encoded (padded) header:"
            Write-Verbose $Tokenheader
            #Convert from Base64 encoded string to PSObject all at once
            Write-Verbose "Decoded header:"
            [System.Text.Encoding]::ASCII.GetString([system.convert]::FromBase64String($Tokenheader)) | ConvertFrom-Json
            #>
 
            #Payload
            $TokenPayload = $AccessToken.Split(".")[1].Replace('-', '+').Replace('_', '/')
            #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
            while ($TokenPayload.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $tokenPayload += "=" }
            Write-Verbose "Base64 encoded (padded) payoad:"
            Write-Verbose $TokenPayload
            #Convert to Byte array
            $tokenByteArray = [System.Convert]::FromBase64String($tokenPayload)
            #Convert to string array
            $tokenArray = [System.Text.Encoding]::ASCII.GetString($tokenByteArray)
            Write-Verbose "Decoded array in JSON format:"
            Write-Verbose $tokenArray
            #Convert from JSON to PSObject
            $tokobj = $tokenArray | ConvertFrom-Json
            Write-Verbose "Decoded Payload:"
        
        $Global:TSxUserAccountID = $tokobj.upn
        
        if ($tokobj.aud -eq "https://graph.windows.net") {
            $Global:TSxAADGraphTokenAudience = $tokobj.aud 
        }

        else {}

        if ($tokobj.aud -eq "https://graph.microsoft.com") {
            $Global:TSxMSGraphTokenAudience = $tokobj.aud
        }
        
        else {}
        
}