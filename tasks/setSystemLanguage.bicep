@description("The bcp47 tag of the language that you're installing")
@allowed(["en-us", "en-gb", "zh-cn", "es-es"])
param language string

output task object = {
  name: 'Set the Windows OS language'
  description: 'Sets the language used by the Windows.'
  type: powerShellCommand
  powerShellCommand: 'Install-Language $language'
}
