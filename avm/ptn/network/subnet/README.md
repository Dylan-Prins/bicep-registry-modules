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

- [Using only defaults](#example-1-using-only-defaults)
- [Using large parameter set](#example-2-using-large-parameter-set)

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

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`defaultOutboundAccess`](#parameter-defaultoutboundaccess) | bool | The default outbound access for the subnet. |
| [`delegations`](#parameter-delegations) | array | The delegations for the subnet. |
| [`disableBgpRoutePropagation`](#parameter-disablebgproutepropagation) | bool | Disable BGP route propagation. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`location`](#parameter-location) | string | Azure region where the each of the Private Link Private DNS Zones created will be deployed, default to Resource Group location if not specified. |
| [`lock`](#parameter-lock) | object | The lock settings for the Private Link Private DNS Zones created. |
| [`networkSecurityGroupName`](#parameter-networksecuritygroupname) | string | The name of the network security group. |
| [`privateLinkServiceNetworkPolicies`](#parameter-privatelinkservicenetworkpolicies) | string | Enable/Disable private link network policies. |
| [`routes`](#parameter-routes) | array | The routes for the route table. |
| [`routeTableName`](#parameter-routetablename) | string | The name of the route table. |
| [`securityRules`](#parameter-securityrules) | array | The security rules for the network security group. |
| [`serviceEndpoints`](#parameter-serviceendpoints) | array | An array of service endpoints. |
| [`tags`](#parameter-tags) | object | Tags of the Private Link Private DNS Zones created. |

### Parameter: `addressPrefix`

address prefix of the subnet.

- Required: Yes
- Type: string

### Parameter: `name`

name of the subnet.

- Required: Yes
- Type: string

### Parameter: `virtualNetworkResourceId`

ID of the virtual network.

- Required: Yes
- Type: string

### Parameter: `defaultOutboundAccess`

The default outbound access for the subnet.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `delegations`

The delegations for the subnet.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `disableBgpRoutePropagation`

Disable BGP route propagation.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `location`

Azure region where the each of the Private Link Private DNS Zones created will be deployed, default to Resource Group location if not specified.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `lock`

The lock settings for the Private Link Private DNS Zones created.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-lockkind) | string | Specify the type of lock. |
| [`name`](#parameter-lockname) | string | Specify the name of lock. |

### Parameter: `lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `lock.name`

Specify the name of lock.

- Required: No
- Type: string

### Parameter: `networkSecurityGroupName`

The name of the network security group.

- Required: No
- Type: string
- Default: `''`

### Parameter: `privateLinkServiceNetworkPolicies`

Enable/Disable private link network policies.

- Required: No
- Type: string
- Default: `'Disabled'`
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `routes`

The routes for the route table.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-routesname) | string | Name of the route. |
| [`properties`](#parameter-routesproperties) | object | Properties of the route. |

### Parameter: `routes.name`

Name of the route.

- Required: Yes
- Type: string

### Parameter: `routes.properties`

Properties of the route.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`nextHopType`](#parameter-routespropertiesnexthoptype) | string | The type of Azure hop the packet should be sent to. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressPrefix`](#parameter-routespropertiesaddressprefix) | string | The destination CIDR to which the route applies. |
| [`hasBgpOverride`](#parameter-routespropertieshasbgpoverride) | bool | A value indicating whether this route overrides overlapping BGP routes regardless of LPM. |
| [`nextHopIpAddress`](#parameter-routespropertiesnexthopipaddress) | string | The IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance. |

### Parameter: `routes.properties.nextHopType`

The type of Azure hop the packet should be sent to.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Internet'
    'None'
    'VirtualAppliance'
    'VirtualNetworkGateway'
    'VnetLocal'
  ]
  ```

### Parameter: `routes.properties.addressPrefix`

The destination CIDR to which the route applies.

- Required: No
- Type: string

### Parameter: `routes.properties.hasBgpOverride`

A value indicating whether this route overrides overlapping BGP routes regardless of LPM.

- Required: No
- Type: bool

### Parameter: `routes.properties.nextHopIpAddress`

The IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance.

- Required: No
- Type: string

### Parameter: `routeTableName`

The name of the route table.

- Required: No
- Type: string
- Default: `''`

### Parameter: `securityRules`

The security rules for the network security group.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-securityrulesname) | string | The name of the security rule. |
| [`properties`](#parameter-securityrulesproperties) | object | The properties of the security rule. |

### Parameter: `securityRules.name`

The name of the security rule.

- Required: Yes
- Type: string

### Parameter: `securityRules.properties`

The properties of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-securityrulespropertiesaccess) | string | Whether network traffic is allowed or denied. |
| [`direction`](#parameter-securityrulespropertiesdirection) | string | The direction of the rule. The direction specifies if rule will be evaluated on incoming or outgoing traffic. |
| [`priority`](#parameter-securityrulespropertiespriority) | int | Required. The priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule. |
| [`protocol`](#parameter-securityrulespropertiesprotocol) | string | Network protocol this rule applies to. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-securityrulespropertiesdescription) | string | The description of the security rule. |
| [`destinationAddressPrefix`](#parameter-securityrulespropertiesdestinationaddressprefix) | string | Optional. The destination address prefix. CIDR or destination IP range. Asterisk "*" can also be used to match all source IPs. Default tags such as "VirtualNetwork", "AzureLoadBalancer" and "Internet" can also be used. |
| [`destinationAddressPrefixes`](#parameter-securityrulespropertiesdestinationaddressprefixes) | array | The destination address prefixes. CIDR or destination IP ranges. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-securityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | The resource IDs of the application security groups specified as destination. |
| [`destinationPortRange`](#parameter-securityrulespropertiesdestinationportrange) | string | The destination port or range. Integer or range between 0 and 65535. Asterisk "*" can also be used to match all ports. |
| [`destinationPortRanges`](#parameter-securityrulespropertiesdestinationportranges) | array | The destination port ranges. |
| [`sourceAddressPrefix`](#parameter-securityrulespropertiessourceaddressprefix) | string | The CIDR or source IP range. Asterisk "*" can also be used to match all source IPs. Default tags such as "VirtualNetwork", "AzureLoadBalancer" and "Internet" can also be used. If this is an ingress rule, specifies where network traffic originates from. |
| [`sourceAddressPrefixes`](#parameter-securityrulespropertiessourceaddressprefixes) | array | The CIDR or source IP ranges. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-securityrulespropertiessourceapplicationsecuritygroupresourceids) | array | The resource IDs of the application security groups specified as source. |
| [`sourcePortRange`](#parameter-securityrulespropertiessourceportrange) | string | The source port or range. Integer or range between 0 and 65535. Asterisk "*" can also be used to match all ports. |
| [`sourcePortRanges`](#parameter-securityrulespropertiessourceportranges) | array | The source port ranges. |

### Parameter: `securityRules.properties.access`

Whether network traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `securityRules.properties.direction`

The direction of the rule. The direction specifies if rule will be evaluated on incoming or outgoing traffic.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `securityRules.properties.priority`

Required. The priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.

- Required: Yes
- Type: int

### Parameter: `securityRules.properties.protocol`

Network protocol this rule applies to.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `securityRules.properties.description`

The description of the security rule.

- Required: No
- Type: string

### Parameter: `securityRules.properties.destinationAddressPrefix`

Optional. The destination address prefix. CIDR or destination IP range. Asterisk "*" can also be used to match all source IPs. Default tags such as "VirtualNetwork", "AzureLoadBalancer" and "Internet" can also be used.

- Required: No
- Type: string

### Parameter: `securityRules.properties.destinationAddressPrefixes`

The destination address prefixes. CIDR or destination IP ranges.

- Required: No
- Type: array

### Parameter: `securityRules.properties.destinationApplicationSecurityGroupResourceIds`

The resource IDs of the application security groups specified as destination.

- Required: No
- Type: array

### Parameter: `securityRules.properties.destinationPortRange`

The destination port or range. Integer or range between 0 and 65535. Asterisk "*" can also be used to match all ports.

- Required: No
- Type: string

### Parameter: `securityRules.properties.destinationPortRanges`

The destination port ranges.

- Required: No
- Type: array

### Parameter: `securityRules.properties.sourceAddressPrefix`

The CIDR or source IP range. Asterisk "*" can also be used to match all source IPs. Default tags such as "VirtualNetwork", "AzureLoadBalancer" and "Internet" can also be used. If this is an ingress rule, specifies where network traffic originates from.

- Required: No
- Type: string

### Parameter: `securityRules.properties.sourceAddressPrefixes`

The CIDR or source IP ranges.

- Required: No
- Type: array

### Parameter: `securityRules.properties.sourceApplicationSecurityGroupResourceIds`

The resource IDs of the application security groups specified as source.

- Required: No
- Type: array

### Parameter: `securityRules.properties.sourcePortRange`

The source port or range. Integer or range between 0 and 65535. Asterisk "*" can also be used to match all ports.

- Required: No
- Type: string

### Parameter: `securityRules.properties.sourcePortRanges`

The source port ranges.

- Required: No
- Type: array

### Parameter: `serviceEndpoints`

An array of service endpoints.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `tags`

Tags of the Private Link Private DNS Zones created.

- Required: No
- Type: object

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `addressPrefix` | string | The name of the subnet. |
| `name` | string | The name of the subnet. |
| `resourceGroupName` | string | The name of the resource group that the Private DNS Zones are deployed into. |
| `resourceGroupResourceId` | string | The resource ID of the resource group that the Private DNS Zones are deployed into. |
| `resourceId` | string | The resource ID of the subnet. |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `br/public:avm/res/network/network-security-group:0.5.0` | Remote reference |
| `br/public:avm/res/network/route-table:0.4.0` | Remote reference |
| `br/public:avm/utl/types/avm-common-types:0.2.1` | Remote reference |

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
