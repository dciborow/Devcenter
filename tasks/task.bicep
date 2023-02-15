param name string
param id string = uniqueString(name)
param description string
param inline array = []

module setSystemLanguage 'ImageTemplateCustomizer.bicep' = {
  name: '${deployment().name}-ImageTask'
  params: {
    imageTemplateCustomizerType: 'Powershell'
    inline: inline
  }
}

output task object = {
  id: id
  name: name
  description: description
  imageTemplateCustomizer: setSystemLanguage.outputs.imageTemplateCustomizer
}
