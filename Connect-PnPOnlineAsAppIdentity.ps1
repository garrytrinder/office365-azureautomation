param
(
    [Parameter(Mandatory=$true)]
    [String] $Url
)

$AppId = Get-AutomationVariable -Name 'SharePointAppId'
$AppSecret = Get-AutomationVariable -Name 'SharePointAppSecret'

Connect-PnPOnline -AppId $AppId -AppSecret $AppSecret -Url $Url

$Web = Get-PnPWeb | Select-Object Title, ServerRelativeUrl, Id
$Web | ConvertTo-Json -Compress

Disconnect-PnPOnline