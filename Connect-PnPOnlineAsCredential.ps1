param
(
    [Parameter(Mandatory=$true)]
    [String] $Url
)

$Credential = Get-AutomationPSCredential -Name 'SharePoint Admin'

$Connect = Connect-PnPOnline -Url $Url -Credentials $Credential

$Web = Get-PnPWeb | Select-Object Title, ServerRelativeUrl, Id
$Web | ConvertTo-Json -Compress