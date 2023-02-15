@description('The bcp47 tag of the installed language')
@allowed(['en-us', 'en-gb', 'zh-cn', 'es-es'])
param language string

module setSystemLanguage 'task.bicep' = {
  name: '${deployment().name}-SetSystemLanguage'
  params: {
    name: 'Set the Windows OS language'
    description: 'Sets the language used by the Windows.'
    type: powerShellCommand
    powerShellCommand: 'Install-Language $language'
  }
}

output task object = setSystemLanguage.outputs.task
