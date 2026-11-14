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

@description('Name of the Virtual Network.')
param vnetName string = 'prod-vnet'

@description('Name of the default subnet.')
param subnetName string = 'webapp-subnet'

@description('Address prefix for the Virtual Network.')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Address prefix for the default subnet.')
param subnetAddressPrefix string = '10.0.1.0/24'

module networkModule './network.bicep' = {
  name: 'deploy-vnet-module'
  scope: az.resourceGroup(resourceGroupName)
  dependsOn: [
    resourceGroup
  ]
  params: {
    location: location
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnetName: subnetName
    subnetAddressPrefix: subnetAddressPrefix
  }
}
