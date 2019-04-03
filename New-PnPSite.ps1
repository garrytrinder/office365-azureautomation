param
(
    [Parameter(Mandatory=$true)]
    [String] $Alias,
    [Parameter(Mandatory=$true)]
    [String] $Title
)

$ErrorActionPreference = "Stop"

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'
$AdminUrl = Get-AutomationVariable -Name 'SharePointAdminUrl'

# create connection to SharePoint site
$Connect = Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $AdminUrl

# create modern team site
$Site = New-PnPSite -Type TeamSite -Title $Title -Alias $Alias

# output site url as JSON
@{"Url" = $Site } | ConvertTo-Json -Compress
