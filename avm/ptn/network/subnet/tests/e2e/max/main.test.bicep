targetScope = 'subscription'

metadata name = 'Using large parameter set'
metadata description = 'This instance deploys the module with most of its features enabled.'

// ========== //
// Parameters //
// ========== //

@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-ptn-pl-pdns-zones-${serviceShort}-rg'

@description('Optional. The location to deploy resources to.')
param resourceLocation string = deployment().location

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'submax'

@description('Optional. A token to inject into the name of each resource. This value can be automatically injected by the CI.')
param namePrefix string = '#_namePrefix_#'

// ============ //
// Dependencies //
// ============ //

// General resources
// =================
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceLocation
}

module nestedDependencies 'dependencies.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, resourceLocation)}-nestedDependencies'
  params: {
    virtualNetworkName: 'dep-${namePrefix}-vnet-${serviceShort}'
    location: resourceLocation
  }
}

// ============== //
// Test Execution //
// ============== //

@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, resourceLocation)}-test-${serviceShort}-${iteration}'
    params: {
      name: 'subnet'
      addressPrefix: cidrSubnet(nestedDependencies.outputs.addressPrefix, 24, 0)
      virtualNetworkResourceId: nestedDependencies.outputs.vnetResourceId
      defaultOutboundAccess: true
      delegations: [
        {
          name: 'delegation-1'
          properties: {
            serviceName: 'Microsoft.ContainerInstance/containerGroups'
            actions: [
              'Microsoft.Network/virtualNetworks/subnets/action'
            ]
          }
        }
      ]
      disableBgpRoutePropagation: false
      location: 'eastus'
      lock: {
        kind: 'CanNotDelete'
        name: 'lock-1'
      }
      networkSecurityGroupName: 'nsg-1'
      privateLinkServiceNetworkPolicies: 'Disabled'
      routes: [
        {
          name: 'route-1'
          properties: {
            nextHopType: 'Internet'
            addressPrefix: '0.0.0.0/0'
            hasBgpOverride: false
            nextHopIpAddress: ''
          }
        }
      ]
      routeTableName: 'routeTable-1'
      securityRules: [
        {
          name: 'rule-1'
          properties: {
            access: 'Allow'
            description: 'Allow all traffic'
            destinationAddressPrefix: '*'
            destinationPortRange: '*'
            direction: 'Inbound'
            priority: 100
            protocol: 'Tcp'
            sourceAddressPrefix: '*'
            sourcePortRange: '*'
          }
        }
      ]
      serviceEndpoints: [
        {
          service: 'Microsoft.Storage'
          locations: [
            'eastus'
          ]
        }
      ]
      tags: {
        environment: 'test'
      }
    }
  }
]
