
@allowed(['File', 'Powershell', 'Shell', 'WindowRestart', 'WindowsUpdate'])
param imageTemplateCustomizerType string

param inline array = []
param sha256Checksum string = ''
param scriptUri string = ''

param destination string = ''
param sourceUri string = ''

var imageTemplateCustomizerFile = {
  type: 'File'
  destination: destination
  sha256Checksum: sha256Checksum
  sourceUri: sourceUri
}


param runAsSystem bool = false
param runElevated bool = false
param validExitCodes array = [0]

var imageTemplateCustomizerPowershell = {
  type: 'Powershell'
  inline: inline
  runAsSystem: runAsSystem
  runElevated: runElevated
  scriptUri: scriptUri
  sha256Checksum: sha256Checksum
  validExitCodes: validExitCodes
}

var imageTemplateCustomizerShell = {
  type: 'Shell'
  inline: inline
  scriptUri: scriptUri
  sha256Checksum: sha256Checksum
}

param restartCheckCommand string = ''
param restartCommand string = ''
param restartTimeout string = ''

var imageTemplateCustomizerWindowRestart = {
  type: 'WindowsRestart'
  restartCheckCommand: restartCheckCommand
  restartCommand: restartCommand
  restartTimeout: restartTimeout
}

param filters array = []
param searchCriteria string = ''
param updateLimit int = 0

var imageTemplateCustomizerWindowsUpdate = {
  type: 'WindowsUpdate'
  filters: filters
  searchCriteria: searchCriteria
  updateLimit: updateLimit
}

output imageTemplateCustomizerType object = 
  imageTemplateCustomizerType == 'File' ? imageTemplateCustomizerFile :
  imageTemplateCustomizerType == 'Powershell' ? imageTemplateCustomizerPowershell :
  imageTemplateCustomizerType == 'Shell' ? imageTemplateCustomizerShell :
  imageTemplateCustomizerType == 'WindowRestart' ? imageTemplateCustomizerWindowRestart :
  imageTemplateCustomizerType == 'WindowsUpdate' ? imageTemplateCustomizerWindowsUpdate : {}
  
