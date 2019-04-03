Param(
    [Parameter(Mandatory=$true)]
    [string]$SiteUrl,
    [Parameter(Mandatory=$true)]
    [xml]$Template
)

$ErrorActionPreference = "Stop"

# store XML as local file
$Template.save("$home\template.xml")

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'

# create connection to SharePoint site
$Connect = Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $SiteUrl

# apply template
$ApplyPnPProvisioningTemplate = Apply-PnPProvisioningTemplate -Path "$home\template.xml" -Wait

# clean up SharePoint connection
$Disconnect = Dis-PnPOnline