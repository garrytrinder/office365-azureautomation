param
(
    [Parameter(Mandatory=$true)]
    [String] $Url
)

$ErrorActionPreference = "Stop"

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'

$Connect = Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $Url

$Web = Get-PnPWeb | Select-Object Title, ServerRelativeUrl, Id
$Web | ConvertTo-Json -Compress