Function Get-GuacUserGroupConnection()
{
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [System.String]
        $DataSource,

        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 1,
            Mandatory = $true
        )]
        [System.String]
        $Group
    )

    begin
    {
        $Uri = "$Server/api/session/data/$($DataSource)/userGroups/$($Group)/permissions?token=$($Token)"
    }
    process
    {
        try
        {
            $RestCall = Invoke-RestMethod -Method GET -Uri $Uri -ContentType 'application/json'
        }
        catch
        {
            Write-Warning $_.Exception.Message
            return $False
        }
    }
    end
    {
        return $RestCall
    }
}

<#
Get-GuacUserGroupConnection -DataSource mysql -Group "test"
#>
