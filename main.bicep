targetScope='subscription'

// params
param resourceGroupName string = 'rgPLXNetwork'
param resourceGroupLocation string = 'eastus'
param plxVnetName string = 'plxVirtualNetwork'
param plxVnetLocation string = 'eastus'
param vnetPrefix string = '10.2.0.0/16'
param subnet1Name string = 'snet1'
param subnet2Name string = 'snet2'
param subnet1Prefix string = '10.2.0.0/24'
param subnet2Prefix string = '10.2.1.0/24'


// resources

resource newRG 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module plxVnet 'vnet.bicep' = {
name: plxVnetName
scope: newRG
params: {
  virtualNetworkName: plxVnetName
  vnetLocation: plxVnetLocation 
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
    name: 'nsgmain01'
    // Non-required parameters
    location: 'eastus'
  }
}
