targetScope='subscription'

// params
param resourceGroupName string = 'rgnavxNetwork'
param resourceGroupLocation string = 'eastus'

param navxVnetName string = 'navxVirtualNetwork'
param navxVnetLocation string = 'eastus'
param vnetPrefix string = '10.2.0.0/16'
param subnet1Name string = 'snet1'
param subnet2Name string = 'snet2'
param subnet1Prefix string = '10.2.0.0/24'
param subnet2Prefix string = '10.2.1.0/24'

param nsgName string = 'nsgmain01'
param nsgLocation string = 'eastus'

// resources

resource newRG 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module navxVnet 'vnet.bicep' = {
name: navxVnetName
scope: newRG
params: {
  virtualNetworkName: navxVnetName
  vnetLocation: navxVnetLocation 
  vnetPrefix: vnetPrefix 
  subnet1Name: subnet1Name
  subnet2Name: subnet2Name
  subnet1Prefix: subnet1Prefix
  subnet2Prefix: subnet2Prefix
  }
}

module networkSecurityGroup 'networkSecurityGroup.bicep' = {
  name: 'networkSecurityGroupDeployment'
  scope: newRG
  params: {
    // Required parameters
    name: nsgName
    // Non-required parameters
    location: nsgLocation
  }
}
