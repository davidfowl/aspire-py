targetScope = 'subscription'

param resourceGroupName string

param location string

param principalId string

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
}

module env 'env/env.bicep' = {
  name: 'env'
  scope: rg
  params: {
    location: location
    userPrincipalId: principalId
  }
}

output env_AZURE_CONTAINER_REGISTRY_NAME string = env.outputs.AZURE_CONTAINER_REGISTRY_NAME

output env_AZURE_CONTAINER_REGISTRY_ENDPOINT string = env.outputs.AZURE_CONTAINER_REGISTRY_ENDPOINT

output env_AZURE_CONTAINER_REGISTRY_MANAGED_IDENTITY_ID string = env.outputs.AZURE_CONTAINER_REGISTRY_MANAGED_IDENTITY_ID

output env_planId string = env.outputs.planId

output env_AZURE_CONTAINER_REGISTRY_MANAGED_IDENTITY_CLIENT_ID string = env.outputs.AZURE_CONTAINER_REGISTRY_MANAGED_IDENTITY_CLIENT_ID

output env_AZURE_APP_SERVICE_DASHBOARD_URI string = env.outputs.AZURE_APP_SERVICE_DASHBOARD_URI

output env_AZURE_WEBSITE_CONTRIBUTOR_MANAGED_IDENTITY_ID string = env.outputs.AZURE_WEBSITE_CONTRIBUTOR_MANAGED_IDENTITY_ID

output env_AZURE_WEBSITE_CONTRIBUTOR_MANAGED_IDENTITY_PRINCIPAL_ID string = env.outputs.AZURE_WEBSITE_CONTRIBUTOR_MANAGED_IDENTITY_PRINCIPAL_ID