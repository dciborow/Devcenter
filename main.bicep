param location string
param devboxJson = 'devbox.json'

param repos array = loadJsonContent(devboxJson, 'repos')
param choco array = loadJsonContent(devboxJson, 'choco')

@allowed(["en-us", "en-gb", "zh-cn", "es-es"])
param language string = loadJsonContent(devboxJson, 'language')

module setSystemLanguage 'tasks/setSystemLanguage.bicep' = {
  name: '${deployment().name}-SetSystemLanguage'
  params: {
    language: language
  }
}

module devdeploy 'bicep/aib.bicep' = {
  name: '${deployment().name}-DevDeploy'
  params: {
    location: location
    repos: repos
    choco: choco
    tasks: [
      setSystemLanguage.outputs.task
    ]
  }
}
