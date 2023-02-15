param location string
param repos array = []

module devdeploy 'bicep/common.bicep' = {
  name: '${deployment().name}-DevDeploy'
  params: {
    repos: repos
    location: location
  }
}
