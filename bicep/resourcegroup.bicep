
targetScope = 'subscription'

@description('Resource Group Name')
param resourceGroupName string

@description('Azure Region')
param location string
  
resource rg 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupId string = rg.id
