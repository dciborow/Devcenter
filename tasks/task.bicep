param name string
param description string

@allowed(['powerShellCommand'])
param type string

param powerShellCommand string = ''

output task object = {
  name: name
  description: description
  type: type
  powerShellCommand: type == 'powerShellCommand' ? powerShellCommand : null
}
