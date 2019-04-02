param
(
    [Parameter(Mandatory=$true)]
    [String] $Url,
    [Parameter(Mandatory=$true)]
    [String] $Title
)

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'

# create connection to SharePoint site
$Connect = Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $Url

# create modern team site
$Site = New-PnPSite -Type TeamSite -Title $Title -Url $Url -Wait

# clean up SharePoint connection
$Disconnect = Disconnect-PnPOnline