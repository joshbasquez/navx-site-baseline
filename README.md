# plx site baseline bicep templates
## configure params in main.bicep

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

param nsgName string = 'nsgmain01'
param nsgLocation string = 'eastus'

## deploy via commandline
In vscode, deploy via az module:

az deployment sub create -f main.bicep -l eastus
