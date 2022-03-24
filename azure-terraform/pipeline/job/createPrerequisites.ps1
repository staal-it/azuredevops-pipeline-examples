param(
    [string]$subscriptionId,

    [Parameter(Mandatory = $true)]
    [string]$resourceGroupName,
    
    [Parameter(Mandatory = $true)]
    [string]$storageAccountName,

    [Parameter(Mandatory = $true)]
    [string]$containerName,

    # This should be Deny always in prod. Use allowedSubnets or Private Endpoints in production
    [string]$publicNetworkAction = "Deny",

    [string[]]$allowedSubnetIds = @()
)

$ErrorActionPreference = "Stop"
$location = "westeurope"
$sku = "Standard_LRS"

az  group create -l $location -g $resourceGroupName

az storage account create --subscription $subscriptionId --resource-group $resourceGroupName --name $storageAccountName --sku $sku --allow-blob-public-access true --min-tls-version TLS1_2 --default-action $publicNetworkAction --allow-cross-tenant-replication false 

az storage container create --subscription $subscriptionId --account-name $storageAccountName --name $containerName --auth-mode login

$addedANetworkRule = $false
foreach ($subnetId in $subnetIds) {
    az storage account network-rule add --subscription $subscriptionId --resource-group $resourceGroupName --account-name $storageAccountName --subnet $subnetId

    $addedANetworkRule = $true
}

if ($addedANetworkRule) {
    $sleepSecondsAfterAdds = 60
    Write-Output ("Giving the firewall rules some time to settle.. ({0} seconds)" -f $sleepSecondsAfterAdds)
    Start-Sleep -Seconds $sleepSecondsAfterAdds
    Write-Output "done"
}