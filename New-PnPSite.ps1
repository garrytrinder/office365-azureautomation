param
(
    [Parameter(Mandatory=$true)]
    [String] $Alias,
    [Parameter(Mandatory=$true)]
    [String] $Title
)

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'

# create connection to SharePoint site
$Connect = Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $Url

# create modern team site
$Site = New-PnPSite -Type TeamSite -Title $Title -Alias $Alias -Wait

@{"Url" = $Site } | ConvertTo-Json -Compress

# clean up SharePoint connection
$Disconnect = Disconnect-PnPOnline