param name string
param id string = uniqueString(name)
param description string
param inline array = []

module imageTemplate 'ImageTemplateCustomizer.bicep' = {
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
  imageTemplateCustomizer: imageTemplate.outputs.imageTemplateCustomizer
}
