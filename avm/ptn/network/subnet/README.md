# avm/ptn/network/subnet `[Network/Subnet]`

Subnet module for landingzones with existing VNETs

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.Insights/diagnosticSettings` | [2021-05-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings) |
| `Microsoft.Network/networkSecurityGroups` | [2023-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/networkSecurityGroups) |
| `Microsoft.Network/routeTables` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/routeTables) |
| `Microsoft.Network/virtualNetworks/subnets` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-01-01/virtualNetworks/subnets) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/ptn/network/subnet:<version>`.

- [avm/ptn/network/subnet `[Network/Subnet]`](#avmptnnetworksubnet-networksubnet)
  - [Navigation](#navigation)
  - [Resource Types](#resource-types)
  - [Usage examples](#usage-examples)
    - [Example 1: _Using only defaults_](#example-1-using-only-defaults)
    - [Example 2: _Using large parameter set_](#example-2-using-large-parameter-set)
  - [Parameters](#parameters)

### Example 1: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module subnet 'br/public:avm/ptn/network/subnet:<version>' = {
  name: 'subnetDeployment'
  params: {
    // Required parameters
    addressPrefix: '<addressPrefix>'
    name: 'subnet'
    virtualNetworkResourceId: '<virtualNetworkResourceId>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "addressPrefix": {
      "value": "<addressPrefix>"
    },
    "name": {
      "value": "subnet"
    },
    "virtualNetworkResourceId": {
      "value": "<virtualNetworkResourceId>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/network/subnet:<version>'

// Required parameters
param addressPrefix = '<addressPrefix>'
param name = 'subnet'
param virtualNetworkResourceId = '<virtualNetworkResourceId>'
```

</details>
<p>

### Example 2: _Using large parameter set_

This instance deploys the module with most of its features enabled.


<details>

<summary>via Bicep module</summary>

```bicep
module subnet 'br/public:avm/ptn/network/subnet:<version>' = {
  name: 'subnetDeployment'
  params: {
    // Required parameters
    addressPrefix: '<addressPrefix>'
    name: 'subnet'
    virtualNetworkResourceId: '<virtualNetworkResourceId>'
    // Non-required parameters
    defaultOutboundAccess: true
    delegations: [
      {
        name: 'delegation-1'
        properties: {
          actions: [
            'Microsoft.Network/virtualNetworks/subnets/action'
          ]
          serviceName: 'Microsoft.ContainerInstance/containerGroups'
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
          addressPrefix: '0.0.0.0/0'
          hasBgpOverride: false
          nextHopIpAddress: ''
          nextHopType: 'Internet'
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
        locations: [
          'eastus'
        ]
        service: 'Microsoft.Storage'
      }
     ]
    tags: {
      environment: 'test'
     }
   }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "addressPrefix": {
      "value": "<addressPrefix>"
    },
    "name": {
      "value": "subnet"
    },
    "virtualNetworkResourceId": {
      "value": "<virtualNetworkResourceId>"
    },
    // Non-required parameters
    "defaultOutboundAccess": {
      "value": true
    },
    "delegations": {
      "value": [
        {
          "name": "delegation-1",
          "properties": {
            "actions": [
              "Microsoft.Network/virtualNetworks/subnets/action"
            ],
            "serviceName": "Microsoft.ContainerInstance/containerGroups"
          }
        }
      ]
    },
    "disableBgpRoutePropagation": {
      "value": false
    },
     "location": {
      "value": "eastus"
     },
     "lock": {
       "value": {
         "kind": "CanNotDelete",
         "name": "lock-1"
       }
     },
    "networkSecurityGroupName": {
      "value": "nsg-1"
    },
    "privateLinkServiceNetworkPolicies": {
      "value": "Disabled"
    },
    "routes": {
       "value": [
        {
          "name": "route-1",
          "properties": {
            "addressPrefix": "0.0.0.0/0",
            "hasBgpOverride": false,
            "nextHopIpAddress": "",
            "nextHopType": "Internet"
          }
        }
       ]
     },

    "routeTableName": {
      "value": "routeTable-1"
    },
    "securityRules": {
      "value": [
        {
          "name": "rule-1",
          "properties": {
            "access": "Allow",
            "description": "Allow all traffic",
            "destinationAddressPrefix": "*",
            "destinationPortRange": "*",
            "direction": "Inbound",
            "priority": 100,
            "protocol": "Tcp",
            "sourceAddressPrefix": "*",
            "sourcePortRange": "*"
          }
        }
      ]
     },
    "serviceEndpoints": {
       "value": [
        {
          "locations": [
            "eastus"
          ],
          "service": "Microsoft.Storage"
        }
       ]
    },
    "tags": {
      "value": {
        "environment": "test"
      }
     }
   }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/network/subnet:<version>'

// Required parameters
param addressPrefix = '<addressPrefix>'
param name = 'subnet'
param virtualNetworkResourceId = '<virtualNetworkResourceId>'
// Non-required parameters
param defaultOutboundAccess = true
param delegations = [
  {
    name: 'delegation-1'
    properties: {
      actions: [
        'Microsoft.Network/virtualNetworks/subnets/action'
      ]
      serviceName: 'Microsoft.ContainerInstance/containerGroups'
    }
  }
]
param disableBgpRoutePropagation = false
param location = 'eastus'
param lock = {
  kind: 'CanNotDelete'
  name: 'lock-1'
}
param networkSecurityGroupName = 'nsg-1'
param privateLinkServiceNetworkPolicies = 'Disabled'
param routes = [
  {
    name: 'route-1'
    properties: {
      addressPrefix: '0.0.0.0/0'
      hasBgpOverride: false
      nextHopIpAddress: ''
      nextHopType: 'Internet'
    }
  }
]
param routeTableName = 'routeTable-1'
param securityRules = [
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
param serviceEndpoints = [
  {
    locations: [
      'eastus'
    ]
    service: 'Microsoft.Storage'
  }
]
param tags = {
  environment: 'test'
}
```

</details>
<p>

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressPrefix`](#parameter-addressprefix) | string | address prefix of the subnet. |
| [`name`](#parameter-name) | string | name of the subnet. |
| [`virtualNetworkResourceId`](#parameter-virtualnetworkresourceid) | string | ID of the virtual network. |

