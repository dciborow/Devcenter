// Set the Windows OS language",
// Sets the language used by the Windows.

@description("The bcp47 tag of the language that you're installing")
@allowed(["en-us", "en-gb", "zh-cn", "es-es"])
param language string

output powerShellCommand string = "Install-Language $language"
