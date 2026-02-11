targetScope = 'subscription'

param environment string
param location string = 'westeurope'

var resourceGroupName = 'rg-bicep-example-${environment}'

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

module storageAccount 'modules/storageAccount.bicep' = {
  name: 'storageAccountDeploy'
  scope: rg
  params: {
    environment: environment
    location: location
  }
}
