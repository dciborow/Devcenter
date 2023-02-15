param name string
param description string

@allowed(['powerShellCommand', 'powerShellScript'])
param taskType string

param powerShellCommand string = ''
param powerShellScript string = ''

output task object = {
  name: name
  description: description
  type: type
  powerShellCommand: taskType == 'powerShellCommand' ? powerShellCommand : null
  powerShellScript: taskType == 'powerShellScript' ? loadFromTextFile(powerShellScript) : null
}
