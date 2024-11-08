@description('Optional. The location to deploy to.')
param location string = resourceGroup().location

@description('Required. The name of the Virtual Network to create.')
param virtualNetworkName string

var addressPrefix = '10.0.0.0/16'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'subnet-1'
        properties: {
          addressPrefix: cidrSubnet(addressPrefix, 24, 0)
        }
      }
    ]
  }
}

@description('The resource ID of the created Virtual Network.')
output vnetResourceId string = virtualNetwork.id

@description('The address prefix of the created Virtual Network.')
output addressPrefix string = addressPrefix
