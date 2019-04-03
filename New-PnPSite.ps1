param
(
    [Parameter(Mandatory=$true)]
    [String] $Alias,
    [Parameter(Mandatory=$true)]
    [String] $Title
)

$ErrorActionPreference = "Stop"

$Credential = Get-AutomationPSCredential -Name 'SharePoint Admin'
$AdminUrl = Get-AutomationVariable -Name 'SharePointAdminUrl'

# New-PnPSite does not support App Only calls
# create connection to SharePoint site
$Connect = Connect-PnPOnline -Url $AdminUrl -Credentials $Credential

# create modern team site
$Site = New-PnPSite -Type TeamSite -Title $Title -Alias $Alias

# output site url as JSON
@{"Url" = $Site } | ConvertTo-Json -Compress

$Disconnect = Disconnect-PnPOnline