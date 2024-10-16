# Import the Azure module
Import-Module Az

# Define parameters
param (
    [string]$storageAccountName,
    [string]$location = "West Europe"
)

# Authenticate to Azure
Connect-AzAccount

# Create a resource group
$resourceGroupName = "example-resources"
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS" `
    -Kind "StorageV2"

# Output the storage account details
$storageAccount | Format-List