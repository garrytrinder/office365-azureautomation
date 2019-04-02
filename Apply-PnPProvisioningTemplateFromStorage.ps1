Param(
    [Parameter(Mandatory=$true)]
    [string]$CredentialName,
    [Parameter(Mandatory=$true)]
    [string]$SiteUrl,
    [Parameter(Mandatory=$true)]
    [string]$TemplateName,
    [Parameter(Mandatory=$true)]
    [string]$StorageAccountName,
    [Parameter(Mandatory=$true)]
    [string]$StorageAccountResourceGroupName,
    [Parameter(Mandatory=$true)]
    [string]$StorageContainerName
)

$ErrorActionPreference = "Stop"

# connect to Azure using credential provided
Login-AzureRmAccount -Credential (Get-AutomationPSCredential -Name $CredentialName)

# get the key to access the Storage Account
$keys = Get-AzureRmStorageAccountKey -ResourceGroupName $StorageAccountResourceGroupName -Name $StorageAccountName

# get Azure Storage Account context
$context = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $keys.Key1

# get a list of all the files in the container
$blobs = Get-AzureStorageBlob -Container $StorageContainerName -Context $context

# download all blobs locally
$blobs | ForEach-Object {
    Get-AzureStorageBlobContent -Blob $_.Name -Destination "$home\$($_.Name)" -Context $context -Container $StorageContainerName
}

# create connection to SharePoint site
Connect-PnPOnline -Url $SiteUrl -Credentials (Get-AutomationPSCredential -Name $CredentialName)

# apply template
Apply-PnPProvisioningTemplate -Path "$home\$TemplateName"

# clean up SharePoint connection
Disconnect-PnPOnline
