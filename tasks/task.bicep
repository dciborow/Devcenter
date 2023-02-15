param name string
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
  name: name
  description: description
  imageTemplateCustomizer: setSystemLanguage.outputs.imageTemplateCustomizer
}
