
@description('Azure Region')
param location string

@description('Name of the Virtual Network.')
param vnetName string = 'my-vnet'

@description('Address prefix for the Virtual Network.')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Name of the default subnet.')
param subnetName string = 'webapp-subnet'

@description('Address prefix for the default subnet.')
param subnetAddressPrefix string = '10.0.1.0/24'


resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
}

output vnetId string = virtualNetwork.id
output subnetId string = virtualNetwork.properties.subnets[0].id
