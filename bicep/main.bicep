// main.bicep

targetScope = 'subscription'

@description('Resource Group Name')
param resourceGroupName string

@description('Azure Region')
param location string = 'francecentral'

module resourceGroup './resourcegroup.bicep' = {
  name: 'create-rg'

    params: {
    resourceGroupName: resourceGroupName
    location: location
  }
}
