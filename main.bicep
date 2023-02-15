param location string
param repos array = []
param choco array = []

module devdeploy 'bicep/common.bicep' = {
  name: '${deployment().name}-DevDeploy'
  params: {
    location: location
    repos: repos
    choco: choco
  }
}
