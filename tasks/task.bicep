param name string
param description string

@allowed(['powerShellCommand', 'powerShellScript'])
param type string

param powerShellCommand string = ''

param powerShellScript string = ''

output task object = {
  name: name
  description: description
  type: type
  powerShellCommand: type == 'powerShellCommand' ? powerShellCommand : null
  powerShellScript: type == 'powerShellScript' ? loadFromTextFile(powerShellScript) : null
}
